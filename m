Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6673.1792500761235600899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ACYo4bDs;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: vgharaee@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1972475f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 05:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500759; x=1793105559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n4X/tNcJq3ugmSTOKwLQFXC43bPs4CCgvZT23f8uMbw=;
        b=ACYo4bDsaAugfKM2XTQ5UmAOI3nVGT4uWUCzJ8mEjgdzi60W17jKtI/yqFbQPjO06b
         JNpsu+YL5wuIRxV7MEj+MvXva7UeBd25KAq6HYNvKDrm9h5jl90i+TJ5QNlB6W5Q4ih/
         86ve3rnbNf1oFu4UpfQm0amtP8ORnEY/j6JIE04kacchRbtcxJc9WTjKrAELd4f5Blbn
         46QOGXpu3PL88G0zubkaost8aRyjk7Dd3vEu8JuNPpg27WUVkNW9tkX1DDwyaUQGvpAP
         EfJa0o/p8Xz1TNb1/mBt9IUVzCz1J3B8eRRN9uZyZnLTEu/a+bOJ6dX1Ltw9MOEb9rbH
         tPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500759; x=1793105559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n4X/tNcJq3ugmSTOKwLQFXC43bPs4CCgvZT23f8uMbw=;
        b=dyGkML3rex4BZRBeQkZz8eg1rGJ+tF7iUGTOTjb1lMA0CAknzIdSmXOeMQimAzplHC
         i8mx+VDFy6kv0/4GIYeMZiT7ki4h+3k9ms2dhIty5Zj+UxRtdzt0bEcfCbH2Ds6AICoF
         V4lkRstkwYafPTQYfiS5Zt7Whc+CHmppcygp+iAzNPooJ4PlqZEel4vHf9Vwu1ptF6Mc
         lRSiFzVWN1yR5CEqMgmTnCkKq6HnyTmMTvzP94l0vhFhB/Jgc5+nMUSLTP6Hnc2ZTID9
         rFuJgqJkUs5uKlgXWx5sPlEg0YzWAIOlJ4Xyf/ZDMfl/AvqDZ/nUZV+/ZWRqHwLIDLay
         HpzA==
X-Gm-Message-State: AFq9FYJDwwfTNNU8k0/BJZB8Ek0bfoY1Yyh3hSDvM8h2TbgI+GUFKf9J
	VgEvfjimDjiKjTR6TuWaljAImIHlBS6xsqvaYbU/YYq9Vyvhfjhjqlhf6MkoLA==
X-Gm-Gg: AYBFou0IhjSEFJYcoJ6cX79CV9I6tuf7z/3DkDD/jN4fy2QB6iDYD9zPRRpz4FX6X6o
	KliZgF0tG/qjctBkwpJK1KNhiUG8Aea1GxPxXbR0xGLvdxdzkygST80J93MQpOIe7Btf/UumthN
	DJwzpgndfwVGXDspuHzHzeNL4zt4qPB+9Fbpw+YQPJykVraRlfxza1Nqonhee6Ae3TNw/aM7zPl
	SSr7HZaIbsrDK+LF6S4tbVVAn6mjcmyEp5MmSI5t9PrSid1V1J348HkO2jivhWtR169o2P5wcyX
	4Myafa2zqo1cKoMFPzq/2iyIw2IFkDpivMfqg967TzRhcJU9N77PasZYze2tZ7TMFkw6vEJsrav
	W9qqYPNbKgMAB7qmHP+3jLK0NYHq7qI4UBmi8HgY0brTEUr5zUOP9ni9njPYxfLW4UeysbdfYsn
	33JOybxTcr+RyB5LgeN1MB7kZ5i5GGBaJ818BMcJvgTnUqyNn+ehpoN7BjI0RhxNTMlmjAOhuyu
	VJYj3yC4xhk6Ei0j++DUl+o
X-Received: by 2002:adf:f28a:0:b0:48e:44d:5a9d with SMTP id ffacd0b85a97d-48e07fa99a7mr16005870f8f.45.1792500759104;
        Tue, 20 Oct 2026 05:52:39 -0700 (PDT)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.t-mobile.de ([88.128.94.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fdbbsm6335698f8f.17.2026.10.20.05.52.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:52:38 -0700 (PDT)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] oe.fitimage: Add custom configurations and harden multi-kernel handling
Date: Tue, 20 Oct 2026 14:52:33 +0200
Message-ID: <20261020125233.69997-5-vgharaee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020125233.69997-1-vgharaee@gmail.com>
References: <20261020125233.69997-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 13:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248283
Content-Type: text/plain; charset="utf-8"

From: Vahid Gharaee <vgharaee@gmail.com>

One can now add configs that point to any kernel node and,
optionally, a DTB with fitimage_emit_section_config_custom(). The default
config still can be chosen by name with fitimage_set_default_config().

The default configuration is now stored and written to the ITS once, in
write_its_file(). Before, fitimage_set_default_config() had to overwrite
the property that fitimage_emit_section_config() had already set.

DTBs and DTB symlink aliases are now looked up by the id they were added
with. Before, the lookup depended on the "fdt-" node name or the alias
name.

Tested with oe-selftest -r fitimage.FitImagePyTests.

Signed-off-by: Vahid Gharaee <vgharaee@gmail.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 129 +++++++++++++++++--
 meta/lib/oe/fitimage.py                      |  66 +++++++++-
 2 files changed, 175 insertions(+), 20 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 7b2bcd4673..4abdab0a4a 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -29,20 +29,52 @@ python () {
         d.appendVarFlag('do_compile', 'depends', ' virtual/dtb:do_populate_sysroot')
         d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
 
-    # Parse loadables config
-    loadables = d.getVar('FIT_LOADABLES')
-    if loadables:
-        # Check that the loadables configuration variables are not set directly
-        # directly, then assign them a synthetic value for testability purposes
-        for v in ['FIT_LOADABLE_ARCH', 'FIT_LOADABLE_COMPRESSION',
-                  'FIT_LOADABLE_DESCRIPTION', 'FIT_LOADABLE_ENTRYPOINT',
-                  'FIT_LOADABLE_FILENAME', 'FIT_LOADABLE_LOADADDRESS',
-                  'FIT_LOADABLE_OS', 'FIT_LOADABLE_TYPE']:
-            if d.getVar(v):
-                raise bb.parse.SkipRecipe("You cannot use %s as a variable, you can only set flags." % v)
-
-            synt_value = " ? ".join([ d.getVarFlag(v, loadable) or "" for loadable in loadables.split() ])
-            d.setVar(v, synt_value)
+    # Parse loadables, additional kernels and additional configurations
+    for items_var, flag_vars in (
+            ('FIT_LOADABLES', ['FIT_LOADABLE_ARCH', 'FIT_LOADABLE_COMPRESSION',
+                               'FIT_LOADABLE_DESCRIPTION', 'FIT_LOADABLE_ENTRYPOINT',
+                               'FIT_LOADABLE_FILENAME', 'FIT_LOADABLE_LOADADDRESS',
+                               'FIT_LOADABLE_OS', 'FIT_LOADABLE_TYPE']),
+            ('FIT_KERNELS', ['FIT_KERNEL_COMPRESSION', 'FIT_KERNEL_DEPLOYDIR',
+                             'FIT_KERNEL_DESCRIPTION', 'FIT_KERNEL_ENTRYPOINT',
+                             'FIT_KERNEL_FILENAME', 'FIT_KERNEL_LOADADDRESS',
+                             'FIT_KERNEL_MULTICONFIG', 'FIT_KERNEL_RECIPE',
+                             'FIT_KERNEL_TYPE']),
+            ('FIT_CONFIGS', ['FIT_CONFIG_DTB', 'FIT_CONFIG_KERNEL'])):
+        items = d.getVar(items_var)
+        if items:
+            # Check that the configuration variables are not set directly,
+            # then assign them a synthetic value for testability purposes
+            for v in flag_vars:
+                if d.getVar(v):
+                    raise bb.parse.SkipRecipe("You cannot use %s as a variable, you can only set flags." % v)
+
+                synt_value = " ? ".join([ d.getVarFlag(v, item, False) or "" for item in items.split() ])
+                d.setVar(v, synt_value)
+
+    # Additional kernels may be deployed by another recipe, by a recipe of
+    # another multiconfig or be provided as prebuilt files
+    kernels = (d.getVar('FIT_KERNELS') or "").split()
+    if "kernel-1" in kernels:
+        bb.fatal("FIT_KERNELS must not contain kernel-1, it is reserved for virtual/kernel")
+    duplicates = sorted(set(k for k in kernels if kernels.count(k) > 1))
+    if duplicates:
+        bb.fatal("FIT_KERNELS contains duplicate entries: %s" % ' '.join(duplicates))
+    for kernel in kernels:
+        recipe = d.getVarFlag('FIT_KERNEL_RECIPE', kernel)
+        mc = d.getVarFlag('FIT_KERNEL_MULTICONFIG', kernel)
+        if mc:
+            if not d.getVarFlag('FIT_KERNEL_DEPLOYDIR', kernel):
+                bb.fatal("FIT_KERNEL_DEPLOYDIR[%s] must be set if FIT_KERNEL_MULTICONFIG[%s] is set" % (kernel, kernel))
+            d.appendVarFlag('do_compile', 'mcdepends', ' mc:%s:%s:%s:do_deploy' %
+                            (d.getVar('BB_CURRENT_MC'), mc, recipe or 'virtual/kernel'))
+        elif recipe:
+            d.appendVarFlag('do_compile', 'depends', ' %s:do_deploy' % recipe)
+        else:
+            if not d.getVarFlag('FIT_KERNEL_FILENAME', kernel):
+                bb.fatal("FIT_KERNEL_FILENAME[%s] must be set if neither FIT_KERNEL_RECIPE[%s] nor FIT_KERNEL_MULTICONFIG[%s] is set" % (kernel, kernel, kernel))
+            kernel_path = fit_kernel_path(d, kernel)
+            d.appendVarFlag('do_compile', 'file-checksums', ' %s:%s' % (kernel_path, os.path.exists(kernel_path)))
 }
 
 do_configure[noexec] = "1"
@@ -62,6 +94,30 @@ def apply_dtbvendored(d,dtb):
         mapped_name = dtb.replace('/', '_')
     return mapped_name
 
+def fit_kernel_path(d, kernel):
+    filename = d.getVarFlag('FIT_KERNEL_FILENAME', kernel) or "linux.bin"
+    deploydir = d.getVarFlag('FIT_KERNEL_DEPLOYDIR', kernel) or d.getVar('DEPLOY_DIR_IMAGE')
+    return os.path.join(deploydir, filename)
+
+def fit_kernel_deployed_files(d, recipe):
+    """Return the real paths of all files deployed by do_deploy of recipe (PN or PROVIDES) in this multiconfig"""
+    import bb.runqueue
+    mc = d.getVar('BB_CURRENT_MC') or ""
+    taskdepdata = d.getVar('BB_TASKDEPDATA', False)
+    pns = set(dep.pn for tid, dep in taskdepdata.items()
+              if dep.taskname == "do_deploy" and bb.runqueue.mc_from_tid(tid) == mc and
+                 (dep.pn == recipe or recipe in dep.provides))
+    if len(pns) != 1:
+        bb.fatal("Could not identify the do_deploy dependency providing %s (found: %s)" % (recipe, ' '.join(sorted(pns)) or "none"))
+    pn = pns.pop()
+    for arch in d.getVar('SSTATE_ARCHS').split():
+        manifest = os.path.join(d.getVar('SSTATE_MANIFESTS'), "manifest-%s-%s.deploy" % (arch, pn))
+        if os.path.exists(manifest):
+            with open(manifest) as f:
+                return set(os.path.realpath(line) for line in f.read().splitlines() if line and not line.endswith('/'))
+    bb.fatal("No deploy manifest found for %s" % pn)
+fit_kernel_deployed_files[vardepsexclude] = "BB_TASKDEPDATA SSTATE_ARCHS"
+
 python do_compile() {
     import shutil
     import oe.fitimage
@@ -95,6 +151,39 @@ python do_compile() {
         d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
         d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'), d.getVar("UBOOT_ENTRYSYMBOL"))
 
+    # Prepare additional kernel image sections
+    for kernel in d.getVar('FIT_KERNELS').split():
+        recipe = d.getVarFlag('FIT_KERNEL_RECIPE', kernel)
+        mc = d.getVarFlag('FIT_KERNEL_MULTICONFIG', kernel)
+        kernel_path = fit_kernel_path(d, kernel)
+        if not os.path.exists(kernel_path):
+            bb.fatal("File for kernel %s not found at %s" % (kernel, kernel_path))
+        # Artifacts of another multiconfig cannot be verified, its FIT_KERNEL_DEPLOYDIR is trusted
+        deployed = None
+        if recipe and not mc:
+            deployed = fit_kernel_deployed_files(d, recipe)
+            if os.path.realpath(kernel_path) not in deployed:
+                bb.fatal("File for kernel %s at %s is not deployed by %s" % (kernel, kernel_path, recipe))
+        kernel_file = "linux-%s.bin" % kernel
+        shutil.copyfile(kernel_path, kernel_file)
+
+        kernel_comp = d.getVarFlag('FIT_KERNEL_COMPRESSION', kernel)
+        if not kernel_comp:
+            kernel_comp = "none"
+            # linux_comp only describes linux.bin written by kernel-fit-extra-artifacts of the same recipe
+            if (recipe or mc) and os.path.basename(kernel_path) == "linux.bin":
+                kernel_comp_path = os.path.join(os.path.dirname(kernel_path), "linux_comp")
+                if not os.path.exists(kernel_comp_path) or \
+                        (deployed is not None and os.path.realpath(kernel_comp_path) not in deployed):
+                    bb.fatal("%s not found or not deployed by the kernel recipe, set FIT_KERNEL_COMPRESSION[%s]" % (kernel_comp_path, kernel))
+                with open(kernel_comp_path) as kernel_comp_f:
+                    kernel_comp = kernel_comp_f.read().strip()
+        root_node.fitimage_emit_section_kernel(kernel, kernel_file, kernel_comp,
+            d.getVarFlag('FIT_KERNEL_LOADADDRESS', kernel) or d.getVar('UBOOT_LOADADDRESS'),
+            d.getVarFlag('FIT_KERNEL_ENTRYPOINT', kernel) or d.getVar('UBOOT_ENTRYPOINT'),
+            d.getVarFlag('FIT_KERNEL_TYPE', kernel) or d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'),
+            description=d.getVarFlag('FIT_KERNEL_DESCRIPTION', kernel) or "Linux kernel")
+
     # Prepare a DTB image section
     kernel_devicetree = d.getVar('KERNEL_DEVICETREE')
     external_kernel_devicetree = d.getVar("EXTERNAL_KERNEL_DEVICETREE")
@@ -210,6 +299,18 @@ python do_compile() {
     # Generate the configuration section
     root_node.fitimage_emit_section_config(default_dtb, d.getVar("FIT_CONF_MAPPINGS"))
 
+    # Generate additional configurations, e.g. referring to additional kernels
+    for conf in d.getVar('FIT_CONFIGS').split():
+        conf_dtb = d.getVarFlag('FIT_CONFIG_DTB', conf)
+        if conf_dtb:
+            conf_dtb = apply_dtbvendored(d, conf_dtb)
+        root_node.fitimage_emit_section_config_custom(conf,
+            d.getVarFlag('FIT_CONFIG_KERNEL', conf), conf_dtb)
+
+    fit_conf_default = d.getVar('FIT_CONF_DEFAULT')
+    if fit_conf_default:
+        root_node.fitimage_set_default_config(fit_conf_default)
+
     # Write the its file
     root_node.write_its_file(itsfile)
 
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index 91ccc31d46..c062413f52 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -147,8 +147,11 @@ class ItsNodeConfiguration(ItsNode):
 class ItsNodeRootKernel(ItsNode):
     """Create FIT images for the kernel
 
-    Currently only a single kernel (no less or more) can be added to the FIT
-    image along with 0 or more device trees and 0 or 1 ramdisk.
+    One or more kernels can be added to the FIT image along with 0 or more
+    device trees and 0 or 1 ramdisk. The first kernel added is the default
+    kernel referenced by the automatically generated configurations.
+    Additional configurations referring to other kernels can be added with
+    fitimage_emit_section_config_custom().
 
     If a device tree included in the FIT image, the default configuration is the
     firt DTB. If there is no dtb present than the default configuation the kernel.
@@ -192,6 +195,9 @@ class ItsNodeRootKernel(ItsNode):
 
         self._dtbs = []
         self._dtb_alias = []
+        # DTB ids as passed to fitimage_emit_section_dtb(_alias) mapped to their nodes
+        self._dtbs_by_id = {}
+        self._default_conf = None
         self._kernel = None
         self._kernels = {}
         self._ramdisk = None
@@ -213,11 +219,18 @@ class ItsNodeRootKernel(ItsNode):
                 bb.fatal("FIT image signing is enabled for individual images but no image key name is provided.")
 
     def write_its_file(self, itsfile):
+        if self._default_conf:
+            self.configurations.add_property('default', self._default_conf)
         with open(itsfile, 'w') as f:
             f.write("/dts-v1/;\n\n")
             self.emit(f, 0)
 
+    def _check_image_id_unique(self, image_id):
+        if any(node.name == image_id for node in self.images.sub_nodes):
+            bb.fatal("Image node '%s' already exists in the ITS file." % image_id)
+
     def its_add_node_image(self, image_id, description, image_type, compression, opt_props):
+        self._check_image_id_unique(image_id)
         image_node = ItsNodeImage(
             image_id,
             self.images,
@@ -242,6 +255,7 @@ class ItsNodeRootKernel(ItsNode):
         return image_node
 
     def its_add_node_dtb(self, image_id, description, image_type, compression, opt_props, compatible):
+        self._check_image_id_unique(image_id)
         dtb_node = ItsNodeDtb(
             image_id,
             self.images,
@@ -267,7 +281,7 @@ class ItsNodeRootKernel(ItsNode):
         return dtb_node
 
     def fitimage_emit_section_kernel(self, kernel_id, kernel_path, compression,
-        load, entrypoint, mkimage_kernel_type, entrysymbol=None):
+        load, entrypoint, mkimage_kernel_type, entrysymbol=None, description="Linux kernel"):
         """Emit the fitImage ITS kernel section"""
         if kernel_id in self._kernels:
             bb.fatal("Kernel section '%s' already exists in the ITS file." % kernel_id)
@@ -290,7 +304,7 @@ class ItsNodeRootKernel(ItsNode):
 
         kernel_node = self.its_add_node_image(
             kernel_id,
-            "Linux kernel",
+            description,
             mkimage_kernel_type,
             compression,
             opt_props,
@@ -303,6 +317,8 @@ class ItsNodeRootKernel(ItsNode):
     def fitimage_emit_section_dtb(self, dtb_id, dtb_path, dtb_loadaddress=None,
                                   dtbo_loadaddress=None, add_compatible=False):
         """Emit the fitImage ITS DTB section"""
+        if dtb_id in self._dtbs_by_id:
+            bb.fatal("DTB '%s' already exists in the ITS file." % dtb_id)
         load=None
         dtb_ext = os.path.splitext(dtb_path)[1]
         if dtb_ext == ".dtbo":
@@ -332,9 +348,12 @@ class ItsNodeRootKernel(ItsNode):
             compatible
         )
         self._dtbs.append(dtb_node)
+        self._dtbs_by_id[dtb_id] = dtb_node
 
     def fitimage_emit_section_dtb_alias(self, dtb_alias_id, dtb_path, add_compatible=False):
         """Add a configuration node referring to another DTB"""
+        if dtb_alias_id in self._dtbs_by_id:
+            bb.fatal("DTB '%s' already exists in the ITS file." % dtb_alias_id)
         # Preserve the DTB's compatible string to be added to the configuration node
         compatible = None
         if add_compatible:
@@ -343,6 +362,7 @@ class ItsNodeRootKernel(ItsNode):
         dtb_id = os.path.basename(dtb_path)
         dtb_alias_node = ItsNodeDtbAlias("fdt-" + dtb_id, dtb_alias_id, compatible)
         self._dtb_alias.append(dtb_alias_node)
+        self._dtbs_by_id[dtb_alias_id] = dtb_alias_node
 
     def fitimage_emit_section_boot_script(self, bootscr_id, bootscr_path):
         """Emit the fitImage ITS u-boot script section"""
@@ -567,13 +587,47 @@ class ItsNodeRootKernel(ItsNode):
                 )
                 bb.fatal("FIT configuration mapping(s) not matched with any DTB: %s" % ', '.join(unused_conf))
         else:
-            # Currently exactly one kernel is supported.
+            # Without DTBs, emit one configuration for the default kernel
             self._fitimage_emit_one_section_config(self._conf_prefix + "1")
 
         default_conf = self.configurations.sub_nodes[0].name
         if default_dtb_image and self._dtbs:
             default_conf = self._conf_prefix + default_dtb_image
-        self.configurations.add_property('default', default_conf)
+        self._default_conf = default_conf
+
+    def fitimage_emit_section_config_custom(self, conf_id, kernel_id=None, dtb_id=None):
+        """Emit an additional configuration node for a specific kernel and optional DTB
+
+        kernel_id is the name of a kernel image node, the default kernel is used if not set.
+        dtb_id is the id passed to fitimage_emit_section_dtb or fitimage_emit_section_dtb_alias.
+        """
+        conf_node_name = self._conf_prefix + conf_id
+        if any(conf.name == conf_node_name for conf in self.configurations.sub_nodes):
+            bb.fatal("FIT configuration '%s' already exists in the ITS file." % conf_node_name)
+
+        kernel = None
+        if kernel_id:
+            kernel = self._kernels.get(kernel_id)
+            if not kernel:
+                bb.fatal("FIT configuration '%s' refers to unknown kernel '%s'. Available kernels: %s" %
+                         (conf_node_name, kernel_id, ' '.join(self._kernels)))
+
+        dtb = None
+        if dtb_id:
+            dtb = self._dtbs_by_id.get(dtb_id)
+            if not dtb:
+                bb.fatal("FIT configuration '%s' refers to unknown DTB '%s'. Available DTBs: %s" %
+                         (conf_node_name, dtb_id, ' '.join(self._dtbs_by_id)))
+
+        self._fitimage_emit_one_section_config(conf_node_name, dtb, kernel)
+
+    def fitimage_set_default_config(self, conf_id):
+        """Select the default configuration, overriding the one chosen by fitimage_emit_section_config"""
+        conf_node_name = self._conf_prefix + conf_id
+        if not any(conf.name == conf_node_name for conf in self.configurations.sub_nodes):
+            bb.fatal("FIT default configuration '%s' does not exist. Available configurations: %s" %
+                     (conf_node_name, ' '.join(conf.name for conf in self.configurations.sub_nodes)))
+        self._default_conf = conf_node_name
 
     def run_mkimage_assemble(self, itsfile, fitfile):
         cmd = [
-- 
2.55.0

