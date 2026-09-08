Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74306C79FB2
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:58:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3676.1788861518869505669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=B9CB+xdL;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1491A1A1A58
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DDFAC603C4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39BDB11C7AF45;
	Tue,  8 Sep 2026 11:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788861516; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DkIBCCU7ELtTLTbXU+CtwIxaxF8E5QwdYm6gAWXMeDw=;
	b=B9CB+xdLoyRJ9BmSsYx443V3APhZAvh7ViNuy2RlEJ75EEvKXzXK60I2Ne+conp4wKLBji
	JzRXLCqd3jsaXS15yOHTVyyBhuefi96PtU1eKdGZOY/QoCDbcCEzlmMbJ/ndRbPQ8fuxLn
	CAUxm4eN+/J5hX8mGD7cp71OgcH8GBJPpTVmRNCORp1xJI2/MUzSsvCYg7JgQ3aaCpF4ej
	TORb1aaWD1MoU03bbGyFrpHGJSBIC8/g+ZEZQCMlq93oPo3vPoi+wonIrHEqX3YpSrXK8h
	0Zj3Bz+8wBmP02MDOVfrDqU+Q5XWWcJidGuJQ4sSf+3zrhhER9yaS8Fal08IyQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 08 Sep 2026 11:58:24 +0200
Subject: [PATCH 02/10] gst-devtools: upgrade 1.28.6 -> 1.28.7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-mathieu-gstreamer-1-28-7-v1-2-9694738804f6@bootlin.com>
References: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
In-Reply-To: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788861512; l=2032;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=pksNxQeSdzwDb5h8DR2YsoUarLBXWudEK7MNvIcqbVE=;
 b=mtecObYj+UvBBm9lfjTU2Pfgt2k5R6UzNBjUXn+k+unS/MZfyhYucy2TsyfVrINrN11mEBqAy
 CUPR9HPykuUCx01Q0v2qd2K+omdnPRenpFlsEoL4M1IzguR7xX5EscT
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245342

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../gst-devtools/0001-connect-has-a-different-signature-on-musl.patch   | 2 +-
 .../gstreamer/{gst-devtools_1.28.6.bb => gst-devtools_1.28.7.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index a348624e490d..3f07a429e0b5 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From bb36ab400ee8b84b8f604aa3314952b7df2aeda6 Mon Sep 17 00:00:00 2001
+From 80ad3bf3c51cf013480777db355504c4308d9030 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.6.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.28.6.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.7.bb
index 60fd92e0a8ef..ec07499f6717 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "14d41faae03619251f95959d3d57bf65c6106838b3b54218dc95c7135e1eba13"
+SRC_URI[sha256sum] = "9f3a389d6a7efa5a18d7564724a7f3b1c3faecffcb8fd1351ed0e811d1873ad5"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"

-- 
2.47.3


