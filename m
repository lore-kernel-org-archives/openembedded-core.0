Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65.1793464008331100358
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2026 09:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IBDx77sE;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: vgharaee@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214af2076so12560395e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 09:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793464006; x=1794068806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Us+SRnYC9YS5WqNJJBO+fVht/yIpuhOSahNh+L/obbU=;
        b=IBDx77sECFmMTxrXSltD9Cx4swKSRIM8KhADlSWJPj/4tGAUo/4fdli370QIzqag96
         UVvnwNK/pbYiFnpIrLS1wfunY8ahfo9fOfoDRQvYwY9RoMOsmquxbsYUkkQSaeHHJBXy
         /jfv4SQMTprQyQIVlmfwX6T8fuiobfymF3/KWArMeqCojfNLGjyC1eJ29WRZaDdl1i1F
         kPlKci3W7z7cXYxljC2K13/TXnu/2VE1dvVGIKF4RfB3231QXpY8+s25AsSucM61R0kB
         FfOElOyRvBQPDkEoCzlX+kMkgNxZGHoU3GihehRQromONg6IpZQ1i0nGaMiU2IOgGg4k
         roTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464006; x=1794068806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Us+SRnYC9YS5WqNJJBO+fVht/yIpuhOSahNh+L/obbU=;
        b=DGBSnF/MvO7AOMiXJrlCJ9TMpD5QKY9uDL6bs8MgX1hPXGQaMISmRQn1X3QIkjIqms
         JrA9KaVB878kyoL3KlWCsozfVSlen3W6ZSykHBm7layKbjDJxHvw86Uq7gkuVN2P/D+1
         tXfPteuLN5waawsF/TSRef28luStyNztSV17jGW4pfvwNI2BurAf/8dmRaFWVtAVfEKt
         rq+AD2DnAMyxnK4Ai8M9dzevwnu05Mvw03poskOXYOg1Rs78vLrdM6LqGn1Hj8wHNk4T
         22hvrd2W5oCdhs8RDgJ4o96MTyFuoph35u1p9twYK4Lz+uc6mDOhJxPEn1nMqo7IjwxD
         jMUQ==
X-Gm-Message-State: AFq9FYIZZ+7wYqETX2QyOEVUxfKE2j12YWB6NF47bZFsQQ7RIX4w8Hvx
	kFwEHBaShOPcI83r7/AjjD1t8XCidBqtnreafa3littS/O4NW5YtYXP2x/eahg==
X-Gm-Gg: AYBFou3bsgTNTV/1LaPZwZeZu1p0R8BB/XNsnLFqYgoldfL0hYcARA29U9W97qprjGU
	BS8K1eL1T+fpB8WQd0evguOJwFZgXvGZzh4Vi2kKDK22rTkvLkDv6nJTLJnAO2fw4n+P3ftYdF8
	p+vyJcgVWicBCHTT/khuRxVhwPuC4v1fnIIU+quNF/o/WHC3tfC/iswQPNIXcIN15uhz1ZrNQ3i
	n5SNPmTiMI89p1XzUXYBMl1Pyp2XDvsSaDfaCwcUzqGvgxx0R5qc7oIkEoG1wwLt7Tt7LuOIcCx
	sGlXldtjeUfp+JtLaAqXM239CSaAMLNPM4Slfip30C9IhSLjc+qLH4IjqaYVBQMGMKBMWMZrmzE
	1mBaajva2/n0dLMSjk0QcP8ZeO/J1up3/urbm1KCO/XMhbPYRtfnryjbiaXu+NLsyWbt8hzK7qC
	VqUHoEKr3zdwR4Fu/roeE689ZT/3yCJKWuujrlLL8LNiCXJnPebgTRZrBxZZJd1FMXwwb9tHQsM
	P8cwY13fiUZ2HauWA2arkLoOZi0JvC87ATyPXA3qtjFun6ZWC0mb0IWiGtjobLBi2c0uEKNWJdN
	jjnfMWw/x0ghOlAug05UCCSnng32TaB1iAtQUSh9x/69b8wtDSi0V7Hw4l5MSsLGj3RnY4d+
X-Received: by 2002:a05:600c:3b29:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4ac17d19aeamr117234485e9.21.1793464006465;
        Sat, 31 Oct 2026 09:26:46 -0700 (PDT)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.fritz.box ([2001:16e0:257:b301:9825:3e45:cd0a:824b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2640sm214214455e9.6.2026.10.31.09.26.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:26:46 -0700 (PDT)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 4/6] oe.fitimage: Add custom configurations and harden multi-kernel handling
Date: Sat, 31 Oct 2026 17:26:47 +0100
Message-ID: <20261031162649.944625-5-vgharaee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031162649.944625-1-vgharaee@gmail.com>
References: <20261031162649.944625-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 18:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249162
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

Reject explicit kernel selection for FIT overlays and validate
configuration generation order.

Tested with oe-selftest -r fitimage.FitImagePyTests.

Signed-off-by: Vahid Gharaee <vgharaee@gmail.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 136 ++++++++++++++++---
 meta/lib/oe/fitimage.py                      |  85 ++++++++++--
 meta/lib/oeqa/selftest/cases/fitimage.py     |  37 +++++
 3 files changed, 231 insertions(+), 27 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index a238de1aa2..ea4f39373d 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -29,22 +29,57 @@ python () {
         d.appendVarFlag('do_compile', 'depends', ' virtual/dtb:do_populate_sysroot')
         d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
 
-    # Parse loadables config
-    loadables = d.getVar('FIT_LOADABLES')
-    if loadables:
-        # Forbid direct assignment, set synthetic values for testability and
-        # add the vars to vardeps so their flags are part of the signature.
-        loadable_vars = ['FIT_LOADABLE_ARCH', 'FIT_LOADABLE_COMPRESSION',
-                         'FIT_LOADABLE_DESCRIPTION', 'FIT_LOADABLE_ENTRYPOINT',
-                         'FIT_LOADABLE_FILENAME', 'FIT_LOADABLE_LOADADDRESS',
-                         'FIT_LOADABLE_OS', 'FIT_LOADABLE_TYPE']
-        for v in loadable_vars:
-            if d.getVar(v):
-                raise bb.parse.SkipRecipe("You cannot use %s as a variable, you can only set flags." % v)
-
-            synt_value = " ? ".join([ d.getVarFlag(v, loadable) or "" for loadable in loadables.split() ])
-            d.setVar(v, synt_value)
-        d.appendVarFlag('do_compile', 'vardeps', ' ' + ' '.join(loadable_vars))
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
+                d.appendVarFlag('do_compile', 'vardeps', ' ' + v)
+
+                synt_value = " ? ".join([ d.getVarFlag(v, item, False) or "" for item in items.split() ])
+                d.setVar(v, synt_value)
+
+            # Preserve upstream's task signature tracking
+            d.appendVarFlag('do_compile', 'vardeps', ' ' + ' '.join(flag_vars))
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
@@ -64,6 +99,30 @@ def apply_dtbvendored(d,dtb):
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
@@ -97,6 +156,39 @@ python do_compile() {
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
@@ -212,6 +304,18 @@ python do_compile() {
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
index 91ccc31d46..55dfdc1737 100644
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
@@ -192,7 +195,9 @@ class ItsNodeRootKernel(ItsNode):
 
         self._dtbs = []
         self._dtb_alias = []
-        self._kernel = None
+        # DTB ids as passed to fitimage_emit_section_dtb(_alias) mapped to their nodes
+        self._dtbs_by_id = {}
+        self._default_conf = None
         self._kernels = {}
         self._ramdisk = None
         self._bootscr = None
@@ -213,11 +218,18 @@ class ItsNodeRootKernel(ItsNode):
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
@@ -242,6 +254,7 @@ class ItsNodeRootKernel(ItsNode):
         return image_node
 
     def its_add_node_dtb(self, image_id, description, image_type, compression, opt_props, compatible):
+        self._check_image_id_unique(image_id)
         dtb_node = ItsNodeDtb(
             image_id,
             self.images,
@@ -267,7 +280,7 @@ class ItsNodeRootKernel(ItsNode):
         return dtb_node
 
     def fitimage_emit_section_kernel(self, kernel_id, kernel_path, compression,
-        load, entrypoint, mkimage_kernel_type, entrysymbol=None):
+        load, entrypoint, mkimage_kernel_type, entrysymbol=None, description="Linux kernel"):
         """Emit the fitImage ITS kernel section"""
         if kernel_id in self._kernels:
             bb.fatal("Kernel section '%s' already exists in the ITS file." % kernel_id)
@@ -290,19 +303,18 @@ class ItsNodeRootKernel(ItsNode):
 
         kernel_node = self.its_add_node_image(
             kernel_id,
-            "Linux kernel",
+            description,
             mkimage_kernel_type,
             compression,
             opt_props,
         )
         self._kernels[kernel_id] = kernel_node
 
-        if self._kernel is None:
-            self._kernel = kernel_node
-
     def fitimage_emit_section_dtb(self, dtb_id, dtb_path, dtb_loadaddress=None,
                                   dtbo_loadaddress=None, add_compatible=False):
         """Emit the fitImage ITS DTB section"""
+        if dtb_id in self._dtbs_by_id:
+            bb.fatal("DTB '%s' already exists in the ITS file." % dtb_id)
         load=None
         dtb_ext = os.path.splitext(dtb_path)[1]
         if dtb_ext == ".dtbo":
@@ -332,9 +344,12 @@ class ItsNodeRootKernel(ItsNode):
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
@@ -343,6 +358,7 @@ class ItsNodeRootKernel(ItsNode):
         dtb_id = os.path.basename(dtb_path)
         dtb_alias_node = ItsNodeDtbAlias("fdt-" + dtb_id, dtb_alias_id, compatible)
         self._dtb_alias.append(dtb_alias_node)
+        self._dtbs_by_id[dtb_alias_id] = dtb_alias_node
 
     def fitimage_emit_section_boot_script(self, bootscr_id, bootscr_path):
         """Emit the fitImage ITS u-boot script section"""
@@ -440,7 +456,7 @@ class ItsNodeRootKernel(ItsNode):
         if dtb and os.path.splitext(dtb.name)[1] == ".dtbo":
             include_kernel = 0
 
-        selected_kernel = kernel if kernel is not None else self._kernel
+        selected_kernel = kernel if kernel is not None else next(iter(self._kernels.values()), None)
 
         if selected_kernel and include_kernel:
             conf_desc.append("Linux kernel")
@@ -510,6 +526,9 @@ class ItsNodeRootKernel(ItsNode):
             )
 
     def fitimage_emit_section_config(self, default_dtb_image=None, mappings=None):
+        if self.configurations.sub_nodes:
+            bb.fatal("Standard FIT configurations must be emitted before custom configurations")
+
         if self._dtbs:
             dtb_extra_confs = []
             dtb_confs = {}
@@ -567,13 +586,57 @@ class ItsNodeRootKernel(ItsNode):
                 )
                 bb.fatal("FIT configuration mapping(s) not matched with any DTB: %s" % ', '.join(unused_conf))
         else:
-            # Currently exactly one kernel is supported.
+            # Without DTBs, emit one configuration for the default kernel
             self._fitimage_emit_one_section_config(self._conf_prefix + "1")
 
+        # The caller must emit standard configurations before custom ones.
+        # The first configuration is the default unless overridden by
+        # default_dtb_image or a later call to fitimage_set_default_config().
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
+        if kernel_id and dtb and os.path.splitext(dtb.name)[1] == ".dtbo":
+            bb.fatal(
+                "FIT configuration '%s' cannot select kernel '%s' "
+                "with device tree overlay '%s'" %
+                (conf_node_name, kernel_id, dtb_id)
+            )
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
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 86326f40bd..2783e4e85c 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1569,6 +1569,43 @@ KERNEL_DTBVENDORED = "1"
 
 class FitImagePyTests(KernelFitImageBase):
     """Test cases for the fitimage.py module without calling bitbake"""
+    def test_custom_config_rejects_kernel_with_overlay(self):
+        """An overlay configuration must not silently ignore an explicit kernel."""
+        root = oe.fitimage.ItsNodeRootKernel(
+            "Test FIT", "1", "x86_64-poky-linux-", "x86",
+            "linux", "conf-", False, None,
+            "uboot-mkimage", "", "uboot-mkimage", "",
+            "sha256", "rsa2048", "pkcs-1.5",
+            None, False, None
+        )
+
+        root.fitimage_emit_section_kernel(
+            "kernel-1", "linux.bin", "none",
+            "0x20008000", "0x20008000", "kernel"
+        )
+
+        root.fitimage_emit_section_dtb(
+            "test-overlay.dtbo", "a-dir/test-overlay.dtbo"
+        )
+        
+        with self.assertRaises(bb.BBHandledException):
+            root.fitimage_emit_section_config_custom(
+                "invalid", "kernel-1", "test-overlay.dtbo"
+            )
+        
+        # A regular DTB may explicitly select a kernel.
+        root.fitimage_emit_section_dtb(
+            "test-board.dtb", "a-dir/test-board.dtb"
+        )
+        
+        root.fitimage_emit_section_config_custom(
+            "regular", "kernel-1", "test-board.dtb"
+        )
+
+        # An overlay without an explicit kernel is valid.
+        root.fitimage_emit_section_config_custom(
+            "overlay", None, "test-overlay.dtbo"
+        )
 
     def _test_fitimage_py(self, bb_vars_overrides=None):
         topdir = os.path.join(os.environ['BUILDDIR'])
-- 
2.55.0

