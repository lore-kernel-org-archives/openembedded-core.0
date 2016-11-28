Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 23D6F71A85
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:28 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412241"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:29 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:17 +0200
Message-Id: <25f83a1bf177dde8db32ac494b4f0a82839ffb43.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/18] cmake: update to 3.7.0
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:28 -0000

License is still 3-clause BSD.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../cmake/{cmake-native_3.6.2.bb => cmake-native_3.7.0.bb}        | 1 +
 meta/recipes-devtools/cmake/cmake.inc                             | 8 ++++----
 meta/recipes-devtools/cmake/{cmake_3.6.2.bb => cmake_3.7.0.bb}    | 1 +
 3 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.6.2.bb => cmake-native_3.7.0.bb} (95%)
 rename meta/recipes-devtools/cmake/{cmake_3.6.2.bb => cmake_3.7.0.bb} (97%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.6.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.7.0.bb
similarity index 95%
rename from meta/recipes-devtools/cmake/cmake-native_3.6.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.7.0.bb
index aec0d64..7ad4345 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.6.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.7.0.bb
@@ -17,6 +17,7 @@ CMAKE_EXTRACONF = "\
     -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0 \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
 "
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index fee511f..9ae2890 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=052f86c15bbde68af55c7f7b340ab639 \
-                    file://Source/cmake.h;beginline=1;endline=10;md5=341736dae83c9e344b53eeb1bc7d7bc2"
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=7a64bc564202bf7401d9a8ef33c9564d \
+                    file://Source/cmake.h;beginline=1;endline=3;md5=4494dee184212fc89c469c3acd555a14"
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV', True).split('.')[0:2])}"
 
@@ -17,8 +17,8 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://avoid-gcc-warnings-with-Wstrict-prototypes.patch \
            "
 
-SRC_URI[md5sum] = "139d7affdd4e8ab1edfc9f4322d69e43"
-SRC_URI[sha256sum] = "189ae32a6ac398bb2f523ae77f70d463a6549926cde1544cd9cc7c6609f8b346"
+SRC_URI[md5sum] = "3801dc4e54c1c957a7378d8b0d4254ba"
+SRC_URI[sha256sum] = "ed63e05c41aeb6c036e503114ab15847f29c312f9f21f5f1a7060a4b4ec2fb31"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.6.2.bb b/meta/recipes-devtools/cmake/cmake_3.7.0.bb
similarity index 97%
rename from meta/recipes-devtools/cmake/cmake_3.6.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.7.0.bb
index 850d6de..58c6615 100644
--- a/meta/recipes-devtools/cmake/cmake_3.6.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.7.0.bb
@@ -27,6 +27,7 @@ EXTRA_OECMAKE=" \
     -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
     -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0 \
     -DKWSYS_CHAR_IS_SIGNED=1 \
     -DBUILD_CursesDialog=0 \
     ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
-- 
2.10.2


