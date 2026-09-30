Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6BBCA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8500.1790756227681893863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fByBiucN;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 104C71A107D
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D925D60749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 964AC103298BD;
	Wed, 30 Sep 2026 10:17:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756224; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rGtJiG+D8bzqbGMQcGncoF3AC4dG9PviZ5St5Djbmz8=;
	b=fByBiucNZC50hNpfNMAvRpFYlBFC/x017cuQG/LXcTso1u0UST82mFLqPuSfndXgTZpVBT
	aSAVAkTdMQrZw+E7XLH8pLTX4G2OZyJeLTHdZ4I2ekwCPj+z5yNKQKbPQYnuVqjEIyqDAk
	95cesuOK/kNf1AYBzyuqGiCuY77yRphOnEZnFmqEzqP/cA9nW/pWXgiujIPH6SOY4L8V16
	RbP/7nnJuJY/rfW6A9EeKzbgx092MW0DxWuGwJJYKMlEZf+CqAdxMkGZqy4lK+kFHNpR8r
	974P3dyllXgDNooVa9OgC3VOzOQXQgrZvrfOJ3WNrI74LPCoUS9TJZ8WPAaw9g==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:46 +0200
Subject: [PATCH 21/24] diffoscope: upgrade 331 -> 332
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-21-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=1149;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=Mrrszt6O8cLt+24mBhU1tmEVstrKjG3gawaPGGfvtLg=;
 b=Ni/Uoo3X63frNudCQb+pkCwKsuV+Y8417/F+w4QTYcFmxJ0HHyY8QKNpC4iiNUSHB9cCrrJjY
 B97Ex7e2KHHDCDWz7TaRTHqGUxK4EmIDvVFGUQpYfGgbOV7Ht+ZXBXi
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246945

Changelog:
- Do not Build-Depend on GNU Guix. Thanks to Vagrant and Holger for the
  reports.
- Update more tests to support new versions of Radare.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../recipes-support/diffoscope/{diffoscope_331.bb => diffoscope_332.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/diffoscope/diffoscope_331.bb b/meta/recipes-support/diffoscope/diffoscope_332.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_331.bb
rename to meta/recipes-support/diffoscope/diffoscope_332.bb
index 3c64e1231816..a43b20b4608c 100644
--- a/meta/recipes-support/diffoscope/diffoscope_331.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_332.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "298a62c374f5d60dd3d3af38cdea21cbad7148c84dbfe9cc5a91fdb1b5af4e37"
+SRC_URI[sha256sum] = "da858807ce2535f1bb5c3942020b01c7aef14f870257c964b70cd4e1f2333206"
 
 RDEPENDS:${PN} += "\
         binutils \

-- 
2.47.3


