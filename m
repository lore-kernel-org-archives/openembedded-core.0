Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615B5F94CDB
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 15:31:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85417.1776871894626680627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 08:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sOz4yJ0s;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DCB4F1A33A5;
	Wed, 22 Apr 2026 15:31:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B3ED65FA8F;
	Wed, 22 Apr 2026 15:31:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4687610460C02;
	Wed, 22 Apr 2026 17:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776871892; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lykaZvlLu1iAXLNAhBZaL+NTYB7z8umDmLJR52eNsZ4=;
	b=sOz4yJ0sYhuKyvrfnUeK9bQVb7kSJawyPQfVoITRlzkMD32qmTWtH3rmCv1K8A3xVtCot1
	RwlZnH2Jk/HjI7Jh7unDpdPr020CXmwdJfOkrsVC5V31ErKFjjmwnRnztUNX+dC61C1tTR
	+5IjDzADwUoPkRMjwTuxr6mDBvJA3uW9O+Xc02R49R6AshiroEUQtA1B1sBZFuKl+I25Sb
	EAMKHXwmdQaeDzrLWLRmdQTw2JbmHSw5i0Sm35xSPOFXOoqC/peyp5djMcHH+tPt/XpqLf
	2RhVKqfnFkavU+Rf6f+NVg0765z/YtnR/CCtMFifigFsrFg3DoRWxdDRBK8BeA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Wed, 22 Apr 2026 17:31:27 +0200
Subject: [PATCH 2/3] python3-spdx-python-model: Update to version 0.0.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-update-sbom-cve-check-and-depends-v1-2-4646f840ce48@bootlin.com>
References: <20260422-update-sbom-cve-check-and-depends-v1-0-4646f840ce48@bootlin.com>
In-Reply-To: <20260422-update-sbom-cve-check-and-depends-v1-0-4646f840ce48@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 15:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235731

sbom-cve-check version 1.3.0 requires spdx-python-model 0.0.5

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 ...enerate-bindings-allow-to-use-local-files.patch | 58 ----------------------
 ...0.0.4.bb => python3-spdx-python-model_0.0.5.bb} |  3 +-
 2 files changed, 1 insertion(+), 60 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-generate-bindings-allow-to-use-local-files.patch b/meta/recipes-devtools/python/python3-spdx-python-model/0001-generate-bindings-allow-to-use-local-files.patch
deleted file mode 100644
index ec24d7beb3c5..000000000000
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
index 00c3b3913c2e..c77bdffada9a 100644
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
2.53.0


