Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 6C9A07C420
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 07:12:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2019 23:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,388,1544515200"; d="scan'208";a="276403701"
Received: from anmitta2-mobl1.png.intel.com ([10.221.16.243])
	by orsmga004.jf.intel.com with ESMTP; 19 Feb 2019 23:12:49 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 15:12:46 +0800
Message-Id: <20190220071247.3758-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] libjpeg-turbo: upgrade 2.0.1 -> 2.0.2
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
X-List-Received-Date: Wed, 20 Feb 2019 07:12:49 -0000

For changes, see:

https://github.com/libjpeg-turbo/libjpeg-turbo/releases

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...0001-libjpeg-turbo-fix-package_qa-error.patch | 16 ++++++++--------
 ...peg-turbo_2.0.1.bb => libjpeg-turbo_2.0.2.bb} |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.0.1.bb => libjpeg-turbo_2.0.2.bb} (95%)

diff --git a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
index 6f3d201b21..82fffe1e68 100644
--- a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
+++ b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
@@ -1,4 +1,4 @@
-From ce3bd4f0e46f738a9aec098e7c341ad6deeab9f2 Mon Sep 17 00:00:00 2001
+From 5cf847b5bef8dc3f9f89bd09dd5af4e6603f393c Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 27 Aug 2018 16:10:55 +0800
 Subject: [PATCH] libjpeg-turbo: fix package_qa error
@@ -16,17 +16,17 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index efeb51a..bbebe55 100644
+index 2bc3458..ea3041e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -109,10 +109,6 @@ endif()
- 
- include(cmakescripts/GNUInstallDirs.cmake)
+@@ -189,10 +189,6 @@ endif()
+ report_option(ENABLE_SHARED "Shared libraries")
+ report_option(ENABLE_STATIC "Static libraries")
  
 -if(ENABLE_SHARED)
 -  set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})
 -endif()
 -
- macro(report_directory var)
-   if(CMAKE_INSTALL_${var} STREQUAL CMAKE_INSTALL_FULL_${var})
-     message(STATUS "CMAKE_INSTALL_${var} = ${CMAKE_INSTALL_${var}}")
+ if(WITH_12BIT)
+   set(WITH_ARITH_DEC 0)
+   set(WITH_ARITH_ENC 0)
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.2.bb
similarity index 95%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.2.bb
index 029847ff5f..e1df754b76 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.2.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[md5sum] = "1b05a66aa9b006fd04ed29f408e68f46"
-SRC_URI[sha256sum] = "e5f86cec31df1d39596e0cca619ab1b01f99025a27dafdfc97a30f3a12f866ff"
+SRC_URI[md5sum] = "79f76fbfb0c6109631332762d10e16d2"
+SRC_URI[sha256sum] = "acb8599fe5399af114287ee5907aea4456f8f2c1cc96d26c28aebfdf5ee82fed"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.17.1


