Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB7C7FF5F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 05:46:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 21:46:47 -0800
X-IronPort-AV: E=Sophos;i="5.70,348,1574150400"; d="scan'208";a="220200342"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.19])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 21:46:46 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 13:46:35 +0800
Message-Id: <20200122054636.10681-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200122054636.10681-1-anuj.mittal@intel.com>
References: <20200122054636.10681-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] assimp: upgrade 5.0.0 -> 5.0.1
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
X-List-Received-Date: Wed, 22 Jan 2020 05:46:46 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...se-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch | 12 +++++-------
 .../vulkan/{assimp_5.0.0.bb => assimp_5.0.1.bb}      |  4 ++--
 2 files changed, 7 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/vulkan/{assimp_5.0.0.bb => assimp_5.0.1.bb} (84%)

diff --git a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch b/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
index 3e9fbec701..34c5bfa857 100644
--- a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
+++ b/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
@@ -1,4 +1,4 @@
-From dd5c10f660716a2fab513714245be1932003306b Mon Sep 17 00:00:00 2001
+From 58f576d6f240b08957a402960cdf06c74201ac7b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 12 Dec 2019 22:16:15 -0800
 Subject: [PATCH] Use ASSIMP_LIB_INSTALL_DIR to search library
@@ -8,12 +8,13 @@ Use ASSIMP_LIB_INSTALL_DIR rather than hardcoded /lib to search library
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  assimpTargets-release.cmake.in | 16 ++++++++--------
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/assimpTargets-release.cmake.in b/assimpTargets-release.cmake.in
-index b09b881f..5c6999fe 100644
+index f3db8f1..b8a066a 100644
 --- a/assimpTargets-release.cmake.in
 +++ b/assimpTargets-release.cmake.in
 @@ -42,11 +42,11 @@ if(MSVC)
@@ -43,8 +44,8 @@ index b09b881f..5c6999fe 100644
    endif()
  
  else()
-@@ -66,17 +66,17 @@ else()
-     set(sharedLibraryName "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_SHARED_LIBRARY_SUFFIX@.@ASSIMP_VERSION_MAJOR@")
+@@ -70,17 +70,17 @@ else()
+     endif()
      set_target_properties(assimp::assimp PROPERTIES
        IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
 -      IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
@@ -65,6 +66,3 @@ index b09b881f..5c6999fe 100644
    endif()
  endif()
  
--- 
-2.21.0
-
diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.0.bb b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
similarity index 84%
rename from meta/recipes-graphics/vulkan/assimp_5.0.0.bb
rename to meta/recipes-graphics/vulkan/assimp_5.0.1.bb
index a42494a920..5a8c62e64d 100644
--- a/meta/recipes-graphics/vulkan/assimp_5.0.0.bb
+++ b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2119edef0916b0bd511cb3c731076271"
 
 DEPENDS = "zlib"
 
-SRC_URI = "git://github.com/assimp/assimp.git \
+SRC_URI = "git://github.com/assimp/assimp.git;branch=assimp_5.0_release \
            file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch \
            file://0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "2d2889f73fa1b2ca09ba9f43c9785402d3a7fdd0"
+SRCREV = "8f0c6b04b2257a520aaab38421b2e090204b69df"
 
 S = "${WORKDIR}/git"
 
-- 
2.21.1


