Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.638.1793897308338952880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 08:48:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iR+FUP1L;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: vgharaee@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so10015015e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897306; x=1794502106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ecpd7VjXpy349c9YrAuofwBcNeqquH4xixQHGn0hwx4=;
        b=iR+FUP1Lk/b+2xHe5cT1/qAgTymNz8bJj7gbtxrpH5K40r5kD7r2gS35GwelT7/vOu
         J1Z64GvieprvxPChnz992SCJH0SDQ7El0dH5zx0kEJjW0tEKXL7xmlCVTD6H5epaUysq
         /jSWlSVxcA0zGtJt9MGzXas2IAkojinKSszVJ2jWUCxdlFgUlboqL+r6Wq3EqE++mANr
         KDzR/yJo6lZJKZiU3GCtCunUzqK3j29Qi7xwrx8B/YeMa2IXULhZ+9o3Gartl+nfbvaL
         eokZbFyl5DA2qrqgMtLxY+e68acbaFCTEK+FbteHNniLfgx3NUs0IChZZKdh3W+XEFDY
         43Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897306; x=1794502106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ecpd7VjXpy349c9YrAuofwBcNeqquH4xixQHGn0hwx4=;
        b=BfUxVtpGI9aD3rTpYax8mK4Fr2FeKEQKbd6D9VZhOWFT4CBTNcHkEOIZ0NT73a7N01
         qX/nGJrnYL7Ixy926pOXAoAEXt9uQmIQj114OoldfG/xyR7B14wHXE/V33gZ2M7n7+O7
         ftZxgI6KhRkFROcEZzXYIaAIIvFMCKKOWMqDXBajIvBIN7Ro3dOfbdTyytqFk5X0+ZJI
         T2DZZpVzsWtTpvBAzT5O8c4OYULMMpjdwsKXNGdtRrXduAXMYRZX16+MuyXds2a+9s8f
         jUQ1th6xSx2clBDCHNbImzPBH3dxvsE7g2mRO1rvvTqJk3jGCgi7kmFKu/zuhSOpsVjc
         nx+Q==
X-Gm-Message-State: APuU4Z84dZEnHPSc/J1C8K2ODuDcsghtl52seeMChXRmvUx1v2C4wG1w
	TNW8TRKWHFTm5SymwjqQARFD9N2RhBgKkONMKKMHkc+4pOR7AL8C8byHf45f+A==
X-Gm-Gg: AYBFou2zdRStRqEIPG89PgQ3VSZl1a2Uq04pA1csIblyqoegyEVcxtnPJAbQuZzQ9nk
	qh3jOifS2AQLQvU2ENAN/M4k3/6l+XmUSz9un5JJfKFiJN/CXcAtVbNBWC4BlbVaO8/UKVgl5Vy
	K+hX2UeIiGp/S4QsJUtLMbIBLZkbzgAlCsn7LvNyY29CJKcFjixmwOJOSuS8taHoI4riOUSn4G6
	UmiMkRVZd2qQ/xUxFwXhBTzXouk7IJcPTICHF3yTGOJyG0o/kziU0zqhjathc2B5XYjOxMs38Dv
	qbA4dZX7uhOIXEFeGoDpQ0oSyoIbx6Fsg9kJFX0LUlZXMth85zOeTt4wMbX+YD1OODmTgJ44WDV
	OivqKJ9WMz70CHAoKNa0pzQCYLjQtcyvK6rvMhaS33048rrEJ85opSRVhn0w5EzOgcYLYqxtOUo
	waKu+xbEgRCVP9f41Agc1/2uQBusU3L+LeOiso8YK2tPy/QYpu9uT1zqBo3qBYnD506GESHkuC1
	2vgbIslinLHWpuS7i/gTYgtGi8TSRUEqG91qH12JFRHC7zKN8zU6QZbL1U+Hevf0qt8NEB1DmLf
	ZMv+ugvt9P4WaGe8btGY2fFzdTG6LAAeGUoajyUQLNsLu5TCstOyDVze71CJaIy2TreEoy+YUfN
	ofQw8zdmk0fkdZw==
X-Received: by 2002:a05:600d:82e2:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4b55d7d7a2amr62251835e9.10.1793897306572;
        Thu, 05 Nov 2026 08:48:26 -0800 (PST)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.t-mobile.de ([88.128.94.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b63863d490sm42536975e9.2.2026.11.05.08.48.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:48:25 -0800 (PST)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 5/6] oe.selftest: Improve FIT DTB alias validation
Date: Thu,  5 Nov 2026 17:48:25 +0100
Message-ID: <20261105164826.1340446-6-vgharaee@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105164826.1340446-1-vgharaee@gmail.com>
References: <20261105164826.1340446-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 19:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249576
Content-Type: text/plain; charset="utf-8"

From: Vahid Gharaee <vgharaee@gmail.com>

Use explicit DTB alias targets instead of relying on FIT node
naming conventions.

Discover external DTBs and symlink aliases when generating
expected FIT configurations, including vendored DTB names.

Signed-off-by: Vahid Gharaee <vgharaee@gmail.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 80 ++++++++++++++++--------
 1 file changed, 55 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 1b99d6bac8..8ff75dd3da 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -432,6 +432,30 @@ class FitImageTestCase(OESelftestTestCase):
             mapped_name = dtb.replace('/', '_')
         return mapped_name
 
+    @staticmethod
+    def _get_test_dtb_files():
+        return (
+            ["test-ext.dtb", "test-overlay.dtbo"],
+            {"test-ext-alias.dtb": "test-ext.dtb"},
+        )
+
+    @staticmethod
+    def _get_external_dtb_files(devicetree_dir):
+        dtbs = []
+        aliases = {}
+
+        for name in sorted(os.listdir(devicetree_dir)):
+            if not name.endswith((".dtb", ".dtbo")):
+                continue
+
+            target = oe.fitimage.symlink_points_below(name, devicetree_dir)
+            if target:
+                aliases[name] = target
+            else:
+                dtbs.append(name)
+
+        return dtbs, aliases
+
     @staticmethod
     def _get_dtb_files(bb_vars):
         """Return a list of devicetree names
@@ -442,15 +466,22 @@ class FitImageTestCase(OESelftestTestCase):
         """
         kernel_devicetree = bb_vars.get('KERNEL_DEVICETREE')
         all_dtbs = []
-        dtb_symlinks = []
+        dtb_aliases = {}
+
         if kernel_devicetree:
             all_dtbs += [FitImageTestCase._apply_dtbvendored(bb_vars, dtb) for dtb in kernel_devicetree.split()]
-        # Support only the test recipe which provides 1 devicetree and 1 devicetree overlay
-        pref_prov_dtb = bb_vars.get('PREFERRED_PROVIDER_virtual/dtb')
-        if pref_prov_dtb == "test-dtbs-as-ext":
-            all_dtbs += ["test-ext.dtb", "test-overlay.dtbo"]
-            dtb_symlinks.append("test-ext-alias.dtb")
-        return (all_dtbs, dtb_symlinks)
+       
+        if bb_vars.get("PREFERRED_PROVIDER_virtual/dtb") == "test-dtbs-as-ext":
+            if bb_vars.get("_python_only_test"):
+                external_dtbs, external_aliases = FitImageTestCase._get_test_dtb_files()
+            else:
+                devicetree_dir = os.path.join(bb_vars["DEPLOY_DIR_IMAGE"], "devicetree")
+                external_dtbs, external_aliases = FitImageTestCase._get_external_dtb_files(devicetree_dir)
+
+            all_dtbs.extend(external_dtbs)
+            dtb_aliases.update(external_aliases)
+
+        return all_dtbs, dtb_aliases
 
     @staticmethod
     def _get_loadables(bb_vars):
@@ -482,13 +513,12 @@ class FitImageTestCase(OESelftestTestCase):
         configs = (bb_vars.get('FIT_CONFIGS') or "").split()
         kernels = FitImageTestCase._get_flag_values(bb_vars, 'FIT_CONFIG_KERNEL', configs)
         dtbs = FitImageTestCase._get_flag_values(bb_vars, 'FIT_CONFIG_DTB', configs)
-        _, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
+        _, dtb_aliases = FitImageTestCase._get_dtb_files(bb_vars)
         extra_configs = []
         for conf in configs:
             dtb = dtbs[conf]
-            if dtb in dtb_symlinks:
-                # Symlinks of test-dtbs-as-ext point to the DTB without "-alias"
-                dtb = dtb.replace("-alias", "")
+            if dtb in dtb_aliases:
+                dtb = dtb_aliases[dtb]
             elif dtb:
                 dtb = FitImageTestCase._apply_dtbvendored(bb_vars, dtb)
             extra_configs.append((conf, kernels[conf] or "kernel-1", dtb))
@@ -985,10 +1015,10 @@ class KernelFitImageBase(FitImageTestCase):
                 if not dtb.endswith('.dtbo'):
                     its_field_check.append('kernel = "kernel-1";')
                 its_field_check.append('fdt = "fdt-%s";' % dtb)
-            for dtb in dtb_symlinks:
+
+            for dtb, target in dtb_symlinks.items():
                 its_field_check.append('kernel = "kernel-1";')
-                # Works only for tests were the symlink is with -alias suffix
-                its_field_check.append('fdt = "fdt-%s";' % dtb.replace('-alias', ''))
+                its_field_check.append('fdt = "fdt-%s";' % target)
 
             if initramfs_image and initramfs_image_bundle != "1":
                 its_field_check.append('ramdisk = "ramdisk-1";')
@@ -1085,11 +1115,10 @@ class KernelFitImageBase(FitImageTestCase):
                 req_sections[loadable]['Entry Point'] = entrypoint
         # Create a configuration section for each DTB
         if dtb_files:
-            for dtb in dtb_files + dtb_symlinks:
+            for dtb in dtb_files + list(dtb_symlinks):
                 conf_name = bb_vars['FIT_CONF_PREFIX'] + dtb
-                # Assume that DTBs with an "-alias" in its name are symlink DTBs created e.g. by the
-                # test-dtbs-as-ext test recipe. Make the configuration node pointing to the real DTB.
-                real_dtb = dtb.replace("-alias", "")
+                # Resolve DTB aliases using their explicit target mapping.
+                real_dtb = dtb_symlinks.get(dtb, dtb)
                 # dtb overlays do not refer to a kernel (yet?)
                 if dtb.endswith('.dtbo'):
                     req_sections[conf_name] = {
@@ -1155,7 +1184,7 @@ class KernelFitImageBase(FitImageTestCase):
         fit_hash_alg_len = FitImageTestCase.MKIMAGE_HASH_LENGTHS[fit_hash_alg]
         fit_sign_alg_len = FitImageTestCase.MKIMAGE_SIGNATURE_LENGTHS[fit_sign_alg]
         dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
-        all_dtb_names = set(dtb_files + dtb_symlinks)
+        all_dtb_names = set(dtb_files) | set(dtb_symlinks)
         # The public key is always injected into UBOOT_DTB_IMAGE (-K flag in
         # uboot-sign.bbclass concat_dtb).  For DTB-based configurations, the
         # same key is also injected into each per-configuration DTB, so either
@@ -1621,7 +1650,7 @@ class FitImagePyTests(KernelFitImageBase):
     def _test_fitimage_py(self, bb_vars_overrides=None):
         topdir = os.path.join(os.environ['BUILDDIR'])
         fitimage_its_path = os.path.join(topdir, self._testMethodName + '.its')
-
+        
         # Provide variables without calling bitbake
         bb_vars = {
             # image-fitimage.conf
@@ -1671,7 +1700,10 @@ class FitImagePyTests(KernelFitImageBase):
             # x86 kernels produce a setup.bin section; set to the file name to
             # enable it, or to "" / omit the key to suppress it.
             'KERNEL_SETUP_BIN': 'setup1.bin',
+            # ... existing entries ...
+            '_python_only_test': True,
         }
+
         if bb_vars_overrides:
             bb_vars.update(bb_vars_overrides)
             if logging.DEBUG >= self.logger.level:
@@ -1700,15 +1732,12 @@ class FitImagePyTests(KernelFitImageBase):
                 bb_vars.get('UBOOT_LOADADDRESS'), bb_vars.get('UBOOT_ENTRYPOINT'),
                 bb_vars.get('UBOOT_MKIMAGE_KERNEL_TYPE'))
 
-        dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
+        dtb_files, dtb_aliases = FitImageTestCase._get_dtb_files(bb_vars)
         for dtb in dtb_files:
             root_node.fitimage_emit_section_dtb(dtb, os.path.join("a-dir", dtb),
                 bb_vars.get("UBOOT_DTB_LOADADDRESS"), bb_vars.get("UBOOT_DTBO_LOADADDRESS"))
 
-        for dtb_symlink in dtb_symlinks:
-            # For test purposes, assume each symlink points to a DTB with the same basename minus "-alias"
-            # In this case, "test-ext-alias.dtb" -> "test-ext.dtb"
-            dtb_target = dtb_symlink.replace("-alias", "")
+        for dtb_symlink, dtb_target in dtb_aliases.items():
             root_node.fitimage_emit_section_dtb_alias(dtb_symlink, os.path.join("a-dir", dtb_target))
 
         if bb_vars.get('FIT_UBOOT_ENV'):
@@ -1921,6 +1950,7 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_SIGN_IMG_KEYNAME',
             'UBOOT_SIGN_KEYDIR',
             'UBOOT_SIGN_KEYNAME',
+            'EXTERNAL_KERNEL_DEVICETREE',
         }
         bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), UBootFitImageTests.BOOTLOADER_RECIPE)
         self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
-- 
2.56.0

