Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95E1C47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 22:46:24 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.8568.1708901183641296412
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 14:46:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1reNGH-00006G-6z; Sun, 25 Feb 2024 23:46:21 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1reNGG-002sZp-7r; Sun, 25 Feb 2024 23:46:20 +0100
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1reNGG-005TKA-0c;
	Sun, 25 Feb 2024 23:46:20 +0100
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH] wic: 'empty' plugin: fix typo in comment
Date: Sun, 25 Feb 2024 23:44:28 +0100
Message-Id: <20240225224428.1303678-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 22:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196175

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 scripts/lib/wic/plugins/source/empty.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/empty.py b/scripts/lib/wic/plugins/source/empty.py
index 0a9f5fa27c..4178912377 100644
--- a/scripts/lib/wic/plugins/source/empty.py
+++ b/scripts/lib/wic/plugins/source/empty.py
@@ -14,7 +14,7 @@
 # partition. This is useful to overwrite old content like
 # filesystem signatures which may be re-recognized otherwise.
 # This feature can be enabled with
-# '--soucreparams="[fill|size=<N>[S|s|K|k|M|G]][,][bs=<N>[S|s|K|k|M|G]]"'
+# '--sourceparams="[fill|size=<N>[S|s|K|k|M|G]][,][bs=<N>[S|s|K|k|M|G]]"'
 # Conflicting or missing options throw errors.
 
 import logging
-- 
2.39.2


