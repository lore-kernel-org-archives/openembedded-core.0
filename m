Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A1AC573CF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 10:46:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jun 2015 03:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="509705036"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2015 03:46:51 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 772836A4083;
	Wed, 17 Jun 2015 03:46:14 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 11:53:04 +0300
Message-Id: <1434531184-14916-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: Add missing docstrings to plugin classes
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
X-List-Received-Date: Wed, 17 Jun 2015 10:46:51 -0000

Docstings from plugin classes are used as part of
output of 'wic help plugins'. Adding them makes help page
more informative.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct_plugin.py     | 9 +++++++++
 scripts/lib/wic/plugins/source/bootimg-efi.py       | 5 +++++
 scripts/lib/wic/plugins/source/bootimg-partition.py | 5 +++++
 scripts/lib/wic/plugins/source/bootimg-pcbios.py    | 4 ++++
 scripts/lib/wic/plugins/source/fsimage.py           | 4 ++++
 scripts/lib/wic/plugins/source/rawcopy.py           | 4 ++++
 scripts/lib/wic/plugins/source/rootfs.py            | 4 ++++
 7 files changed, 35 insertions(+)

diff --git a/scripts/lib/wic/plugins/imager/direct_plugin.py b/scripts/lib/wic/plugins/imager/direct_plugin.py
index 17888e9..ff974b2 100644
--- a/scripts/lib/wic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/wic/plugins/imager/direct_plugin.py
@@ -33,6 +33,15 @@ import wic.imager.direct as direct
 from wic.pluginbase import ImagerPlugin
 
 class DirectPlugin(ImagerPlugin):
+    """
+    Install a system into a file containing a partitioned disk image.
+
+    An image file is formatted with a partition table, each partition
+    created from a rootfs or other OpenEmbedded build artifact and dd'ed
+    into the virtual disk. The disk image can subsequently be dd'ed onto
+    media and used on actual hardware.
+    """
+
     name = 'direct'
 
     @classmethod
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index d3b8468..f47fc82 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -34,6 +34,11 @@ from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var, \
                               BOOTDD_EXTRA_SPACE
 
 class BootimgEFIPlugin(SourcePlugin):
+    """
+    Create EFI boot partition.
+    This plugin supports GRUB 2 and gummiboot bootloaders.
+    """
+
     name = 'bootimg-efi'
 
     @classmethod
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 909e59b..9168dd0 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -32,6 +32,11 @@ from wic.utils.oe.misc import exec_cmd, get_bitbake_var
 from glob import glob
 
 class BootimgPartitionPlugin(SourcePlugin):
+    """
+    Create an image of boot partition, copying over files
+    listed in IMAGE_BOOT_FILES bitbake variable.
+    """
+
     name = 'bootimg-partition'
 
     @classmethod
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 5caffbc..bfde93a 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -34,6 +34,10 @@ from wic.utils.oe.misc import exec_cmd, exec_native_cmd, \
                               get_bitbake_var, BOOTDD_EXTRA_SPACE
 
 class BootimgPcbiosPlugin(SourcePlugin):
+    """
+    Create MBR boot partition and install syslinux on it.
+    """
+
     name = 'bootimg-pcbios'
 
     @classmethod
diff --git a/scripts/lib/wic/plugins/source/fsimage.py b/scripts/lib/wic/plugins/source/fsimage.py
index ef56cf2..3751ff2 100644
--- a/scripts/lib/wic/plugins/source/fsimage.py
+++ b/scripts/lib/wic/plugins/source/fsimage.py
@@ -22,6 +22,10 @@ from wic.pluginbase import SourcePlugin
 from wic.utils.oe.misc import get_bitbake_var
 
 class FSImagePlugin(SourcePlugin):
+    """
+    Add an already existing filesystem image to the partition layout.
+    """
+
     name = 'fsimage'
 
     @classmethod
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 444c026..848b9b7 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -22,6 +22,10 @@ from wic.pluginbase import SourcePlugin
 from wic.utils.oe.misc import exec_cmd, get_bitbake_var
 
 class RawCopyPlugin(SourcePlugin):
+    """
+    Populate partition content from raw image file.
+    """
+
     name = 'rawcopy'
 
     @classmethod
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 7d44430..ca3d398 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -32,6 +32,10 @@ from wic.pluginbase import SourcePlugin
 from wic.utils.oe.misc import find_bitbake_env_lines, find_artifact
 
 class RootfsPlugin(SourcePlugin):
+    """
+    Populate partition content from a rootfs directory.
+    """
+
     name = 'rootfs'
 
     @staticmethod
-- 
2.1.4


