Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 634A0721D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 16:07:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 21 Nov 2014 08:08:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="419852009"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.176])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2014 07:58:28 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2014 10:07:49 -0600
Message-Id: <0401998924efd058c73f071e989b505fdf35f3fb.1416585198.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <db14e81d99065b4381af1878a856f4933a0aa9c5.1416585198.git.tom.zanussi@linux.intel.com>
References: <db14e81d99065b4381af1878a856f4933a0aa9c5.1416585198.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1416585198.git.tom.zanussi@linux.intel.com>
References: <cover.1416585198.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 3/6][dizzy] wic: Update the help text to include -D (--debug)
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
X-List-Received-Date: Fri, 21 Nov 2014 16:07:59 -0000

The --debug option is missing from the wic help text; this adds it and
at the same time rearranges the usage into a more logical arrangement.

(From OE-Core rev: cf5144ef241d8f4ccaa3461ae5c9f89c2cf2f8d1)

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/image/help.py | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 080795e..0963532 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -109,8 +109,9 @@ wic_create_usage = """
 
  usage: wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
             [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
-            [-e | --image-name] [-r, --rootfs-dir] [-b, --bootimg-dir]
-            [-k, --kernel-dir] [-n, --native-sysroot] [-s, --skip-build-check]
+            [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
+            [-r, --rootfs-dir] [-b, --bootimg-dir]
+            [-k, --kernel-dir] [-n, --native-sysroot]
 
  This command creates an OpenEmbedded image based on the 'OE kickstart
  commands' found in the <wks file>.
@@ -129,8 +130,9 @@ NAME
 SYNOPSIS
     wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
         [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
-        [-e | --image-name] [-r, --rootfs-dir] [-b, --bootimg-dir]
-        [-k, --kernel-dir] [-n, --native-sysroot] [-s, --skip-build-check]
+        [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
+        [-r, --rootfs-dir] [-b, --bootimg-dir]
+        [-k, --kernel-dir] [-n, --native-sysroot]
 
 DESCRIPTION
     This command creates an OpenEmbedded image based on the 'OE
@@ -172,6 +174,12 @@ DESCRIPTION
     explicitly, 'wic' assumes the user knows what he or she is doing
     and skips the build check.
 
+    The -D option is used to display debug information detailing
+    exactly what happens behind the scenes when a create request is
+    fulfilled (or not, as the case may be).  It enumerates and
+    displays the command sequence used, and should be included in any
+    bug report describing unexpected results.
+
     When 'wic -e' is used, the locations for the build artifacts
     values are determined by 'wic -e' from the output of the 'bitbake
     -e' command given an image name e.g. 'core-image-minimal' and a
@@ -519,8 +527,9 @@ DESCRIPTION
 
        usage: wic create <wks file or image name> [-o <DIRNAME> | ...]
             [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
-            [-e | --image-name] [-r, --rootfs-dir] [-b, --bootimg-dir]
-            [-k, --kernel-dir] [-n, --native-sysroot] [-s, --skip-build-check]
+            [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
+            [-r, --rootfs-dir] [-b, --bootimg-dir]
+            [-k, --kernel-dir] [-n, --native-sysroot]
 
        This command creates an OpenEmbedded image based on the 'OE
        kickstart commands' found in the <wks file>.
-- 
1.9.3


