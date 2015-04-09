Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 50885606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 11:37:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 09 Apr 2015 04:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,549,1422950400"; d="scan'208";a="478842220"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Apr 2015 04:37:06 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 10FEA340001;
	Thu,  9 Apr 2015 04:36:42 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 14:36:49 +0300
Message-Id: <1428579409-8227-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic:code cleanup: No space allowed
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
X-List-Received-Date: Thu, 09 Apr 2015 11:37:06 -0000

Fixed pylint warning
  'No space allowed around keyword argument assignment'

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/baseimager.py   |  8 ++---
 scripts/lib/wic/imager/direct.py       | 10 +++---
 scripts/lib/wic/kickstart/__init__.py  | 14 ++++----
 scripts/lib/wic/msger.py               | 10 +++---
 scripts/lib/wic/utils/fs_related.py    |  2 +-
 scripts/lib/wic/utils/misc.py          |  2 +-
 scripts/lib/wic/utils/oe/misc.py       |  8 ++---
 scripts/lib/wic/utils/partitionedfs.py |  8 ++---
 scripts/wic                            | 58 +++++++++++++++++-----------------
 9 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/scripts/lib/wic/imager/baseimager.py b/scripts/lib/wic/imager/baseimager.py
index 2075358..0afbc2c 100644
--- a/scripts/lib/wic/imager/baseimager.py
+++ b/scripts/lib/wic/imager/baseimager.py
@@ -42,7 +42,7 @@ class BaseImageCreator(object):
     def __del__(self):
         self.cleanup()
 
-    def __init__(self, createopts = None):
+    def __init__(self, createopts=None):
         """Initialize an ImageCreator instance.
 
         ks -- a pykickstart.KickstartParser instance; this instance will be
@@ -131,8 +131,8 @@ class BaseImageCreator(object):
             self.workdir = os.path.join(self.tmpdir, "build")
             if not os.path.exists(self.workdir):
                 os.makedirs(self.workdir)
-            self.__builddir = tempfile.mkdtemp(dir = self.workdir,
-                                               prefix = "imgcreate-")
+            self.__builddir = tempfile.mkdtemp(dir=self.workdir,
+                                               prefix="imgcreate-")
         except OSError, (err, msg):
             raise CreatorError("Failed create build directory in %s: %s" %
                                (self.tmpdir, msg))
@@ -178,7 +178,7 @@ class BaseImageCreator(object):
 
         self._cleanup()
 
-        shutil.rmtree(self.__builddir, ignore_errors = True)
+        shutil.rmtree(self.__builddir, ignore_errors=True)
         self.__builddir = None
 
         self.__clean_tmpdir()
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index c7e1c6c..0e687bd 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -269,11 +269,11 @@ class DirectImageCreator(BaseImageCreator):
                                        p.source_file,
                                        p.fstype,
                                        p.label,
-                                       fsopts = p.fsopts,
-                                       boot = p.active,
-                                       align = p.align,
-                                       no_table = p.no_table,
-                                       part_type = p.part_type)
+                                       fsopts=p.fsopts,
+                                       boot=p.active,
+                                       align=p.align,
+                                       no_table=p.no_table,
+                                       part_type=p.part_type)
 
         self._restore_fstab(fstab)
 
diff --git a/scripts/lib/wic/kickstart/__init__.py b/scripts/lib/wic/kickstart/__init__.py
index 1095921..111723b 100644
--- a/scripts/lib/wic/kickstart/__init__.py
+++ b/scripts/lib/wic/kickstart/__init__.py
@@ -68,7 +68,7 @@ def read_kickstart(path):
 
     return ks
 
-def get_image_size(ks, default = None):
+def get_image_size(ks, default=None):
     __size = 0
     for p in ks.handler.partition.partitions:
         if p.mountpoint == "/" and p.size:
@@ -78,40 +78,40 @@ def get_image_size(ks, default = None):
     else:
         return default
 
-def get_image_fstype(ks, default = None):
+def get_image_fstype(ks, default=None):
     for p in ks.handler.partition.partitions:
         if p.mountpoint == "/" and p.fstype:
             return p.fstype
     return default
 
-def get_image_fsopts(ks, default = None):
+def get_image_fsopts(ks, default=None):
     for p in ks.handler.partition.partitions:
         if p.mountpoint == "/" and p.fsopts:
             return p.fsopts
     return default
 
-def get_timeout(ks, default = None):
+def get_timeout(ks, default=None):
     if not hasattr(ks.handler.bootloader, "timeout"):
         return default
     if ks.handler.bootloader.timeout is None:
         return default
     return int(ks.handler.bootloader.timeout)
 
-def get_kernel_args(ks, default = "ro rd.live.image"):
+def get_kernel_args(ks, default="ro rd.live.image"):
     if not hasattr(ks.handler.bootloader, "appendLine"):
         return default
     if ks.handler.bootloader.appendLine is None:
         return default
     return "%s %s" %(default, ks.handler.bootloader.appendLine)
 
-def get_menu_args(ks, default = ""):
+def get_menu_args(ks, default=""):
     if not hasattr(ks.handler.bootloader, "menus"):
         return default
     if ks.handler.bootloader.menus in (None, ""):
         return default
     return "%s" % ks.handler.bootloader.menus
 
-def get_default_kernel(ks, default = None):
+def get_default_kernel(ks, default=None):
     if not hasattr(ks.handler.bootloader, "default"):
         return default
     if not ks.handler.bootloader.default:
diff --git a/scripts/lib/wic/msger.py b/scripts/lib/wic/msger.py
index 9f557e7..35b705b 100644
--- a/scripts/lib/wic/msger.py
+++ b/scripts/lib/wic/msger.py
@@ -60,7 +60,7 @@ CATCHERR_BUFFILE_FD = -1
 CATCHERR_BUFFILE_PATH = None
 CATCHERR_SAVED_2 = -1
 
-def _general_print(head, color, msg = None, stream = None, level = 'normal'):
+def _general_print(head, color, msg=None, stream=None, level='normal'):
     global LOG_CONTENT
     if not stream:
         stream = sys.stdout
@@ -130,7 +130,7 @@ def _color_print(head, color, msg, stream, level):
 
     stream.flush()
 
-def _color_perror(head, color, msg, level = 'normal'):
+def _color_perror(head, color, msg, level='normal'):
     if CATCHERR_BUFFILE_FD > 0:
         _general_print(head, color, msg, sys.stdout, level)
     else:
@@ -190,7 +190,7 @@ def info(msg):
 
 def verbose(msg):
     head, msg = _split_msg('Verbose', msg)
-    _general_print(head, INFO_COLOR, msg, level = 'verbose')
+    _general_print(head, INFO_COLOR, msg, level='verbose')
 
 def warning(msg):
     head, msg = _split_msg('Warning', msg)
@@ -198,7 +198,7 @@ def warning(msg):
 
 def debug(msg):
     head, msg = _split_msg('Debug', msg)
-    _color_perror(head, ERR_COLOR, msg, level = 'debug')
+    _color_perror(head, ERR_COLOR, msg, level='debug')
 
 def error(msg):
     head, msg = _split_msg('Error', msg)
@@ -299,7 +299,7 @@ def disable_logstderr():
     global CATCHERR_BUFFILE_PATH
     global CATCHERR_SAVED_2
 
-    raw(msg = None) # flush message buffer and print it.
+    raw(msg=None) # flush message buffer and print it.
     os.dup2(CATCHERR_SAVED_2, 2)
     os.close(CATCHERR_SAVED_2)
     os.close(CATCHERR_BUFFILE_FD)
diff --git a/scripts/lib/wic/utils/fs_related.py b/scripts/lib/wic/utils/fs_related.py
index 224b43e..fb9054d 100644
--- a/scripts/lib/wic/utils/fs_related.py
+++ b/scripts/lib/wic/utils/fs_related.py
@@ -39,7 +39,7 @@ class Disk:
     """
     Generic base object for a disk.
     """
-    def __init__(self, size, device = None):
+    def __init__(self, size, device=None):
         self._device = device
         self._size = size
 
diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index 5d6337c..9d75069 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -18,7 +18,7 @@
 import os
 import time
 
-def build_name(kscfg, release=None, prefix = None, suffix = None):
+def build_name(kscfg, release=None, prefix=None, suffix=None):
     """Construct and return an image name string.
 
     This is a utility function to help create sensible name and fslabel
diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 7769f3f..119f072 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -28,7 +28,7 @@
 from wic import msger
 from wic.utils import runner
 
-def __exec_cmd(cmd_and_args, as_shell = False, catch = 3):
+def __exec_cmd(cmd_and_args, as_shell=False, catch=3):
     """
     Execute command, catching stderr, stdout
 
@@ -49,7 +49,7 @@ def __exec_cmd(cmd_and_args, as_shell = False, catch = 3):
     return (rc, out)
 
 
-def exec_cmd(cmd_and_args, as_shell = False, catch = 3):
+def exec_cmd(cmd_and_args, as_shell=False, catch=3):
     """
     Execute command, catching stderr, stdout
 
@@ -63,7 +63,7 @@ def exec_cmd(cmd_and_args, as_shell = False, catch = 3):
     return out
 
 
-def exec_cmd_quiet(cmd_and_args, as_shell = False):
+def exec_cmd_quiet(cmd_and_args, as_shell=False):
     """
     Execute command, catching nothing in the output
 
@@ -72,7 +72,7 @@ def exec_cmd_quiet(cmd_and_args, as_shell = False):
     return exec_cmd(cmd_and_args, as_shell, 0)
 
 
-def exec_native_cmd(cmd_and_args, native_sysroot, catch = 3):
+def exec_native_cmd(cmd_and_args, native_sysroot, catch=3):
     """
     Execute native command, catching stderr, stdout
 
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index c848bea..4ea1be3 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -86,9 +86,9 @@ class Image:
         self.partitions.append(part)
         self.__add_disk(part['disk_name'])
 
-    def add_partition(self, size, disk_name, mountpoint, source_file = None, fstype = None,
-                      label=None, fsopts = None, boot = False, align = None, no_table=False,
-                      part_type = None):
+    def add_partition(self, size, disk_name, mountpoint, source_file=None, fstype=None,
+                      label=None, fsopts=None, boot=False, align=None, no_table=False,
+                      part_type=None):
         """ Add the next partition. Prtitions have to be added in the
         first-to-last order. """
 
@@ -116,7 +116,7 @@ class Image:
 
             self.__add_partition(part)
 
-    def layout_partitions(self, ptable_format = "msdos"):
+    def layout_partitions(self, ptable_format="msdos"):
         """ Layout the partitions, meaning calculate the position of every
         partition on the disk. The 'ptable_format' parameter defines the
         partition table format and may be "msdos". """
diff --git a/scripts/wic b/scripts/wic
index 524156d..dcf1a55 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -79,28 +79,28 @@ def wic_create_subcommand(args, usage_str):
     Command-line handling for image creation.  The real work is done
     by image.engine.wic_create()
     """
-    parser = optparse.OptionParser(usage = usage_str)
-
-    parser.add_option("-o", "--outdir", dest = "outdir",
-                      action = "store", help = "name of directory to create image in")
-    parser.add_option("-i", "--infile", dest = "properties_file",
-                      action = "store", help = "name of file containing the values for image properties as a JSON file")
-    parser.add_option("-e", "--image-name", dest = "image_name",
-                      action = "store", help = "name of the image to use the artifacts from e.g. core-image-sato")
-    parser.add_option("-r", "--rootfs-dir", dest = "rootfs_dir",
-                      action = "callback", callback = callback_rootfs_dir, type = "string",
-                      help = "path to the /rootfs dir to use as the .wks rootfs source")
-    parser.add_option("-b", "--bootimg-dir", dest = "bootimg_dir",
-                      action = "store", help = "path to the dir containing the boot artifacts (e.g. /EFI or /syslinux dirs) to use as the .wks bootimg source")
-    parser.add_option("-k", "--kernel-dir", dest = "kernel_dir",
-                      action = "store", help = "path to the dir containing the kernel to use in the .wks bootimg")
-    parser.add_option("-n", "--native-sysroot", dest = "native_sysroot",
-                      action = "store", help = "path to the native sysroot containing the tools to use to build the image")
-    parser.add_option("-p", "--skip-build-check", dest = "build_check",
-                      action = "store_false", default = True, help = "skip the build check")
-    parser.add_option("-f", "--build-rootfs", action="store_true", help = "build rootfs")
-    parser.add_option("-D", "--debug", dest = "debug", action = "store_true",
-                      default = False, help = "output debug information")
+    parser = optparse.OptionParser(usage=usage_str)
+
+    parser.add_option("-o", "--outdir", dest="outdir",
+                      action="store", help="name of directory to create image in")
+    parser.add_option("-i", "--infile", dest="properties_file",
+                      action="store", help="name of file containing the values for image properties as a JSON file")
+    parser.add_option("-e", "--image-name", dest="image_name",
+                      action="store", help="name of the image to use the artifacts from e.g. core-image-sato")
+    parser.add_option("-r", "--rootfs-dir", dest="rootfs_dir",
+                      action="callback", callback=callback_rootfs_dir, type="string",
+                      help="path to the /rootfs dir to use as the .wks rootfs source")
+    parser.add_option("-b", "--bootimg-dir", dest="bootimg_dir",
+                      action="store", help="path to the dir containing the boot artifacts (e.g. /EFI or /syslinux dirs) to use as the .wks bootimg source")
+    parser.add_option("-k", "--kernel-dir", dest="kernel_dir",
+                      action="store", help="path to the dir containing the kernel to use in the .wks bootimg")
+    parser.add_option("-n", "--native-sysroot", dest="native_sysroot",
+                      action="store", help="path to the native sysroot containing the tools to use to build the image")
+    parser.add_option("-p", "--skip-build-check", dest="build_check",
+                      action="store_false", default=True, help="skip the build check")
+    parser.add_option("-f", "--build-rootfs", action="store_true", help="build rootfs")
+    parser.add_option("-D", "--debug", dest="debug", action="store_true",
+                      default=False, help="output debug information")
 
     (options, args) = parser.parse_args(args)
 
@@ -223,11 +223,11 @@ def wic_list_subcommand(args, usage_str):
     Command-line handling for listing available image properties and
     values.  The real work is done by image.engine.wic_list()
     """
-    parser = optparse.OptionParser(usage = usage_str)
+    parser = optparse.OptionParser(usage=usage_str)
 
-    parser.add_option("-o", "--outfile", action = "store",
-                      dest = "properties_file",
-                      help = "dump the possible values for image properties to a JSON file")
+    parser.add_option("-o", "--outfile", action="store",
+                      dest="properties_file",
+                      help="dump the possible values for image properties to a JSON file")
 
     (options, args) = parser.parse_args(args)
 
@@ -276,12 +276,12 @@ subcommands = {
 
 
 def start_logging(loglevel):
-    logging.basicConfig(filname = 'wic.log', filemode = 'w', level=loglevel)
+    logging.basicConfig(filname='wic.log', filemode='w', level=loglevel)
 
 
 def main():
-    parser = optparse.OptionParser(version = "wic version %s" % __version__,
-                                   usage = wic_usage)
+    parser = optparse.OptionParser(version="wic version %s" % __version__,
+                                   usage=wic_usage)
 
     parser.disable_interspersed_args()
 
-- 
2.1.4


