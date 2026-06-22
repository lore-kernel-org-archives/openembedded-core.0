Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D087CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 16:01:44 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.313.1782144096387500375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 09:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AXiLWHRs;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4864ebb6268so2593695b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782144095; x=1782748895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fBmELcR62qaRaX0bzufwvBMCGVRz+I0w0N+V1LZO1i8=;
        b=AXiLWHRseFBp0wcyPLxLPmXAV3rGL99im2oOiraVqp1f6iTzEEmCzgfpnC1YNDPLJN
         ywhbfxEHsLPY20CU0Wp55NZh2Qu8RTawHJ1NJRUbCrlMiinq7qPbzwWBZArCHkrYtbPN
         2soeadRzcGw2JBi4DK1okta9WjdbgVbkHSn+oscUwNXcUM7Je/iiAOxkcCXHUy9/GfDz
         9iGTqYQIiNxxLicnufNSwdzkeFCSWHsxL4s2r/SfE8V+RRdz1IgCbRhA5rmg1bTFwPS+
         jxIOW5Lbpr/Tp2Id5gJkgOryHPWOpARyvSTm8ktbeFXOhwFqUWEuV8Uw01lf1/eR6kZI
         kZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782144095; x=1782748895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBmELcR62qaRaX0bzufwvBMCGVRz+I0w0N+V1LZO1i8=;
        b=DyH0glgPcnFnnJ+JA3JNeUEzrl8+EIXH1G4lZd6R+sTrHR/QpNY9PShaSUtTe0AimU
         dxJigkFFAGTrruCBLbPw4+4SGdSLkbnQi5rTNUy/VOYqkX+dLHB5CIy0mxqYenVM3R+Y
         pU27C1WNETsgqXpKtXZhFgvx2UxJqbGo+m6gBc2cfyCCf8aeg4S3YWBtks187nEyHnC4
         dLhtyqrrENmcKQwOqkBAJ1r1QhgFxyPaAvroewn0z9mH7NF42XjYSjodCZcJHc3c8NSx
         3WVO9KvT84GwOgDfjvnDnCaJgOLAA0sSgDRlwiWFTSQ0TZNI3HHHoGZ+WG5YPVhQvQj8
         KeqA==
X-Gm-Message-State: AOJu0Yxn8ldwpK8GmrDpt/bk73s0tpP+pO+qCmdcewsgMcSorHyBYuEx
	0HWOjOH8GmMW77JDm6v0ug46NnBKsLtF1vUiEgDUTXAcaTizltic4TU6G3nuBA==
X-Gm-Gg: AfdE7ckDXm294+y0ncbaUEqLoDBt0MzA+KA6pPp5f9pRS/Aqaww2hxH6r+rkT+sWTYX
	MK4zybyvXk8Ink8Spiyk8GquBGQFEDkLtqIK0UOc5RpVuLKnDveZcPb+cheJIAPR/qkr2vZbTnz
	1ZZM5ugFhDg3C0KOvlN7SLzMKM4M/zb/A6XZpmKh+cK4IoQJtFGIcx7ZFiHSaDvjjQ1tjutVHoV
	f29qXEUiUxIC7rdRy9PTHgRFlPS6v/kBqoqdCiXZexqPjic3MJuBRBaRF5Nfyk6iIbmLPCTGkS3
	V5q6d3o+2XrnIC8bgvA1M+x+KNxDT32z2JVYtqIlRan0Rl5CG4ALUjr81Bj9Q0f/TxTAFEZNSZl
	C+nFFoPP/Q+i/yI6HI5HU1LqrYDO0HrjljttnW6zrgaMWO9wPFkvjgJhWjR72kdGO7eq8pPh0FW
	9bSu6ScNPyqg==
X-Received: by 2002:a05:6809:1d1:20b0:489:bbc9:8834 with SMTP id 5614622812f47-489bbc98c01mr8393614b6e.29.1782144095152;
        Mon, 22 Jun 2026 09:01:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::44b7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48aebb9f1e4sm5022584b6e.1.2026.06.22.09.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 09:01:34 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] spdx: Add custom annotations to recipe packages
Date: Mon, 22 Jun 2026 10:01:24 -0600
Message-ID: <20260622160124.254101-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 16:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239311

In addition to adding custom annotations to the build, add them to the
recipe as well.

Historically in the SPDX 2.2 implementation, there was no concept of a
"build" and instead just a "recipe" SPDX package that represented both
the recipe itself and the build that produced the runtime packages. The
custom annotations were attached to this package. When SPDX 3 was first
introduced, this unified recipe package was not kept and instead only a
build object was created to represent the production of the runtime
packages; as such the custom annotations were attached to this build.
Later, it was desired to re-introduce a package to represent the recipe
itself for various reasons, however the custom annotations were not
attached to the recipe object at that time.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 72d17aade6..79e18db11d 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -588,6 +588,15 @@ def set_purposes(d, element, *var_names, force_purposes=[]):
     ]
 
 
+def add_custom_annotations(d, objset, obj):
+    for var in (d.getVar("SPDX_CUSTOM_ANNOTATION_VARS") or "").split():
+        objset.new_annotation(
+            obj,
+            "%s=%s" % (var, d.getVar(var)),
+            oe.spdx30.AnnotationType.other,
+        )
+
+
 def set_purls(spdx_package, purls):
     if purls:
         spdx_package.software_packageUrl = purls[0]
@@ -639,6 +648,8 @@ def create_recipe_spdx(d):
         ext.is_native = True
         recipe.extension.append(ext)
 
+    add_custom_annotations(d, recipe_objset, recipe)
+
     set_purls(recipe, (d.getVar("SPDX_PACKAGE_URLS") or "").split())
 
     # TODO: This doesn't work before do_unpack because the license text has to
@@ -839,12 +850,7 @@ def create_spdx(d):
 
     build_objset.set_is_native(is_native)
 
-    for var in (d.getVar("SPDX_CUSTOM_ANNOTATION_VARS") or "").split():
-        build_objset.new_annotation(
-            build,
-            "%s=%s" % (var, d.getVar(var)),
-            oe.spdx30.AnnotationType.other,
-        )
+    add_custom_annotations(d, build_objset, build)
 
     build_inputs = set()
 
-- 
2.54.0


