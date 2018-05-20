<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="com.demo.po.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>企业人事管理平台</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="css/uniform.css" />
		<link rel="stylesheet" href="css/datepicker.css" />	
		<link rel="stylesheet" href="css/unicorn.main.css" />
		<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />			
		<script src="js/jquery.min.js"></script>
        <script src="js/jquery.ui.custom.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.uniform.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/unicorn.js"></script> 
        <script type="text/javascript">
        	$(document).ready(function (){
        		$("form input").blur(function (){
        			validateInput(this);
        		});
				$("#pform").submit(function (){
					var flag = true;
					if(flag == true)
					{
						$("#saveFail").css("opacity","0");
						$("#saveSuccess").css("opacity","0.7");
					}
					else{
						$("#saveSuccess").css("opacity","0");
						$("#saveFail").css("opacity","0.7");
						$("#pform")[0].reset();
					}
					return flag;
				});
        		$("form").submit(function (){
        			var f = true;

        			var a = $("form input"); 
        			
        			for(var i = 0; i < a.size(); i++){
        				var t = validateInput(a.get(i));
        				f = f && t;
        			}
        			return f;
        		});
        	});

        	function validateInput(obj){
        		var v = $(obj).val();
    			if(v == ""){
    				$(obj).parent().parent().removeClass("success");
					$(obj).parent().parent().addClass("error");
					return false;
    			}else{
    				$(obj).parent().parent().removeClass("error");
					$(obj).parent().parent().addClass("success");
					return true;
    			}
        	}
        </script>          
</head>
	<body>
		<div id="header"><h1></h1></div>
		
        <div id="user-nav" class="navbar navbar-inverse">
            <ul class="nav btn-group">
                <li class="btn btn-inverse">
                    <a href="#">
                        <i class="icon icon-user"></i>
                        <span class="text">
                         ${user.employeeName}
                        </span>
                    </a>
                </li>
                <li class="btn btn-inverse">
                    <a href="login.jsp">
                        <i class="icon icon-share-alt"></i>
                        <span class="text">注销</span>
                    </a>
                </li>
            </ul>
        </div>
        <div id="sidebar">
            <ul>
                <li>
                    <a href="main.jsp">
                        <i class="icon icon-home"></i> 
                        <span>首页</span>
                    </a>
                </li>
                <li>
                    <a href="empinfo.action">
                        <i class="icon icon-tag"></i> 
                        <span>查看个人信息</span>
                    </a>
                </li>
                <li>
                    <a href="changePassword.jsp">
                        <i class="icon icon-ok-circle"></i> 
                        <span>修改登录密码</span>
                    </a>
                </li>
                <li class="submenu">
                    <a href="#">
                        <i class="icon icon-time"></i> 
                        <span>休假管理</span> 
                        <!--
                        <span class="label">2</span>
                        -->
                    </a>
                    <ul>
                        <li><a href="beforeHolidayReq.action">申请休假</a></li>
                        <li><a href="vWaitingAppList.action">审批休假</a></li>
                        <li><a href="initHolidayList.action">查看休假记录</a></li>
                        <li><a href="ApprovalRecord.action">查看审批记录</a></li>
                        <li><a href="before.action">假期类型管理</a></li>
                    </ul>
                </li>
                <li>
                    <a href="getAllEmpInfo.action">
                        <i class="icon icon-user"></i> 
                        <span>员工信息管理</span> 
                    </a>
                </li>
                <li>
                    <a href="initDepartment.action">
                        <i class="icon icon-flag"></i> 
                        <span>部门信息管理</span> 
                    </a>
                </li>
                <li class="active">
                    <a href="selectAllHeadship.action">
                        <i class="icon icon-briefcase"></i> 
                        <span>职位信息管理</span> 
                    </a>
                </li>
            </ul>
        </div>
		<div id="content">
			<div id="content-header">
				<h1>修改职位</h1>
			</div>
			<div id="breadcrumb">
				<a href="main.jsp" class="tip-bottom">
                	<i class="icon-home"></i>
                                                    首页
                </a>
				<a href="selectAllHeadship.action">职位列表</a>
				<a href="#" class="current">修改职位</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
						<div class="span12">
							<div class="widget-box">
								<div class="widget-title">
									<span class="icon">
										<i class="icon-align-justify"></i>									
									</span>
									<h5>职位信息</h5>
								</div>
								<div class="widget-content nopadding">
									<form id="eform" action="xiugai1.action" class="form-horizontal" method="post" />
	                                    <div id="info1" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	职位名称:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="text" name="headshipName" id="jname" value="${modifyjob.headshipName}"/><input type="text" name="headshipID" id="jname" value="${modifyjob.headshipID}"  style="visibility:hidden"/>
	                                        </div>
	                                    </div>
	                                    <div id="info2" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	职位级别:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="text" name="headshipLevel" id="jlevel" value="${modifyjob.headshipLevel}"/>
	                                        </div>
	                                    </div>
	                                    <div class="form-actions">
	                                        <input type="submit" value="提交" class="btn btn-primary" />
	                                        <input type="reset" value="重置" class="btn btn-primary" />
	                                    </div>
	                                </form>
								</div>
							</div>			
						</div>
				</div>	
			</div>	

            		<c:choose>
            		<c:when test="${a==0}">                                          
            <div class="alert alert-error" id="saveFail" >
                保存失败
            </div>
					</c:when>
					<c:otherwise>
			<div class="alert alert-success" id="saveSuccess" >
                保存成功
            </div>

					</c:otherwise>
					</c:choose>

			
		</div>		
        <div class="row-fluid">&nbsp;</div>
        <div class="row-fluid">
            <div id="footer" class="span12">
                2016 &copy; 企业人事管理平台
            </div>
        </div>
		
	</body>
</html>