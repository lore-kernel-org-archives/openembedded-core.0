Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71044D5AE6A
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:19 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2897.1765620079059797283
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lKvj1qNk;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297ef378069so21803045ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620078; x=1766224878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiRkf+/zs4fLsQoYKhyDyIldBVS0kSciAQXdVb8K4bs=;
        b=lKvj1qNkscuXjaav/BnBivZ64XHdaNCdBWo6tKX2DSIr15SSds4KaoUP/Z5APqzg0Z
         izGQkkoYihtceW90zdajVajREOprekSoPoXzBozK09n19vGd+HZ3+dGMGEQ5+TsC+abI
         tyZxkic/DXUcBd+asB+PNAX2kDjZ0wSuzg/hxGDOcIHnl40i9027F92OvzgFNZQI2KQK
         VJK9fAbUyHvU9yBdmHwxG6cnKY0gg/T84uBkzUAWk886bW12hJPlkXuFSPgq/zCeKkdW
         IBaBosQGMr6mK4wAdodc2P9Rf/LWQUKtl5v4hoWL9h0CLyQhMKraGPf653iBkfm8pbaH
         mzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620078; x=1766224878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JiRkf+/zs4fLsQoYKhyDyIldBVS0kSciAQXdVb8K4bs=;
        b=t3qR6WuI6pZ7q+09kKtbZfSqvypV1ofivM2EksCaS0EwjbFNtiIsmkApMIneHeVH0h
         sEokMsQRwJDWFEDMITLAsl/ZqP5DJO1uzb8eKuMtzWRBvuZOAKtF2E8XhYN3Iu+thokj
         6IshbtCg3YayQ3y5ZqfyUfHGap3r+Hlgm4r5Zsb8fS2wrlBqxR27NNhBRiZ5kcGhbr9y
         otmtmvcV/RnLEbo+HwH+DLATD8Fnz+I6hh3mfQB9c78ZVsb5Partx9zY1OuSYKh9FFWF
         edkwwBRqDcSx3I/DCqdVVLeHdhB/zx1MakJtUi+x1Pk6Cjb1I+2S8HWpCZrS91X6fwnk
         +pMQ==
X-Gm-Message-State: AOJu0YzK1cQ8cU/xoayTexfmlMxqE6QCKS+00LMF67XjsgGsy9r6J+aA
	hnsH3skD5rlEyozfieJ60X8LdkSF9IjA+dbcrsDvYhrK/Nkg1rmgj5595DHwGBnF
X-Gm-Gg: AY/fxX6JQOEvQtx2m6G41gF6q/ugw5ub58hNiwZju72gzOV0Ujk+/VjY2nuMiUhj2cp
	J0whkYkYYjcIGkx1kcCiIoD0dEVu/z63J3BVqOmJL3XEXRPj/2+Z4Fg8IGebLaXfpvFmYJF9nE+
	Ckwudwwx+9BCUFqEB5U2Yai2kSXh8f7up9e+fHbIMbaK/kXYlV8HGNKtLTzoVmn6AaVU9qdoiVG
	T47cDJsghQrKH8RHuT0P7+qfvCiZi2Lis6iNYRHEh9UCpu/uNEoy+SWKM0W7F+d3MTCN3SFMJzA
	hPGroZN7dwoCawiILqnsep/M6i3yC1lMjOp3PS3TauCNl6vzwnyRRyWoxCTFARw60mk9DNxnwa5
	j6RLCC8IXvf7iudM+jWyyxMHzKROXeaidLuXwMZjO3jvIzzeyEj2WbYa67gngpyt6jCBRJqTc6T
	rziRYjFON/upJYop9JAg2OsnA1zCjVTgtegMk=
X-Google-Smtp-Source: AGHT+IFfwMTKMBGZAuDO/TAlPmQlxo3sJ7W78eF3okk0j30IyRN8fOjBYpUjx29Y/CGRGU0LZFb1uQ==
X-Received: by 2002:a17:902:ccc9:b0:29e:9c16:273f with SMTP id d9443c01a7336-29f23b6e65amr53287715ad.21.1765620078222;
        Sat, 13 Dec 2025 02:01:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Stefano Tondo <stefano.tondo.ext@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 36/67] spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS implementation
Date: Sat, 13 Dec 2025 15:29:00 +0530
Message-ID: <20251213095931.2571498-36-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227654

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 52ab3b640c6bb7ece34cb4ea6026fd6375f17af4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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

