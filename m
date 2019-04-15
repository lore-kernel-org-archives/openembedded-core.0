Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 39A1E7D97F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:09 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n25so19809988wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Zncyx+vzvkzOp2QgzckEgpA69LREhyUoVmHxMY+OSJc=;
	b=kzvF0FEtehcEDcUh9sC+FlUtMQlknaRJQEIbPX3NcdhbW7NJ5Jh333nCDSqX7tBNrN
	3vMtvTZ86l1Gckhf7rwueJjPhv4/YSJMyx3t9VwAH/wWPc1YmtMi164xF3S4Ew/Td08x
	c1fv65aqdZekk10KgqgV1JwVMT5mi58aU07Ir7YIUiJb+sX78vN16adHMVel7KJpw45v
	3dgPESxHHL6sd1Pcgf/FGWsS73VkRnWCPJWNZVxTvSheF0ex4aizejXhmpWRtbdkadMz
	0yt6Q4VZGCGV/k9/OKmsr3jD+XDI3MTrlrp+k1a0UggZGMHV9G+wzTOFkZswTnlcm6TI
	zO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Zncyx+vzvkzOp2QgzckEgpA69LREhyUoVmHxMY+OSJc=;
	b=JDKNeAABYWx8VUN1boNMx9JvDtKRqwpX491F1YjIaFvkZciYGCtvUU4vAQq7y5oCfe
	7Azpb2VNXIRIBwLChNIz1GmoTDcIL6C7sMUC1wI/PVraC0uZaDippEGcap05NG8jO1tx
	u9VL9WU+xMnbB5/keanNOzSXB5snotV6oUBv78cYWirFFDWAaH5qyts6JdD5PpduN2Va
	AnHYOUebDPXeX08OQPrcvdWBWQTEDMOeIX5fKngb3xQSTXzjCc5oFkgIIC5tc8WLyz0O
	GuBWqJT0VWxVxY2gtlUOfNUCfvDXWQrWglOjA5bGGm0JnDrfHOBVjEL2hc/9oFMSCbBi
	w2Jg==
X-Gm-Message-State: APjAAAUwC7BrStv8lmcfjI8sNcnitJ37ze6YRMQadjV6JRxHkS2Q59PA
	8NGzDPvAbTIM88kg3qhMvWShTLAyxCc=
X-Google-Smtp-Source: APXvYqx3AHKjUpZolg4YjnrUgUeMz2N19sVbroN4ptwJvf4cCiECaH26bgaUUvwf51pmxgXCrsIjxg==
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr22414921wmj.43.1555325709597; 
	Mon, 15 Apr 2019 03:55:09 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:45 +0200
Message-Id: <20190415105457.57067-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/19] libdnf: update to 0.28.1
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:09 -0000

Remove upstreamed 0001-include-missing-string-and-errno.h-headers.patch

Rebase the other patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdnf/0001-Add-WITH_TESTS-option.patch   | 44 ++++++-------
 ...or-both-libsolv-and-libsolvext-libdn.patch | 16 ++---
 ...e-missing-string-and-errno.h-headers.patch | 65 -------------------
 ...ables-with-pkg-config-cmake-s-own-mo.patch | 20 +++---
 .../{libdnf_0.26.0.bb => libdnf_0.28.1.bb}    |  3 +-
 5 files changed, 41 insertions(+), 107 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-include-missing-string-and-errno.h-headers.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.26.0.bb => libdnf_0.28.1.bb} (90%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
index 7c8131b4be8..3c87d4d8b33 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
@@ -1,4 +1,4 @@
-From 0d0155c4dd6c0b3305ea2ab0e10b0f84d024a6e1 Mon Sep 17 00:00:00 2001
+From e5a50db749b2b02e9e0cff9f7b639020e8ac76da Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 6 Nov 2018 13:54:43 +0100
 Subject: [PATCH] Add WITH_TESTS option
@@ -14,36 +14,36 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b73a03d7..a9e0200f 100644
+index ce88b9e3..7a99320a 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -36,6 +36,7 @@ OPTION(WITH_MAN "Enables hawkey man page generation" ON)
- OPTION(WITH_HTML "Enables hawkey HTML generation" ON)
+@@ -32,6 +32,7 @@ option(WITH_HTML "Enables hawkey HTML generation" ON)
+ option(WITH_MAN "Enables hawkey man page generation" ON)
+ option(ENABLE_RHSM_SUPPORT "Build with Red Hat Subscription Manager support?" OFF)
+ option(ENABLE_SOLV_URPMREORDER "Build with support for URPM-like solution reordering?" OFF)
++option(WITH_TESTS "Enables unit tests" ON)
  
- OPTION(WITH_BINDINGS "Enables python/SWIG bindings" ON)
-+OPTION(WITH_TESTS "Enables unit tests" ON)
  
- OPTION (ENABLE_SOLV_URPMREORDER "Build with support for URPM-like solution reordering?" OFF)
- option (ENABLE_RHSM_SUPPORT "Build with Red Hat Subscription Manager support?" OFF)
-@@ -122,8 +123,10 @@ IF (WITH_BINDINGS)
- # ADD_SUBDIRECTORY (bindings/perl)
- ADD_SUBDIRECTORY (bindings/python)
- ENDIF()
+ # load pkg-config first; it's required by other modules
+@@ -158,8 +159,10 @@ endif()
+ 
+ 
+ # build tests
 +IF (WITH_TESTS)
- ENABLE_TESTING()
- ADD_SUBDIRECTORY (tests)
+ enable_testing()
+ add_subdirectory(tests)
 +ENDIF()
- IF (WITH_BINDINGS)
- ADD_SUBDIRECTORY (python/hawkey)
- ADD_SUBDIRECTORY (docs/hawkey)
+ if(WITH_BINDINGS)
+     add_subdirectory(python/hawkey)
+ endif()
 diff --git a/python/hawkey/CMakeLists.txt b/python/hawkey/CMakeLists.txt
-index 3c0b3c0c..31466ed9 100644
+index d9645346..84d17204 100644
 --- a/python/hawkey/CMakeLists.txt
 +++ b/python/hawkey/CMakeLists.txt
-@@ -49,4 +49,6 @@ TARGET_LINK_LIBRARIES(_hawkeymodule ${PYTHON_LIBRARY})
- INSTALL(FILES __init__.py DESTINATION ${PYTHON_INSTALL_DIR}/hawkey)
- INSTALL(TARGETS _hawkeymodule LIBRARY DESTINATION ${PYTHON_INSTALL_DIR}/hawkey)
+@@ -50,4 +50,6 @@ target_link_libraries(_hawkeymodule ${PYTHON_LIBRARY})
+ install(FILES __init__.py DESTINATION ${PYTHON_INSTALL_DIR}/hawkey)
+ install(TARGETS _hawkeymodule LIBRARY DESTINATION ${PYTHON_INSTALL_DIR}/hawkey)
  
 +IF (WITH_TESTS)
- ADD_SUBDIRECTORY(tests)
+ add_subdirectory(tests)
 +ENDIF()
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index 246db34154a..10450defbec 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -1,4 +1,4 @@
-From c139a6c929cff93dbb9b8279e97263fc9e055727 Mon Sep 17 00:00:00 2001
+From 9294cd19e5e3121fb8d37b44ee82dd7c4b3ab2c7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Feb 2017 12:16:03 +0200
 Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
@@ -13,15 +13,15 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cd91f08..6422534 100644
+index b722d4fb..ce88b9e3 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -46,7 +46,7 @@ endif(APPLE)
- PKG_CHECK_MODULES(GLIB gio-unix-2.0>=2.46.0 REQUIRED)
- pkg_check_modules(SMARTCOLS REQUIRED smartcols)
- FIND_LIBRARY (RPMDB_LIBRARY NAMES rpmdb)
+@@ -45,7 +45,7 @@ endif()
+ 
+ # build dependencies
+ find_package(Gpgme REQUIRED)
 -PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
 +PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv libsolvext)
  set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
- if (ENABLE_RHSM_SUPPORT)
-     pkg_check_modules (RHSM REQUIRED librhsm>=0.0.3)
+ find_package(OpenSSL REQUIRED)
+ 
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-include-missing-string-and-errno.h-headers.patch b/meta/recipes-devtools/libdnf/libdnf/0001-include-missing-string-and-errno.h-headers.patch
deleted file mode 100644
index 62de7848207..00000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-include-missing-string-and-errno.h-headers.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From ccc89ff0c1f8e55a4a22444d051925408f265df1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Jan 2019 10:32:11 -0800
-Subject: [PATCH] include missing <string> and errno.h headers
-
-This is unearthed when compiling with clang/libc++
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/677]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libdnf/conf/ConfigParser.hpp             | 1 +
- libdnf/module/modulemd/ModuleProfile.hpp | 1 +
- libdnf/sack/changelog.hpp                | 1 +
- libdnf/utils/smartcols/Cell.hpp          | 1 +
- 4 files changed, 4 insertions(+)
-
-diff --git a/libdnf/conf/ConfigParser.hpp b/libdnf/conf/ConfigParser.hpp
-index 97f25500..2a3851fa 100644
---- a/libdnf/conf/ConfigParser.hpp
-+++ b/libdnf/conf/ConfigParser.hpp
-@@ -23,6 +23,7 @@
- 
- #include <map>
- #include <stdexcept>
-+#include <string>
- #include <utility>
- 
- namespace libdnf {
-diff --git a/libdnf/module/modulemd/ModuleProfile.hpp b/libdnf/module/modulemd/ModuleProfile.hpp
-index ab018deb..8d996ff4 100644
---- a/libdnf/module/modulemd/ModuleProfile.hpp
-+++ b/libdnf/module/modulemd/ModuleProfile.hpp
-@@ -23,6 +23,7 @@
- 
- 
- #include <memory>
-+#include <string>
- #include <vector>
- 
- #include <modulemd/modulemd.h>
-diff --git a/libdnf/sack/changelog.hpp b/libdnf/sack/changelog.hpp
-index a3d3fc44..d830c414 100644
---- a/libdnf/sack/changelog.hpp
-+++ b/libdnf/sack/changelog.hpp
-@@ -23,6 +23,7 @@
- #define __CHANGELOG_HPP
- 
- #include <ctime>
-+#include <string>
- 
- namespace libdnf {
- 
-diff --git a/libdnf/utils/smartcols/Cell.hpp b/libdnf/utils/smartcols/Cell.hpp
-index 2e811dee..b90f0050 100644
---- a/libdnf/utils/smartcols/Cell.hpp
-+++ b/libdnf/utils/smartcols/Cell.hpp
-@@ -22,6 +22,7 @@
- #define LIBDNF_CELL_HPP
- 
- #include <libsmartcols/libsmartcols.h>
-+#include <cerrno>
- #include <string>
- #include <stdexcept>
- 
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index 80b1ed7bf18..475c8f120ba 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -1,4 +1,4 @@
-From 2bcd0b9f6310bacdc554e077e85319a5e90e5ce0 Mon Sep 17 00:00:00 2001
+From 18c2c06017784cd641cc8a3deee5fc472008f7f4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
 Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
@@ -13,16 +13,16 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0b405cb..cd91f08 100644
+index 16b63308..b722d4fb 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -46,7 +46,8 @@ endif(APPLE)
- PKG_CHECK_MODULES(GLIB gio-unix-2.0>=2.46.0 REQUIRED)
- pkg_check_modules(SMARTCOLS REQUIRED smartcols)
- FIND_LIBRARY (RPMDB_LIBRARY NAMES rpmdb)
--find_package (LibSolv 0.6.30 REQUIRED COMPONENTS ext)
+@@ -45,7 +45,8 @@ endif()
+ 
+ # build dependencies
+ find_package(Gpgme REQUIRED)
+-find_package(LibSolv 0.6.30 REQUIRED COMPONENTS ext)
 +PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
 +set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
- if (ENABLE_RHSM_SUPPORT)
-     pkg_check_modules (RHSM REQUIRED librhsm>=0.0.3)
-     include_directories (${RHSM_INCLUDE_DIRS})
+ find_package(OpenSSL REQUIRED)
+ 
+ 
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.26.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
similarity index 90%
rename from meta/recipes-devtools/libdnf/libdnf_0.26.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index 9c2247c237d..4ff294c32cb 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.26.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -7,10 +7,9 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://0001-Add-WITH_TESTS-option.patch \
-           file://0001-include-missing-string-and-errno.h-headers.patch \
            "
 
-SRCREV = "bd23204aa83d10e3d293a9f2d496cba6070f6a4d"
+SRCREV = "751f89045b80d58c0d05800f74357cf78cdf7e77"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


