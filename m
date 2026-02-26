Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483A3FD8FF1
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 17:39:42 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75833.1772127577818028665
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 09:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gVLAlyhk;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d4bd4db87aso491197a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 09:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772127577; x=1772732377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B26QEFGZ1BfU8osvAqsZdiqlbAEmeNAht5QsWjTxO+M=;
        b=gVLAlyhkrBSUjsS48jQ09o889ch+KoEE7jAva+RbfP9eJf9Rb9LbMdhU4VV0IwvY15
         +zPzNlRFEVXp0WYy/BDSEmWRj3i7crOiNC/TGWog2YvC7wFH27+ugklqTpuw5p/I3zZZ
         NdTc1KPs/XOMypY+XEYlySwJ14wiLGE/nI45YnUIoWJt6qaKlt0SQiX5ly6EI0c9ZcMk
         hEY92BI4WfZnVwsK2CWYiFv18b5XEgUxhCb7mwawsD1n7UdafYECFraLTn4tsKTQ2+96
         a7Gn2g8Y/hwN9fjKCAwXARFhdmoZmJQGIXq1h5rh2XwPFeXKCeGIptTAyLOoym27svbU
         3kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772127577; x=1772732377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B26QEFGZ1BfU8osvAqsZdiqlbAEmeNAht5QsWjTxO+M=;
        b=Op8eaImrDrgw5UDf/uGuX9Jl/RWLqeQUrFmjpRMST2rXJMAMrgNX6W49GrgwtJBAJe
         i1A8C39qwd8Ha3beIjFyn+SiTSxL9ZgBfZrNGdybzuwaUe029p53Xfn7dmeSNTTVr2au
         cI1AzLxiXdyLMEamE0fPocZtSFgr0uNqrI7fGFliFdblfuE3OLdnr2mN5jPYCdcrz7DX
         5Ve0oTWhAepAszvciDpNrYtgVGBOQazmmXwztUaL5fDp2h8hTj3hwdxyaa2B+H21AZMd
         ZXzYlb9cAne2R3XhmIM63n7IbzyfoB8RYMR9aqXX4iZIfx3va14C6Pyk/K3A5XTx8mLr
         rUSg==
X-Gm-Message-State: AOJu0YwQylMI5eQD1qJE5nw/cPAz+4k16aPF07ucc8a6nfszg0LrMQFy
	mVtFaul2cY95WE0Lis2NKjMkIDXJId5Ilfhk/b/QFJLDSgoBJ1FFUK2LMWGGww==
X-Gm-Gg: ATEYQzyxy6P7VzhAH5tMPIKRg3Q6Lfnoq3ET1tRKAQlaRsg1790AkIWQsU3Fd2CURyJ
	iZgqnD4fX6LhXhBYWMDcznL8aJg8c5R06Ub45CYqK1YSMdx8nHjwlqB+/2gd30lkPhcXIL2xZ3v
	iRQRvxgfoFvXAt6SRPMJNWv4/Y/Y2gGCLlLc9eXa5XVb5FzOVJ82QTDDxw0b2s295mI607fGSgD
	QhGEpsxDJ0unFrBna0NGMYC9E7TfwhA1da3RyZE+kq2l+vIFCecvHgCsDAhPJ8ISr6+a5O4zJ4t
	Ax+BwWz2mm78fOvv3vcQS6rvcP/Z/fy7rGIou3q0rxe3Xk16a6hqjoLdDk00HNFgolwiS3DUVwC
	W+cUxGz/tEtO1Kvv8UiyQ4YgGiY0QhuvvGqASVrS4yKVTf+bVZx53O2Pbr3Dnnu5Q4m68UlO5J/
	YGWRxQr+MTsrbdU2j1/A96vGFwLWJcz1s=
X-Received: by 2002:a05:6830:3787:b0:7c7:8113:6f6e with SMTP id 46e09a7af769-7d586f605c7mr1703681a34.27.1772127576818;
        Thu, 26 Feb 2026 09:39:36 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::6492])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d586653f81sm2173027a34.23.2026.02.26.09.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:39:36 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 5/8] spdx3: Add is-native property
Date: Thu, 26 Feb 2026 10:33:06 -0700
Message-ID: <20260226173930.2847872-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226173930.2847872-1-JPEWhacker@gmail.com>
References: <20260224230234.679049-1-JPEWhacker@gmail.com>
 <20260226173930.2847872-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232051

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


