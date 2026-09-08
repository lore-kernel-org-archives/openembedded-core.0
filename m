Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABABCC79FA1
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:58:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3681.1788861524397330831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=miDir9nH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BC4111A1A56
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A062603C4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 241C211C7AF51;
	Tue,  8 Sep 2026 11:58:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788861521; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DevB5GvWSuVWjUPU7CA8ydR1dV0wcVh9OrBOL9Xr9rY=;
	b=miDir9nHpw80sK3hR72hGZ8buJwOLngbX6xEc9szFpQJBUe10iTXNHOVOrbwo5CFJ9q2qJ
	EUZoKAMm6mbM+u57tv7NhMFRVqhHMz7+7sOZFXCS6GKsJxytomR5grEkWFyx1NMJx878F9
	p1AsEr+uA/GZHvbwOnSLsPJ1TUM7oamnyMfxDqkbGs1cHR0cEXtlnnyDiHInQe2JFuPoKX
	jrXUg8i9iuE++EFSkK+/RyMhJ9rtRE/us3r8a/yExtYhoJZfQxm/leGdcfIk9xkBhizoqR
	6z64M0OugauuaNUh+kVPihqDxodFs1fpWWCOIPKr1RbZnVVh7Oxb9XJmZOE4eQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 08 Sep 2026 11:58:32 +0200
Subject: [PATCH 10/10] gstreamer1.0-rtsp-server: upgrade 1.28.6 -> 1.28.7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-mathieu-gstreamer-1-28-7-v1-10-9694738804f6@bootlin.com>
References: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
In-Reply-To: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788861512; l=1116;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=7LVtxtOzY2H4RrsA/UU0tAqcXO3SNz/LvyhG9LglhF4=;
 b=oxP8puk+QW2khhEoMV6/jVpTQKZ3fISj/Dg/5h1Gkw6M1uDtuW9SsHHMv+FdpweyIQgSJnyen
 Zsuvccag0X/B2+LhBP3sM2XrP5PMuHNA3i9TwnQzq1julXZ2lknH9Go
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245350

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...amer1.0-rtsp-server_1.28.6.bb => gstreamer1.0-rtsp-server_1.28.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.7.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.7.bb
index f775dd08e7cc..9c5ce9e59c0c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.7.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "0cb725b1351f75e88803c55dddea1f27be09523ddcd7f29ab18270e182a2a463"
+SRC_URI[sha256sum] = "de43a59a0c89a14eb1c14ae8e81e5b45c4e9d7b1f930b0ebaad360f9b5e0b5c4"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 

-- 
2.47.3


