Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.633.1793897304700127406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 08:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mjMa99Mf;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: vgharaee@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so16405085e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897303; x=1794502103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yqArQJrXu/3ruyqwO7InglEIi9Wi9COdxz3EdAaSSSk=;
        b=mjMa99MfTNxHRRAbUp/7kG/XNZQwuSBrNpOWfH0xNEJN6XtaEkjE5ekG+vLyw2hJBQ
         fxALg8BQL6MJYdeJsPvUbWFZUPmDphUj1Y275B7WgBLfl/u4dZCL9Hhn3sRFor6DfgmX
         dHQFkoN2HEPgIfcKZmxhOxBxQoEr50H+WFVXJbEFxgRrIVXMmbd6i/mjIfkYS/8r7J9N
         RnJA7LprZAeHWmx3sZT75OfGzxboOoYpNVJfSChojcpnKGUQ2JbEjf/GnNCFGZ2OdDsO
         uuA0PDcGegYW2l5zFqW4A9F2lvvzMcg/DIjQIoT8xcgGwraaS35ZLlMMD0KbT/geSGhC
         UxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897303; x=1794502103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yqArQJrXu/3ruyqwO7InglEIi9Wi9COdxz3EdAaSSSk=;
        b=xl65jXeleSiIp8RCxYVSwNmej4YylMO9KoKba3xuNKsdjbtbc+sypn5fRZ9yqCR2Wk
         ETA68l38007HG1zDv1+5wMukrFKg825I4rRWEGJx88L1KwevtcshObX3bjZwBs2mDu4f
         tcB1KgoAIHVI9CWySvhluxy5kq6TraZhtxz5RgAZsi4rYWDzye4133fr8prbOxqgPM+j
         57L720S8VndQcRyWLFcDhLKnkyobmrtDXNWcXyJO0N402dLkrd0b0jzhqiUapyBZ57e5
         FMuINHTpcDgKL+DlmxRhxD4NBgOoIAvZYLKQnjv/vqfUj9U9VOc/W07zVMB0sYHNEzUf
         7utg==
X-Gm-Message-State: APuU4Z8htD3Pvs4/Nx+ByJN+AEkdH+uIrbD4l+hc+8Ujgcfj2Qub7Uu8
	gBddyEJTZo74Hl2MjIdDWDA1qoaWxh2ECaEY3GVQylF0n7X68Faog3QJlTotlg==
X-Gm-Gg: AYBFou3tkpucQ3ulViXDQzLIZ9f1Db4viVJueq7SaEvGMfi1RYjMzUebbeWlgiTXWcN
	5TenbdVxNxYXcrfaJ4j/HR01pF9kEcfGBnO3Kqv78zyPcrN1ii8sm4MWwAB39BVOsVYeMjH0Ss3
	CjeyIh4tH/xxLg9sN1p230v5mwAAaZSjcGpNzsZmRkW+VQrn+hqAJNxuDnf32BouR0hgQt8FvXk
	38rMgJTRdyiL6CefJsaInCOvpgWpdcYkWrJFj69cswaEZLdSGBqfEW8tqJymz7QNu+VWD8Ul1Ev
	Z2Z6uokSOUFXT1kybjQdAmDV9Zc8T/QB9a5WMO6kNMdFd42D0bDwHM55q6OTreH3ZI/0ZB4nlMB
	qMCOWfPIR1xMOSBTBpSsJyoRZYCpMWIq2sQG72yD6oN8N8uSxIt4cMs3Vyi1x9YFpySdKxbU6Lg
	P6gBJm8zWBDCZE8u3V7XCLwXcaEE96BCio5UQRUFRc9OwXPEXlxOjMnCtNp0LFOj0G4s7ASZkcH
	U0rIOk4FkVJXltaoqDSF8Y89I9TQB6TcUapT1XyQJXQNz5urkUs24o9lln5v1Ky4ndxSm/HpQGp
	uFDzzfzTsxsb+37lXbBblpj8M37BHJLYQvHtzG9qdT5jNfeo3lUdB/zD9emRr8To94V1
X-Received: by 2002:a05:600c:1c0f:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4ac19233381mr435384635e9.26.1793897302723;
        Thu, 05 Nov 2026 08:48:22 -0800 (PST)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.t-mobile.de ([88.128.94.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b63863d490sm42536975e9.2.2026.11.05.08.48.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:48:22 -0800 (PST)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 3/6] oe.selftest: Add tests for multi-kernel FIT config
Date: Thu,  5 Nov 2026 17:48:23 +0100
Message-ID: <20261105164826.1340446-4-vgharaee@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105164826.1340446-1-vgharaee@gmail.com>
References: <20261105164826.1340446-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 19:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249574
Content-Type: text/plain; charset="utf-8"

From: Vahid Gharaee <vgharaee@gmail.com>

Add selftests for FIT images containing multiple kernel nodes
and configurations.

AI-Generated: Uses GitHub copilot (Claude Opus 5.5)

Signed-off-by: Vahid Gharaee <vgharaee@gmail.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 163 ++++++++++++++++++++++-
 1 file changed, 162 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 1fad53b16c..40431184de 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -461,6 +461,39 @@ class FitImageTestCase(OESelftestTestCase):
             loadables += var_loadables.split()
         return loadables
 
+    @staticmethod
+    def _get_flag_values(bb_vars, var, items):
+        """Return per-item values from BitBake flags or synthetic test values."""
+        values = bb_vars.get(var) or {}
+
+        if isinstance(values, dict):
+            return {item: values.get(item) or "" for item in items}
+
+        # Support synthetic values used by the Python-only test fixtures.
+        values = values.split("?")
+        return {
+            item: values[index].strip() if index < len(values) else ""
+            for index, item in enumerate(items)
+        }
+
+    @staticmethod
+    def _get_extra_configs(bb_vars):
+        """Return a list of (conf, kernel, dtb image) tuples for FIT_CONFIGS"""
+        configs = (bb_vars.get('FIT_CONFIGS') or "").split()
+        kernels = FitImageTestCase._get_flag_values(bb_vars, 'FIT_CONFIG_KERNEL', configs)
+        dtbs = FitImageTestCase._get_flag_values(bb_vars, 'FIT_CONFIG_DTB', configs)
+        _, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
+        extra_configs = []
+        for conf in configs:
+            dtb = dtbs[conf]
+            if dtb in dtb_symlinks:
+                # Symlinks of test-dtbs-as-ext point to the DTB without "-alias"
+                dtb = dtb.replace("-alias", "")
+            elif dtb:
+                dtb = FitImageTestCase._apply_dtbvendored(bb_vars, dtb)
+            extra_configs.append((conf, kernels[conf] or "kernel-1", dtb))
+        return extra_configs
+
     def _is_req_dict_in_dict(self, found_dict, req_dict):
         """
         Check if all key-value pairs in the required dictionary are present in the found dictionary.
@@ -672,11 +705,14 @@ class KernelFitImageBase(FitImageTestCase):
         internal_used = {
             'DEPLOY_DIR_IMAGE',
             'FIT_CONF_DEFAULT_DTB',
+            'FIT_CONF_DEFAULT',
             'FIT_CONF_MAPPINGS',
             'FIT_CONF_PREFIX',
+            'FIT_CONFIGS',
             'FIT_DESC',
             'FIT_HASH_ALG',
             'FIT_KERNEL_COMP_ALG',
+            'FIT_KERNELS',
             'FIT_LOADABLES',
             'FIT_OS',
             'FIT_SIGN_ALG',
@@ -837,6 +873,8 @@ class KernelFitImageBase(FitImageTestCase):
         if loadables:
             images += loadables
 
+        images += (bb_vars.get('FIT_KERNELS') or "").split()
+
         # configuration nodes (one per DTB, symlink, and mappings)
         configurations = []
         if dtb_files:
@@ -886,6 +924,8 @@ class KernelFitImageBase(FitImageTestCase):
         else:
             configurations = [bb_vars['FIT_CONF_PREFIX'] + '1']
 
+        configurations += [bb_vars['FIT_CONF_PREFIX'] + conf for conf, _, _ in FitImageTestCase._get_extra_configs(bb_vars)]
+
         # Create a list of paths for all image and configuration nodes
         req_its_paths = []
         for image in images:
@@ -928,8 +968,12 @@ class KernelFitImageBase(FitImageTestCase):
             if uboot_rd_entrypoint:
                 its_field_check.append("entry = <%s>;" % uboot_rd_entrypoint)
 
+        fit_conf_default = bb_vars.get('FIT_CONF_DEFAULT')
         fit_conf_default_dtb = bb_vars.get('FIT_CONF_DEFAULT_DTB')
-        if fit_conf_default_dtb:
+        if fit_conf_default:
+            fit_conf_prefix = bb_vars.get('FIT_CONF_PREFIX', "conf-")
+            its_field_check.append('default = "' + fit_conf_prefix + fit_conf_default + '";')
+        elif fit_conf_default_dtb:
             fit_conf_prefix = bb_vars.get('FIT_CONF_PREFIX', "conf-")
             its_field_check.append('default = "' + fit_conf_prefix + self._apply_dtbvendored(bb_vars, fit_conf_default_dtb) + '";')
 
@@ -953,6 +997,12 @@ class KernelFitImageBase(FitImageTestCase):
             if initramfs_image and initramfs_image_bundle != "1":
                 its_field_check.append('ramdisk = "ramdisk-1";')
 
+        # Additional configurations are emitted after the generated ones
+        for _, kernel, dtb in FitImageTestCase._get_extra_configs(bb_vars):
+            its_field_check.append('kernel = "%s";' % kernel)
+            if dtb:
+                its_field_check.append('fdt = "fdt-%s";' % dtb)
+
         return its_field_check
 
     def _get_req_sigvalues_config(self, bb_vars):
@@ -1064,6 +1114,15 @@ class KernelFitImageBase(FitImageTestCase):
             if loadables:
                 req_sections[conf_name]['Loadables'] = ",".join(loadables)
 
+        # Additional kernels and configurations
+        for kernel in (bb_vars.get('FIT_KERNELS') or "").split():
+            req_sections[kernel] = { "Type": "Kernel Image" }
+        for conf, kernel, dtb in FitImageTestCase._get_extra_configs(bb_vars):
+            conf_name = bb_vars['FIT_CONF_PREFIX'] + conf
+            req_sections[conf_name] = { "Kernel": kernel }
+            if dtb:
+                req_sections[conf_name]['FDT'] = 'fdt-' + dtb
+
         # Add signing related properties if needed
         if uboot_sign_enable == "1":
             for section in req_sections:
@@ -1212,6 +1271,32 @@ FIT_LOADABLE_TYPE[loadable2] = "firmware"
         self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
+    def test_fit_image_multiple_kernels(self):
+        """
+        Summary:     Check FIT_KERNELS, FIT_CONFIGS and FIT_CONF_DEFAULT
+        Expected:    An additional kernel image node and a configuration
+                     referring to it are present and the configuration is
+                     the default one.
+        Product:     oe-core
+        """
+        machine = self._get_machine_or_skip()
+        config = """
+KERNEL_IMAGETYPE = "Image"
+UBOOT_LOADADDRESS = "0x80080000"
+UBOOT_ENTRYPOINT = "0x80080000"
+# Use the linux.bin of virtual/kernel also as second kernel to avoid building another kernel
+FIT_KERNELS = "kernel-2"
+FIT_KERNEL_RECIPE[kernel-2] = "virtual/kernel"
+FIT_CONFIGS = "second"
+FIT_CONFIG_KERNEL[second] = "kernel-2"
+FIT_CONF_DEFAULT = "second"
+"""
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["KERNEL_DEVICETREE"])
+        config = self._config_add_kernel_classes(config)
+        self.write_config(config)
+        bb_vars = self._fit_get_bb_vars(flags={'FIT_CONFIG_KERNEL': ['second'], 'FIT_CONFIG_DTB': ['second'],})
+        self._test_fitimage(bb_vars)
+
     def test_get_compatible_from_dtb(self):
         """Test the oe.fitimage.get_compatible_from_dtb function
 
@@ -1505,11 +1590,14 @@ class FitImagePyTests(KernelFitImageBase):
             # image-fitimage.conf
             'FIT_ADDRESS_CELLS': "1",
             'FIT_CONF_DEFAULT_DTB': "",
+            'FIT_CONF_DEFAULT': "",
             'FIT_CONF_MAPPINGS': "",
             'FIT_CONF_PREFIX': "conf-",
+            'FIT_CONFIGS': "",
             'FIT_DESC': "Kernel fitImage for a dummy distro",
             'FIT_GENERATE_KEYS': "0",
             'FIT_HASH_ALG': "sha256",
+            'FIT_KERNELS': "",
             'FIT_KEY_GENRSA_ARGS': "-F4",
             'FIT_KEY_REQ_ARGS': "-batch -new",
             'FIT_KEY_SIGN_PKCS': "-x509",
@@ -1570,6 +1658,11 @@ class FitImagePyTests(KernelFitImageBase):
             bb_vars.get('UBOOT_MKIMAGE_KERNEL_TYPE'), bb_vars.get("UBOOT_ENTRYSYMBOL")
         )
 
+        for kernel in bb_vars['FIT_KERNELS'].split():
+            root_node.fitimage_emit_section_kernel(kernel, "linux-%s.bin" % kernel, "none",
+                bb_vars.get('UBOOT_LOADADDRESS'), bb_vars.get('UBOOT_ENTRYPOINT'),
+                bb_vars.get('UBOOT_MKIMAGE_KERNEL_TYPE'))
+
         dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
         for dtb in dtb_files:
             root_node.fitimage_emit_section_dtb(dtb, os.path.join("a-dir", dtb),
@@ -1600,9 +1693,19 @@ class FitImagePyTests(KernelFitImageBase):
                 "loadable-type")
 
         root_node.fitimage_emit_section_config(bb_vars['FIT_CONF_DEFAULT_DTB'], bb_vars.get('FIT_CONF_MAPPINGS'))
+        configs = bb_vars['FIT_CONFIGS'].split()
+        conf_kernels = FitImageTestCase._get_flag_values(bb_vars, 'FIT_CONFIG_KERNEL', configs)
+        conf_dtbs = FitImageTestCase._get_flag_values(bb_vars, 'FIT_CONFIG_DTB', configs)
+        for conf in configs:
+            root_node.fitimage_emit_section_config_custom(conf, conf_kernels[conf], conf_dtbs[conf])
+        if bb_vars['FIT_CONF_DEFAULT']:
+            root_node.fitimage_set_default_config(bb_vars['FIT_CONF_DEFAULT'])
         root_node.write_its_file(fitimage_its_path)
 
         self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
+        with open(fitimage_its_path) as its_file:
+            default_lines = [line for line in its_file if line.strip().startswith("default = ")]
+        self.assertEqual(len(default_lines), 1, "Expected exactly one default configuration: %s" % default_lines)
         self.logger.debug("Checking its: %s" % fitimage_its_path)
         self._check_its_file(bb_vars, fitimage_its_path)
 
@@ -1669,6 +1772,64 @@ class FitImagePyTests(KernelFitImageBase):
         }
         self._test_fitimage_py(bb_vars_overrides)
 
+    def test_fitimage_py_multiple_kernels(self):
+        """Test FIT_KERNELS, FIT_CONFIGS and FIT_CONF_DEFAULT"""
+        bb_vars_overrides = {
+            'KERNEL_DEVICETREE': "one.dtb two.dtb",
+            'FIT_CONF_DEFAULT_DTB': "one.dtb",
+            'FIT_KERNELS': "kernel-rt",
+            'FIT_CONFIGS': "rt rt-two default-two",
+            'FIT_CONFIG_KERNEL': "kernel-rt ? kernel-rt ? ",
+            'FIT_CONFIG_DTB': " ? two.dtb ? two.dtb",
+            'FIT_CONF_DEFAULT': "rt-two",
+        }
+        self._test_fitimage_py(bb_vars_overrides)
+
+    def test_fitimage_py_multiple_kernels_unknown_kernel_error(self):
+        """Test that FIT_CONFIG_KERNEL referring to an unknown kernel causes a fatal error"""
+        bb_vars_overrides = {
+            'FIT_CONFIGS': "rt",
+            'FIT_CONFIG_KERNEL': "kernel-rt",
+        }
+        with self.assertRaises(BBHandledException):
+            self._test_fitimage_py(bb_vars_overrides)
+
+    def test_fitimage_py_conf_default_unknown_error(self):
+        """Test that FIT_CONF_DEFAULT referring to an unknown configuration causes a fatal error"""
+        bb_vars_overrides = {
+            'FIT_CONF_DEFAULT': "nonexistent",
+        }
+        with self.assertRaises(BBHandledException):
+            self._test_fitimage_py(bb_vars_overrides)
+
+    def test_fitimage_py_multiple_kernels_dtb_alias(self):
+        """Test FIT_CONFIG_DTB referring to an external DTB symlink"""
+        bb_vars_overrides = {
+            'PREFERRED_PROVIDER_virtual/dtb': "test-dtbs-as-ext",
+            'FIT_KERNELS': "kernel-rt",
+            'FIT_CONFIGS': "rt",
+            'FIT_CONFIG_KERNEL': "kernel-rt",
+            'FIT_CONFIG_DTB': "test-ext-alias.dtb",
+        }
+        self._test_fitimage_py(bb_vars_overrides)
+
+    def test_fitimage_py_multiple_kernels_kernel_1_error(self):
+        """Test that a FIT_KERNELS entry colliding with kernel-1 causes a fatal error"""
+        bb_vars_overrides = {
+            'FIT_KERNELS': "kernel-1",
+        }
+        with self.assertRaises(BBHandledException):
+            self._test_fitimage_py(bb_vars_overrides)
+
+    def test_fitimage_py_multiple_kernels_image_collision_error(self):
+        """Test that a FIT_KERNELS entry colliding with another image node causes a fatal error"""
+        bb_vars_overrides = {
+            'FIT_KERNELS': "my-loadable",
+            'FIT_LOADABLES': "my-loadable",
+        }
+        with self.assertRaises(BBHandledException):
+            self._test_fitimage_py(bb_vars_overrides)
+
 class UBootFitImageTests(FitImageTestCase):
     """Test cases for the uboot-sign bbclass"""
 
-- 
2.56.0

