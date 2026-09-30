Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6944DCA5FC6
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:16:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8489.1790756211095535426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xJgc8s/2;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 22B2B1A1082
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBDC860749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26FEA103298B1;
	Wed, 30 Sep 2026 10:16:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756208; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xvP8kQFet8pco2BkXzejHEyfIXtE+Vyn+qJ3MHvA8no=;
	b=xJgc8s/2NOVeZy0LYcEcYFuetqxg0isXNA8hf6y6PvRm7LCJSTbn7EcjjJeH7WiDAbLQlq
	1Z1YWgXLQuSxHzm3FcEsh5hGk/pZQqmw/bsHNgfGE50EN+cthronhIahQlldXai0kySQcS
	aLGqnBbnnXOAe8xkjp64z8aRNyYYz0fVHgPCgZPz12autZQyLUbKUzwkskZ8zWIttXKrRY
	8eYgoIlBRXmucLra/iVhK0MzT1FjKmNLkL1PGwhTCuQf2/YqbyFqNcY/NrMyT3gR8WBN4s
	ZTfnxSWXUrrJlKb4Ia3xOBqG3lqKygozS4KhPaTr9+w9sVrkQQJ2ZFarWtpYsQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:30 +0200
Subject: [PATCH 05/24] gnupg: upgrade 2.5.22 -> 2.5.24
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-5-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=4659;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=09VpZC+SYCGg0VEZz24b3ZAiWGajL1vHOdONit2QrtA=;
 b=UiK/01jChOdtAUlAgblXoJqCyhDGrZdfoFtoFZ8n05FRGm8jN4UwVIkdkFqCoTnh8OuEx7Rz1
 +DqyT+rEMHFC3NJGfywpWvtJZq0G7y4xCw83EXclPBZ3unsHbl6yffu
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246929

Noteworthy changes in version 2.5.24 (2026-09-23)
- Bug fixes:
 - scd: Fix for regression in 2.5.23 related to the new Nitrokey
   detection.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch    | 2 +-
 .../0001-configure.ac-use-a-custom-value-for-the-location-of-.patch   | 4 ++--
 .../gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch       | 2 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch                       | 2 +-
 meta/recipes-support/gnupg/{gnupg_2.5.23.bb => gnupg_2.5.24.bb}       | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 707bba9faf94..4d6e364a65c9 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 1c8f78f659e094aa924e1a84326a086701e803c9 Mon Sep 17 00:00:00 2001
+From abe388c8f38df7cd2f0641f17c6f872dd847c330 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 94120195a781..95f62ff26d0f 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From ff6e519a6034d331a82d8018772db940191a3887 Mon Sep 17 00:00:00 2001
+From f8d096e62c06085e93a339bc2d7421a65c437e6f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 59e2bce..4eff4a8 100644
+index 51ffbc6..39924db 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1910,7 +1910,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index c30677e80de3..6b2cfc250397 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From a0a9afc96bcf352324109496a3c5419133002afe Mon Sep 17 00:00:00 2001
+From 7d42cbba53eddce53d1763d7ffe70e728d7b0445 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 2775967303dd..0bffeb0a69e4 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 4d15672a7dadaa0d21ef9339a065af20a49b5348 Mon Sep 17 00:00:00 2001
+From 4c4068e6f8a180737d1b28c6914387bc0a485df3 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.23.bb b/meta/recipes-support/gnupg/gnupg_2.5.24.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.23.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.24.bb
index 139e1c9ef2e6..3e562250d70a 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.23.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.24.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "97ebba329ed0aa1ed24395b6a485a3626680f4c19232c62a0c0f0433c726e2bd"
+SRC_URI[sha256sum] = "bf149d01a2b9fcc0e4589b8ae8697d3d5c557ea48ed95a3fa55dd3b1187e6039"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \

-- 
2.47.3


