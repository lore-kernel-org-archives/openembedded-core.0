Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7D7C5AD2C
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 10:52:20 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3506.1786186338640748508
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 03:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Or1f3/on;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260808105216f1735ea5b100020748-z0hs_d@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260808105216f1735ea5b100020748
        for <openembedded-core@lists.openembedded.org>;
        Sat, 08 Aug 2026 12:52:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Y/+d51I/5OWxZFbjqRtJZWle8u1ANlNOzyKjt2fuL3s=;
 b=Or1f3/on9yhKWplwHOHWq7qOLdAIajuepuRBEThqAnOfqFzXy8VcNuQIgO0KMmJgm6cXFB
 StL7arUU7dr51UjZlnBlbdxfkCkk4M+E/54A3NZqJqbDMiJ3t2kGC3pmxFQJwjYvJy1X0YnG
 IR7b/rXPK+0rEjfwub70leSF7ttyrJxM96W6SxmFPPKb7Um3VCyRccKWIiyg3L7CGqlLzCC+
 J1Ia14sBojAND2TDK1wZOLbEB8bK9aB4LchK+JRAiy4+hI7dpjqCDlj5NeAi/qB4QuaZSzcU
 KmAei/gsDol4INWCT83c6idLQt35Z4f77Z02nllS7b0CjA4xPHiB1eFA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][RFC PATCH 02/11] python3-shacl2code: upgrade 1.0.1 -> 1.1.0
Date: Sat,  8 Aug 2026 12:51:38 +0200
Message-ID: <20260808105147.42294-3-peter.marko@siemens.com>
In-Reply-To: <20260808105147.42294-1-peter.marko@siemens.com>
References: <20260808105147.42294-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 10:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243039

From: Alexander Kanavin <alex@linutronix.de>

Add a patch to python3-spdx-python-model to support this release.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: f6557000abc90b0c3b7ca5b4560849e64425c853)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...e_1.0.1.bb => python3-shacl2code_1.1.0.bb} |  2 +-
 ...pdate-shacl2code-to-1.1.0-and-add-ke.patch | 41 +++++++++++++++++++
 .../python/python3-spdx-python-model_0.0.5.bb | 10 ++---
 3 files changed, 47 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-shacl2code_1.0.1.bb => python3-shacl2code_1.1.0.bb} (81%)
 create mode 100644 meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch

diff --git a/meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb b/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
index 904940926f..a9c8bec84f 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
 PYPI_PACKAGE = "shacl2code"
-SRC_URI[sha256sum] = "c856822b40c330452b8b31e94a658ad4595a5ef03cdb75ea432ea9c73d0cf7d9"
+SRC_URI[sha256sum] = "0f3a243c6482a0f95c5a793288d304908506b51b82dc6133de22be477cd75c24"
 
 inherit pypi python_hatchling
 
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch b/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
new file mode 100644
index 0000000000..d9dc0a03c8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
@@ -0,0 +1,41 @@
+From b623473f634aebeb30028cc746fb7a3da4fb2ce3 Mon Sep 17 00:00:00 2001
+From: Arthit Suriyawongkul <arthit@gmail.com>
+Date: Sat, 6 Jun 2026 02:44:48 +0100
+Subject: [PATCH] pyproject.toml: Update shacl2code to 1.1.0 and add keywords
+ (#35)
+
+Signed-off-by: Arthit Suriyawongkul <arthit@gmail.com>
+Upstream-Status: Backport [https://github.com/spdx/spdx-python-model/commit/2d7b71a7c8e6270a1c8795cdeb4f3dcd9393b3a9]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ pyproject.toml | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index c8b3e56..df011e8 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -8,6 +8,14 @@ authors = [
+     {name = "Joshua Watt", email = "JPEWhacker@gmail.com"},
+ ]
+ readme = "README.md"
++keywords = [
++    "spdx",
++    "sbom",
++    "spdx3",
++    "software-bill-of-materials",
++    "shacl2code",
++    "bindings",
++]
+ classifiers = [
+     "Development Status :: 4 - Beta",
+     "Intended Audience :: Developers",
+@@ -36,7 +44,7 @@ Issues = "https://github.com/spdx/spdx-python-model/issues"
+ requires = [
+     "hatchling >= 1.27.0",
+     "hatch-build-scripts >= 0.0.4",
+-    "shacl2code == 1.0.1",
++    "shacl2code == 1.1.0",
+ ]
+ build-backend = "hatchling.build"
+ 
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
index c77bdffada..19d9bb815b 100644
--- a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
+++ b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 PYPI_PACKAGE = "spdx_python_model"
 SRC_URI[sha256sum] = "4bcf7c6e5e2e8f0b787ed4eb8fb519e2ed776e820cb6d9eb93e44e98eb92ca2d"
 
-SRC_URI += " \
-    https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 \
-    https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 \
-    https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 \
-"
+SRC_URI += "https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 \
+           https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 \
+           https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 \
+           file://0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch \
+           "
 
 SRC_URI[spdx1.sha256sum] = "c72b0928f094c83e5c127784edb1ebca2af74a104fcacc007c332b23cbc788bd"
 SRC_URI[spdx2.sha256sum] = "c6a54b51230eb2bf3b31302546af201f303e0b7931c1db404d7f5b72b6f863e6"

