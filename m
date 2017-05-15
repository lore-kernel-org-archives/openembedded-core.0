Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 623C772F5F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 14:20:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 15 May 2017 07:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,345,1491289200"; d="scan'208";a="261790822"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 15 May 2017 07:20:30 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id F030B6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 07:20:14 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 16:57:36 +0300
Message-Id: <323b2f9ad7b6e78adcd53465fc2bcbae7fba2f2d.1494856157.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494856157.git.ed.bartosh@linux.intel.com>
References: <cover.1494856157.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 5/8] wic: add help and usage content for 'wic ls'
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
X-List-Received-Date: Mon, 15 May 2017 14:20:30 -0000

Added wic_ls_help and wic_ls_usage variables to
help.py. These variables contain help content that
will be used in 'wic ls help' and 'wic ls --help'
output.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/help.py | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index f9f7268..bb3c749 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -284,6 +284,71 @@ DESCRIPTION
     details.
 """
 
+wic_ls_usage = """
+
+ List content of a partitioned image
+
+ usage: wic ls <image>[:<vfat partition>[<path>]] [--native-sysroot <path>]
+
+ This command  outputs either list of image partitions or directory contents
+ of vfat partitions.
+
+ See 'wic help ls' for more detailed instructions.
+
+"""
+
+wic_ls_help = """
+
+NAME
+    wic ls - List contents of partitioned image or vfat partitions
+
+SYNOPSIS
+    wic ls <image>
+    wic ls <image>:<vfat partition>
+    wic ls <image>:<vfat partition><path>
+    wic ls <image>:<vfat partition><path> --native-sysroot <path>
+
+DESCRIPTION
+    This command lists either partitions of the image or directory contents
+    of vfat partitions.
+
+    The first form it lists partitions of the image.
+    For example:
+        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
+        Num     Start        End          Size      Fstype
+        1        1048576     24438783     23390208  fat16
+        2       25165824     50315263     25149440  ext4
+
+    Second and third form list directory content of vfat partition:
+        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
+        Volume in drive : is boot
+         Volume Serial Number is 2DF2-5F02
+        Directory for ::/
+
+        efi          <DIR>     2017-05-11  10:54
+        startup  nsh        26 2017-05-11  10:54
+        vmlinuz        6922288 2017-05-11  10:54
+                3 files           6 922 314 bytes
+                                 15 818 752 bytes free
+
+
+        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/EFI/boot/
+        Volume in drive : is boot
+         Volume Serial Number is 2DF2-5F02
+        Directory for ::/EFI/boot
+
+        .            <DIR>     2017-05-11  10:54
+        ..           <DIR>     2017-05-11  10:54
+        grub     cfg       679 2017-05-11  10:54
+        bootx64  efi    571392 2017-05-11  10:54
+                4 files             572 071 bytes
+                                 15 818 752 bytes free
+
+    The -n option is used to specify the path to the native sysroot
+    containing the tools(parted and mtools) to use.
+
+"""
+
 wic_plugins_help = """
 
 NAME
-- 
2.1.4


