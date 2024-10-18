Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7946D2FFFF
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 12:15:28 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.20474.1729253726634296070
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 05:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1t1lt6-0007Gy-Vs; Fri, 18 Oct 2024 14:15:25 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t1lt6-000D7N-1Y;
	Fri, 18 Oct 2024 14:15:24 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t1lt6-0065P3-1P;
	Fri, 18 Oct 2024 14:15:24 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 1/2] barebox-tools: upgrade 2024.08.0 -> 2024.09.0
Date: Fri, 18 Oct 2024 14:14:23 +0200
Message-Id: <20241018121424.1449586-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206058

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 .../{barebox-tools_2024.08.0.bb => barebox-tools_2024.09.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/barebox/{barebox-tools_2024.08.0.bb => barebox-tools_2024.09.0.bb} (93%)

diff --git a/meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb b/meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
similarity index 93%
rename from meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb
rename to meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
index ed49ce5373..13a308b3da 100644
--- a/meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 DEPENDS = "bison-native flex-native libusb1"
 
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "b08a762da8d63dd18b4f2d9f5d0a8da001b6e608d1b3eff6dcebc6a2e575d535"
+SRC_URI[sha256sum] = "4d4ea7e232aeba2b3cb9ccf0dbf8cd8e01c65b6c615f64c3bd0c4f24f23a47da"
 
 S = "${WORKDIR}/barebox-${PV}"
 B = "${WORKDIR}/build"
-- 
2.39.5


