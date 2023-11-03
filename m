Return-Path: <r.czerwinski@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F38C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 15:46:17 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.56403.1699026367944679968
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 08:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rcz@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rcz@pengutronix.de>)
	id 1qywN3-000231-Cj; Fri, 03 Nov 2023 16:46:05 +0100
Received: from [2a0a:edc0:0:1101:1d::54] (helo=dude05.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rcz@pengutronix.de>)
	id 1qywN3-006LoW-0H; Fri, 03 Nov 2023 16:46:05 +0100
Received: from rcz by dude05.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rcz@pengutronix.de>)
	id 1qywN2-00Govt-35;
	Fri, 03 Nov 2023 16:46:04 +0100
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Subject: [PATCH] glib-2.0: Remove unnecessary assignement
Date: Fri,  3 Nov 2023 16:45:50 +0100
Message-Id: <20231103154549.4001077-1-r.czerwinski@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rcz@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 15:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190165

FILES:${PN}-utils is += extended and than replaced completely later,
remove the first extension.

Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
---
 meta/recipes-core/glib-2.0/glib.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index b946e798bb..cec06b2f88 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -57,11 +57,6 @@ FILES:${PN} = "${libdir}/lib*${SOLIBS} \
                ${datadir}/glib-2.0/dtds \
                ${datadir}/glib-2.0/schemas"
 
-FILES:${PN}-utils += "${bindir}/glib-genmarshal \
-                      ${bindir}/glib-gettextize \
-                      ${bindir}/glib-mkenums \
-                      ${bindir}/glib-compile-resources"
-
 FILES:${PN}-dev += "${libdir}/glib-2.0/include \
                     ${libdir}/gio/modules/lib*${SOLIBSDEV} \
                     ${libdir}/gio/modules/*.la \
-- 
2.39.2


