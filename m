Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F76F9B611
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 10:36:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79500.1776854196949162202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 03:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G8loFPIc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776854196; x=1808390196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r0qNG0sq+b2eOdZZdfbOcPDIC4HYamZeAYOQOL1EP/4=;
  b=G8loFPIcClZlRrHAiORmLiim8oCzpxEwEKCysIK2OKAn9e34leRiunAi
   bMoTc1FSoAUiVgjFwD106MkMiIvOv7aZVVatUUwYd021Bq5aw9Z+D6aFj
   o4Epx1+BoM33SvmFooJkza6L9W0t5mi/Qqkpbu4FO8KC01OMfZ97ZRAD8
   R5kJCbXTGageMAzZs/d9c+O9XPls7brGGa/RG553ml5eFXswAQYFRAZBj
   ZP4AmWCJtjAbvwBlBmKBwFssAmC45/BJXWlDjW+mgeyNoP7sfE+iQZIGZ
   P3lehu1fNFfKYjL/DbI5+fVW4OcwHGmEbvxKJep1SUpvSaiNuum5nW3/E
   g==;
X-CSE-ConnectionGUID: 62PLebJsQFmSsA5wzssM1A==
X-CSE-MsgGUID: wyuDAAAQRQ+Jpa7Cdkq3FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="237754421"
X-IronPort-AV: E=Sophos;i="6.23,192,1770562800"; 
   d="scan'208";a="237754421"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 19:36:34 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0B57E8204F2
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:36:35 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id B6F13C01196
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:36:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 383211017325;
	Wed, 22 Apr 2026 10:36:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-spdx-python-model: upgrade 0.0.4 -> 0.0.5
Date: Wed, 22 Apr 2026 18:36:25 +0800
Message-ID: <20260422103626.817-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260422103626.817-1-wangmy@fujitsu.com>
References: <20260422103626.817-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235711

From: Wang Mingyu <wangmy@fujitsu.com>

0001-generate-bindings-allow-to-use-local-files.patch
removed since it's included in 0.0.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...te-bindings-allow-to-use-local-files.patch | 58 -------------------
 ....bb => python3-spdx-python-model_0.0.5.bb} |  3 +-
 2 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-spdx-python-model/0001-generate-bindings-allow-to-use-local-files.patch
 rename meta/recipes-devtools/python/{python3-spdx-python-model_0.0.4.bb => python3-spdx-python-model_0.0.5.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-generate-bindings-allow-to-use-local-files.patch b/meta/recipes-devtools/python/python3-spdx-python-model/0001-generate-bindings-allow-to-use-local-files.patch
deleted file mode 100644
index ec24d7beb3..0000000000
--- a/meta/recipes-devtools/python/python3-spdx-python-model/0001-generate-bindings-allow-to-use-local-files.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 9fb565a0a70c6985fa1efde13cfe7fb4851588ce Mon Sep 17 00:00:00 2001
-From: Benjamin Robin <benjamin.robin@bootlin.com>
-Date: Tue, 24 Feb 2026 10:59:25 +0100
-Subject: [PATCH] generate-bindings: allow to use local files
-
-shacl2code needs to download the following URLs during build time:
- - https://spdx.org/rdf/3.0.1/spdx-model.ttl
- - https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl
- - https://spdx.org/rdf/3.0.1/spdx-context.jsonld
-
-There are a lot of package build tools that do not allow to download
-a file during the build. So provide a way to use local file:
-If the environment variable SHACL2CODE_SPDX_DIR is defined, load
-the SPDX model and SPDX context from the directory specified by this
-environment variable.
-
-Upstream-Status: Submitted [https://github.com/spdx/spdx-python-model/pull/19]
-
-Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
----
- gen/generate-bindings | 22 ++++++++++++++++------
- 1 file changed, 16 insertions(+), 6 deletions(-)
-
-diff --git a/gen/generate-bindings b/gen/generate-bindings
-index b963c55a3bc9..bc7041ee3bb9 100755
---- a/gen/generate-bindings
-+++ b/gen/generate-bindings
-@@ -14,12 +14,22 @@ echo "# Import all versions" > __init__.py
- for v in $SPDX_VERSIONS; do
-     MODNAME="v$(echo "$v" | sed 's/[^a-zA-Z0-9_]/_/g')"
-
--    shacl2code generate --input https://spdx.org/rdf/$v/spdx-model.ttl \
--        --input https://spdx.org/rdf/$v/spdx-json-serialize-annotations.ttl \
--        --context https://spdx.org/rdf/$v/spdx-context.jsonld \
--        --license Apache-2.0 \
--        python \
--        -o "$MODNAME.py"
-+    if [ -n "${SHACL2CODE_SPDX_DIR}" ] && [ -d "${SHACL2CODE_SPDX_DIR}/$v" ]
-+    then
-+        shacl2code generate --input "file://${SHACL2CODE_SPDX_DIR}/$v/spdx-model.ttl" \
-+            --input "file://${SHACL2CODE_SPDX_DIR}/$v/spdx-json-serialize-annotations.ttl" \
-+            --context-url "file://${SHACL2CODE_SPDX_DIR}/$v/spdx-context.jsonld" https://spdx.org/rdf/$v/spdx-context.jsonld  \
-+            --license Apache-2.0 \
-+            python \
-+            -o "$MODNAME.py"
-+    else
-+        shacl2code generate --input https://spdx.org/rdf/$v/spdx-model.ttl \
-+            --input https://spdx.org/rdf/$v/spdx-json-serialize-annotations.ttl \
-+            --context https://spdx.org/rdf/$v/spdx-context.jsonld \
-+            --license Apache-2.0 \
-+            python \
-+            -o "$MODNAME.py"
-+    fi
-
-     echo "from . import $MODNAME" >> __init__.py
- done
---
-2.53.0
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.4.bb b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-spdx-python-model_0.0.4.bb
rename to meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
index 00c3b3913c..c77bdffada 100644
--- a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.4.bb
+++ b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
@@ -5,13 +5,12 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 PYPI_PACKAGE = "spdx_python_model"
-SRC_URI[sha256sum] = "bdec725398babcbdd4bcb7c16cf23497d06a48d0ef3ea1edb19a3b0d431ab8c1"
+SRC_URI[sha256sum] = "4bcf7c6e5e2e8f0b787ed4eb8fb519e2ed776e820cb6d9eb93e44e98eb92ca2d"
 
 SRC_URI += " \
     https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 \
     https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 \
     https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 \
-    file://0001-generate-bindings-allow-to-use-local-files.patch \
 "
 
 SRC_URI[spdx1.sha256sum] = "c72b0928f094c83e5c127784edb1ebca2af74a104fcacc007c332b23cbc788bd"
-- 
2.43.0


