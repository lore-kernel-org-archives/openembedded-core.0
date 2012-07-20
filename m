Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SsMHQ-0003s7-If
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 01:06:40 +0200
Received: by pbbrq2 with SMTP id rq2so6138963pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 15:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/ddGD9WhVhCiSc49TKhhj2GhUBmyljvO8t4+zVN4Vc0=;
	b=d8ihqKE2U+2PbW3zzBdq7SKeAXkIBYWcB7NVcuffWk1pfN2ojhTqV/aSMNOPRSF3Mo
	ictmkB8lXtnI7cpuzYAG+s8QjbOhkr4iHY9d2EYzxr7ovIKzo7IS29hnMQ76DDTDgD5y
	gC2vwo82ihuOsVQXMs0EqpyTV9x4359BhtdaOsQETi7Fx+9gOkpnJjziU6+9vG7qoHXZ
	SauONXKb267mwwvuNex/wcPnlZqGxfDPrwXQfhJCTDoRw16SmCzwEDs12bJxKNlOCXaF
	Q94rjzE4pkQfF8ms5Ei9DWAKjoGm2PCq1cfgAp3C+KyZBl+BNIuGUVCVZ4dr3X0o2ffZ
	ReTQ==
Received: by 10.66.75.168 with SMTP id d8mr14520405paw.63.1342824915743;
	Fri, 20 Jul 2012 15:55:15 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ot4sm4775373pbb.65.2012.07.20.15.55.14
	(version=SSLv3 cipher=OTHER); Fri, 20 Jul 2012 15:55:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 15:55:12 -0700
Message-Id: <1342824914-24712-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Khem Raj <kraj@juniper.net>
Subject: [PATCH 1/3] cmake: Upgrade recipes to 2.8.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2012 23:06:41 -0000

From: Khem Raj <kraj@juniper.net>

Copyright year change means a change in checksum
...

 CMake - Cross Platform Makefile Generator
-Copyright 2000-2009 Kitware, Inc., Insight Software Consortium
+Copyright 2000-2011 Kitware, Inc., Insight Software Consortium
 All rights reserved.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb |    7 ----
 meta/recipes-devtools/cmake/cmake-native_2.8.8.bb |    8 +++++
 meta/recipes-devtools/cmake/cmake.inc             |    4 +--
 meta/recipes-devtools/cmake/cmake_2.8.5.bb        |   40 ---------------------
 meta/recipes-devtools/cmake/cmake_2.8.8.bb        |   40 +++++++++++++++++++++
 5 files changed, 50 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.8.bb
 delete mode 100644 meta/recipes-devtools/cmake/cmake_2.8.5.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake_2.8.8.bb

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
deleted file mode 100644
index 3fe0c2e..0000000
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require cmake.inc
-inherit native
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "3c5d32cec0f4c2dc45f4c2e84f4a20c5"
-SRC_URI[sha256sum] = "5e18bff75f01656c64f553412a8905527e1b85efaf3163c6fb81ea5aaced0b91"
diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.8.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.8.bb
new file mode 100644
index 0000000..03d57d1
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.8.bb
@@ -0,0 +1,8 @@
+require cmake.inc
+inherit native
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "ba74b22c788a0c8547976b880cd02b17"
+SRC_URI[sha256sum] = "2b59897864d6220ff20aa8eac64cac8994e004898a1c0f899c8cb4d7b7570b46"
+
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d080e50..6dc319c 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -6,10 +6,10 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=f372516292ff7c33337bf16a74a5f9a8 \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=bb2fa3a08736b842556f6171bb9e8ae1 \
                     file://Source/cmake.h;beginline=1;endline=10;md5=341736dae83c9e344b53eeb1bc7d7bc2"
 
-INC_PR = "r2"
+INC_PR = "r0"
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.5.bb b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
deleted file mode 100644
index 6145345..0000000
--- a/meta/recipes-devtools/cmake/cmake_2.8.5.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-require cmake.inc
-
-inherit cmake
-
-DEPENDS += "curl expat zlib libarchive ncurses"
-
-PR = "${INC_PR}.3"
-
-SRC_URI += "file://dont-run-cross-binaries.patch"
-
-SRC_URI[md5sum] = "3c5d32cec0f4c2dc45f4c2e84f4a20c5"
-SRC_URI[sha256sum] = "5e18bff75f01656c64f553412a8905527e1b85efaf3163c6fb81ea5aaced0b91"
-
-# Strip ${prefix} from ${docdir}, set result into docdir_stripped
-python () {
-    prefix=d.getVar("prefix", True)
-    docdir=d.getVar("docdir", True)
-
-    if not docdir.startswith(prefix):
-	raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
-
-    docdir_stripped = docdir[len(prefix):]
-    if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
-	docdir_stripped = docdir_stripped[1:]
-
-    d.setVar("docdir_stripped", docdir_stripped)
-}
-
-EXTRA_OECMAKE=" \
-    -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
-    -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
-    -DKWSYS_CHAR_IS_SIGNED=1 \
-    -DBUILD_CursesDialog=0 \
-    ${@base_contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
-"
-
-FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
-FILES_${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.8.bb b/meta/recipes-devtools/cmake/cmake_2.8.8.bb
new file mode 100644
index 0000000..8665dc3
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake_2.8.8.bb
@@ -0,0 +1,40 @@
+require cmake.inc
+
+inherit cmake
+
+DEPENDS += "curl expat zlib libarchive ncurses"
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://dont-run-cross-binaries.patch"
+
+SRC_URI[md5sum] = "ba74b22c788a0c8547976b880cd02b17"
+SRC_URI[sha256sum] = "2b59897864d6220ff20aa8eac64cac8994e004898a1c0f899c8cb4d7b7570b46"
+
+# Strip ${prefix} from ${docdir}, set result into docdir_stripped
+python () {
+    prefix=d.getVar("prefix", True)
+    docdir=d.getVar("docdir", True)
+
+    if not docdir.startswith(prefix):
+	raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
+
+    docdir_stripped = docdir[len(prefix):]
+    if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
+	docdir_stripped = docdir_stripped[1:]
+
+    d.setVar("docdir_stripped", docdir_stripped)
+}
+
+EXTRA_OECMAKE=" \
+    -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
+    -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
+    -DKWSYS_CHAR_IS_SIGNED=1 \
+    -DBUILD_CursesDialog=0 \
+    ${@base_contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
+"
+
+FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
+FILES_${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.9.5



