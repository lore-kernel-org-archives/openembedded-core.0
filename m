Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69.1793464011423841747
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2026 09:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=obxfuNXu;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: vgharaee@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so16382105e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 09:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793464010; x=1794068810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LlH0iORSfvD2wu6fFSkRmEWmqtcx/phC0Of0iK+QnVI=;
        b=obxfuNXuBSjn0HXrqm7hLfwkfewZ3V46x6kAY6voOzNaW6foRJUSJzLLq/wFOd6a6h
         Htb0TzqrsRGIzmYbnsZtwdAMFmtmR1jao9ukGCgyRsIz1mwrPTKLlYI2tMxbyctWS+d1
         YHG+uzWge8sYr+uBSz8zj0VxAMFA3o+VBa9LrQ7z/ony4TrKsgMc33scUqd4EaG8LOq1
         5pDBT/WhSyw9wKGIQuyQdNAOe5FrYTkW8iVsCdVRyqbEhpPbEFU19JJC+egTq1evUKPw
         bcHg+XnMY+huqwolMl6LaptFCD6gTwnwc+NH9B1MujGBJC5HsqULXV7Oykqo5xL21PDB
         mZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464010; x=1794068810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LlH0iORSfvD2wu6fFSkRmEWmqtcx/phC0Of0iK+QnVI=;
        b=zDhIxEFU7ka71hLzv1ciDjvsD4ZuyBqt9lWuEd1I57JGVP+jNS5IJ5o7LPizwRexJV
         U1+563Hz55S1ZfJ/btxgfcQFb+T8sozxFoUSXoF6EMByTFgv87WzEyIAFAbU++eeoQbU
         LJ8xhGs/VeI9KvLe8zymIxRHOPRzf+o56WVI99/byxCetqva541hpuSN5UKecA4VrNQP
         Xh1oFGpA6nDXjiCyhWTRt2hCDE8Y1mz5nsjufUpkswqnSV72FCzrs5YocwVW9YGUTZtI
         hBoiGKekpa/XRkvT6ZLLIG/pIDGeXIJ7ca31md3snTP2Z8GWhGYt6EdIk3Rhsx9TGwuA
         WWdg==
X-Gm-Message-State: AFq9FYJG4NofPVIeuwM3/NAyVZThgQwjdzS5y2NwMC+en528lAERghHL
	NM9M6ZW5G1PIibznfpdRISOeMhOXoIpJRjdbcoJVdFOfQsubGfvs0Esl69QtqA==
X-Gm-Gg: AYBFou3Rmu1TKOEsQvbONjcBhA7OPmG1PtaOvATK1oo/+ghQ+3WZgZ7Z9oN9rwZ+QuC
	c0euRhsWpR7P07EMGHBC2js9SFLhzTVwucl9q7vc79gO/AMXRkhrSKM5xioiCa2q7Dkewts37Nk
	CDFs/raHIWWVXxp8By6dvQp+w9V/+hMwksWLaem6dlNcDfM2t2zf50tRHwLxlB3RwyomGvGAl6j
	q3g+9/B8FKaz+g5vQh2UWLjw71h1S28Wm5bWWiCmkJInJc92fgya6ktikyil4HkzNh012NkVEtd
	40yOtAspuxw2ReIOJzR0gIVfnV6vYAG0bQcD6V97D+IuUlvmVw1sqt2h3v5hOeMds0f/K9c5s34
	342JIC/56KSo2w8izXfhM5l5f5NXyWTC2bx3dyt6JQ3AQ98JTtUeKdn30Tjf4UOVGge7D+dvNJ7
	mjnopCGgbotawdWZhqubl+LEYcN3IQo+aT3tarY9tcoqmTefxPzaqJMZozu8uL8cYCId2bg/oOx
	pAvunc+psMSOfbxgudAFsvzLICm8eZjQufcAXxOHvA1jvZq/d0jdBWbIkedtT0JvRn1mBthOZy2
	p0j5qNplPjGE5vbRoxoRxseu+k4VVuh9LneV+n0joc3/12FoaP0Gu1C8/6vEzAfr9kPiZEO9Rum
	1xGoEycImGy26jevVPA==
X-Received: by 2002:a05:600c:8b5c:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4ac1889c4b9mr135140865e9.20.1793464009629;
        Sat, 31 Oct 2026 09:26:49 -0700 (PDT)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.fritz.box ([2001:16e0:257:b301:9825:3e45:cd0a:824b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2640sm214214455e9.6.2026.10.31.09.26.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:26:49 -0700 (PDT)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 6/6] kernel-fit-image: preserve vendored DTB aliases for external overrides
Date: Sat, 31 Oct 2026 17:26:49 +0100
Message-ID: <20261031162649.944625-7-vgharaee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031162649.944625-1-vgharaee@gmail.com>
References: <20261031162649.944625-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 18:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249164
Content-Type: text/plain; charset="utf-8"

From: Vahid Gharaee <vgharaee@gmail.com>

When an external DTB overrides a kernel-provided DTB, the FIT
generation skips the kernel DTB. With KERNEL_DTBVENDORED enabled,
this also drops the vendored configuration name.

Preserve the vendored name by creating a configuration alias
referencing the external DTB image. Resolve external symlinks
to their actual DTB targets.

Add regression tests for regular and symlinked external DTB
overrides.

Signed-off-by: Vahid Gharaee <vgharaee@gmail.com>
---
 .../recipes-test/ext-dtb/test-dtbs-as-ext.bb  |  11 ++
 meta/classes-recipe/kernel-fit-image.bbclass  |   7 ++
 meta/lib/oeqa/selftest/cases/fitimage.py      | 105 ++++++++++++++++--
 3 files changed, 113 insertions(+), 10 deletions(-)

diff --git a/meta-selftest/recipes-test/ext-dtb/test-dtbs-as-ext.bb b/meta-selftest/recipes-test/ext-dtb/test-dtbs-as-ext.bb
index 217ca36235..de994cebce 100644
--- a/meta-selftest/recipes-test/ext-dtb/test-dtbs-as-ext.bb
+++ b/meta-selftest/recipes-test/ext-dtb/test-dtbs-as-ext.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit devicetree
 
+TEST_EXTRA_DTB ?= ""
 COMPATIBLE_MACHINE = ".*"
 
 SRC_URI = "\
@@ -18,8 +19,18 @@ SRC_URI = "\
 # Sym-links are handled as extra configuration nodes in FIT images.
 do_install:append() {
     ln -sf test-ext.dtb "${D}/boot/devicetree/test-ext-alias.dtb"
+
+    if [ -n "${TEST_EXTRA_DTB}" ]; then
+        cp "${D}/boot/devicetree/test-ext.dtb" \
+           "${D}/boot/devicetree/${TEST_EXTRA_DTB}"
+    fi
 }
 
 do_deploy:append() {
     ln -sf test-ext.dtb "${DEPLOYDIR}/devicetree/test-ext-alias.dtb"
+
+    if [ -n "${TEST_EXTRA_DTB}" ]; then
+        cp "${DEPLOYDIR}/devicetree/test-ext.dtb" \
+           "${DEPLOYDIR}/devicetree/${TEST_EXTRA_DTB}"
+    fi
 }
diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index ea4f39373d..1ef2717908 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -192,6 +192,7 @@ python do_compile() {
     # Prepare a DTB image section
     kernel_devicetree = d.getVar('KERNEL_DEVICETREE')
     external_kernel_devicetree = d.getVar("EXTERNAL_KERNEL_DEVICETREE")
+    external_dtb_aliases = {}
     if kernel_devicetree:
         for dtb in kernel_devicetree.split():
             # In deploy_dir the DTBs are without sub-directories also with KERNEL_DTBVENDORED = "1"
@@ -205,6 +206,8 @@ python do_compile() {
             if external_kernel_devicetree:
                 ext_dtb_path = os.path.join(external_kernel_devicetree, dtb_name)
                 if os.path.exists(ext_dtb_path) and os.path.getsize(ext_dtb_path) > 0:
+                    if conf_name != dtb_name:
+                        external_dtb_aliases[conf_name] = ext_dtb_path
                     continue
 
             # Copy the dtb or dtbo file into the FIT image assembly directory
@@ -229,6 +232,10 @@ python do_compile() {
                     root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
                         d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"), True)
 
+        for alias, dtb_path in external_dtb_aliases.items():
+            symlink_target = oe.fitimage.symlink_points_below(os.path.basename(dtb_path), external_kernel_devicetree)
+            root_node.fitimage_emit_section_dtb_alias(alias, symlink_target or dtb_path)
+
     # Prepare a u-boot script section
     fit_uboot_env = d.getVar("FIT_UBOOT_ENV")
     if fit_uboot_env:
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 6a0b0f82e9..90b7a20ad0 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -467,10 +467,9 @@ class FitImageTestCase(OESelftestTestCase):
         kernel_devicetree = bb_vars.get('KERNEL_DEVICETREE')
         all_dtbs = []
         dtb_aliases = {}
+        external_aliases = {}
+        kernel_dtbs = kernel_devicetree.split() if kernel_devicetree else []
 
-        if kernel_devicetree:
-            all_dtbs += [FitImageTestCase._apply_dtbvendored(bb_vars, dtb) for dtb in kernel_devicetree.split()]
-       
         if bb_vars.get("PREFERRED_PROVIDER_virtual/dtb") == "test-dtbs-as-ext":
             if bb_vars.get("_python_only_test"):
                 external_dtbs, external_aliases = FitImageTestCase._get_test_dtb_files()
@@ -481,6 +480,23 @@ class FitImageTestCase(OESelftestTestCase):
             all_dtbs.extend(external_dtbs)
             dtb_aliases.update(external_aliases)
 
+        for dtb in kernel_dtbs:
+            dtb_name = os.path.basename(dtb)
+            mapped_name = FitImageTestCase._apply_dtbvendored(bb_vars, dtb)
+
+            if dtb_name in all_dtbs:
+                target = dtb_name
+            elif dtb_name in external_aliases:
+                target = external_aliases[dtb_name]
+            else:
+                target = None
+
+            if target:
+                if mapped_name != target:
+                    dtb_aliases[mapped_name] = target
+            else:
+                all_dtbs.append(mapped_name)
+
         return all_dtbs, dtb_aliases
 
     @staticmethod
@@ -508,10 +524,10 @@ class FitImageTestCase(OESelftestTestCase):
         extra_configs = []
         for conf in configs:
             dtb = dtbs[conf]
-            if dtb in dtb_aliases:
-                dtb = dtb_aliases[dtb]
-            elif dtb:
+            if dtb:
                 dtb = FitImageTestCase._apply_dtbvendored(bb_vars, dtb)
+                dtb = dtb_aliases.get(dtb, dtb)
+
             extra_configs.append((conf, kernels[conf] or "kernel-1", dtb))
         return extra_configs
 
@@ -1379,6 +1395,58 @@ PREFERRED_PROVIDER_virtual/dtb = "test-dtbs-as-ext"
         self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
+    def test_fit_image_ext_dtb_vendored_override(self):
+        """Check that an external DTB overrides a vendored kernel DTB."""
+        machine = self._get_machine_or_skip()
+
+        if machine != "qemuarm64":
+            self.skipTest("This test requires the qemuarm64 foundation-v8.dtb")
+
+        config = """
+KERNEL_DTBVENDORED = "1"
+PREFERRED_PROVIDER_virtual/dtb = "test-dtbs-as-ext"
+TEST_EXTRA_DTB = "foundation-v8.dtb"
+FIT_CONF_DEFAULT_DTB = "arm/foundation-v8.dtb"
+FIT_CONFIGS = "external-override"
+FIT_CONFIG_DTB[external-override] = "arm/foundation-v8.dtb"
+"""
+        config = self._config_add_machine_settings(config, machine, keys=["KERNEL_DEVICETREE"])
+        config = self._config_add_kernel_classes(config)
+        config = self._config_add_uboot_env(config)
+
+        self.write_config(config)
+
+        bb_vars = self._fit_get_bb_vars()
+        self._gen_atf_tee_dummy_images(bb_vars)
+
+        its_path, fit_path = self._bitbake_fit_image(bb_vars)
+
+        self.assertExists(its_path)
+        self.assertExists(fit_path)
+
+        self.logger.info("Regression test ITS: %s", its_path)
+
+        with open(its_path, encoding="utf-8") as f:
+            its = f.read()
+
+        self.assertIn("fdt-foundation-v8.dtb", its)
+        self.assertIn("conf-arm_foundation-v8.dtb", its)
+        self.assertIn("conf-external-override", its)
+        self.assertNotIn("fdt-arm_foundation-v8.dtb {", its)
+        # The vendored configuration must be the default.
+        self.assertIn('default = "conf-arm_foundation-v8.dtb";', its)
+
+        # Both the vendored and custom configurations must reference
+        # the external DTB image.
+        for conf in ("conf-arm_foundation-v8.dtb", "conf-external-override"):
+            match = re.search(r'\b' + re.escape(conf) + r'\s*\{([^{}]*)', its)
+            self.assertIsNotNone(match, "Missing configuration: %s" % conf)
+            self.assertIn('fdt = "fdt-foundation-v8.dtb";', match.group(1))
+
+        self._check_its_file(bb_vars, its_path)
+
+        uboot_tools_bindir = self._setup_native('u-boot-tools-native')
+        self._check_fitimage(bb_vars, fit_path, uboot_tools_bindir)
 
     def test_sign_fit_image_configurations(self):
         """
@@ -1616,17 +1684,17 @@ class FitImagePyTests(KernelFitImageBase):
         root.fitimage_emit_section_dtb(
             "test-overlay.dtbo", "a-dir/test-overlay.dtbo"
         )
-        
+
         with self.assertRaises(bb.BBHandledException):
             root.fitimage_emit_section_config_custom(
                 "invalid", "kernel-1", "test-overlay.dtbo"
             )
-        
+
         # A regular DTB may explicitly select a kernel.
         root.fitimage_emit_section_dtb(
             "test-board.dtb", "a-dir/test-board.dtb"
         )
-        
+
         root.fitimage_emit_section_config_custom(
             "regular", "kernel-1", "test-board.dtb"
         )
@@ -1639,7 +1707,7 @@ class FitImagePyTests(KernelFitImageBase):
     def _test_fitimage_py(self, bb_vars_overrides=None):
         topdir = os.path.join(os.environ['BUILDDIR'])
         fitimage_its_path = os.path.join(topdir, self._testMethodName + '.its')
-        
+
         # Provide variables without calling bitbake
         bb_vars = {
             # image-fitimage.conf
@@ -1764,6 +1832,23 @@ class FitImagePyTests(KernelFitImageBase):
         self.logger.debug("Checking its: %s" % fitimage_its_path)
         self._check_its_file(bb_vars, fitimage_its_path)
 
+    def test_fitimage_py_vendored_external_dtb_symlink_override(self):
+        bb_vars = {
+            "KERNEL_DEVICETREE": "arm/test-ext-alias.dtb",
+            "KERNEL_DTBVENDORED": "1",
+            "PREFERRED_PROVIDER_virtual/dtb": "test-dtbs-as-ext",
+            "_python_only_test": True,
+        }
+
+        dtbs, aliases = FitImageTestCase._get_dtb_files(bb_vars)
+
+        self.assertIn("test-ext.dtb", dtbs)
+        self.assertNotIn("arm_test-ext-alias.dtb", dtbs)
+        self.assertEqual(aliases["arm_test-ext-alias.dtb"],"test-ext.dtb")
+
+        # Verify that the original external symlink alias is preserved
+        self.assertEqual(aliases["test-ext-alias.dtb"], "test-ext.dtb")
+
     def test_fitimage_py_default(self):
         self._test_fitimage_py()
 
-- 
2.55.0

