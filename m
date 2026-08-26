Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0657C61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:34:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7838.1787733258955358184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=K1yKbcfy;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2AAB21A182B
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3668604EC
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1882011C7AC91;
	Wed, 26 Aug 2026 10:34:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733252; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sClzcXOCv0XbHehc9aBtm32OqbXbHB6xRUGlzaMfxio=;
	b=K1yKbcfy3atYRpDSUVQpFYnMGwWi27LjFwo5irQ414EiykJEZyqpSk47xgaoYZjW5u7g7C
	aQnQI5MwjR2bEY2iPqVFQfOuys8vZTOESxT7MYbEMswBgFY4HEoFnxtwku8miweY+dgGuv
	CaqT/uf+2dTeNGmcYPN5boBVCxQlp16rsFhKDq/PoBJ9Ko23zeg6+hUhMu+ey64wFYE7VG
	34kU9XR0qSnCO60B5dZijupeLGHL36UQ5vLf9B0YqyXpJwBv/kxwcJnlsRg8XZ1IClTxbo
	cYYWrtIKKqVl02oqG/3QIB57/oTam6sVnn29/1yCKrQvhJ3oM7eMvfKOfqZyWA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 26 Aug 2026 10:33:43 +0200
Subject: [PATCH 4/8] python3-cryptography: upgrade 50.0.0 -> 50.0.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-mathieu-updates-20260826-v1-4-4082bbc152f2@bootlin.com>
References: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
In-Reply-To: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787733232; l=4054;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=vB8hkouttjXXb6G2bNuEenROkqLB/t8UH8on1pkq8RU=;
 b=hoxxeUfZOGqNfzDyvflAlH7Ch8wA0efV3UfDYrylokBXXRaRBpn0sjlJJEw0NhbfMfamG3JE8
 +n4VmSnBFVKBRQlyaATyQKSWeCYTYBgS3S6FTsktkt47RH7wHMCaaRn
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244372

Changelog:

* Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 4.0.2.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-devtools/python/python3-cryptography-common.inc      | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb      | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb              | 2 +-
 .../0001-pyproject.toml-remove-benchmark-disable-option.patch     | 8 +++-----
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 298c52d1d3a8..d37f52358d3f 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "50.0.0"
+PV = "50.0.1"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index d62d681c6d41..0f25199f68d8 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "6760814930443e6d73a6afcad09463d3ffdc42084ee0bdcfb2f05697250c3c8d"
+SRC_URI[sha256sum] = "90066d0f7351b12ebac2b4ce594ce0a6f05c19ad3068e4d5cfc64d9d2bec8d80"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index d6a1bb53f3a7..f2ac4e1b89f4 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "eeac2acb5a20ed25e0ad6d1df9891a520b78b404266b6d11778f25d5d691a6c9"
+SRC_URI[sha256sum] = "5dd9bda1c12b4162f6ff568eeb5e0ff956c28d14406e875cfe8a63a2d414ff20"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 967b661c6e17..454e08605aa6 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From c8fd85d80eb64fede8447842042977b70b3c96bc Mon Sep 17 00:00:00 2001
+From 74473daa46b315f3d98fbf9a6a58f52c9c29a365 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,17 +26,15 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index fb8185913..29d0b3e08 100644
+index b56cda9..781743b 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -140,7 +140,7 @@ exclude = [
  ]
-
+ 
  [tool.pytest.ini_options]
 -addopts = "-r s --capture=no --strict-markers --benchmark-disable"
 +addopts = "-r s --capture=no --strict-markers"
  testpaths = ["tests"]
  console_output_style = "progress-even-when-capture-no"
  markers = [
---
-2.43.0

-- 
2.47.3


