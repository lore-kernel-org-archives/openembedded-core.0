Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A1DF978277
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:15:21 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 09:15:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="978408385"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 08 Jun 2017 09:15:23 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 3455B58029B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:15:22 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 19:12:52 +0300
Message-Id: <c84c8b93bd2d806d25e289724c2dff02f255e5d5.1496938139.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496938139.git.ed.bartosh@linux.intel.com>
References: <cover.1496938139.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 10/25] wic: add help and usage content for 'wic cp'
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
X-List-Received-Date: Thu, 08 Jun 2017 16:15:21 -0000

Added wic_cp_help and wic_cp_usage variables to
help.py. These variables contain help content that
will be used in 'wic cp help' and 'wic cp --help'
output.

[YOCTO #11283]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/help.py | 62 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index bb3c749..e93ac4b 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -349,6 +349,68 @@ DESCRIPTION
 
 """
 
+wic_cp_usage = """
+
+ Copy files and directories to the vfat partitions
+
+ usage: wic cp <src> <image>:<vfat partition>[<path>] [--native-sysroot <path>]
+
+ This command  copies local files or directories to the vfat partitions of partitioned
+ image.
+
+ See 'wic help cp' for more detailed instructions.
+
+"""
+
+wic_cp_help = """
+
+NAME
+    wic cp - copy files and directories to the vfat partitions
+
+SYNOPSIS
+    wic cp <src> <image>:<vfat partition>
+    wic cp <src> <image>:<vfat partition><path>
+    wic cp <src> <image>:<vfat partition><path> --native-sysroot <path>
+
+DESCRIPTION
+    This command copies files and directories to the vfat partition of the
+    wic image.
+
+    The first form of it copies file or directory to the root directory of
+    the vfat partition:
+        $ wic cp test.wks tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
+        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
+        Volume in drive : is boot
+         Volume Serial Number is DB4C-FD4C
+        Directory for ::/
+
+        efi          <DIR>     2017-05-24  18:15
+        loader       <DIR>     2017-05-24  18:15
+        startup  nsh        26 2017-05-24  18:15
+        vmlinuz        6926384 2017-05-24  18:15
+        test     wks       628 2017-05-24  21:22
+                5 files           6 927 038 bytes
+                                 15 677 440 bytes free
+
+    The second form of the command copies file or directory to the specified directory
+    on the vfat partition:
+       $ wic cp test tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/efi/
+       $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/eti/
+       Volume in drive : is boot
+        Volume Serial Number is DB4C-FD4C
+       Directory for ::/efi
+
+       .            <DIR>     2017-05-24  18:15
+       ..           <DIR>     2017-05-24  18:15
+       boot         <DIR>     2017-05-24  18:15
+       test         <DIR>     2017-05-24  21:27
+               4 files                   0 bytes
+                                15 675 392 bytes free
+
+    The -n option is used to specify the path to the native sysroot
+    containing the tools(parted and mtools) to use.
+"""
+
 wic_plugins_help = """
 
 NAME
-- 
2.1.4


