Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90D8CDE002
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 16:54:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12168.1782320054091785757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 09:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WU2Utsx/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 424601A0923;
	Wed, 24 Jun 2026 16:54:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17B01601C5;
	Wed, 24 Jun 2026 16:54:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57CDC106C8415;
	Wed, 24 Jun 2026 18:54:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782320051; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0FfU/70D7G8YHQ5pPNwnGbp/WaaEI5EHsLUvdJqXuMg=;
	b=WU2Utsx/Iz+NHmlWRy7xnQ0Ckwv076bU9FcjeN5PT8LDSas1DPOB/Z6kbpYI3EnDoHqrUG
	nY6B56qIBtu9sHcgq1Lad7cu0o5X0XCbpiWVVVlaTGVPT8iwXCwOaaQDar3GaXtUjBYJgZ
	olM3uDcA3cvrK3PiwkrH0/NMhKsqqV1L0jJXuPP2QEBIqC81p031PbqAmdWBwFvcNGJVA8
	I7G7fnGZEGqWyB2IvedqJHSROQzMq0fwvH1hRAcGsES9nrG9hftGCRspUO2fuwsy0gnwqU
	Pqfb6ioBBporsL3OVf2S8hBHe5M4N/X+RnvW8o4WHTdxwRQQ2ad7CemHXmQg0Q==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 24 Jun 2026 18:53:53 +0200
Subject: [PATCH 1/4] python3-spdx-python-model: update from version 0.0.5
 to 0.0.6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-update-sbom-cve-check-1-3-2-v1-1-f7ab738bd785@bootlin.com>
References: <20260624-update-sbom-cve-check-1-3-2-v1-0-f7ab738bd785@bootlin.com>
In-Reply-To: <20260624-update-sbom-cve-check-1-3-2-v1-0-f7ab738bd785@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 16:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239527

Drop the patch which should no longer be necessary. This is a partial
revert of f6557000abc90b0c3b7ca5b4560849e64425c853

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 ...oml-Update-shacl2code-to-1.1.0-and-add-ke.patch | 41 ----------------------
 ...0.0.5.bb => python3-spdx-python-model_0.0.6.bb} | 12 +++----
 2 files changed, 6 insertions(+), 47 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch b/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
deleted file mode 100644
index d9dc0a03c8d1..000000000000
--- a/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b623473f634aebeb30028cc746fb7a3da4fb2ce3 Mon Sep 17 00:00:00 2001
-From: Arthit Suriyawongkul <arthit@gmail.com>
-Date: Sat, 6 Jun 2026 02:44:48 +0100
-Subject: [PATCH] pyproject.toml: Update shacl2code to 1.1.0 and add keywords
- (#35)
-
-Signed-off-by: Arthit Suriyawongkul <arthit@gmail.com>
-Upstream-Status: Backport [https://github.com/spdx/spdx-python-model/commit/2d7b71a7c8e6270a1c8795cdeb4f3dcd9393b3a9]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- pyproject.toml | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index c8b3e56..df011e8 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -8,6 +8,14 @@ authors = [
-     {name = "Joshua Watt", email = "JPEWhacker@gmail.com"},
- ]
- readme = "README.md"
-+keywords = [
-+    "spdx",
-+    "sbom",
-+    "spdx3",
-+    "software-bill-of-materials",
-+    "shacl2code",
-+    "bindings",
-+]
- classifiers = [
-     "Development Status :: 4 - Beta",
-     "Intended Audience :: Developers",
-@@ -36,7 +44,7 @@ Issues = "https://github.com/spdx/spdx-python-model/issues"
- requires = [
-     "hatchling >= 1.27.0",
-     "hatch-build-scripts >= 0.0.4",
--    "shacl2code == 1.0.1",
-+    "shacl2code == 1.1.0",
- ]
- build-backend = "hatchling.build"
- 
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
similarity index 72%
rename from meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
rename to meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
index 19d9bb815ba1..def12b204926 100644
--- a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
+++ b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
@@ -5,13 +5,13 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 PYPI_PACKAGE = "spdx_python_model"
-SRC_URI[sha256sum] = "4bcf7c6e5e2e8f0b787ed4eb8fb519e2ed776e820cb6d9eb93e44e98eb92ca2d"
+SRC_URI[sha256sum] = "f1938eb08d08218278122849bba123b8993a0171e9b4f5ea6af7aeb71f3204d7"
 
-SRC_URI += "https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 \
-           https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 \
-           https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 \
-           file://0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch \
-           "
+SRC_URI += " \
+    https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 \
+    https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 \
+    https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 \
+"
 
 SRC_URI[spdx1.sha256sum] = "c72b0928f094c83e5c127784edb1ebca2af74a104fcacc007c332b23cbc788bd"
 SRC_URI[spdx2.sha256sum] = "c6a54b51230eb2bf3b31302546af201f303e0b7931c1db404d7f5b72b6f863e6"

-- 
2.54.0


