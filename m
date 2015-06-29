Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 39D0672E99
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 19:11:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 29 Jun 2015 12:11:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,371,1432623600"; d="scan'208";a="596920041"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 29 Jun 2015 12:11:45 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 211196A4083;
	Mon, 29 Jun 2015 12:11:05 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 22:10:32 +0300
Message-Id: <1435605033-11509-20-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 19/20] wic: Code cleanup: long lines, identation and whitespaces
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
X-List-Received-Date: Mon, 29 Jun 2015 19:11:44 -0000

Fixed pylint warnings bad-continuation, bad-continuation and
line-too-long.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 92dcc5a..0dc7920 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -236,7 +236,10 @@ def wic_list(args, scripts_path, properties_file):
             wks_file = args[0]
             fullpath = find_canned_image(scripts_path, wks_file)
             if not fullpath:
-                print "No image named %s found, exiting.  (Use 'wic list images' to list available images, or specify a fully-qualified OE kickstart (.wks) filename)\n" % wks_file
+                print "No image named %s found, exiting. "\
+                      "(Use 'wic list images' to list available images, or "\
+                      "specify a fully-qualified OE kickstart (.wks) "\
+                      "filename)\n" % wks_file
                 sys.exit(1)
             list_canned_image_help(scripts_path, fullpath)
             return True
diff --git a/scripts/lib/wic/conf.py b/scripts/lib/wic/conf.py
index ff6e2ca..cecf396 100644
--- a/scripts/lib/wic/conf.py
+++ b/scripts/lib/wic/conf.py
@@ -30,20 +30,18 @@ def get_siteconf():
     return scripts_path + "/lib/image/config/wic.conf"
 
 class ConfigMgr(object):
-    DEFAULTS = {'common': {
-                    "distro_name": "Default Distribution",
-                    "plugin_dir": "/usr/lib/wic/plugins", # TODO use prefix also?
-                },
-                'create': {
-                    "tmpdir": '/var/tmp/wic',
-                    "outdir": './wic-output',
-
-                    "release": None,
-                    "logfile": None,
-                    "name_prefix": None,
-                    "name_suffix": None,
-                },
-               }
+    DEFAULTS = {
+        'common': {
+            "distro_name": "Default Distribution",
+            "plugin_dir": "/usr/lib/wic/plugins"}, # TODO use prefix also?
+        'create': {
+            "tmpdir": '/var/tmp/wic',
+            "outdir": './wic-output',
+            "release": None,
+            "logfile": None,
+            "name_prefix": None,
+            "name_suffix": None}
+        }
 
     # make the manager class as singleton
     _instance = None
diff --git a/scripts/lib/wic/kickstart/custom_commands/micboot.py b/scripts/lib/wic/kickstart/custom_commands/micboot.py
index 358b0ea..1fa282b 100644
--- a/scripts/lib/wic/kickstart/custom_commands/micboot.py
+++ b/scripts/lib/wic/kickstart/custom_commands/micboot.py
@@ -27,7 +27,7 @@ class Mic_Bootloader(F8_Bootloader):
                  forceLBA=False, location="", md5pass="", password="",
                  upgrade=False, menus=""):
         F8_Bootloader.__init__(self, writePriority, appendLine, driveorder,
-                                forceLBA, location, md5pass, password, upgrade)
+                               forceLBA, location, md5pass, password, upgrade)
 
         self.menus = ""
         self.ptable = "msdos"
diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index fea4d6d..045b290 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -157,7 +157,9 @@ class Wic_PartData(Mic_PartData):
 
         if not self.source:
             if not self.size:
-                msger.error("The %s partition has a size of zero.  Please specify a non-zero --size for that partition." % self.mountpoint)
+                msger.error("The %s partition has a size of zero.  Please "
+                            "specify a non-zero --size for that partition." % \
+                            self.mountpoint)
             if self.fstype and self.fstype == "swap":
                 self.prepare_swap_partition(cr_workdir, oe_builddir,
                                             native_sysroot)
@@ -178,9 +180,14 @@ class Wic_PartData(Mic_PartData):
         plugins = pluginmgr.get_source_plugins()
 
         if self.source not in plugins:
-            msger.error("The '%s' --source specified for %s doesn't exist.\n\tSee 'wic list source-plugins' for a list of available --sources.\n\tSee 'wic help source-plugins' for details on adding a new source plugin." % (self.source, self.mountpoint))
-
-        self._source_methods = pluginmgr.get_source_plugin_methods(self.source, partition_methods)
+            msger.error("The '%s' --source specified for %s doesn't exist.\n\t"
+                        "See 'wic list source-plugins' for a list of available"
+                        " --sources.\n\tSee 'wic help source-plugins' for "
+                        "details on adding a new source plugin." % \
+                        (self.source, self.mountpoint))
+
+        self._source_methods = pluginmgr.get_source_plugin_methods(\
+                                   self.source, partition_methods)
         self._source_methods["do_configure_partition"](self, self.sourceparams_dict,
                                                        cr, cr_workdir,
                                                        oe_builddir,
@@ -466,9 +473,10 @@ class Wic_Partition(Mic_Partition):
     removedAttrs = Mic_Partition.removedAttrs
 
     def _getParser(self):
-        def overhead_cb (option, opt_str, value, parser):
+        def overhead_cb(option, opt_str, value, parser):
             if value < 1:
-                raise OptionValueError("Option %s: invalid value: %r" % (option, value))
+                raise OptionValueError("Option %s: invalid value: %r" % \
+                                       (option, value))
             setattr(parser.values, option.dest, value)
 
         op = Mic_Partition._getParser(self)
diff --git a/scripts/lib/wic/msger.py b/scripts/lib/wic/msger.py
index 35b705b..1b60980 100644
--- a/scripts/lib/wic/msger.py
+++ b/scripts/lib/wic/msger.py
@@ -16,7 +16,8 @@
 # with this program; if not, write to the Free Software Foundation, Inc., 59
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
-import os,sys
+import os
+import sys
 import re
 import time
 
@@ -37,8 +38,8 @@ __ALL__ = ['set_mode',
 # COLORs in ANSI
 INFO_COLOR = 32 # green
 WARN_COLOR = 33 # yellow
-ERR_COLOR  = 31 # red
-ASK_COLOR  = 34 # blue
+ERR_COLOR = 31 # red
+ASK_COLOR = 34 # blue
 NO_COLOR = 0
 
 PREFIX_RE = re.compile('^<(.*?)>\s*(.*)', re.S)
@@ -47,12 +48,12 @@ INTERACTIVE = True
 
 LOG_LEVEL = 1
 LOG_LEVELS = {
-                'quiet': 0,
-                'normal': 1,
-                'verbose': 2,
-                'debug': 3,
-                'never': 4,
-             }
+    'quiet': 0,
+    'normal': 1,
+    'verbose': 2,
+    'debug': 3,
+    'never': 4,
+}
 
 LOG_FILE_FP = None
 LOG_CONTENT = ''
@@ -75,7 +76,7 @@ def _general_print(head, color, msg=None, stream=None, level='normal'):
 
     errormsg = ''
     if CATCHERR_BUFFILE_FD > 0:
-        size = os.lseek(CATCHERR_BUFFILE_FD , 0, os.SEEK_END)
+        size = os.lseek(CATCHERR_BUFFILE_FD, 0, os.SEEK_END)
         os.lseek(CATCHERR_BUFFILE_FD, 0, os.SEEK_SET)
         errormsg = os.read(CATCHERR_BUFFILE_FD, size)
         os.ftruncate(CATCHERR_BUFFILE_FD, 0)
@@ -158,7 +159,7 @@ def _split_msg(head, msg):
     return head, msg
 
 def get_loglevel():
-    return (k for k,v in LOG_LEVELS.items() if v==LOG_LEVEL).next()
+    return (k for k, v in LOG_LEVELS.items() if v == LOG_LEVEL).next()
 
 def set_loglevel(level):
     global LOG_LEVEL
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 6ca68f6..721c524 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -56,7 +56,9 @@ class BootimgPcbiosPlugin(SourcePlugin):
             msger.error("Unsupported partition table: %s" % cr.ptable_format)
 
         if not os.path.exists(mbrfile):
-            msger.error("Couldn't find %s.  If using the -e option, do you have the right MACHINE set in local.conf?  If not, is the bootimg_dir path correct?" % mbrfile)
+            msger.error("Couldn't find %s.  If using the -e option, do you "
+                        "have the right MACHINE set in local.conf?  If not, "
+                        "is the bootimg_dir path correct?" % mbrfile)
 
         full_path = cr._full_path(workdir, disk_name, "direct")
         msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index ca4b1f0..2f884a3 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -302,9 +302,8 @@ class Image(object):
                 msger.debug("partition %d: set UUID to %s" % \
                             (p['num'], p['uuid']))
                 exec_native_cmd("sgdisk --partition-guid=%d:%s %s" % \
-                                         (p['num'], p['uuid'],
-                                          d['disk'].device),
-                                        self.native_sysroot)
+                                (p['num'], p['uuid'], d['disk'].device),
+                                self.native_sysroot)
 
             if p['boot']:
                 flag_name = "legacy_boot" if d['ptable_format'] == 'gpt' else "boot"
diff --git a/scripts/lib/wic/utils/runner.py b/scripts/lib/wic/utils/runner.py
index 2ae9f41..8d48f68 100644
--- a/scripts/lib/wic/utils/runner.py
+++ b/scripts/lib/wic/utils/runner.py
@@ -89,7 +89,7 @@ def show(cmdln_or_args):
     else:
         cmd = cmdln_or_args
 
-    msg =  'running command: "%s"' % cmd
+    msg = 'running command: "%s"' % cmd
     if out: out = out.strip()
     if out:
         msg += ', with output::'
diff --git a/scripts/wic b/scripts/wic
index ac272c6..9435ce0 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -90,18 +90,24 @@ def wic_create_subcommand(args, usage_str):
     parser = optparse.OptionParser(usage=usage_str)
 
     parser.add_option("-o", "--outdir", dest="outdir",
-                      action="store", help="name of directory to create image in")
+                      help="name of directory to create image in")
     parser.add_option("-e", "--image-name", dest="image_name",
-                      action="store", help="name of the image to use the artifacts from e.g. core-image-sato")
-    parser.add_option("-r", "--rootfs-dir", dest="rootfs_dir",
-                      action="callback", callback=callback_rootfs_dir, type="string",
-                      help="path to the /rootfs dir to use as the .wks rootfs source")
+                      help="name of the image to use the artifacts from "
+                           "e.g. core-image-sato")
+    parser.add_option("-r", "--rootfs-dir", dest="rootfs_dir", type="string",
+                      action="callback", callback=callback_rootfs_dir,
+                      help="path to the /rootfs dir to use as the "
+                           ".wks rootfs source")
     parser.add_option("-b", "--bootimg-dir", dest="bootimg_dir",
-                      action="store", help="path to the dir containing the boot artifacts (e.g. /EFI or /syslinux dirs) to use as the .wks bootimg source")
+                      help="path to the dir containing the boot artifacts "
+                           "(e.g. /EFI or /syslinux dirs) to use as the "
+                           ".wks bootimg source")
     parser.add_option("-k", "--kernel-dir", dest="kernel_dir",
-                      action="store", help="path to the dir containing the kernel to use in the .wks bootimg")
+                      help="path to the dir containing the kernel to use "
+                           "in the .wks bootimg")
     parser.add_option("-n", "--native-sysroot", dest="native_sysroot",
-                      action="store", help="path to the native sysroot containing the tools to use to build the image")
+                      help="path to the native sysroot containing the tools "
+                           "to use to build the image")
     parser.add_option("-p", "--skip-build-check", dest="build_check",
                       action="store_false", default=True, help="skip the build check")
     parser.add_option("-f", "--build-rootfs", action="store_true", help="build rootfs")
@@ -173,7 +179,9 @@ def wic_create_subcommand(args, usage_str):
     if not wks_file.endswith(".wks"):
         wks_file = engine.find_canned_image(scripts_path, wks_file)
         if not wks_file:
-            print "No image named %s found, exiting.  (Use 'wic list images' to list available images, or specify a fully-qualified OE kickstart (.wks) filename)\n" % args[0]
+            print "No image named %s found, exiting.  (Use 'wic list images' "\
+                  "to list available images, or specify a fully-qualified OE "\
+                  "kickstart (.wks) filename)\n" % args[0]
             sys.exit(1)
 
     image_output_dir = ""
-- 
2.1.4


