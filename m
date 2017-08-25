Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id BED8860939
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:42:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 25 Aug 2017 06:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,425,1498546800"; d="scan'208";a="128187861"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 25 Aug 2017 06:42:18 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 1F41258048D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 06:42:17 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 16:41:36 +0300
Message-Id: <60a0b98024d81708598c09307a04dc4c11a2654b.1503667857.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503667857.git.ed.bartosh@linux.intel.com>
References: <cover.1503667857.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 01/10] wic: add help and usage content for 'wic write'
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
X-List-Received-Date: Fri, 25 Aug 2017 13:42:17 -0000

Added wic_write_help and wic_write_usage variables to the help.py module.
These variables contain help content that will be used in 'wic write help'
and 'wic write --help' output.

[YOCTO #11278]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/help.py | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 99912cd..ccd3382 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -468,6 +468,46 @@ DESCRIPTION
     containing the tools(parted and mtools) to use.
 """
 
+wic_write_usage = """
+
+ Write image to a device
+
+ usage: wic write <image> <target device> [--expand [rules]] [--native-sysroot <path>]
+
+ This command writes wic image to a target device (USB stick, SD card etc).
+
+ See 'wic help write' for more detailed instructions.
+
+"""
+
+wic_write_help = """
+
+NAME
+    wic write - write wic image to a device
+
+SYNOPSIS
+    wic write <image> <target>
+    wic write <image> <target> --expand auto
+    wic write <image> <target> --expand 1:100M-2:300M
+    wic write <image> <target> --native-sysroot <path>
+
+DESCRIPTION
+    This command writes wic image to a target device (USB stick, SD card etc)
+
+        $ wic write ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic /dev/sdb
+
+    The --expand option is used to resize image partitions.
+    --expand auto expands partitions to occupy all free space available on the target device.
+    It's also possible to specify expansion rules in a format
+    <partition>:<size>[-<partition>:<size>...] for one or more partitions.
+    Specifying size 0 will keep partition unmodified.
+    Note: Resizing boot partition can result in non-bootable image for non-EFI images. It is
+    recommended to use size 0 for boot partition to keep image bootable.
+
+    The --native-sysroot option is used to specify the path to the native sysroot
+    containing the tools(parted, resize2fs) to use.
+"""
+
 wic_plugins_help = """
 
 NAME
-- 
2.1.4


