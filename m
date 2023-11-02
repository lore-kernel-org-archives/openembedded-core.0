Return-Path: <bst@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84022C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 17:04:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.36881.1698944655019024944
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 10:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: bst@pengutronix.de)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1qyb76-0005iD-NJ; Thu, 02 Nov 2023 18:04:12 +0100
From: Bastian Krause <bst@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Bastian Krause <bst@pengutronix.de>
Subject: [PATCH] linux-firmware: add new fw file to ${PN}-rtl8821
Date: Thu,  2 Nov 2023 18:04:08 +0100
Message-Id: <20231102170408.3502481-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 17:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190087

Extend the linux-firmware-rtl8821 package with rtw8821 firmware files for
Realtek RTL8821 variants.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 0e8005bfc9..33be741a0a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -825,6 +825,7 @@ FILES:${PN}-rtl8723 = " \
 "
 FILES:${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin \
+  ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin \
 "
 FILES:${PN}-rtl8761 = " \
   ${nonarch_base_libdir}/firmware/rtl_bt/rtl8761*.bin \
-- 
2.39.2


