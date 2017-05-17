Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id AA83377E1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:40:22 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 17 May 2017 06:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="102811522"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 17 May 2017 06:40:23 -0700
Received: from vmed.fi.intel.com (crosswalk-testmaster.fi.intel.com
	[10.237.72.36])
	by linux.intel.com (Postfix) with ESMTP id C191F6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 06:40:07 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 13:39:50 +0000
Message-Id: <9d117bd35810645dcfb90f192f5294037440d74d.1495028274.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1495028274.git.ed.bartosh@linux.intel.com>
References: <cover.1495028274.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 5/8] wic: add help and usage content for 'wic ls'
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
X-List-Received-Date: Wed, 17 May 2017 13:40:22 -0000

Added wic_ls_help and wic_ls_usage variables to
help.py. These variables contain help content that
will be used in 'wic ls help' and 'wic ls --help'
output.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/help.py | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index f9f7268986..bb3c749323 100644
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
2.12.0


