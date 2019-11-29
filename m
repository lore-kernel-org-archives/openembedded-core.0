Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8477FC8B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 13:12:28 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so4185316wru.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 05:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uaameoyiGg3L9pt5mh/pAOKG9AMzDKoJ6H3iwxb8jqo=;
	b=qwNZ3tm5BiwuX3HQpLZ4j0eK2A209pQx3raOW83KMcaYSXqoiDUJ1LtORPJcMVC2XS
	7fY1NeTfSIDSuVVVsx1Iz83f6dWTT4KPACcP90JirBKTM4+0HZ0CiRCrxQU+NiW6eVfA
	xPXvyeifvIyVxWg1hm6jGkY6YY2BnFYFSQpaTHhVmBGo8ai6kffFC7Ea2fKwTwn59ZcS
	6b1GKnNrGGlSs3X9ky8f+KZd+zMVlv/AubCkhk6XWOH64zhBANLmfd08qg4/r27YGyVU
	a0ciTGOyK/tumkziG0hCxojxDwE8o5nWDWbKwf0wwJ7T13i570L0SKyCVzOB47JE0ojy
	CQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uaameoyiGg3L9pt5mh/pAOKG9AMzDKoJ6H3iwxb8jqo=;
	b=HInnDuEYL0pva6oQhw0DIagEfVwG87MpPGz4+Ix2NgCqkWLLljIznhZxiGjQFfRtX4
	94nzprlHLqBOx8eZwCh3yvpyynM8HCKtlpUeqTrcOE6Mk/RYRRXM7M+m+n3xrLddw51j
	2PlyDuSuEzxkD1Dwx+NOtIPD7dwNHx/APQ2hlEKyjE6g2F4hZDSOZBSDU/CR3GFEkbeD
	as5vgm4cpMT4cL8N39OPSf2xSUhtmj6G75FrTcoJh9Kps09lF4oZ2csffI3OvC+iw4zg
	4Q6YfiyzS3HMN1qa6+34yy04ev/UZYiyuI3zIHw4RT6soB+lhLtJHCVoB+7klSIySdT5
	G2TQ==
X-Gm-Message-State: APjAAAWFYdPYWEWKOs44LbCuN/zq1/DKSCWw3eAwA0EBedstHSfdQpK8
	KTQQQJKq8r5z72gp8AmUfOIhN3n/
X-Google-Smtp-Source: APXvYqzyIHjRUjSDEqN0j5ZlSq2IWM5lmLtduf/S6sFbfIZQlQ712JoXM9JCqxtE0QRhlx3+Pg89cA==
X-Received: by 2002:a05:6000:12ce:: with SMTP id
	l14mr41829490wrx.342.1575033148248; 
	Fri, 29 Nov 2019 05:12:28 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id v17sm637224wrt.91.2019.11.29.05.12.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 Nov 2019 05:12:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Nov 2019 14:11:51 +0100
Message-Id: <20191129131152.128311-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191129131152.128311-1-alex.kanavin@gmail.com>
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/15] libcomps: update to 0.1.12
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
X-List-Received-Date: Fri, 29 Nov 2019 13:12:29 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...PYTHON_INSTALL_DIR-by-running-python.patch | 50 +++++++------------
 .../recipes-devtools/libcomps/libcomps_git.bb |  4 +-
 2 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 26e8b06f378..59c09aa70a1 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,41 +1,25 @@
-From ff4aae4c8beaf17cb8e7a3431f6c541eccfae244 Mon Sep 17 00:00:00 2001
+From b28859ea93110d52d8a87d7b5a6c8796d0d523ed Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:22:09 +0200
-Subject: [PATCH 1/2] Do not set PYTHON_INSTALL_DIR by running python.
+Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- libcomps/src/python/src/python2/CMakeLists.txt | 2 +-
- libcomps/src/python/src/python3/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ libcomps/src/python/src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/libcomps/src/python/src/python2/CMakeLists.txt b/libcomps/src/python/src/python2/CMakeLists.txt
-index 3ad9e18..0e7dd4b 100644
---- a/libcomps/src/python/src/python2/CMakeLists.txt
-+++ b/libcomps/src/python/src/python2/CMakeLists.txt
-@@ -1,7 +1,7 @@
- find_package (PythonLibs 2.6)
- find_package (PythonInterp 2.6 REQUIRED)
- 
--execute_process (COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+#execute_process (COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
- 
- include_directories(${PYTHON_INCLUDE_PATH})
- include_directories(${LIBCOMPS_INCLUDE_PATH})
-diff --git a/libcomps/src/python/src/python3/CMakeLists.txt b/libcomps/src/python/src/python3/CMakeLists.txt
-index 7fafa9f..ed82d3d 100644
---- a/libcomps/src/python/src/python3/CMakeLists.txt
-+++ b/libcomps/src/python/src/python3/CMakeLists.txt
-@@ -2,7 +2,7 @@ find_package (PythonLibs 3.0)
- find_package (PythonInterp 3.0)
- #add_custom_target(py3-copy)
+diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
+index fa590ae..6913214 100644
+--- a/libcomps/src/python/src/CMakeLists.txt
++++ b/libcomps/src/python/src/CMakeLists.txt
+@@ -117,7 +117,7 @@ IF (SKBUILD)
+     INSTALL(FILES libcomps/__init__.py DESTINATION libcomps/src/python/src/libcomps)
+     INSTALL(TARGETS pycomps LIBRARY DESTINATION libcomps/src/python/src/libcomps)
+ ELSE ()
+-    EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++    #EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
  
--execute_process (COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+#execute_process (COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
- 
- include_directories(${PYTHON_INCLUDE_PATH})
- include_directories(${LIBCOMPS_INCLUDE_PATH})
--- 
-2.11.0
-
+     INSTALL(FILES ${pycomps_SRCDIR}/libcomps/__init__.py DESTINATION ${PYTHON_INSTALL_DIR}/libcomps)
+     #INSTALL(FILES ${pycomps_SRCDIR}/tests/__test.py DESTINATION
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
index 372c3c35804..34881bba372 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0001-Add-crc32.c-to-sources-list.patch \
            "
 
-PV = "0.1.11"
-SRCREV = "d868a79b76fb980d1371c28124ae07f00d2b63a9"
+PV = "0.1.12"
+SRCREV = "d0c8aa312dcab75c265ed6123f8afe0d7c8e91db"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


