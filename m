Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.163.1793464009771014134
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2026 09:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hCDqFT+C;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: vgharaee@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso20058425e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 09:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793464008; x=1794068808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/BZSbL+uFoeAbLtqjpjE7qgWLM5Nq0cOjYdApkjywTc=;
        b=hCDqFT+CtpikrMiT+dUKTvswnm95rgLmw2Ry5Iu0yeU5wdiOAba/soq79zwK9d4McP
         nmF+opUu2iV9J6MP7a411geR8avPx/8ApKgKuYpF07ne6OmZyjQsLEGSJKLadS0SYF4d
         vAPjw0WBxJlBtuExW3/6JYvmDSIAMQu/M89bsHm6XLJ/bRNSQGwJ+D0BnnwNZT4ubI/6
         iInoQE4x6jyn2cJoUwbh2Y0BoPBDJv6ZjvWFeZ0XsBrqlOwW9Qiy43iEfqwFFUMj4ICT
         0XCrObLbY/2zN7aNEYYEIrdLrR6pXOrjzwx47IMPCnvS2lrNCjJYsJY2NKo8EC1Vzay9
         nnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464008; x=1794068808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/BZSbL+uFoeAbLtqjpjE7qgWLM5Nq0cOjYdApkjywTc=;
        b=enUGp3Ci4inj5dNDDFO6gZqhgQK+fXaW4AlmG3bV+o0rlp8P7hX+fZW6yCX67xh53+
         mgFMwjRX86zcn6cL0rNE6vUuKqmwW3OqiMcCXxSwrhWL2rPJaU/7TxQCuM4uegHVp7P+
         X24Cxj3XVFvM2lkZONEvb6YTCwNlxAXH7asMrv3PbFaWZlujiOuUyCOa7MQndOBqB6YP
         RUnfSmdQl3U8rU4hbVusoHKs0O8C01IdZzRQljTyfIwT1POjjN3I21wMINieP1eiMVza
         u7O/ktUc3s6SJ/6ta402uko60BCoYcQlFAei/wz9x8qftlc4bRgy202UuaPf/V0/hped
         cgsQ==
X-Gm-Message-State: AFq9FYLwqsarLLye/Hqv2isEfLOGJQomxU9152A+Vr8JCR0g+qVY4/LG
	oQ0sVLa3ed2FVrUI+o8WhuVVU2gRQiPo6Z9Zs7Xfp/Dcr8QnhxJzQXL/DATcIw==
X-Gm-Gg: AYBFou2opKiYYw/fHUAL6i0VsGZBMlQmbo2E0DG/G7xtdDnZJz+TMKZmLUmcEVUU3nb
	vC1XMFfKAm8kgEbWxL1329RsiwvboziFqe7yixn7ST339w0khDr8YFxiLoLxS3Z85Cg3GzQvYn+
	XbNT3ZnkxeP+/MY42mkpXAyskAyJEk7cT0+Q8bZ15JQKd1kaScM/UXcAUYqu1JQc7uoUXUY+NOY
	Ld6x161RCP9i5bCbS/SO/tcbJzFsipGA2yiPT+7191yp1iWsKmTm6hSfa4zHkaYU4QB10QrrH7K
	AWuz9vCMK1zTlTOd5ecgwGITzfWowBo8PrW5tWM8rZEOwFHHFrxKbkubP9DB8w+iW1Sb8f9BKPU
	yp7B8xTeHh/v+vBofZBM4gdfWFHEZDE3Cbt9XMhTmUL7XHvQNIMBOmAdXwTiiv9szX+S3xIHQiw
	EmHF0c0nYLQFyL7G8pD+A0a0UZ0A3Qcdj8dVjyfeXwQO6wffYCy/6gV+WLhmsnc2qQU4LBqy14F
	/ePl6X0YY75QBkW7S1JqdYEQQZORnjpPGf3jVhB8zdorqEa62CN/vhiITgintoufK2LGZpGVgaP
	1etcpd2u2jW4cPAyG87MRMIXBnIXhKpIzwrQOzvsdlY9ut0gUBof0WO9z0TZtQga1yb2/xiP
X-Received: by 2002:a05:600c:354c:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4ac17d16b1fmr127267985e9.7.1793464008059;
        Sat, 31 Oct 2026 09:26:48 -0700 (PDT)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.fritz.box ([2001:16e0:257:b301:9825:3e45:cd0a:824b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2640sm214214455e9.6.2026.10.31.09.26.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:26:47 -0700 (PDT)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 5/6] oe.selftest: Improve FIT DTB alias validation
Date: Sat, 31 Oct 2026 17:26:48 +0100
Message-ID: <20261031162649.944625-6-vgharaee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031162649.944625-1-vgharaee@gmail.com>
References: <20261031162649.944625-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 18:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249163
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
index 2783e4e85c..6a0b0f82e9 100644
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
@@ -473,13 +504,12 @@ class FitImageTestCase(OESelftestTestCase):
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
@@ -976,10 +1006,10 @@ class KernelFitImageBase(FitImageTestCase):
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
@@ -1076,11 +1106,10 @@ class KernelFitImageBase(FitImageTestCase):
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
@@ -1146,7 +1175,7 @@ class KernelFitImageBase(FitImageTestCase):
         fit_hash_alg_len = FitImageTestCase.MKIMAGE_HASH_LENGTHS[fit_hash_alg]
         fit_sign_alg_len = FitImageTestCase.MKIMAGE_SIGNATURE_LENGTHS[fit_sign_alg]
         dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
-        all_dtb_names = set(dtb_files + dtb_symlinks)
+        all_dtb_names = set(dtb_files) | set(dtb_symlinks)
         # The public key is always injected into UBOOT_DTB_IMAGE (-K flag in
         # uboot-sign.bbclass concat_dtb).  For DTB-based configurations, the
         # same key is also injected into each per-configuration DTB, so either
@@ -1610,7 +1639,7 @@ class FitImagePyTests(KernelFitImageBase):
     def _test_fitimage_py(self, bb_vars_overrides=None):
         topdir = os.path.join(os.environ['BUILDDIR'])
         fitimage_its_path = os.path.join(topdir, self._testMethodName + '.its')
-
+        
         # Provide variables without calling bitbake
         bb_vars = {
             # image-fitimage.conf
@@ -1660,7 +1689,10 @@ class FitImagePyTests(KernelFitImageBase):
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
@@ -1689,15 +1721,12 @@ class FitImagePyTests(KernelFitImageBase):
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
@@ -1910,6 +1939,7 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_SIGN_IMG_KEYNAME',
             'UBOOT_SIGN_KEYDIR',
             'UBOOT_SIGN_KEYNAME',
+            'EXTERNAL_KERNEL_DEVICETREE',
         }
         bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), UBootFitImageTests.BOOTLOADER_RECIPE)
         self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
-- 
2.55.0

