Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB03577309
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:11:38 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 01 Feb 2017 06:11:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="59948553"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2017 06:11:38 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 3BBC36A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:10:38 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:24 +0200
Message-Id: <fe2fd94ad0a81ddbf96ba2dbf0cabb0834a0edea.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485953483.git.ed.bartosh@linux.intel.com>
References: <cover.1485953483.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 17/18] wic: code cleanup
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
X-List-Received-Date: Wed, 01 Feb 2017 14:11:39 -0000

Fixed indentation, unused imports, trailing lines etc.

[YOCTO #10619]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/__version__.py                       |  1 -
 scripts/lib/wic/engine.py                            |  2 +-
 scripts/lib/wic/help.py                              |  4 ++--
 scripts/lib/wic/partition.py                         | 11 +++++++----
 scripts/lib/wic/plugin.py                            |  3 ++-
 scripts/lib/wic/pluginbase.py                        |  1 -
 scripts/lib/wic/plugins/imager/direct.py             |  3 +--
 scripts/lib/wic/plugins/source/bootimg-efi.py        | 14 +++++++-------
 scripts/lib/wic/plugins/source/bootimg-partition.py  |  4 ++--
 scripts/lib/wic/plugins/source/bootimg-pcbios.py     |  4 +---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 11 +++++------
 scripts/lib/wic/plugins/source/rawcopy.py            |  1 -
 scripts/lib/wic/plugins/source/rootfs.py             |  4 ++--
 scripts/lib/wic/utils/misc.py                        |  9 +++------
 scripts/lib/wic/utils/partitionedfs.py               |  7 +++----
 15 files changed, 36 insertions(+), 43 deletions(-)
 delete mode 100644 scripts/lib/wic/__version__.py

diff --git a/scripts/lib/wic/__version__.py b/scripts/lib/wic/__version__.py
deleted file mode 100644
index 5452a46..0000000
--- a/scripts/lib/wic/__version__.py
+++ /dev/null
@@ -1 +0,0 @@
-VERSION = "2.00"
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 685bc88..592ef77 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -190,7 +190,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     crobj = creator.Creator()
 
     cmdline = ["direct", native_sysroot, kernel_dir, bootimg_dir, rootfs_dir,
-                wks_file, image_output_dir, oe_builddir, compressor or ""]
+               wks_file, image_output_dir, oe_builddir, compressor or ""]
     if bmap:
         cmdline.append('--bmap')
 
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index daa11bf..1bd411d 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -31,7 +31,7 @@ import logging
 from wic.plugin import pluginmgr, PLUGIN_TYPES
 
 def subcommand_error(args):
-    logging.info("invalid subcommand %s" % args[0])
+    logging.info("invalid subcommand %s", args[0])
 
 
 def display_help(subcommand, subcommands):
@@ -87,7 +87,7 @@ def invoke_subcommand(args, parser, main_command_usage, subcommands):
     elif args[0] == "help":
         wic_help(args, main_command_usage, subcommands)
     elif args[0] not in subcommands:
-        logging.error("Unsupported subcommand %s, exiting\n" % (args[0]))
+        logging.error("Unsupported subcommand %s, exiting\n", args[0])
         parser.print_help()
         return 1
     else:
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 31a0350..69b369c 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -182,7 +182,7 @@ class Partition():
 
         # further processing required Partition.size to be an integer, make
         # sure that it is one
-        if type(self.size) is not int:
+        if not isinstance(self.size, int):
             msger.error("Partition %s internal size is not an integer. " \
                           "This a bug in source plugin %s and needs to be fixed." \
                           % (self.mountpoint, self.source))
@@ -242,7 +242,10 @@ class Partition():
             # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
             rsize_bb = get_bitbake_var('ROOTFS_SIZE')
             if rsize_bb:
-                msger.warning('overhead-factor was specified, but size was not, so bitbake variables will be used for the size. In this case both IMAGE_OVERHEAD_FACTOR and --overhead-factor will be applied')
+                msger.warning('overhead-factor was specified, but size was not,'
+                              ' so bitbake variables will be used for the size.'
+                              ' In this case both IMAGE_OVERHEAD_FACTOR and '
+                              '--overhead-factor will be applied')
                 self.size = int(round(float(rsize_bb)))
 
         for prefix in ("ext", "btrfs", "vfat", "squashfs"):
@@ -402,7 +405,8 @@ class Partition():
                       "Proceeding as requested." % self.mountpoint)
 
         path = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
-        os.path.isfile(path) and os.remove(path)
+        if os.path.isfile(path):
+            os.remove(path)
 
         # it is not possible to create a squashfs without source data,
         # thus prepare an empty temp dir that is used as source
@@ -436,4 +440,3 @@ class Partition():
             label_str = "-L %s" % self.label
         mkswap_cmd = "mkswap %s -U %s %s" % (label_str, str(uuid.uuid1()), path)
         exec_native_cmd(mkswap_cmd, native_sysroot)
-
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 6b06ed6..f04a034 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -15,7 +15,8 @@
 # with this program; if not, write to the Free Software Foundation, Inc., 59
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
-import os, sys
+import os
+import sys
 
 from wic import msger
 from wic import pluginbase
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index e737dee..2f747a9 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -17,7 +17,6 @@
 
 __all__ = ['ImagerPlugin', 'SourcePlugin', 'get_plugins']
 
-import sys
 from collections import defaultdict
 
 from wic import msger
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 592412a..4637fbf3 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -29,7 +29,6 @@ import uuid
 import tempfile
 
 from time import strftime
-from os.path import basename, splitext
 
 from wic import msger
 from wic.ksparser import KickStart, KickStartError
@@ -65,7 +64,7 @@ class DirectPlugin(ImagerPlugin):
         except KickStartError as err:
             msger.error(str(err))
 
-        name = "%s-%s" % (splitext(basename(ksconf))[0],
+        name = "%s-%s" % (os.path.splitext(os.path.basename(ksconf))[0],
                           strftime("%Y%m%d%H%M"))
 
         # parse possible 'rootfs=name' items
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 2b66a58..dd6c920 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -42,7 +42,7 @@ class BootimgEFIPlugin(SourcePlugin):
     name = 'bootimg-efi'
 
     @classmethod
-    def do_configure_grubefi(cls, hdddir, creator, cr_workdir, source_params):
+    def do_configure_grubefi(cls, creator, cr_workdir):
         """
         Create loader-specific (grub-efi) config
         """
@@ -54,10 +54,10 @@ class BootimgEFIPlugin(SourcePlugin):
                 # Use a custom configuration for grub
                 grubefi_conf = custom_cfg
                 msger.debug("Using custom configuration file "
-                        "%s for grub.cfg" % configfile)
+                            "%s for grub.cfg" % configfile)
             else:
                 msger.error("configfile is specified but failed to "
-                        "get it from %s." % configfile)
+                            "get it from %s." % configfile)
 
         if not custom_cfg:
             # Create grub configuration using parameters from wks file
@@ -125,10 +125,10 @@ class BootimgEFIPlugin(SourcePlugin):
                 # Use a custom configuration for systemd-boot
                 boot_conf = custom_cfg
                 msger.debug("Using custom configuration file "
-                        "%s for systemd-boots's boot.conf" % configfile)
+                            "%s for systemd-boots's boot.conf" % configfile)
             else:
                 msger.error("configfile is specified but failed to "
-                        "get it from %s." % configfile)
+                            "get it from %s." % configfile)
 
         if not custom_cfg:
             # Create systemd-boot configuration using parameters from wks file
@@ -164,7 +164,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
         try:
             if source_params['loader'] == 'grub-efi':
-                cls.do_configure_grubefi(hdddir, creator, cr_workdir, source_params)
+                cls.do_configure_grubefi(creator, cr_workdir)
             elif source_params['loader'] == 'systemd-boot':
                 cls.do_configure_systemdboot(hdddir, creator, cr_workdir, source_params)
             else:
@@ -185,7 +185,7 @@ class BootimgEFIPlugin(SourcePlugin):
         if not bootimg_dir:
             bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
-                 msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+                msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
             # just so the result notes display it
             creator.set_bootimg_dir(bootimg_dir)
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index f94dfab..e0d9a50 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -26,10 +26,11 @@
 import os
 import re
 
+from glob import glob
+
 from wic import msger
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import exec_cmd, get_bitbake_var
-from glob import glob
 
 class BootimgPartitionPlugin(SourcePlugin):
     """
@@ -137,4 +138,3 @@ class BootimgPartitionPlugin(SourcePlugin):
         msger.debug('Prepare boot partition using rootfs in %s' % (hdddir))
         part.prepare_rootfs(cr_workdir, oe_builddir, hdddir,
                             native_sysroot)
-
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index d796433..4b9b265 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -198,7 +198,5 @@ class BootimgPcbiosPlugin(SourcePlugin):
         out = exec_cmd(du_cmd)
         bootimg_size = out.split()[0]
 
-        part.size = int(out.split()[0])
+        part.size = int(bootimg_size)
         part.source_file = bootimg
-
-
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 6df3756..56bb62d 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -100,10 +100,10 @@ class IsoImagePlugin(SourcePlugin):
             grubefi_conf = get_custom_config(configfile)
             if grubefi_conf:
                 msger.debug("Using custom configuration file "
-                        "%s for grub.cfg" % configfile)
+                            "%s for grub.cfg" % configfile)
             else:
                 msger.error("configfile is specified but failed to "
-                        "get it from %s." % configfile)
+                            "get it from %s." % configfile)
         else:
             splash = os.path.join(cr_workdir, "EFI/boot/splash.jpg")
             if os.path.exists(splash):
@@ -285,6 +285,7 @@ class IsoImagePlugin(SourcePlugin):
             if not deploy_dir:
                 msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
             cp_cmd = "cp %s/%s %s" % (deploy_dir, initrd, cr_workdir)
+            exec_cmd(cp_cmd)
         else:
             # Prepare initial ramdisk
             initrd = "%s/initrd" % deploy_dir
@@ -293,8 +294,7 @@ class IsoImagePlugin(SourcePlugin):
             if not os.path.isfile(initrd):
                 initrd = cls._build_initramfs_path(rootfs_dir, cr_workdir)
 
-        install_cmd = "install -m 0644 %s %s/initrd" \
-            % (initrd, isodir)
+        install_cmd = "install -m 0644 %s %s/initrd" % (initrd, isodir)
         exec_cmd(install_cmd)
 
         # Remove the temporary file created by _build_initramfs_path function
@@ -303,7 +303,7 @@ class IsoImagePlugin(SourcePlugin):
 
         # Install bzImage
         install_cmd = "install -m 0644 %s/bzImage %s/bzImage" % \
-            (kernel_dir, isodir)
+                      (kernel_dir, isodir)
         exec_cmd(install_cmd)
 
         #Create bootloader for efi boot
@@ -362,7 +362,6 @@ class IsoImagePlugin(SourcePlugin):
                     exec_native_cmd(grub_cmd, native_sysroot)
 
             else:
-                # TODO: insert gummiboot stuff
                 msger.error("unrecognized bootimg-efi loader: %s" \
                             % source_params['loader'])
         except KeyError:
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 79e41ca..4e42e3e 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -84,4 +84,3 @@ class RawCopyPlugin(SourcePlugin):
             part.size = filesize
 
         part.source_file = dst
-
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 891f095..9d959fa 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -79,5 +79,5 @@ class RootfsPlugin(SourcePlugin):
         real_rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
 
         part.rootfs_dir = real_rootfs_dir
-        part.prepare_rootfs(cr_workdir, oe_builddir, real_rootfs_dir, native_sysroot)
-
+        part.prepare_rootfs(cr_workdir, oe_builddir,
+                            real_rootfs_dir, native_sysroot)
diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index 6781d83..edb9c5b 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -77,18 +77,15 @@ def _exec_cmd(cmd_and_args, as_shell=False, catch=3):
     msger.debug("_exec_cmd: output for %s (rc = %d): %s" % \
                 (cmd_and_args, ret, out))
 
-    return (ret, out)
+    return ret, out
 
 
 def exec_cmd(cmd_and_args, as_shell=False, catch=3):
     """
-    Execute command, catching stderr, stdout
-
-    Exits if rc non-zero
+    Execute command, return output
     """
-    ret, out = _exec_cmd(cmd_and_args, as_shell, catch)
+    return _exec_cmd(cmd_and_args, as_shell, catch)[1]
 
-    return out
 
 def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
     """
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index eb4d7e6..5fc5765 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -21,7 +21,7 @@
 import os
 from wic import msger
 from wic.utils.errors import ImageError
-from wic.utils.misc import exec_cmd, exec_native_cmd
+from wic.utils.misc import exec_native_cmd
 from wic.filemap import sparse_copy
 
 # Overhead of the MBR partitioning scheme (just one sector)
@@ -350,10 +350,9 @@ class Image():
         if self.disks:
             for dev in self.disks:
                 disk = self.disks[dev]
-                try:
+                if hasattr(disk['disk'], 'cleanup'):
                     disk['disk'].cleanup()
-                except:
-                    pass
+
         # remove partition images
         for image in self.partimages:
             if os.path.isfile(image):
-- 
2.1.4


