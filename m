Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F83F5542D
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 23:02:57 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33595.1771974168798694397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 15:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dwxXNDl/;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-46392972257so4248540b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771974168; x=1772578968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B26QEFGZ1BfU8osvAqsZdiqlbAEmeNAht5QsWjTxO+M=;
        b=dwxXNDl/RQl5zNvKhw7cp88Dwz1q6uLuctQyV4BJOEVEd1WrGbDuhPwaoXOLFILstc
         HuqkqHTw93vtsvmAYowP2TTmtsobsteNdZWXVQdxwXTeFsShp56AXqlSpRNeOFznGDxL
         p6uHU6DynTPVWq+NllFf1Eux9TMCfiwj2QKTvpUdOqhqZGY93+vK1hU91mjTu6T0z2Lf
         aoB1KtAWBOshF1fBB92ax1/Ya4XHxuVKSzUupK0HsTjxCz5V0867kAKUNINiz4tpoBio
         /c3EhTVc6R56dqB1z6EwfeI38PXpILcKdqxITgW3xZ+LCg8e9HA7lY0kDTH/p2pEruaz
         enow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771974168; x=1772578968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B26QEFGZ1BfU8osvAqsZdiqlbAEmeNAht5QsWjTxO+M=;
        b=cvPie6fCnTuFxOYe8BBcUNmaGY1MjdY8QAI/iW0ZjYv5LlVzbgrDlfkLXLGlR2mIDM
         tA5mU74ZZetBIrBPNfrNCfDZZph1iruYGmxopKmzqPKmyRHsyno9kwcNDH666YPNKFcP
         A8WXJ/gCWO6VsN4UDIlxlOkevhH2lgFm8d6tDf7AoUYnwnyrWdzb9kjAJirWK6NuNMWe
         W48O8l0KnaibBiZMfdtt5bkaDTyUW8VGfGAIX0YtN9DVCR5RXD0q/uQkyXd2RIWIJCp6
         zK/h2Xo0l+jqRfZdj1vJXdp0WnDLYMXii/UEQF2UL7GvGydLueta/onz6wfgstNfy6CS
         Y0fg==
X-Gm-Message-State: AOJu0YzMvDfN8Sizaa/7Kxw6d6OGsCi6v08/2LtGVAKNwHEO2V37cMuM
	r84gHOL0ZW5nnEjHvRoafujCuR31olAz3qOvGefmZWeSnb3jZhrNLuL8YMRs5g==
X-Gm-Gg: AZuq6aI2qz7UFLQARj5faC5FFm4khQrwyRyQMCTI7JUwdb6f4xui6RbnwAhnUoNj1rJ
	4bd6+Z9MuyHVYN/1Z5VxMghyzOGYBsmR6Riw1m+YD9goe+zjZhp8K2NyCQQW5IbU3lF7xfsENzO
	YcEUAhAOJ6OcyToObM7bvpfTWVJSLAn+BY5BBioZyQZQoyYHcq/JXy+8t/4hp5gVAoubUkq2E+v
	D03LgPjlc8y6HRuO9BsQITOvgBl00GJ367ViQ75uEB8GvRQ4lrA9q/gTtqnMV+hXhxyVF5LUeAR
	A8djbh8wQCVqoJz1moRq84tqMLKkQEwAOJ2/Ei86xe20Y+U9zaBoXdTk0IkzL7tjcmp7rLi1Rpn
	haBsvO7JB7VMiNF+TajIpzLDt2tId2hN1Da1kwQu4Z5HTbSoXaF4qe2kbLrm9GSFYxlm1rJUv3U
	W4Zluxizn/Ay+KNB9CYeUb
X-Received: by 2002:a05:6808:171c:b0:44f:6a19:433e with SMTP id 5614622812f47-4644617f594mr8573568b6e.15.1771974167846;
        Tue, 24 Feb 2026 15:02:47 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4644a1efc76sm7912024b6e.18.2026.02.24.15.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:02:47 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 5/8] spdx3: Add is-native property
Date: Tue, 24 Feb 2026 16:00:18 -0700
Message-ID: <20260224230234.679049-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224230234.679049-1-JPEWhacker@gmail.com>
References: <20260220154123.376880-1-JPEWhacker@gmail.com>
 <20260224230234.679049-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231914

Adds a custom is-native property to the recipe package to indicate if it
is a native recipe

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py       | 20 ++++++++++++++++++++
 meta/lib/oe/spdx30_tasks.py | 18 +++++++++++-------
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 227ac51877..50a72fce39 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -118,6 +118,26 @@ class OEDocumentExtension(oe.spdx30.extension_Extension):
         )
 
 
+@oe.spdx30.register(OE_SPDX_BASE + "recipe-extension")
+class OERecipeExtension(oe.spdx30.extension_Extension):
+    """
+    This extension is added to recipe software_Packages to indicate various
+    useful bits of information about the recipe
+    """
+
+    CLOSED = True
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        cls._add_property(
+            "is_native",
+            oe.spdx30.BooleanProp(),
+            OE_SPDX_BASE + "is-native",
+            max_count=1,
+        )
+
+
 def spdxid_hash(*items):
     h = hashlib.md5()
     for i in items:
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 9a312a870d..fff1ca6bea 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -477,6 +477,10 @@ def set_purls(spdx_package, purls):
         )
 
 
+def get_is_native(d):
+    return bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d)
+
+
 def create_recipe_spdx(d):
     deploydir = Path(d.getVar("SPDXRECIPEDEPLOY"))
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
@@ -507,6 +511,11 @@ def create_recipe_spdx(d):
         )
     )
 
+    if get_is_native(d):
+        ext = oe.sbom30.OERecipeExtension()
+        ext.is_native = True
+        recipe.extension.append(ext)
+
     set_purls(recipe, (d.getVar("SPDX_PACKAGE_URLS") or "").split())
 
     # TODO: This doesn't work before do_unpack because the license text has to
@@ -668,9 +677,7 @@ def create_spdx(d):
     spdx_workdir = Path(d.getVar("SPDXWORK"))
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
     pkg_arch = d.getVar("SSTATE_PKGARCH")
-    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class(
-        "cross", d
-    )
+    is_native = get_is_native(d)
 
     recipe, recipe_objset = load_recipe_spdx(d)
 
@@ -1021,14 +1028,11 @@ def create_spdx(d):
 def create_package_spdx(d):
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     deploydir = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
-    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class(
-        "cross", d
-    )
 
     providers = oe.spdx_common.collect_package_providers(d)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
 
-    if is_native:
+    if get_is_native(d):
         return
 
     bb.build.exec_func("read_subpackage_metadata", d)
-- 
2.53.0


