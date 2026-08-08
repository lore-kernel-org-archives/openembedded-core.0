Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F16C5AD2B
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 10:52:30 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3554.1786186345725298605
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 03:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Cw8pJOAi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260808105223444f6d8d7d000207d4-woas4s@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260808105223444f6d8d7d000207d4
        for <openembedded-core@lists.openembedded.org>;
        Sat, 08 Aug 2026 12:52:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kupDkW8pwkpO0fspUm6YP0/NIxUGHqOhG1AjC8ooRCQ=;
 b=Cw8pJOAiT6mt9jK800hBBINqVO74PJcKqfeiNa0NE+SovcxaycQR5UjGp+ZHrM//kOTF1D
 uWT1/zd21EBOTOlghhIcXaUsb0RqdjK2IB1np7/5KABYmCo9Sz6z7PlzdkgXZjo501H2Ic++
 TE1cyDiT+H5YETnTD4CNUsMFkAaOZVM/7IkoLmNlbW779gKR8pSVVZanr2Pbgd9yvi0m5JmA
 smqXNA4147PXOrssrY5dzvpon+AyrFbQPJQv2pOdhHnY07NQgT83MIL82TzHmzK5b3/aa0/g
 c0otjx3JP1Jxg/1MesNZiqLd2ZvtZjihA/2Klye2BgDC5CNzzx3sg/MA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][RFC PATCH 03/11] python3-spdx-python-model: update from version 0.0.5 to 0.0.6
Date: Sat,  8 Aug 2026 12:51:39 +0200
Message-ID: <20260808105147.42294-4-peter.marko@siemens.com>
In-Reply-To: <20260808105147.42294-1-peter.marko@siemens.com>
References: <20260808105147.42294-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 10:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243040

From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>

Drop the patch which should no longer be necessary. This is a partial
revert of f6557000abc90b0c3b7ca5b4560849e64425c853

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9b5c92cd6b8ef8a56ebc3815120fd4af5872173c)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...pdate-shacl2code-to-1.1.0-and-add-ke.patch | 41 -------------------
 ....bb => python3-spdx-python-model_0.0.6.bb} | 12 +++---
 2 files changed, 6 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
 rename meta/recipes-devtools/python/{python3-spdx-python-model_0.0.5.bb => python3-spdx-python-model_0.0.6.bb} (72%)

diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch b/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
deleted file mode 100644
index d9dc0a03c8..0000000000
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
index 19d9bb815b..def12b2049 100644
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

