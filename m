Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532F8CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 07:33:26 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.6201.1761636797729380428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 00:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1vDeCh-0004gB-IE; Tue, 28 Oct 2025 08:33:15 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1vDeCg-005py4-18;
	Tue, 28 Oct 2025 08:33:14 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1vDeCg-0000000CtfI-1FUU;
	Tue, 28 Oct 2025 08:33:14 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH] barebox: upgrade 2025.08.0 -> 2025.09.0
Date: Tue, 28 Oct 2025 08:32:48 +0100
Message-ID: <20251028073305.3073787-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.47.3
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
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 07:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225380

Changes in 2025.09.0
--------------------

* Added support for SoCFPGA Agilex5 and Rockchip RK3576
* Added structured I/O support for shell commands
* Added support for booting signed Rockchip images
* Support for adding device tree overlay (.dtbo) files to FIT images
* New 'bfetch' eyecandy tool for displaying logo and system information
  (similar to 'neofetch')
* Several other fixes and improvements

Changelog: https://lore.barebox.org/barebox/aNugWfoJR_2AirEx@pengutronix.de/

Migration Guide:
https://barebox.org/doc/latest/migration-guides/migration-2025.09.0.html

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 864c6010c9..e41d0858fd 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.08.0"
+PV = "2025.09.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "b32f141ee708e87cb0cc01d626adafc07bd6eb52d62ca969287d7d27462eab32"
+SRC_URI[sha256sum] = "7df1aa47bb7bf1763a729137ac773e69a4052812af094475d739fc63a9295f0d"
-- 
2.47.3


