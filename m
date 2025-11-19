Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F28CF6487
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 22:23:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19589.1763590974284881389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 14:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aY5h5zkb;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4775ae77516so2918715e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 14:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763590972; x=1764195772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NAkdSStRG6JCYXFUokqmBy5Ap0iOqwIT8fNzR8slmWA=;
        b=aY5h5zkb9+Ab7zmdLgRGiIXCozrv0mK0IqGorRCU+SX3HI4ta/pHvaQPlMj/vmOp6q
         nUTmS8NL+gPMGPEFByC/zJQ8tB5WZSZ41qtJ/qSTh03TNhNHjcyitEjPTun2Pk00fpzN
         YlrVEKU4BH7Y9RawWCY7OF7EkPQZN3k7hcQ+/kwAu4UHMRlsm+dQJ1BM0VPnApPushTZ
         FMYFQSA4Im6C1d15TFMqUaNWN90y0qiGT/qYNKUBXdotSREkOTnck4r/hZRrumNRpZO4
         nneY9UKxR9oEQc01UwzaazRSabTIsX8Pof1/nI9PE6vzfneym8JzZxPwEGBF9oYbrYTo
         owyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763590972; x=1764195772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAkdSStRG6JCYXFUokqmBy5Ap0iOqwIT8fNzR8slmWA=;
        b=fjiqSRKJF8s2RSn9xl3I592fUa/3vH/q0bvLCu7C5CNYmugfBUSV/RlqzbNRA9OjKq
         KToa8i2KobLaCf0eZNylzZc0JBX9i6C8JPQGSaGWPLyRV2C1cleran5lqa23MhfkZhRA
         nmvJTb5jahlixRQOmlP5UopVYJaVBoy9xpsXO+I8H0sMY/etgBsp6wzePuuu+FRxtAii
         reps4nTX8ftRv3HEg1wNVrKNFhze0cooZ+1KqFKzmn8YhhQP6o7NE3JtcQOSMwPMreIv
         GiWOil3n4dGvflElvNGFURbEUGQVDwTqDQYMGXRqlbfs8RAi139EnZwv362WOBBWIsuP
         tFXQ==
X-Gm-Message-State: AOJu0YygTHzCu6Bc6K/59MNmD4pe6UNHwcOR1XF7rzJydpW4SfzHBvCt
	zt7dG9JzdW7OsxaGKVJr8hqkfYR/4POK7VAvxxRAFmtca1h+/0X1coijn0g36pM3
X-Gm-Gg: ASbGncvgHobZrym0gvW1Ajn+fYeWquE4LC13bdVTe5ZqucCCfspMyT84S/RjrbFSQUe
	8SHphLXHUwnrD2uopA0/7ED+XaBGNtUMDCTf9rqn9TvW3Jt6f+30Gw2egaLDufJ5wt4OhPkcXgO
	vKKqOS2G5zY0bOHznEXmc0r75CHa1f/mnnL6hdsslGkf2AOvZIFueW88f81m+SjG2USLODVh3jS
	b1j61YB23nQvePzjOdel6IdYEHHhvCgB9h+rs+/oNC9yPxsXNqtHWA1yTfRMgzgAYlitn2Ncbxc
	1cWm9ecTKc377fxeiuSS49uB2kG7OeR1reku1t3rtFJ1d8L5+1ZEeat9Tq9cZ7Re2U7I17/aWUK
	j3sbAUqDc8xnwuxzLpLLj+B9uVXDG2MXk+C8Ovvbwy/hlBdJSj7G82G9XwKguFBsC6quEPjvyDP
	Wyydc/5zC7gilOl/oMdZF07uwQsOcOibc5zQ==
X-Google-Smtp-Source: AGHT+IFYydp0kI8EFvfy5PYZFD/rEeY/JD0XIBQBNbW2u3U0ZaaZuWlYsGDSwd/EDFML2URY6mZWOw==
X-Received: by 2002:a05:600c:1994:b0:477:9bfc:dcb6 with SMTP id 5b1f17b1804b1-477b895a8cemr7493815e9.14.1763590971937;
        Wed, 19 Nov 2025 14:22:51 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477b106b10asm70182445e9.10.2025.11.19.14.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 14:22:51 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v3] spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS implementation
Date: Wed, 19 Nov 2025 23:22:45 +0100
Message-ID: <20251119222245.80654-1-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 22:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226600

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Fix incorrect function call when processing SPDX_CUSTOM_ANNOTATION_VARS.
The code was calling new_annotation() as a standalone function, but it
should be called as a method on the build_objset object.

Error:
    new_annotation(d, build_objset, build, ...)

Corrected to:
    build_objset.new_annotation(d, build_objset, build, ...)

This bug would cause a NameError at runtime if SPDX_CUSTOM_ANNOTATION_VARS
was set to a non-empty value, preventing SPDX document generation.

The fix aligns with how new_annotation() is called elsewhere in the
codebase and matches the SBOMObjset class method signature.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>

---
Changes in v3:
- Fixed test bugs identified in v2 review:
  - Corrected SPDX file path from packages/package-base-files.spdx.json
    to recipes/recipe-base-files.spdx.json
  - Fixed objset.objects() to objset.objects (removed incorrect parentheses)
  - Fixed whitespace formatting in test code

Changes in v2:
- Added regression test to prevent future occurrences
---
 meta/lib/oe/spdx30_tasks.py          |  4 +-
 meta/lib/oeqa/selftest/cases/spdx.py | 85 +++++++++++++++++++++++++---
 2 files changed, 79 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index f2f133005d..4d11b3c289 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -498,9 +498,7 @@ def create_spdx(d):
     build_objset.set_is_native(is_native)
 
     for var in (d.getVar("SPDX_CUSTOM_ANNOTATION_VARS") or "").split():
-        new_annotation(
-            d,
-            build_objset,
+        build_objset.new_annotation(
             build,
             "%s=%s" % (var, d.getVar(var)),
             oe.spdx30.AnnotationType.other,
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 8cd4e83ca2..f548dd4be7 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -34,7 +34,7 @@ class SPDX22Check(OESelftestTestCase):
         arch_dir = get_bb_var("PACKAGE_ARCH", target_name)
         spdx_version = get_bb_var("SPDX_VERSION")
         # qemux86-64 creates the directory qemux86_64
-        #arch_dir = arch_var.replace("-", "_")
+        # arch_dir = arch_var.replace("-", "_")
 
         full_file_path = os.path.join(
             deploy_dir, "spdx", spdx_version, arch_dir, high_level_dir, spdx_file
@@ -89,15 +89,12 @@ class SPDX3CheckBase(object):
         return objset
 
     def check_recipe_spdx(self, target_name, spdx_path, *, task=None, extraconf=""):
-        config = (
-            textwrap.dedent(
-                f"""\
+        config = textwrap.dedent(
+            f"""\
                 INHERIT:remove = "create-spdx"
                 INHERIT += "{self.SPDX_CLASS}"
                 """
-            )
-            + textwrap.dedent(extraconf)
-        )
+        ) + textwrap.dedent(extraconf)
 
         self.write_config(config)
 
@@ -286,3 +283,77 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 break
         else:
             self.assertTrue(False, "Unable to find imported Host SpdxID")
+
+    def test_custom_annotation_vars(self):
+        """
+        Test that SPDX_CUSTOM_ANNOTATION_VARS properly creates annotations
+        without runtime errors. This is a regression test for the bug where
+        new_annotation() was called as a standalone function instead of as
+        a method on build_objset, causing a NameError.
+
+        The test verifies:
+        1. The build completes successfully (no NameError)
+        2. Each configured annotation variable appears exactly once
+        3. The annotation values match the configured variables
+
+        We check for exact equality (not >=) to prevent regressions where
+        one annotation might appear multiple times while another is missing.
+        """
+        ANNOTATION_VAR1 = "TestAnnotation1"
+        ANNOTATION_VAR2 = "TestAnnotation2"
+
+        # This will fail with NameError if new_annotation() is called incorrectly
+        objset = self.check_recipe_spdx(
+            "base-files",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/recipes/recipe-base-files.spdx.json",
+            extraconf=textwrap.dedent(
+                f"""\
+                ANNOTATION1 = "{ANNOTATION_VAR1}"
+                ANNOTATION2 = "{ANNOTATION_VAR2}"
+                SPDX_CUSTOM_ANNOTATION_VARS = "ANNOTATION1 ANNOTATION2"
+                """
+            ),
+        )
+
+        # If we got here, the build succeeded (no NameError)
+        # Now verify the annotations were actually created
+
+        # Find the build element
+        build = None
+        for o in objset.foreach_type(oe.spdx30.build_Build):
+            build = o
+            break
+
+        self.assertIsNotNone(build, "Unable to find Build element")
+
+        # Find annotation objects that reference our build
+        found_annotations = []
+        for obj in objset.objects:  # <-- Remove parentheses
+            if isinstance(obj, oe.spdx30.Annotation):
+                if hasattr(obj, "subject") and build._id == obj.subject._id:
+                    found_annotations.append(obj)
+
+        # Check each annotation separately to ensure exactly one occurrence of each
+        annotation1_count = 0
+        annotation2_count = 0
+
+        for annotation in found_annotations:
+            if hasattr(annotation, "statement"):
+                if f"ANNOTATION1={ANNOTATION_VAR1}" in annotation.statement:
+                    annotation1_count += 1
+                    self.logger.info(f"Found ANNOTATION1: {annotation.statement}")
+                if f"ANNOTATION2={ANNOTATION_VAR2}" in annotation.statement:
+                    annotation2_count += 1
+                    self.logger.info(f"Found ANNOTATION2: {annotation.statement}")
+
+        # Each annotation should appear exactly once
+        self.assertEqual(
+            annotation1_count,
+            1,
+            f"Expected exactly 1 occurrence of ANNOTATION1, found {annotation1_count}",
+        )
+        self.assertEqual(
+            annotation2_count,
+            1,
+            f"Expected exactly 1 occurrence of ANNOTATION2, found {annotation2_count}",
+        )
-- 
2.51.1


