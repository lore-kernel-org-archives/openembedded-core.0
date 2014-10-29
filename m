Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DBBF56AC47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 22:04:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 29 Oct 2014 15:02:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,280,1413270000"; d="scan'208";a="627922440"
Received: from enewy-mobl1.amr.corp.intel.com (HELO localhost) ([10.254.56.8])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2014 15:04:35 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: philip@balister.org, maciej.borzecki@open-rnd.pl,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 17:04:21 -0500
Message-Id: <a6fcd2262266431a33398a4617d755f12b639eba.1414618765.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <92a50f084bc31cb2824d01435737b85be99f0d1d.1414618765.git.tom.zanussi@linux.intel.com>
References: <92a50f084bc31cb2824d01435737b85be99f0d1d.1414618765.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1414618765.git.tom.zanussi@linux.intel.com>
References: <cover.1414618765.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 3/6] wic: Update the help text to include -D (--debug)
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
X-List-Received-Date: Wed, 29 Oct 2014 22:04:36 -0000

The --debug option is missing from the wic help text; this adds it and
at the same time rearranges the usage into a more logical arrangement.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
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


