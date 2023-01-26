Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80D9C54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 06:46:31 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.68330.1674715583387305409
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 22:46:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKw1d-0008Bx-EO; Thu, 26 Jan 2023 07:46:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKw1b-000V3I-SS; Thu, 26 Jan 2023 07:46:18 +0100
Received: from jlu by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKw1Z-00FxQi-PB; Thu, 26 Jan 2023 07:46:17 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [OE-core][PATCH] p11-kit: add native to BBCLASSEXTEND
Date: Thu, 26 Jan 2023 07:46:13 +0100
Message-Id: <20230126064612.3803320-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 06:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176382

This recipe is needed to build softhsm (in meta-oe) in with p11-kit
support, which is useful when multiple PKCS#11 modules need to be used.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta/recipes-support/p11-kit/p11-kit_0.24.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
index 59cbb67961ac..72b446204a1c 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
@@ -29,4 +29,4 @@ FILES:${PN} += " \
 # PN contains p11-kit-proxy.so, a symlink to a loadable module
 INSANE_SKIP:${PN} = "dev-so"
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


