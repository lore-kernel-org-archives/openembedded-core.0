Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB856C982E7
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:05 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1672.1789682879446091641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=n4V4xq0q;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so732715e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682878; x=1790287678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=luF8XoDCDhg5jTpiKUdXEMXwvUCSqvPma1BoMoL+d0Y=;
        b=n4V4xq0qBcBwR4NpBfP/yJabiey93eUnMWL0bn3CM69tFL/yCBFRV3pKFVPeR08r8M
         F88ysPgg5IwoZRsgtUqXOrlUozQV4mKNtU4u42qmKDHW8riH2bq9kwOpc0g+12jR62E2
         1Po+Ad0ZH/fzNv5njz/3FZ+hl45Jr7b3e3KMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682878; x=1790287678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=luF8XoDCDhg5jTpiKUdXEMXwvUCSqvPma1BoMoL+d0Y=;
        b=GaO62E+/m7E6rwjDtrQaSVTeSYUum+41kushURjy6UOVK01X2bA7+CSqGX01aSMpzj
         8UJwx3ke5JLkwVL2r3jgzsul2foj+a68CyLp5NCmKl464kk4UUbq1ZG6F9bP5ddZC3xQ
         QpNl3a86zYUp15kVZcRa+tCcQ76NOYTZeFgWAsGn49q5sO9Un/thkvWtslCpc6snEWZq
         Gh0ZwRHlNsTxdaOahingJ6X5jrMUF9vP84NSpmNr44WXSOa821ONTYQI848G+HR7BFyg
         qqnwUX9R/tt6lzX9dskkxHEVG7VFCl3VRCqpf7eMUaa06eFbZy29CjxW4O83rKCgfea+
         elew==
X-Gm-Message-State: AFuF++m5FkS5jj+bU75/Sqz8wkXnjFbQHofXE0IdW92a0QN17qln5P0r
	RYQbATuW00ZBnxY5JquohOjMwL5jg7o7hAXW5IYXoeqb2q0F858p4Tk5tlqViPjwLYyAnbZTFkR
	9SUBfeIs=
X-Gm-Gg: AYBFou2X4FD9FLHPyuyY9uXDt9t96lu+ZnCHWpbShgL/Xj+xmRpTOaLLzegsdYSNZoC
	vvVF1tYIsd2u9Cx5TncU4Hu9zrvU3KOmF8VRX4W1RfLUT4Vk7mHzzXYU9H22M8+n1Y10N4y7jUs
	WYhqzYRatNsPoKgYxF3NEB6QT5M9RqFAIX035xK3LbAroX2r7gw7p7hq3RaQtvSGqUWEGhue35J
	t/GExzVIDGVClA3PEqA1yfQa8+Hj75nq2UKjkzQfB6ABAhdlvlfU0/44SmJbjPGYQg379Ptgl8Q
	DKHGRgcASPNhohzzUMGU3mRjcskNtf83X6XsVQXGOUyv5pHcdXJ5XieVugeuMDKJAlOm5cd1tMe
	Z1wodkbfV3t2BduOofj9mm/Wf0dQB7Q2NzrOhlSt8Vajpf7K/YDvCXzkqXr3mtVqJpDSRsJMGBR
	TyoVH2e4s/SdpolXvVX5ZsufwOWHFH6JUgKf/FLm8nGclYWkKq/EwZFIqO95EPsyt/ebmmW7OSs
	xsJc4gLC2fkzlzs7pUb9RdYvvacYZ3rqAPc32eJF05sr0wX6geVSdGDRqLecwjsG0+ckvBVBx0=
X-Received: by 2002:a05:600c:468d:b0:49d:93c:d903 with SMTP id 5b1f17b1804b1-49fc5746554mr3343195e9.20.1789682877640;
        Thu, 17 Sep 2026 15:07:57 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/79] python3-spdx-python-model: update from version 0.0.5 to 0.0.6
Date: Fri, 18 Sep 2026 00:06:01 +0200
Message-ID: <93065713246d5b0a4d0393d9f4357674e7013f1c.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246111

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

Drop the patch which should no longer be necessary. This is a partial
revert of f6557000abc90b0c3b7ca5b4560849e64425c853

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9b5c92cd6b8ef8a56ebc3815120fd4af5872173c)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: Changelog: https://github.com/spdx/spdx-python-model/releases/tag/v0.0.6]
---
 ...pdate-shacl2code-to-1.1.0-and-add-ke.patch | 41 -------------------
 ....bb => python3-spdx-python-model_0.0.6.bb} | 12 +++---
 2 files changed, 6 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
 rename meta/recipes-devtools/python/{python3-spdx-python-model_0.0.5.bb => python3-spdx-python-model_0.0.6.bb} (72%)

diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch b/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
deleted file mode 100644
index d9dc0a03c8d..00000000000
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
index 19d9bb815ba..def12b20492 100644
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

