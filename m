Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6145176DC0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:17:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2015 05:17:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="550251018"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2015 05:17:39 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 15:18:57 +0300
Message-Id: <3cef45b83a8e7bf3cbc48086de6c2ab2dd4ca67a.1440763946.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 8/8] cmake: update to 3.3.1
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
X-List-Received-Date: Fri, 28 Aug 2015 12:17:47 -0000

Share tarball checksums between cmake and cmake-native via cmake.inc.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../cmake/{cmake-native_3.2.2.bb => cmake-native_3.3.1.bb}             | 3 ---
 meta/recipes-devtools/cmake/cmake.inc                                  | 3 +++
 meta/recipes-devtools/cmake/{cmake_3.2.2.bb => cmake_3.3.1.bb}         | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.2.2.bb => cmake-native_3.3.1.bb} (72%)
 rename meta/recipes-devtools/cmake/{cmake_3.2.2.bb => cmake_3.3.1.bb} (92%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.2.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.3.1.bb
similarity index 72%
rename from meta/recipes-devtools/cmake/cmake-native_3.2.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.3.1.bb
index 17e9e2c..cb4e749 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.2.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.3.1.bb
@@ -8,9 +8,6 @@ SRC_URI += "\
     file://cmlibarchive-disable-ext2fs.patch \
 "
 
-SRC_URI[md5sum] = "2da57308071ea98b10253a87d2419281"
-SRC_URI[sha256sum] = "ade94e6e36038774565f2aed8866415443444fb7a362eb0ea5096e40d5407c78"
-
 # Disable ccmake since we don't depend on ncurses
 CMAKE_EXTRACONF = "\
     -DBUILD_CursesDialog=0 \
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d1cb7ab..57e93ac 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -16,6 +16,9 @@ SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz
            file://qt4-fail-silent.patch \
            "
 
+SRC_URI[md5sum] = "52638576f4e1e621fed6c3410d3a1b12"
+SRC_URI[sha256sum] = "cd65022c6a0707f1c7112f99e9c981677fdd5518f7ddfa0f778d4cee7113e3d6"
+
 inherit autotools
 
 # Ugly hack to work around undefined OE_QMAKE_PATH_EXTERNAL_HOST_BINS variable
diff --git a/meta/recipes-devtools/cmake/cmake_3.2.2.bb b/meta/recipes-devtools/cmake/cmake_3.3.1.bb
similarity index 92%
rename from meta/recipes-devtools/cmake/cmake_3.2.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.3.1.bb
index 4765f6c..2f188f0 100644
--- a/meta/recipes-devtools/cmake/cmake_3.2.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.3.1.bb
@@ -8,9 +8,6 @@ SRC_URI_append_class-nativesdk = " \
     file://OEToolchainConfig.cmake \
     file://environment.d-cmake.sh"
 
-SRC_URI[md5sum] = "2da57308071ea98b10253a87d2419281"
-SRC_URI[sha256sum] = "ade94e6e36038774565f2aed8866415443444fb7a362eb0ea5096e40d5407c78"
-
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
     prefix=d.getVar("prefix", True)
-- 
2.1.4


