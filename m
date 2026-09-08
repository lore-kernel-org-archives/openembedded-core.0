Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67FCC79FB4
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:58:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3546.1788861523121916066
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=paJx+BLq;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6F6691A1A52
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 449F7603C4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D37411C7AF4F;
	Tue,  8 Sep 2026 11:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788861520; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DmNO9LUM6Wj+sPS3A/wBugWsO2593FuEUSs+kw21DHc=;
	b=paJx+BLq1mNdnz8Rgy88qo6iGHr/d9/RV+zyCitsi5tv6p0n4msxGOCSoY8qj/YmM00+89
	Gy6JzDwc81/e/BXp4Wr3wjRiuWz0UNP3o/JlB1LMeaCuQKArC5W/sb7apTOigxH4HjGuny
	/nNKI0gN+lYDZUwqKnIjKN7ZVRA9ZRrrAGLjwFXn8UaCcRREsyR2hAz7IPsd22uWjQtfKB
	xR5wd5A9pZldxcjDX/0aHoX5l+eiFA4Lhsu9s1HRzNn02b4oYL7zWZaL39cX0tsERsRJXo
	SR79rp2JC9FE17qDBjehFC7oZlr0MLzCpGnIDJrbD3TVzzE2H49b0jJNbYx+Gg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 08 Sep 2026 11:58:31 +0200
Subject: [PATCH 09/10] gstreamer1.0-libav: upgrade 1.28.6 -> 1.28.7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-mathieu-gstreamer-1-28-7-v1-9-9694738804f6@bootlin.com>
References: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
In-Reply-To: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788861512; l=1148;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=3Kzn/AH61K+p27ooNRUSMBRI1Du7E8u0zGKTBkrYMt8=;
 b=THnFF1y8aPayBBekYtYpoC6M/z9/YymuWqYjJoBEqbHZlimmIzs1BdDgfoL7nSOCn8DVS8G4J
 B4gAeKWKeJjCnAzMhWTjbdu5QcoABjpDoQUD3eMhGVVuJHzWgy0r5hL
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245349

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../{gstreamer1.0-libav_1.28.6.bb => gstreamer1.0-libav_1.28.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.7.bb
index 3a1c80c15276..0eb98da0215e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "71e6eafb4fff2a66d1bb0ba8d078224dfe7e3397307d8c0bba3dc23606e08f51"
+SRC_URI[sha256sum] = "58da51dd39ecf1cf6faade34cc6412001be2e2e145bca8ae0f45336f60a36ab2"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 

-- 
2.47.3


