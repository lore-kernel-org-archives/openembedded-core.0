Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0B6AE7C0E7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 16:30:18 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id j2so16586801wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 08:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A6AhVimDQNePIfgGHQhhxBAOunyv86lvOL40qBqV6tQ=;
	b=E/PlkM/uLxwLBAPigbWhpPG1hdf8lp2HHNEJPaDC5ImRXQguYCjAD5UvClB3ewm0EA
	2E26anSbuT7kaOIDt3Cr/1p7PgsrOVoYyNp9j7mLjxdv+J9LeM55xIrRBu+kicjgvogS
	qz8mSQzHAkBy0BpOEzErmXJ5dqSKlT+WaWWu6s/Y7t0kFFfGWX1SnQ4ANlTwZaCxFDzn
	U8hW6lHQXe/Rzj2+DSzOEpclvMT+80qJAbWadTBUNhbRTb1g8gUbmwJMBSWnu5u3oXfn
	NIJCo9Tspd1SACW26z8SAMf6cWFMOCNZ5UFqthoEXAI+xSHojDpIjS7mBX4vT0yQQ52Z
	zgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A6AhVimDQNePIfgGHQhhxBAOunyv86lvOL40qBqV6tQ=;
	b=Wr5nIcI4WFnCryrVrRuxLUoFLiJhTuu0Sh+URaBwDH+wgYuZ33uE55Z0DvX77Ygjgk
	c9I5P3m1kqgxL1XPY+ez+2ie0E3mZZZAdw2yoVUaZIHNDK6i4jEvU9/txlgMOiGlcjeH
	bB1IhzSD5ORC5FMPqRuCXTrYxrZ+Yk75loXBlXXsBwG7oSWCZ2dDDtJpuUT8aOTozHTb
	VWuoEEqyqzwKht98giZJga48q3jefA64UrdayMshrhJ/eSA8V4h/+i7cFUFUWw4HrUwb
	Ag1IcP7hAahFJkG8ovY6OGdW7fTyEgL/fRrVDB4BS8pdF+FEkKCyrVuBx4P1ABiZlllE
	e0/A==
X-Gm-Message-State: AA+aEWaZqgKm8LbR80zTtZwzFw2BwawGEDF9zoW+houAXKv1Qob3wj6/
	WOqsCBmT8Y2+uYOIf/0oadOteZvr
X-Google-Smtp-Source: AFSGD/VrmOLbJcuAPqQy2xI4cWMhSvYV1D1IG1/T7l6PyDLPODc7V26w/4QkC/4XJmFOaKzDmKm9Gg==
X-Received: by 2002:a5d:49cd:: with SMTP id t13mr15525704wrs.144.1545150619311;
	Tue, 18 Dec 2018 08:30:19 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f18sm2237849wrs.92.2018.12.18.08.30.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 08:30:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 17:29:58 +0100
Message-Id: <20181218163005.1330-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218163005.1330-1-alex.kanavin@gmail.com>
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/13] createrepo-c: update to 0.12.0
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
X-List-Received-Date: Tue, 18 Dec 2018 16:30:19 -0000

Drop 0001-Correctly-install-the-shared-library.patch as upstream fixed the issue.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...Correctly-install-the-shared-library.patch | 28 -------------------
 ...PYTHON_INSTALL_DIR-by-running-python.patch | 14 ++++------
 .../createrepo-c/createrepo-c_git.bb          |  7 ++---
 3 files changed, 9 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Correctly-install-the-shared-library.patch

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Correctly-install-the-shared-library.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Correctly-install-the-shared-library.patch
deleted file mode 100644
index cd72084ee2f..00000000000
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Correctly-install-the-shared-library.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From fef835e1fdedc72c97d9c3e5704302e56e1bdef0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 2 Jan 2017 17:23:59 +0200
-Subject: [PATCH] Correctly install the shared library
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/78]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/CMakeLists.txt | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index f3635e8..46dc037 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -110,7 +110,8 @@ CONFIGURE_FILE("deltarpms.h.in" "${CMAKE_CURRENT_SOURCE_DIR}/deltarpms.h" @ONLY)
- IF (CMAKE_SIZEOF_VOID_P MATCHES "8")
-     SET (LIB_SUFFIX "64")
- ENDIF (CMAKE_SIZEOF_VOID_P MATCHES "8")
--SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
-+#SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
-+SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}")
- 
- INSTALL(FILES ${headers} DESTINATION "include/createrepo_c")
- INSTALL(FILES "createrepo_c.pc" DESTINATION "${LIB_INSTALL_DIR}/pkgconfig")
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 9531070937c..c0f07fe2ca0 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,27 +1,25 @@
-From bef487b5c2515062c5dd73c21082ce42f69aa717 Mon Sep 17 00:00:00 2001
+From 4644d18157296257284bedd857f4610f1037d50e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  src/python/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/python/CMakeLists.txt b/src/python/CMakeLists.txt
-index 9f1ac64..eae0cbb 100644
+index 3d873f7..e977b2f 100644
 --- a/src/python/CMakeLists.txt
 +++ b/src/python/CMakeLists.txt
-@@ -19,7 +19,7 @@ else()
-     FIND_PACKAGE(PythonInterp 3.0 REQUIRED)
- endif()
+@@ -21,7 +21,7 @@ if (NOT SKBUILD)
+     endif ()
+ endif (NOT SKBUILD)
  
 -EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
 +#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
  INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
  
  MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
index 2960811048e..3a4cfb7b021 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
@@ -6,11 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
-           file://0001-Correctly-install-the-shared-library.patch \
            "
 
-PV = "0.11.1+git${SRCPV}"
-SRCREV = "434a40babdde57ab405e9a1085a30e9575ea0c92"
+PV = "0.12.0"
+SRCREV = "8884a469680b7fb4a10fcbd49dbfef99b035c44b"
 
 S = "${WORKDIR}/git"
 
@@ -19,7 +18,7 @@ DEPENDS_append_class-native = " file-replacement-native"
 
 inherit cmake pkgconfig bash-completion distutils3-base
 
-EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
+EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DWITH_ZCHUNK=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


