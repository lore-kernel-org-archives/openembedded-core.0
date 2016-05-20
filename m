Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2436E60043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 12:50:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 20 May 2016 05:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,339,1459839600"; d="scan'208";a="985288815"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 20 May 2016 05:50:51 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 929A96A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 06:38:21 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2016 15:51:19 +0300
Message-Id: <1463748682-22067-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/4] cmake: update to 3.5.2
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
X-List-Received-Date: Fri, 20 May 2016 12:50:53 -0000

Adjust LIC_FILES_CHKSUM due to changes in the Copyright date.
No change to the license text.

Remove the upstreamed patch:
        1. 0001-Add-NIOS2-CPU-support.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...cmake-native_3.4.3.bb => cmake-native_3.5.2.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc              |  7 ++-
 .../cmake/cmake/0001-Add-NIOS2-CPU-support.patch   | 50 ----------------------
 .../cmake/{cmake_3.4.3.bb => cmake_3.5.2.bb}       |  0
 4 files changed, 3 insertions(+), 54 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.4.3.bb => cmake-native_3.5.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-Add-NIOS2-CPU-support.patch
 rename meta/recipes-devtools/cmake/{cmake_3.4.3.bb => cmake_3.5.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.4.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.5.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.4.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.5.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 968d003..4c1a4c7 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=3ba5a6c34481652ce573e5c4e1d707e4 \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=052f86c15bbde68af55c7f7b340ab639 \
                     file://Source/cmake.h;beginline=1;endline=10;md5=341736dae83c9e344b53eeb1bc7d7bc2"
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
@@ -14,11 +14,10 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch \
            file://qt4-fail-silent.patch \
-           file://0001-Add-NIOS2-CPU-support.patch \
            "
 
-SRC_URI[md5sum] = "4cb3ff35b2472aae70f542116d616e63"
-SRC_URI[sha256sum] = "b73f8c1029611df7ed81796bf5ca8ba0ef41c6761132340c73ffe42704f980fa"
+SRC_URI[md5sum] = "701386a1b5ec95f8d1075ecf96383e02"
+SRC_URI[sha256sum] = "92d8410d3d981bb881dfff2aed466da55a58d34c7390d50449aa59b32bb5e62a"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-Add-NIOS2-CPU-support.patch b/meta/recipes-devtools/cmake/cmake/0001-Add-NIOS2-CPU-support.patch
deleted file mode 100644
index 6e0ab9f..0000000
--- a/meta/recipes-devtools/cmake/cmake/0001-Add-NIOS2-CPU-support.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 3f8c3d3011ea192da2c761560b615f55763715ef Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Thu, 26 Nov 2015 21:31:04 +0100
-Subject: [PATCH] Add NIOS2 CPU support
-
-Add necessary bits to support the NIOS2 little-endian CPU.
-
-Signed-off-by: Marek Vasut <marex@denx.de>
-Cc: Ley Foon Tan <lftan@altera.com>
-Cc: Thomas Chou <thomas@wytron.com.tw>
-Cc: Walter Goossens <waltergoossens@home.nl>
-Upstream-Status: Submitted
----
- Source/kwsys/CPU.h.in    | 4 ++++
- Utilities/KWIML/ABI.h.in | 4 ++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/Source/kwsys/CPU.h.in b/Source/kwsys/CPU.h.in
-index 884d71a..66ffbb1 100644
---- a/Source/kwsys/CPU.h.in
-+++ b/Source/kwsys/CPU.h.in
-@@ -88,6 +88,10 @@
- #elif defined(__mips) || defined(__mips__) || defined(__MIPS__)
- # define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID @KWSYS_NAMESPACE@_CPU_ENDIAN_ID_BIG
- 
-+/* NIOS2 */
-+#elif defined(__NIOS2__) || defined(__NIOS2) || defined(__nios2__)
-+# define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID @KWSYS_NAMESPACE@_CPU_ENDIAN_ID_LITTLE
-+
- /* OpenRISC 1000 */
- #elif defined(__or1k__)
- # define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID @KWSYS_NAMESPACE@_CPU_ENDIAN_ID_BIG
-diff --git a/Utilities/KWIML/ABI.h.in b/Utilities/KWIML/ABI.h.in
-index 6300ada..87b6e96 100644
---- a/Utilities/KWIML/ABI.h.in
-+++ b/Utilities/KWIML/ABI.h.in
-@@ -398,6 +398,10 @@ suppression macro @KWIML@_ABI_NO_VERIFY was defined.
- #elif defined(__mips) || defined(__mips__) || defined(__MIPS__)
- # define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_BIG
- 
-+/* NIOS2 */
-+#elif defined(__NIOS2__) || defined(__NIOS2) || defined(__nios2__)
-+# define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_LITTLE
-+
- /* OpenRISC 1000 */
- #elif defined(__or1k__)
- # define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_BIG
--- 
-2.6.2
-
diff --git a/meta/recipes-devtools/cmake/cmake_3.4.3.bb b/meta/recipes-devtools/cmake/cmake_3.5.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.4.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.5.2.bb
-- 
2.4.0


