Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3939C6D06C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:34:26 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Oct 2013 03:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,513,1378882800"; d="scan'208";a="376040023"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 17 Oct 2013 03:34:27 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:34:14 +0300
Message-Id: <347f7e68905e5255b56328279d5b38bb315168b2.1382005791.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/8] m4: upgrade to 1.4.17
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
X-List-Received-Date: Thu, 17 Oct 2013 10:34:27 -0000

Refreshed remove-gets.patch to apply correctly and changed license
checksum since some years were added to the license file.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../m4/{m4-1.4.16.inc => m4-1.4.17.inc}            |    9 +++------
 .../{m4-native_1.4.16.bb => m4-native_1.4.17.bb}   |    0
 meta/recipes-devtools/m4/m4/remove-gets.patch      |   18 ++++++++++--------
 .../m4/{m4_1.4.16.bb => m4_1.4.17.bb}              |    0
 4 files changed, 13 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/m4/{m4-1.4.16.inc => m4-1.4.17.inc} (47%)
 rename meta/recipes-devtools/m4/{m4-native_1.4.16.bb => m4-native_1.4.17.bb} (100%)
 rename meta/recipes-devtools/m4/{m4_1.4.16.bb => m4_1.4.17.bb} (100%)

diff --git a/meta/recipes-devtools/m4/m4-1.4.16.inc b/meta/recipes-devtools/m4/m4-1.4.17.inc
similarity index 47%
rename from meta/recipes-devtools/m4/m4-1.4.16.inc
rename to meta/recipes-devtools/m4/m4-1.4.17.inc
index 01016d6..790678e 100644
--- a/meta/recipes-devtools/m4/m4-1.4.16.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.17.inc
@@ -3,14 +3,11 @@ require m4.inc
 LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-	            file://examples/COPYING;md5=fbc986d45b3dae6725c29870dd6b669d"
+	            file://examples/COPYING;md5=4031593b2166d6c47cae282d944a7ede"
 
-PR = "r4"
 SRC_URI += "file://ac_config_links.patch \
             file://remove-gets.patch \
            "
 
-SRC_URI[md5sum] = "a5dfb4f2b7370e9d34293d23fd09b280"
-SRC_URI[sha256sum] = "e9176a35bb13a1b08482359aa554ee8072794f58f00e4827bf0e06b570c827da"
-
-
+SRC_URI[md5sum] = "a5e9954b1dae036762f7b13673a2cf76"
+SRC_URI[sha256sum] = "3ce725133ee552b8b4baca7837fb772940b25e81b2a9dc92537aeaf733538c9e"
diff --git a/meta/recipes-devtools/m4/m4-native_1.4.16.bb b/meta/recipes-devtools/m4/m4-native_1.4.17.bb
similarity index 100%
rename from meta/recipes-devtools/m4/m4-native_1.4.16.bb
rename to meta/recipes-devtools/m4/m4-native_1.4.17.bb
diff --git a/meta/recipes-devtools/m4/m4/remove-gets.patch b/meta/recipes-devtools/m4/m4/remove-gets.patch
index 9c396d9..effb353 100644
--- a/meta/recipes-devtools/m4/m4/remove-gets.patch
+++ b/meta/recipes-devtools/m4/m4/remove-gets.patch
@@ -4,18 +4,20 @@ undefining it.
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: m4-1.4.16/lib/stdio.in.h
+Index: m4-1.4.17/lib/stdio.in.h
 ===================================================================
---- m4-1.4.16.orig/lib/stdio.in.h	2011-03-01 08:39:29.000000000 -0800
-+++ m4-1.4.16/lib/stdio.in.h	2012-07-03 08:32:08.145935928 -0700
-@@ -161,8 +161,10 @@
+--- m4-1.4.17.orig/lib/stdio.in.h	2013-10-16 14:41:01.678496227 +0300
++++ m4-1.4.17/lib/stdio.in.h	2013-10-16 14:41:48.849427839 +0300
+@@ -717,10 +717,12 @@
  /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
+    so any use of gets warrants an unconditional warning; besides, C11
+    removed it.  */
 +#if defined gets
  #undef gets
+ #if HAVE_RAW_DECL_GETS
  _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
+ #endif
 +#endif
  
- #if @GNULIB_FOPEN@
- # if @REPLACE_FOPEN@
+ 
+ #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
diff --git a/meta/recipes-devtools/m4/m4_1.4.16.bb b/meta/recipes-devtools/m4/m4_1.4.17.bb
similarity index 100%
rename from meta/recipes-devtools/m4/m4_1.4.16.bb
rename to meta/recipes-devtools/m4/m4_1.4.17.bb
-- 
1.7.9.5


