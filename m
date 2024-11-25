Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFCFD3B7FF
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 10:23:22 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.15976.1732530200780360715
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 02:23:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tFWFS-0008MR-UU; Mon, 25 Nov 2024 11:23:18 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tFWFR-0003yq-2l;
	Mon, 25 Nov 2024 11:23:18 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tFWFS-0058AL-1m;
	Mon, 25 Nov 2024 11:23:18 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/3] barebox: upgrade 2024.09.0 -> 2024.10.0
Date: Mon, 25 Nov 2024 11:22:26 +0100
Message-Id: <20241125102227.1216656-2-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125102227.1216656-1-ejo@pengutronix.de>
References: <20241125102227.1216656-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 10:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207729

Regular barebox release.

* cleanups and bug fixes
* larger font for high-res displays

Changelog: https://lore.pengutronix.de/barebox/ZxIdBi3xLj0dHqzi@pengutronix.de/T/

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 .../barebox/{barebox_2024.09.0.bb => barebox_2024.10.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/barebox/{barebox_2024.09.0.bb => barebox_2024.10.0.bb} (90%)

diff --git a/meta/recipes-bsp/barebox/barebox_2024.09.0.bb b/meta/recipes-bsp/barebox/barebox_2024.10.0.bb
similarity index 90%
rename from meta/recipes-bsp/barebox/barebox_2024.09.0.bb
rename to meta/recipes-bsp/barebox/barebox_2024.10.0.bb
index 4b24ab945e..c886fcfba3 100644
--- a/meta/recipes-bsp/barebox/barebox_2024.09.0.bb
+++ b/meta/recipes-bsp/barebox/barebox_2024.10.0.bb
@@ -14,4 +14,4 @@ inherit barebox
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2 \
            file://0001-lib-lz4-use-lz4-instead-of-lz4c.patch \
            "
-SRC_URI[sha256sum] = "4d4ea7e232aeba2b3cb9ccf0dbf8cd8e01c65b6c615f64c3bd0c4f24f23a47da"
+SRC_URI[sha256sum] = "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16dee7442d71a5af88d"
-- 
2.39.5


