Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D514BC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 12:19:51 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.13778.1753366199866579567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 07:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: m.tretter@pengutronix.de)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1uewdx-0004vs-Uq; Thu, 24 Jul 2025 16:09:57 +0200
From: "Michael Tretter" <m.tretter@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Michael Tretter <m.tretter@pengutronix.de>
Subject: [OE-core][PATCH] barebox-tools: install rk-usb-loader
Date: Thu, 24 Jul 2025 16:09:57 +0200
Message-Id: <20250724140957.4167089-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 12:19:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221069

The rk-usb-loader is already enabled in the hosttools_defconfig and
targettools_defconfig and compiled by the recipe.

Add it to the BAREBOX_TOOLS list to actually install it.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 meta/recipes-bsp/barebox/barebox-tools.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
index e519796c1d29..eb327306d915 100644
--- a/meta/recipes-bsp/barebox/barebox-tools.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -39,6 +39,7 @@ BAREBOX_TOOLS = " \
          omap3-usb-loader \
          omap4_usbboot \
          imx/imx-usb-loader \
+         rk-usb-loader \
          "
 
 BAREBOX_TOOLS_SUFFIX = ""

