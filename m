Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD787813F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:15:16 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 09:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="96001826"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 08 Jun 2017 09:15:18 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id DD60C58029B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:15:16 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 19:12:47 +0300
Message-Id: <7d2948e5aab5be3bbf6f5f85f2d052c2f98a7eb4.1496938139.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496938139.git.ed.bartosh@linux.intel.com>
References: <cover.1496938139.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 05/25] wic: add help and usage content for 'wic ls'
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
X-List-Received-Date: Thu, 08 Jun 2017 16:15:17 -0000

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


