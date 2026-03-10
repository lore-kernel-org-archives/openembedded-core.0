Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF98FD4F29
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:13 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2596.1773168068450317275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BeNX+j4z;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-467161c4b89so1195595b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168067; x=1773772867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wYSZS61IRGHmLD9OmiNc9hgO2b0xZj5mQwHOFCwfH8=;
        b=BeNX+j4zF5itTfIu7GGO2a+HcMoibJb2bCi1cd86WPG4FcYcYLpIPUwPO9LxI6tsyu
         XJHSgBrjA8laD/zvEh5psRLVSdOnme4fcYoZoOH20QawCeCNqveZ7JJrTZNLRiiJ9ZKJ
         S/1aWHNjGGRVlsPIWNFq4sdSYQiq/9dnWuN7rpavpfkohePiv+qlDZaqAvy3sXE5mp/z
         iwLbxJgWUAOpcxNAcRyi97NysHE791c5anxFlOIZFd409l4SQAUA2g8OsrkGY7XT4uGs
         xYxq+Cf9iEV8hLvJHFCpvp5uriDbNr7bHBwRTv9O0LwmQW+ml/5l3TxiGTat+4fCnola
         sKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168067; x=1773772867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wYSZS61IRGHmLD9OmiNc9hgO2b0xZj5mQwHOFCwfH8=;
        b=a0LiS0xVClME+hdx1FfAjD1h3QeAPdBMX6ah6xWma3iqzsjEWkS8wD5k447OcW1g3h
         A85ZR/GZkmiRB2ZMxuOW+8PGkqWk/VioGB0nc4R8FTR1dDjD+/jxnxOivGH0rv0r7Dem
         AG+Z0cO7ZQjiFdvdwcuDsNQ5Am/i5NZbGS5fJp2HF66UtLEe769KcXtYB/o5lMRRE7kb
         AVrtyFbHXWd0F+kMINYex7HkXeaBeVWgCOA+UUXFcfDBBMoi9M98jMJGkopcvl1ENo2E
         0oiQActaEzcwVxnlHzK6I46E0fEDt9mSVE8n2jcWRty8Zbrj3bLuIrc5uriFqWaxcUxq
         MuAA==
X-Gm-Message-State: AOJu0Yy4r+WvtPB9hE1NFG49ZiO0zMfxeq88yi7Jj0TvPfPw63PAWvUR
	I6UqgYoatRVGcHebkkeGZxPeVjtuZt6kYzhoPpgIIFFCWlLMdHea9yA9dpFJtg==
X-Gm-Gg: ATEYQzypZ0hM4dF7mRdMpVjGSPB0jfy2coA7dAjOQE6a1S0ko9RfJYxN5SNSVr+VQ4J
	oWcXnxqwDk3GC82Uoc+/HSx2TpocZKzSKzu67ep94Y+qX635Pb8ZKvuMu1y+5kyV85r9imFn1cK
	1XvgXf6DEgC0hjzAQYHbRWzh9tjjnLM4SZi8NYBnWv3iH3m8N73laiEllFP6Zv9zDG70/HR3rA8
	CMopOV3KQhptGN/ggjqbA85AvBWxNfVfzSB4dwa/GKxwq2mVd9+gFsJufMiHd1q3537VidzUtVI
	W4GPgQRL9GVUIucsBbymXVuQaChtOBNay9F5PRm5VTCwaYHygVkjgzCtMwZfvc39cCYbRViGMY1
	CG3LGpHIBCYWPUOLAB1yfSaNe8iZFjhuxOX09pBIOwaDjMaygHCbA4NOjJ/tJLCBfr2hJgrqjeQ
	+agZIeyuFxSlHSq8/al6oL
X-Received: by 2002:a05:6808:5093:b0:467:db8:e46d with SMTP id 5614622812f47-4670db8f589mr4454510b6e.34.1773168067617;
        Tue, 10 Mar 2026 11:41:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::9891])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671d2a7ebfsm2444524b6e.20.2026.03.10.11.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:41:07 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 05/15] spdx3: Add is-native property
Date: Tue, 10 Mar 2026 12:38:25 -0600
Message-ID: <20260310184058.533343-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232816

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
index b6c917045e..a8fffbb085 100644
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


