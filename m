Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7B678066
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 11:56:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Sep 2017 04:55:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,480,1498546800"; d="scan'208";a="1191668877"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2017 04:55:38 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id F2D5D5809EF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 04:55:37 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 14:54:39 +0300
Message-Id: <71f2414acd9c390fd74967b6b8a65e3a2c2a4734.1504611134.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <cover.1504611134.git.ed.bartosh@linux.intel.com>
References: <cover.1504611134.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/7] wic: update help content
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
X-List-Received-Date: Tue, 05 Sep 2017 11:56:08 -0000

Added ext* partitions to the description of 'wic ls',
'wic cp' and 'wic rm' commands.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/help.py | 64 ++++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index ccd33823244..83bd86e7c51 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -288,10 +288,10 @@ wic_ls_usage = """
 
  List content of a partitioned image
 
- usage: wic ls <image>[:<vfat partition>[<path>]] [--native-sysroot <path>]
+ usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot <path>]
 
  This command  outputs either list of image partitions or directory contents
- of vfat partitions.
+ of vfat and ext* partitions.
 
  See 'wic help ls' for more detailed instructions.
 
@@ -300,17 +300,17 @@ wic_ls_usage = """
 wic_ls_help = """
 
 NAME
-    wic ls - List contents of partitioned image or vfat partitions
+    wic ls - List contents of partitioned image or partition
 
 SYNOPSIS
     wic ls <image>
-    wic ls <image>:<vfat partition>
-    wic ls <image>:<vfat partition><path>
-    wic ls <image>:<vfat partition><path> --native-sysroot <path>
+    wic ls <image>:<vfat or ext* partition>
+    wic ls <image>:<vfat or ext* partition><path>
+    wic ls <image>:<vfat or ext* partition><path> --native-sysroot <path>
 
 DESCRIPTION
     This command lists either partitions of the image or directory contents
-    of vfat partitions.
+    of vfat or ext* partitions.
 
     The first form it lists partitions of the image.
     For example:
@@ -319,7 +319,7 @@ DESCRIPTION
         1        1048576     24438783     23390208  fat16
         2       25165824     50315263     25149440  ext4
 
-    Second and third form list directory content of vfat partition:
+    Second and third form list directory content of the partition:
         $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
         Volume in drive : is boot
          Volume Serial Number is 2DF2-5F02
@@ -351,12 +351,12 @@ DESCRIPTION
 
 wic_cp_usage = """
 
- Copy files and directories to the vfat partitions
+ Copy files and directories to the vfat or ext* partition
 
- usage: wic cp <src> <image>:<vfat partition>[<path>] [--native-sysroot <path>]
+ usage: wic cp <src> <image>:<partition>[<path>] [--native-sysroot <path>]
 
- This command  copies local files or directories to the vfat partitions of partitioned
- image.
+ This command  copies local files or directories to the vfat or ext* partitions
+of partitioned  image.
 
  See 'wic help cp' for more detailed instructions.
 
@@ -365,19 +365,19 @@ wic_cp_usage = """
 wic_cp_help = """
 
 NAME
-    wic cp - copy files and directories to the vfat partitions
+    wic cp - copy files and directories to the vfat or ext* partitions
 
 SYNOPSIS
-    wic cp <src> <image>:<vfat partition>
-    wic cp <src> <image>:<vfat partition><path>
-    wic cp <src> <image>:<vfat partition><path> --native-sysroot <path>
+    wic cp <src> <image>:<partition>
+    wic cp <src> <image>:<partition><path>
+    wic cp <src> <image>:<partition><path> --native-sysroot <path>
 
 DESCRIPTION
-    This command copies files and directories to the vfat partition of the
-    wic image.
+    This command copies files and directories to the vfat or ext* partition of
+    the partitioned image.
 
     The first form of it copies file or directory to the root directory of
-    the vfat partition:
+    the partition:
         $ wic cp test.wks tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
         $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
         Volume in drive : is boot
@@ -393,7 +393,7 @@ DESCRIPTION
                                  15 677 440 bytes free
 
     The second form of the command copies file or directory to the specified directory
-    on the vfat partition:
+    on the partition:
        $ wic cp test tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/efi/
        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/efi/
        Volume in drive : is boot
@@ -413,12 +413,12 @@ DESCRIPTION
 
 wic_rm_usage = """
 
- Remove files or directories from the vfat partitions
+ Remove files or directories from the vfat or ext* partitions
 
- usage: wic rm <image>:<vfat partition><path> [--native-sysroot <path>]
+ usage: wic rm <image>:<partition><path> [--native-sysroot <path>]
 
- This command  removes files or directories from the vfat partitions of partitioned
- image.
+ This command  removes files or directories from the vfat or ext* partitions of
+ the partitioned image.
 
  See 'wic help rm' for more detailed instructions.
 
@@ -427,15 +427,15 @@ wic_rm_usage = """
 wic_rm_help = """
 
 NAME
-    wic rm - remove files or directories from the vfat partitions
+    wic rm - remove files or directories from the vfat or ext* partitions
 
 SYNOPSIS
-    wic rm <src> <image>:<vfat partition><path>
-    wic rm <src> <image>:<vfat partition><path> --native-sysroot <path>
+    wic rm <src> <image>:<partition><path>
+    wic rm <src> <image>:<partition><path> --native-sysroot <path>
 
 DESCRIPTION
-    This command removes files or directories from the vfat partition of the
-    wic image:
+    This command removes files or directories from the vfat or ext* partition of the
+    partitioned image:
 
         $ wic ls ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
         Volume in drive : is boot
@@ -474,7 +474,7 @@ wic_write_usage = """
 
  usage: wic write <image> <target device> [--expand [rules]] [--native-sysroot <path>]
 
- This command writes wic image to a target device (USB stick, SD card etc).
+ This command writes partitioned image to a target device (USB stick, SD card etc).
 
  See 'wic help write' for more detailed instructions.
 
@@ -483,7 +483,7 @@ wic_write_usage = """
 wic_write_help = """
 
 NAME
-    wic write - write wic image to a device
+    wic write - write an image to a device
 
 SYNOPSIS
     wic write <image> <target>
@@ -492,7 +492,7 @@ SYNOPSIS
     wic write <image> <target> --native-sysroot <path>
 
 DESCRIPTION
-    This command writes wic image to a target device (USB stick, SD card etc)
+    This command writes an image to a target device (USB stick, SD card etc)
 
         $ wic write ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic /dev/sdb
 
-- 
2.13.5


