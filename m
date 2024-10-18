Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CABD30000
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 12:15:28 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.20775.1729253727034260219
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 05:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1t1lt6-0007Gz-Vs; Fri, 18 Oct 2024 14:15:25 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t1lt6-000D7O-1c;
	Fri, 18 Oct 2024 14:15:24 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t1lt6-0065P7-1T;
	Fri, 18 Oct 2024 14:15:24 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 2/2] barebox: upgrade 2024.08.0 -> 2024.09.0
Date: Fri, 18 Oct 2024 14:14:24 +0200
Message-Id: <20241018121424.1449586-2-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241018121424.1449586-1-ejo@pengutronix.de>
References: <20241018121424.1449586-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 12:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206059

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 .../barebox/{barebox_2024.08.0.bb => barebox_2024.09.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/barebox/{barebox_2024.08.0.bb => barebox_2024.09.0.bb} (89%)

diff --git a/meta/recipes-bsp/barebox/barebox_2024.08.0.bb b/meta/recipes-bsp/barebox/barebox_2024.09.0.bb
similarity index 89%
rename from meta/recipes-bsp/barebox/barebox_2024.08.0.bb
rename to meta/recipes-bsp/barebox/barebox_2024.09.0.bb
index 98e8aa053b..d2a3d4ebd1 100644
--- a/meta/recipes-bsp/barebox/barebox_2024.08.0.bb
+++ b/meta/recipes-bsp/barebox/barebox_2024.09.0.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 inherit barebox
 
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "b08a762da8d63dd18b4f2d9f5d0a8da001b6e608d1b3eff6dcebc6a2e575d535"
+SRC_URI[sha256sum] = "4d4ea7e232aeba2b3cb9ccf0dbf8cd8e01c65b6c615f64c3bd0c4f24f23a47da"
-- 
2.39.5


