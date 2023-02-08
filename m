Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E474C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 13:34:17 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.8348.1675863248911346998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 05:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pPkaM-00023L-Mz; Wed, 08 Feb 2023 14:34:06 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pPkaK-003WqW-OF; Wed, 08 Feb 2023 14:34:05 +0100
Received: from jlu by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pPkaL-00861M-77; Wed, 08 Feb 2023 14:34:05 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Jan Luebbe <jlu@pengutronix.de>
Subject: [OE-core][PATCH] systemd: add PACKAGECONFIG for pstore
Date: Wed,  8 Feb 2023 14:34:01 +0100
Message-Id: <20230208133400.1929248-1-jlu@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 13:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176906

pstore is used to collect crash logs in the journal after a crash. As it
needs a correctly configured kernel, it's not always enabled. Add a
PACKAGECONFIG to enable it when needed.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta/recipes-core/systemd/systemd_252.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_252.4.bb b/meta/recipes-core/systemd/systemd_252.4.bb
index e6c873f53be2..64a3efa1d413 100644
--- a/meta/recipes-core/systemd/systemd_252.4.bb
+++ b/meta/recipes-core/systemd/systemd_252.4.bb
@@ -185,6 +185,7 @@ PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
 # hostname without acquiring additional privileges
 PACKAGECONFIG[polkit_hostnamed_fallback] = ",,,,dbus-broker,polkit"
 PACKAGECONFIG[portabled] = "-Dportabled=true,-Dportabled=false"
+PACKAGECONFIG[pstore] = "-Dpstore=true,-Dpstore=false"
 PACKAGECONFIG[qrencode] = "-Dqrencode=true,-Dqrencode=false,qrencode,,qrencode"
 PACKAGECONFIG[quotacheck] = "-Dquotacheck=true,-Dquotacheck=false"
 PACKAGECONFIG[randomseed] = "-Drandomseed=true,-Drandomseed=false"
-- 
2.30.2


