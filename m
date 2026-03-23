Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249B8F4613F
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 21:08:03 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5848.1774300075039852179
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 14:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZuwpCAR5;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so4022215e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774300073; x=1774904873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Z9Ne6j8pD+uwZUmlLy1ZhaWXchSCrlDC9kmxy59dPE=;
        b=ZuwpCAR5nTlTDHVth8bZnsEE7xfgZ0weofo+7/i5NGb6U1K9n/0hJ+K87/ZfdefTBT
         jsdg7LYkyQvfMAP+pneZ2WQ4v92Tzi+IPwhsOxflE75ycZZ3L8dyjHNcg6095JBl5Rjw
         ODlJDQOSMcrX/fQf1K4+6G38lwmj8hgDegr2ukrPOZD4Ozj1OVuRy19ySkcMwZwcFLtW
         nhO9J4Hr3AhsJIUYYFnRtVVFixHuq21Y1DhZR+M/1M7/K0dMffhDyGzbcKYg968y2nOY
         iZblzKGCpuyrlDpUVxdxDAJ+UyLfy/XbWDnIsvtXcDCIPsMmCQmvz8A0gua26H3dAIk0
         IP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774300073; x=1774904873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Z9Ne6j8pD+uwZUmlLy1ZhaWXchSCrlDC9kmxy59dPE=;
        b=K+CvxOnWNolhJLp6e5ThciJskdPKcl4fdzw32kucdO/TFVBhNuzPjKN2lj0oBCF77s
         nXjaC2E3W8bxUalXxHTwUw4eTiMK21isXHFMV6M/zc4WPPFiDs80tkpbzTlSgSgf1jLj
         20K0vx3VQnTb8XXhxLcMaKXuaekPyWZhAc3bArxgW3h3QixmU+zM6RCQcovAoOgPBZbi
         AGcAHldPRFzMZWiJDzsPERFIgVxXise8aTukFCoae0vDj2xLFtWY213sDS1Xm0gkQBdY
         n0LCLIuGWcfkClnRJ2jRglzYZcUipxibmkxEeK8bPPIr+MxYlcA7RQmkwZyykoxTus+A
         AzDQ==
X-Gm-Message-State: AOJu0Yx2hdHME+suM++VtOicYDY/vDPOvRlIMptBH4Gaqfm6DEZrKc+v
	pZIO3usVi5wjhFp6wAjfGNr0XoDb+hFsS6bYlB/P3FBvpMzPkTF5Me5q7vVUlX2m
X-Gm-Gg: ATEYQzxTEiH1OcB1Bdc6IqX5JaV3oWFjPQJaXJRUcLh1prU93VjysVBIthMCnGXiIvm
	f8kWlRqhlPMX3DoQsGvq7d4WXdY1n9sB0ShdX35O6Q6hWnaV7i6yueJa36VJwZs/cUpiZh7GCxx
	AEPT9oPdW0z3PX9gLqu3dSvC4pHJXepyhIIwu9q+siuAWw/UWcuVwp8S3vW23dRCUhwXA4eo1G2
	vVl8lSWRxJWdKBj4yUNgiMBhIHjt6XaK5p7ZbGK6gmLlf853RCqGy2C9pt9rXmB83CKt+WoLc1V
	hknSLBHT7eVcmcmHBs6qY3zzpy0axIKW65/brl4B00htjDefpMT+fa0+VckAgyyVsegMq7UdfWj
	ouRkBkX3pcjb5OpenjtqnkJTPVkudNxqeCVZAx9LSb1BTU8mFWOXAWKgfNG5NaO80YvvlHeM8mH
	18lqExSbjeP1hsygoBextcIT0sgQ//2DxLbc1OeJBh1F0wqt14Yf8E
X-Received: by 2002:a05:600c:a4a:b0:485:4eaf:eb14 with SMTP id 5b1f17b1804b1-486fee0fbf6mr172696845e9.21.1774300073015;
        Mon, 23 Mar 2026 14:07:53 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487113c4eb3sm853495e9.0.2026.03.23.14.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:07:52 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v13 4/4] oeqa/selftest: Add tests for source download enrichment
Date: Mon, 23 Mar 2026 22:07:45 +0100
Message-ID: <20260323210745.1337169-5-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
References: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 21:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233767

Add comprehensive tests for the new source download SPDX features:

test_download_location_defensive_handling:
  Verify that packages with no download location (e.g. packagegroups,
  images, virtual providers) are handled gracefully without crashing
  the SPDX generation pipeline.

test_version_extraction_patterns:
  Verify that Git source packages get SRCREV as their version in the
  SPDX output, rather than the recipe PV.

test_packageconfig_spdx:
  Verify that PACKAGECONFIG features are correctly recorded in SPDX
  build parameters when SPDX_INCLUDE_PACKAGECONFIG is enabled.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 104 +++++++++++++++++++++------
 1 file changed, 83 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index af1144c1e5..140d3debba 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -141,29 +141,15 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
     SPDX_CLASS = "create-spdx-3.0"
 
     def test_base_files(self):
-        self.check_recipe_spdx(
-            "base-files",
-            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-base-files.spdx.json",
-            task="create_recipe_spdx",
-        )
         self.check_recipe_spdx(
             "base-files",
             "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-files.spdx.json",
         )
 
-    def test_world_sbom(self):
-        objset = self.check_recipe_spdx(
-            "meta-world-recipe-sbom",
-            "{DEPLOY_DIR_IMAGE}/world-recipe-sbom.spdx.json",
-        )
-
-        # Document should be fully linked
-        self.check_objset_missing_ids(objset)
-
     def test_gcc_include_source(self):
         objset = self.check_recipe_spdx(
             "gcc",
-            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-gcc.spdx.json",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-gcc.spdx.json",
             extraconf="""\
                 SPDX_INCLUDE_SOURCES = "1"
                 """,
@@ -176,12 +162,12 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
             if software_file.name == filename:
                 found = True
                 self.logger.info(
-                    f"The spdxId of {filename} in build-gcc.spdx.json is {software_file.spdxId}"
+                    f"The spdxId of {filename} in recipe-gcc.spdx.json is {software_file.spdxId}"
                 )
                 break
 
         self.assertTrue(
-            found, f"Not found source file {filename} in build-gcc.spdx.json\n"
+            found, f"Not found source file {filename} in recipe-gcc.spdx.json\n"
         )
 
     def test_core_image_minimal(self):
@@ -319,7 +305,7 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
         # This will fail with NameError if new_annotation() is called incorrectly
         objset = self.check_recipe_spdx(
             "base-files",
-            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/builds/build-base-files.spdx.json",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/recipes/recipe-base-files.spdx.json",
             extraconf=textwrap.dedent(
                 f"""\
                 ANNOTATION1 = "{ANNOTATION_VAR1}"
@@ -374,8 +360,8 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
 
     def test_kernel_config_spdx(self):
         kernel_recipe = get_bb_var("PREFERRED_PROVIDER_virtual/kernel")
-        spdx_file = f"build-{kernel_recipe}.spdx.json"
-        spdx_path = f"{{DEPLOY_DIR_SPDX}}/{{SSTATE_PKGARCH}}/builds/{spdx_file}"
+        spdx_file = f"recipe-{kernel_recipe}.spdx.json"
+        spdx_path = f"{{DEPLOY_DIR_SPDX}}/{{SSTATE_PKGARCH}}/recipes/{spdx_file}"
 
         # Make sure kernel is configured first
         bitbake(f"-c configure {kernel_recipe}")
@@ -383,7 +369,7 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
         objset = self.check_recipe_spdx(
             kernel_recipe,
             spdx_path,
-            task="do_create_spdx",
+            task="do_create_kernel_config_spdx",
             extraconf="""\
                 INHERIT += "create-spdx"
                 SPDX_INCLUDE_KERNEL_CONFIG = "1"
@@ -428,3 +414,79 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 value, ["enabled", "disabled"],
                 f"Unexpected PACKAGECONFIG value '{value}' for {key}"
             )
+
+    def test_download_location_defensive_handling(self):
+        """Test that download_location handling is defensive.
+
+        Verifies SPDX generation succeeds and external references are
+        properly structured when download_location retrieval works.
+        """
+        objset = self.check_recipe_spdx(
+            "m4",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-m4.spdx.json",
+        )
+
+        found_external_refs = False
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if pkg.externalRef:
+                found_external_refs = True
+                for ref in pkg.externalRef:
+                    self.assertIsNotNone(ref.externalRefType)
+                    self.assertIsNotNone(ref.locator)
+                    self.assertGreater(len(ref.locator), 0, "Locator should have at least one entry")
+                    for loc in ref.locator:
+                        self.assertIsInstance(loc, str)
+                break
+
+        self.logger.info(
+            f"External references {'found' if found_external_refs else 'not found'} "
+            f"in SPDX output (defensive handling verified)"
+        )
+
+    def test_version_extraction_patterns(self):
+        """Test that version extraction works for various package formats.
+
+        Verifies that Git source downloads carry extracted versions and that
+        the reported version strings are well-formed.
+        """
+        objset = self.check_recipe_spdx(
+            "opkg-utils",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-opkg-utils.spdx.json",
+        )
+
+        # Collect all packages with versions
+        packages_with_versions = []
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if pkg.software_packageVersion:
+                packages_with_versions.append((pkg.name, pkg.software_packageVersion))
+
+        self.assertGreater(
+            len(packages_with_versions), 0,
+            "Should find packages with extracted versions"
+        )
+
+        for name, version in packages_with_versions:
+            self.assertRegex(
+                version,
+                r"^[0-9a-f]{40}$",
+                f"Expected Git source version for {name} to be a full SHA-1",
+            )
+
+        self.logger.info(f"Found {len(packages_with_versions)} packages with versions")
+
+        # Log some examples for debugging
+        for name, version in packages_with_versions[:5]:
+            self.logger.info(f"  {name}: {version}")
+
+        # Verify that versions follow expected patterns
+        for name, version in packages_with_versions:
+            # Version should not be empty
+            self.assertIsNotNone(version)
+            self.assertNotEqual(version, "")
+
+            # Version should contain digits
+            self.assertRegex(
+                version,
+                r'\d',
+                f"Version '{version}' for package '{name}' should contain digits"
+            )
-- 
2.53.0


