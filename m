Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 736EB6C516
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 13:57:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id w7-v6so5602649wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 05:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ytbb/Sg1bG/ixryFLyTRbNE4seHG1FH7O3PaN/AIsDY=;
	b=fM9b/BBGTm7pgzHjE0Nqp96zjq6RAH1aYUMgeN2totEjQdgzCGz0lOr9gM6Qs+6sVw
	RBsmQ61MjaimfSJZFZiPWbM2HB+zg7XxA4s5UmZQveuGyOAFuOlRDm8e+DCjurIDhWdQ
	oOqxYpDjbPqxkQqWjfDPT5SDny1hKRINgK5MxqGyWUyYaaCYfdT07fUmNDdaFMYdOZ2R
	oxtghTzqlgEf+8+OIfjeRo0Nsn5pcg21PPyOlXwsndUtyCqMgqhYDuahhsgzam/pTb1J
	kWMteNlcq0KFZAJlxX9uBEcNo9Nqnya4AD2zgRFtM7mVnDa6g+49zwz5vuDrp1TEH19z
	22sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ytbb/Sg1bG/ixryFLyTRbNE4seHG1FH7O3PaN/AIsDY=;
	b=AHlcS5mam6rDIpnSmyP3sZXPPOsV+RPP72XaLTDkFO+WL2Y3gBtIBPJCI1E5vrICZ5
	aP4+XGa9iNvcJe7655jo9ItkCrlQXzLwMkHbydSiu3gvs7EgR0J26vgBMmqCvKjX09t5
	6IuMteG+XpXUXYgVl1vryzD8EAz9JACr8Gm7ZVns/S28qgRdIpY0etKOZPIm8+/en3sR
	Zg+z1FSTcga+jq8l0D4ISkslrO1rHE804FL4VHM5D4hYShya0/qciX7lld3DdfZCG/N/
	vlNVD/J32c8NI8tHNuHvO2UvRQ+erV1FnTeu1cfUTDS89bKE7Fi7R1IsjAwVuvDAE6Mp
	SP5w==
X-Gm-Message-State: AA+aEWbsNTw21/JG3sDY93tan0y16UQIa2IENX/lOFh29P+DMprLOfgc
	cqTIwqLaS94V5350oQduntpfXWfg
X-Google-Smtp-Source: AJdET5eKNTCjRHkjmWV/vx6hbFpp6+ixrCEJSqNWesa+gkQg5kjbbEbEDE9FTeyEBs9zHEVtiwCRtw==
X-Received: by 2002:a1c:aecb:: with SMTP id x194mr5514255wme.96.1542808660725; 
	Wed, 21 Nov 2018 05:57:40 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o8sm11203560wrx.15.2018.11.21.05.57.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 05:57:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2018 14:57:25 +0100
Message-Id: <20181121135727.115509-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181121135727.115509-1-alex.kanavin@gmail.com>
References: <20181121135727.115509-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/7] dnf: update to 4.0.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2018 13:57:40 -0000

License-Update: spelling fixes

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ode-etc-and-systemd-unit-directories.patch | 19 ++++++++-----------
 ...PYTHON_INSTALL_DIR-by-running-python.patch | 17 +++++++----------
 .../dnf/{dnf_2.7.5.bb => dnf_4.0.4.bb}        |  6 +++---
 3 files changed, 18 insertions(+), 24 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_2.7.5.bb => dnf_4.0.4.bb} (94%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index 15a7bfc7329..cb09f17a563 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,7 +1,7 @@
-From a8ef81c115a45f05dad145c98e10f3c4940e4e29 Mon Sep 17 00:00:00 2001
+From ffb7942cc73c3d2c6aa7c689cdaf9bc0bcbc144b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:25:47 +0200
-Subject: [PATCH 3/5] Do not hardcode /etc and systemd unit directories
+Subject: [PATCH] Do not hardcode /etc and systemd unit directories
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -11,20 +11,17 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 650b624a..10199618 100644
+index 73552967..38cf4fbf 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -7,8 +7,8 @@ if (NOT PYTHON_DESIRED)
-     set (PYTHON_DESIRED "2")
- endif()
+@@ -3,8 +3,8 @@ CMAKE_MINIMUM_REQUIRED (VERSION 2.4)
+ 
+ INCLUDE (${CMAKE_SOURCE_DIR}/VERSION.cmake)
  
 -SET( SYSCONFDIR /etc)
 -SET( SYSTEMD_DIR /usr/lib/systemd/system)
 +SET( SYSCONFDIR ${CMAKE_INSTALL_SYSCONFDIR})
 +SET( SYSTEMD_DIR $ENV{systemd_system_unitdir})
  
- if (${PYTHON_DESIRED} STREQUAL "2")
- 	FIND_PACKAGE (PythonInterp REQUIRED)
--- 
-2.14.2
-
+ IF (NOT PYTHON_DESIRED)
+     FIND_PACKAGE (PythonInterp REQUIRED)
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 6e011915df0..0ed9afc58d2 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,7 +1,7 @@
-From 7205033e44d8fba1d3b18b490e7eaab82da1ffa3 Mon Sep 17 00:00:00 2001
+From 6be13143a54c79085d400d5bd4c7a6e1cb6ffaf5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
-Subject: [PATCH 1/5] Do not set PYTHON_INSTALL_DIR by running python
+Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -11,18 +11,15 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 23e5f889..650b624a 100644
+index 38cf4fbf..6c5debd8 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -18,7 +18,7 @@ else()
- 	FIND_PACKAGE(PythonInterp 3.0 REQUIRED)
- endif()
+@@ -19,7 +19,7 @@ ELSE ()
+     MESSAGE (FATAL_ERROR "Invalid PYTHON_DESIRED value: " ${PYTHON_DESIRED})
+ ENDIF()
  
 -EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib())" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
 +#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib())" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
- EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "import sys; sys.stdout.write('%s.%s' % (sys.version_info.major, sys.version_info.minor))" OUTPUT_VARIABLE PYTHON_MAJOR_DOT_MINOR_VERSION)
  MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
  
--- 
-2.14.2
-
+ ADD_SUBDIRECTORY (dnf)
diff --git a/meta/recipes-devtools/dnf/dnf_2.7.5.bb b/meta/recipes-devtools/dnf/dnf_4.0.4.bb
similarity index 94%
rename from meta/recipes-devtools/dnf/dnf_2.7.5.bb
rename to meta/recipes-devtools/dnf/dnf_4.0.4.bb
index df60d731b69..931e9eff07f 100644
--- a/meta/recipes-devtools/dnf/dnf_2.7.5.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.0.4.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Package manager forked from Yum, using libsolv as a dependency resolver"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://PACKAGE-LICENSING;md5=bfc29916e11321be06924c4fb096fdcc \
-                   "
+                    file://PACKAGE-LICENSING;md5=4a0548e303dbc77f067335b4d688e745 \
+                    "
 
 SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0001-Corretly-install-tmpfiles.d-configuration.patch \
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0030-Run-python-scripts-using-env.patch \
            "
 
-SRCREV = "564c44667c7014843fa6f1732621093114ec59b2"
+SRCREV = "6fdf0e8cc714c92ee08bd4db9412d4c587ffafe9"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


