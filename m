Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CB27773CF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 11:52:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 17 Jun 2015 04:51:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="745084817"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2015 04:51:34 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 64DED6A4083;
	Wed, 17 Jun 2015 04:50:57 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 14:50:59 +0300
Message-Id: <1434541859-9267-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: code cleanup: superfluous-parens
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
X-List-Received-Date: Wed, 17 Jun 2015 11:52:01 -0000

Removed unncecessary parents after 'if' 'del' and 'print' keywords.
Fixed pyling warning: Unnecessary parens after 'xxx' keyword

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/image/engine.py                            |  6 +++---
 scripts/lib/image/help.py                              |  2 +-
 scripts/lib/wic/3rdparty/pykickstart/options.py        | 10 +++++-----
 scripts/lib/wic/kickstart/custom_commands/partition.py | 14 +++++++-------
 scripts/lib/wic/plugin.py                              |  2 +-
 scripts/lib/wic/plugins/source/fsimage.py              |  2 +-
 scripts/lib/wic/plugins/source/rawcopy.py              |  4 ++--
 scripts/lib/wic/utils/oe/misc.py                       |  6 +++---
 8 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 05c2638..c568d69 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -70,13 +70,13 @@ def find_artifacts(image_name):
     rootfs_dir = kernel_dir = bootimg_dir = native_sysroot = ""
 
     for line in bitbake_env_lines.split('\n'):
-        if (misc.get_line_val(line, "IMAGE_ROOTFS")):
+        if misc.get_line_val(line, "IMAGE_ROOTFS"):
             rootfs_dir = misc.get_line_val(line, "IMAGE_ROOTFS")
             continue
-        if (misc.get_line_val(line, "DEPLOY_DIR_IMAGE")):
+        if misc.get_line_val(line, "DEPLOY_DIR_IMAGE"):
             kernel_dir = misc.get_line_val(line, "DEPLOY_DIR_IMAGE")
             continue
-        if (misc.get_line_val(line, "STAGING_DIR_NATIVE")):
+        if misc.get_line_val(line, "STAGING_DIR_NATIVE"):
             native_sysroot = misc.get_line_val(line, "STAGING_DIR_NATIVE")
             continue
 
diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 9321149..886437b 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -53,7 +53,7 @@ def wic_help(args, usage_str, subcommands):
     Subcommand help dispatcher.
     """
     if len(args) == 1 or not display_help(args[1], subcommands):
-        print(usage_str)
+        print usage_str
 
 
 def get_wic_plugins_help():
diff --git a/scripts/lib/wic/3rdparty/pykickstart/options.py b/scripts/lib/wic/3rdparty/pykickstart/options.py
index b2d8e3e..ebc23ed 100644
--- a/scripts/lib/wic/3rdparty/pykickstart/options.py
+++ b/scripts/lib/wic/3rdparty/pykickstart/options.py
@@ -145,19 +145,19 @@ def _check_string(option, opt, value):
 
 def _check_size(option, opt, value):
     # Former default was MB
-    if (value.isdigit()):
+    if value.isdigit():
         return int(value) * 1024L
 
     mapping = {"opt": opt, "value": value}
-    if (not value[:-1].isdigit()):
+    if not value[:-1].isdigit():
         raise OptionValueError(_("Option %(opt)s: invalid size value: %(value)r") % mapping)
 
     size = int(value[:-1])
-    if (value.endswith("k") or value.endswith("K")):
+    if value.endswith("k") or value.endswith("K"):
         return size
-    if (value.endswith("M")):
+    if value.endswith("M"):
         return size * 1024L
-    if (value.endswith("G")):
+    if value.endswith("G"):
         return size * 1024L * 1024L
     raise OptionValueError(_("Option %(opt)s: invalid size value: %(value)r") % mapping)
 
diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 40c2772..324ea69 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -268,7 +268,7 @@ class Wic_PartData(Mic_PartData):
         extra_imagecmd = "-i 8192"
 
         label_str = ""
-        if (self.label):
+        if self.label:
             label_str = "-L %s" % self.label
 
         mkfs_cmd = "mkfs.%s -F %s %s %s -d %s" % \
@@ -315,7 +315,7 @@ class Wic_PartData(Mic_PartData):
         exec_cmd(dd_cmd)
 
         label_str = ""
-        if (self.label):
+        if self.label:
             label_str = "-L %s" % self.label
 
         mkfs_cmd = "mkfs.%s -b %d -r %s %s %s" % \
@@ -361,7 +361,7 @@ class Wic_PartData(Mic_PartData):
             blocks += (16 - (blocks % 16))
 
         label_str = "-n boot"
-        if (self.label):
+        if self.label:
             label_str = "-n %s" % self.label
 
         dosfs_cmd = "mkdosfs %s -S 512 -C %s %d" % (label_str, rootfs, blocks)
@@ -436,7 +436,7 @@ class Wic_PartData(Mic_PartData):
         extra_imagecmd = "-i 8192"
 
         label_str = ""
-        if (self.label):
+        if self.label:
             label_str = "-L %s" % self.label
 
         mkfs_cmd = "mkfs.%s -F %s %s %s" % \
@@ -460,7 +460,7 @@ class Wic_PartData(Mic_PartData):
         exec_cmd(dd_cmd)
 
         label_str = ""
-        if (self.label):
+        if self.label:
             label_str = "-L %s" % self.label
 
         mkfs_cmd = "mkfs.%s -b %d %s %s" % \
@@ -482,7 +482,7 @@ class Wic_PartData(Mic_PartData):
         blocks = self.size
 
         label_str = "-n boot"
-        if (self.label):
+        if self.label:
             label_str = "-n %s" % self.label
 
         dosfs_cmd = "mkdosfs %s -S 512 -C %s %d" % (label_str, fs, blocks)
@@ -553,7 +553,7 @@ class Wic_Partition(Mic_Partition):
 
     def _getParser(self):
         def overhead_cb (option, opt_str, value, parser):
-            if (value < 1):
+            if value < 1:
                 raise OptionValueError("Option %s: invalid value: %r" % (option, value))
             setattr(parser.values, option.dest, value)
 
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 9872d20..fff02c0 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -103,7 +103,7 @@ class PluginMgr(object):
                                 % (os.path.basename(pdir), mod, err)
                             msger.warning(msg)
 
-            del(sys.path[0])
+            del sys.path[0]
 
     def get_plugins(self, ptype):
         """ the return value is dict of name:class pairs """
diff --git a/scripts/lib/wic/plugins/source/fsimage.py b/scripts/lib/wic/plugins/source/fsimage.py
index 98f02a1..f894e89 100644
--- a/scripts/lib/wic/plugins/source/fsimage.py
+++ b/scripts/lib/wic/plugins/source/fsimage.py
@@ -62,7 +62,7 @@ class FSImagePlugin(SourcePlugin):
 
         msger.debug('Bootimg dir: %s' % bootimg_dir)
 
-        if ('file' not in source_params):
+        if 'file' not in source_params:
             msger.error("No file specified\n")
             return
 
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 071b2d2..f0691ba 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -62,14 +62,14 @@ class RawCopyPlugin(SourcePlugin):
 
         msger.debug('Bootimg dir: %s' % bootimg_dir)
 
-        if ('file' not in source_params):
+        if 'file' not in source_params:
             msger.error("No file specified\n")
             return
 
         src = os.path.join(bootimg_dir, source_params['file'])
         dst = src
 
-        if ('skip' in source_params):
+        if 'skip' in source_params:
             dst = os.path.join(cr_workdir, source_params['file'])
             dd_cmd = "dd if=%s of=%s ibs=%s skip=1 conv=notrunc" % \
                     (src, dst, source_params['skip'])
diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index f08ff15..2f916dd 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -38,7 +38,7 @@ def __exec_cmd(cmd_and_args, as_shell=False, catch=3):
     args = cmd_and_args.split()
     msger.debug(args)
 
-    if (as_shell):
+    if as_shell:
         rc, out = runner.runtool(cmd_and_args, catch)
     else:
         rc, out = runner.runtool(args, catch)
@@ -142,7 +142,7 @@ def find_artifact(bitbake_env_lines, variable):
     retval = ""
 
     for line in bitbake_env_lines.split('\n'):
-        if (get_line_val(line, variable)):
+        if get_line_val(line, variable):
             retval = get_line_val(line, variable)
             break
 
@@ -160,7 +160,7 @@ def get_line_val(line, key):
 
 def get_bitbake_var(key):
     for line in __bitbake_env_lines.split('\n'):
-        if (get_line_val(line, key)):
+        if get_line_val(line, key):
             val = get_line_val(line, key)
             return val
     return None
-- 
2.1.4


