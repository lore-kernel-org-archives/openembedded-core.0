Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D626C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 21:02:44 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.572.1743541362897946551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 14:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tzikr-0002dO-0h; Tue, 01 Apr 2025 23:02:41 +0200
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tzikq-002pAK-2J;
	Tue, 01 Apr 2025 23:02:40 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tzikq-00DZbs-27;
	Tue, 01 Apr 2025 23:02:40 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH] barebox: upgrade 2025.02.0 -> 2025.03.0
Date: Tue,  1 Apr 2025 23:02:33 +0200
Message-Id: <20250401210233.3235121-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 21:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214151

Changes in 2025.03.0
--------------------

 * Support for Sunxi SoCs added.
 * Support for running on a Pine64+ as a generic barebox-dt-2nd.img image.
 * MMCs are now much faster to erase, reportedly up to 60x faster.
 * Fixed partition handling adapted to be Linux compatible
   (barebox,fixed-partitions)
 * i.MX HAB support now supports revoking keys and burning the field
   return fuse.
 * K3: support for eMMC boot partition booting and USB DFU bootstrapping.
 * Support for replacing single artifacts when booting bootspec entries.

Changelog: https://lore.barebox.org/barebox/Z9veR3N6puizrAT8@pengutronix.de/T/#u

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 4298966714..7fd7a88d71 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.02.0"
+PV = "2025.03.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "6da5f9e98a8c93f6eead3badefe133ed5fd865395b1a3c0192fdbdd9eb4f7311"
+SRC_URI[sha256sum] = "0bf7118004e445bdd57feeef89ee9064982acc221e8a046c4a7994d3da6da2ec"
-- 
2.39.5


