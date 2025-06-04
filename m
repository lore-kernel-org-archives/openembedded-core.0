Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7300AC5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 20:34:46 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.27419.1749069276063900234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 13:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1uMuoj-0002Av-IC; Wed, 04 Jun 2025 22:34:33 +0200
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1uMuoi-001qa3-2l;
	Wed, 04 Jun 2025 22:34:32 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1uMuoi-00Bdri-2Z;
	Wed, 04 Jun 2025 22:34:32 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH] barebox: upgrade 2025.04.0 -> 2025.05.0
Date: Wed,  4 Jun 2025 22:34:23 +0200
Message-Id: <20250604203423.2759460-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 20:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217966

Changes in 2025.05.0
--------------------

* RPMB support added for eMMC, enabling AVB persistent value storage
* New commands: 'tree', 'truncate', 'varinfo' (variable inspection)
* Added board support: STM32MP1-based Linux Automation TAC, FairyTux 2,
  Protonic MECT1S
* Unified Beaglebone build now produces MLO first‐stage image
* TLSF allocator becomes the default, replacing dlmalloc
* Various filesystem, CI, and driver cleanups and improvements

Full Changelog:
https://lore.barebox.org/barebox/aC2N-bXXRByPYqiM@pengutronix.de/

Migration Guide:
https://barebox.org/doc/latest/migration-guides/migration-2025.05.0.html

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index d6ea1eedfe..616da2a4ee 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.04.0"
+PV = "2025.05.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "3124f3c2b69d9ce0512b2d40fa17cace9c356f65f005a63da0474387b8839c41"
+SRC_URI[sha256sum] = "693f9aca90b282f6fb96024b70c06c9c57efe4eefe8e2298ef78eaa05c76fd5d"
-- 
2.39.5


