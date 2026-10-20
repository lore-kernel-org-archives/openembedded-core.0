Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6672.1792500759180210707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FP+XjzNt;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: vgharaee@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2052013f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 05:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500757; x=1793105557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ur4FDr53MhQSk/biYrkocJe0cgRJrjFAQC3VssK4WVA=;
        b=FP+XjzNturhkL7PHolFSBE6N+Q/UZOWS7cNM9mv6okaH/ggJmFnKSJGtymIJj3D5P1
         T46xJGj9xlsRYzPlhTQNB9N3k98S+G+FkYsvLkkdMOmtOtKpC1grjIz4Nnoh0GWXSeVl
         D1E0lK3aOZytq1TVqBH7Bb9hZ+A1m2yu9XhrHE0Is3jSFtsPd4wrZaEdGTs2Nooqjchh
         fvxrunbFCoxq1iXdSlUPhyvJHK2uXWZyYJ4PACX5bjuZinynmjdehXEOnc9Il3RdwLL1
         6N/Tr6WtGG1uCJEAUa67KiXyXTd30PTx9SHPIcHkkngAqvBs8xlh+S2e3dVjwgM/WELm
         45Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500757; x=1793105557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ur4FDr53MhQSk/biYrkocJe0cgRJrjFAQC3VssK4WVA=;
        b=Zh0cfyx6750JN0+z7mbg8xQnK1s0ZWf5hgu+SvwZbwW2gteTo9KqMn8ALivwTS/JZd
         fV/U8wvMt/lLBiyWGPDJE0YrX0XbiO4a93nRGTj+IZliLMIyNtYKBM51vw4p+D4Fg7ok
         cLJmiTcKg0Gu+LZ4WH2Z4C+BI0zXKNRleqVJ7VGAzRQYyaklz4gXo26/GI9MJAgeW2St
         Cf7mhKxDxzBJB5ytjknqrxNqtL450uOxJxUnGDTlDA2v7neOISyY99Egs5DoFfWwieyb
         vSYQ6L0lsjDf/Xxo5Y3XB6prVkVh1YiwDIyAV/7iAzJc6XxR8TXAJ5vBYPAa69awSZyH
         NCMA==
X-Gm-Message-State: AFq9FYJxRxu6+xsIIt4GHoPXllrD0fz7dVAJ0OlV2lYWj3lV/Y6Hkbaq
	f4ATm5IuT6thn20g+/p64boHd9L41zIywN4mmQKrNLrwjDDgaRHIjpvbnKSK7Q==
X-Gm-Gg: AYBFou3fNQtJMUdxDhGMktajVv8lftpVoBDibkZM9szclQ8XMa7HOvVOI0FJGNtA9PY
	oM7Lx4oJSM5z25/fAdFwA0KcP4wcKUrRa2sOaBNRPje2gSUjZ5Z8IsCBvnIFPTo18ZX06Qdzk7S
	mgLOfO0276yb+lUah6Af3i+Zr6lcmElSoY6bQl30exy6xNX/dapxELtMNVChT+c1Di7tJz5lYXE
	wksjh45hpwZg+WSa7Tk1YTIsfmnJR2zE3n1F+l9E1EdYBSajUyt4TSnQ+diC6+j5X6F3H9gVrT3
	o45cUDTM4Hu/umfQMkXvD0/SKeJXwQ54Po9nqbpiVPOIZWJlmkVKJ5DU4TUC4rTTlv3biQYQWDw
	dMk6/wWX+g9YzOCvJkA3rrq//m9FTF9ad6A+/PmE/CJA3OKHvLgXJ39P8HmSkbx2VPBRnqYfmvv
	kbu6Nt/KJQUSRQw55B/pEthjmGIRXCbXorl5+4/mGTFMzRuj7U14RSa3EuudV++DqVsTO+io4JF
	gC2/RDRIbaOVs3J9oazkXB9tmXdFObqMT728LM=
X-Received: by 2002:a05:6000:4287:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-48e07fa891fmr19344084f8f.43.1792500757080;
        Tue, 20 Oct 2026 05:52:37 -0700 (PDT)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.t-mobile.de ([88.128.94.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fdbbsm6335698f8f.17.2026.10.20.05.52.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:52:36 -0700 (PDT)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] oe.selftest: adding tests for multi kernel/config fitimage. AI-Generated: Uses GitHub copilot (Claude Opus 5.5)
Date: Tue, 20 Oct 2026 14:52:32 +0200
Message-ID: <20261020125233.69997-4-vgharaee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020125233.69997-1-vgharaee@gmail.com>
References: <20261020125233.69997-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 13:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248282
Content-Type: text/plain; charset="utf-8"

From: Vahid Gharaee <vgharaee@gmail.com>

Signed-off-by: Vahid Gharaee <vgharaee@gmail.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 156 ++++++++++++++++++++++-
 1 file changed, 155 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 5d77e6da09..cd099a7ce4 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -461,6 +461,30 @@ class FitImageTestCase(OESelftestTestCase):
             loadables += var_loadables.split()
         return loadables
 
+    @staticmethod
+    def _get_flag_values(bb_vars, var, items):
+        """Map items to the per-item values of a synthetic "a ? b" flag variable"""
+        values = (bb_vars.get(var) or "").split("?")
+        return {item: values[index].strip() if index < len(values) else "" for index, item in enumerate(items)}
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
@@ -670,11 +694,16 @@ class KernelFitImageBase(FitImageTestCase):
         internal_used = {
             'DEPLOY_DIR_IMAGE',
             'FIT_CONF_DEFAULT_DTB',
+            'FIT_CONF_DEFAULT',
             'FIT_CONF_MAPPINGS',
             'FIT_CONF_PREFIX',
+            'FIT_CONFIGS',
+            'FIT_CONFIG_DTB',
+            'FIT_CONFIG_KERNEL',
             'FIT_DESC',
             'FIT_HASH_ALG',
             'FIT_KERNEL_COMP_ALG',
+            'FIT_KERNELS',
             'FIT_LOADABLES',
             'FIT_LOADABLE_ENTRYPOINT',
             'FIT_LOADABLE_LOADADDRESS',
@@ -835,6 +864,8 @@ class KernelFitImageBase(FitImageTestCase):
         if loadables:
             images += loadables
 
+        images += (bb_vars.get('FIT_KERNELS') or "").split()
+
         # configuration nodes (one per DTB, symlink, and mappings)
         configurations = []
         if dtb_files:
@@ -884,6 +915,8 @@ class KernelFitImageBase(FitImageTestCase):
         else:
             configurations = [bb_vars['FIT_CONF_PREFIX'] + '1']
 
+        configurations += [bb_vars['FIT_CONF_PREFIX'] + conf for conf, _, _ in FitImageTestCase._get_extra_configs(bb_vars)]
+
         # Create a list of paths for all image and configuration nodes
         req_its_paths = []
         for image in images:
@@ -926,8 +959,12 @@ class KernelFitImageBase(FitImageTestCase):
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
 
@@ -951,6 +988,12 @@ class KernelFitImageBase(FitImageTestCase):
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
@@ -1062,6 +1105,15 @@ class KernelFitImageBase(FitImageTestCase):
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
@@ -1208,6 +1260,32 @@ FIT_LOADABLE_TYPE[loadable2] = "firmware"
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
+        bb_vars = self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
+
     def test_get_compatible_from_dtb(self):
         """Test the oe.fitimage.get_compatible_from_dtb function
 
@@ -1501,11 +1579,14 @@ class FitImagePyTests(KernelFitImageBase):
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
@@ -1566,6 +1647,11 @@ class FitImagePyTests(KernelFitImageBase):
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
@@ -1596,9 +1682,19 @@ class FitImagePyTests(KernelFitImageBase):
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
 
@@ -1665,6 +1761,64 @@ class FitImagePyTests(KernelFitImageBase):
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
2.55.0

