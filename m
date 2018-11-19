Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 974976C132
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 15:08:18 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id b13so32417743wrx.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 07:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cpbOlNGF+qsXJXYYPFFPapCkOp5J4a+LQtbmGUmbSsc=;
	b=tWz+k/X4xYJlLHu4Rv/rIx+LFussNppyhHNeHv3oZ8DjdarJj+yhK6ibCuAw6iSltI
	8s9WBN+ZT88d/O2H65BMjU+C+ar8JlzDkmyeUbLN37bsyivqL+WAlC1z6/yHq8m2JX9Q
	ZJQw3iSczYFCFweoRAvr6nu/QlzlLE1nnrZfDBTR6O9T57ttkjF+kmDe6/YWdisVFyhH
	is3hwvWYGbmjrj/ZSuqxyd6b/WVmCyIHH0FdlqTt7R6zbu9araD1WaAQgcH9uFh6ezdD
	SnBt0g9humufYMtwIQii6BqkvYYuJuuXOR0AvFoEVJVJDXF9ejQhcJmUfuAbY54u6Lt6
	Eacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cpbOlNGF+qsXJXYYPFFPapCkOp5J4a+LQtbmGUmbSsc=;
	b=lkMeUrrAuwKhv9thF40pp9Jj5baV38PODb+n/rBWe3tYmmOUHakJYl1veNRh5MspP8
	Ka39PsZN8tfvxADk6g71u4bRdWOgevvUX7E8tVTcOqr6V745IhB5goKgYcBQ0F4lF2m9
	SF5Nrki3BU5SiJ7vzHSHcMkcIqxt0nGcEaJw8S/6wnpyfzahD6XkhMtk9LA78YjkpvNw
	+flF2y0z2H7+nILiBxb/HDXdibUwzLDCRVjk4FL1hwgwfTZTBicPv5KxVM36GSxcP8pW
	LIpjhI5j9ONtlrnYz3dLvtCFASSve8Q+opqqophWKYTEVT6HcDa4cQrjQbc0dYR1fb+M
	Fo0A==
X-Gm-Message-State: AGRZ1gJtttGPngZRO8Kq8RffNN3seQR2BeCZznHLz5jXpGI0qJee9L4t
	3oQB/1JmyZgiU/66+0+oF8eJ/1PD
X-Google-Smtp-Source: AJdET5clcpW3o45xM9pKUIPJ+VRDlhcG3Dh+k+EB3fZ7MHGd1BmWIYemD963RIPTrDO4Dm9nG0S26w==
X-Received: by 2002:adf:800b:: with SMTP id
	11-v6mr19422469wrk.106.1542640098935; 
	Mon, 19 Nov 2018 07:08:18 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm78042526wmf.22.2018.11.19.07.08.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 07:08:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 16:08:08 +0100
Message-Id: <20181119150810.94381-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181119150810.94381-1-alex.kanavin@gmail.com>
References: <20181119150810.94381-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/6] librepo: update to 1.9.2
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
X-List-Received-Date: Mon, 19 Nov 2018 15:08:18 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...tain-PYTHON_INSTALL_DIR-by-running-p.patch | 21 ++++++-------------
 ...les-with-pkg-config-not-with-cmake-m.patch | 18 +++++++---------
 .../{librepo_1.8.1.bb => librepo_1.9.2.bb}    |  4 ++--
 3 files changed, 16 insertions(+), 27 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.8.1.bb => librepo_1.9.2.bb} (86%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index d69deb5110d..b61f0c93246 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
@@ -1,8 +1,7 @@
-From 5b6849d9d7e030c3a521b5245d86f853b0271a61 Mon Sep 17 00:00:00 2001
+From b08a3b71e716dd0485ef51036d32e4c304fb4e67 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
-Subject: [PATCH 1/2] Do not try to obtain PYTHON_INSTALL_DIR by running
- python.
+Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -13,12 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/librepo/python/python2/CMakeLists.txt b/librepo/python/python2/CMakeLists.txt
-index 5ffbd62..90d3c22 100644
+index a0f1f9a..1665079 100644
 --- a/librepo/python/python2/CMakeLists.txt
 +++ b/librepo/python/python2/CMakeLists.txt
-@@ -1,11 +1,11 @@
- FIND_PACKAGE (PythonLibs 2 )
- FIND_PACKAGE (PythonInterp 2 REQUIRED)
+@@ -1,9 +1,9 @@
 -EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "
 -from sys import stdout
 -from distutils import sysconfig
@@ -35,13 +32,10 @@ index 5ffbd62..90d3c22 100644
  
  MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
 diff --git a/librepo/python/python3/CMakeLists.txt b/librepo/python/python3/CMakeLists.txt
-index 47559f7..b39adc2 100644
+index 52ba44e..da51e10 100644
 --- a/librepo/python/python3/CMakeLists.txt
 +++ b/librepo/python/python3/CMakeLists.txt
-@@ -10,12 +10,12 @@ message("--- ${PYTHON_INCLUDE_DIR}")
- 
- FIND_PACKAGE(PythonLibs 3.0)
- FIND_PACKAGE(PythonInterp 3.0 REQUIRED)
+@@ -1,9 +1,9 @@
 -EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "
 -from sys import stdout
 -from distutils import sysconfig
@@ -57,6 +51,3 @@ index 47559f7..b39adc2 100644
  INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
  
  MESSAGE(STATUS "Python3 install dir is ${PYTHON_INSTALL_DIR}")
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
index f7d7ab3a2a1..488657154a9 100644
--- a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
+++ b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
@@ -1,29 +1,27 @@
-From a36be8192615e2a1fb5a5856d44565277f15583b Mon Sep 17 00:00:00 2001
+From 9f44d2f4aaf706027fe5a02f6d83547ff343f09c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:23:27 +0200
-Subject: [PATCH 4/4] Set gpgme variables with pkg-config, not with cmake
- module (which doesn't work properly)
+Subject: [PATCH] Set gpgme variables with pkg-config, not with cmake module
+ (which doesn't work properly)
 
 Upstream-Status: Inappropriate [gpgme upstream does not have pkg-config support and is not interested in it]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  CMakeLists.txt | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ef07d2d..f1fa09b 100644
+index 0f7271f..d71373f 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -31,7 +31,8 @@ PKG_CHECK_MODULES(GLIB2 glib-2.0 REQUIRED)
+@@ -30,7 +30,8 @@ PKG_CHECK_MODULES(GLIB2 glib-2.0 REQUIRED)
  PKG_SEARCH_MODULE(LIBCRYPTO REQUIRED libcrypto openssl)
- FIND_PACKAGE(EXPAT REQUIRED)
+ PKG_CHECK_MODULES(LIBXML2 libxml-2.0 REQUIRED)
  FIND_PACKAGE(CURL REQUIRED)
 -FIND_PACKAGE(Gpgme REQUIRED)
 +PKG_CHECK_MODULES(GPGME gpgme REQUIRED)
 +set(GPGME_VANILLA_LIBRARIES ${GPGME_LIBRARIES})
- FIND_PACKAGE(Xattr REQUIRED)
  
  INCLUDE_DIRECTORIES(${GLIB2_INCLUDE_DIRS})
--- 
-2.11.0
-
+ 
diff --git a/meta/recipes-devtools/librepo/librepo_1.8.1.bb b/meta/recipes-devtools/librepo/librepo_1.9.2.bb
similarity index 86%
rename from meta/recipes-devtools/librepo/librepo_1.8.1.bb
rename to meta/recipes-devtools/librepo/librepo_1.9.2.bb
index 456988558b5..1e6459d295a 100644
--- a/meta/recipes-devtools/librepo/librepo_1.8.1.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.9.2.bb
@@ -7,11 +7,11 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "7b9b7bf388f3f059529c6f50c40b30919fef30f9"
+SRCREV = "313a7644d03f9657ee0c7aa747d1db260f8e2fc0"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "curl expat glib-2.0 openssl attr gpgme"
+DEPENDS = "curl expat glib-2.0 openssl attr gpgme libxml2"
 
 inherit cmake distutils3-base pkgconfig
 
-- 
2.17.1


