Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B73E743F2
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 07:42:45 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.12582.1695973360850259065
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 00:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1qm890-0000BM-3m; Fri, 29 Sep 2023 09:42:38 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1qm88y-009lJq-RF; Fri, 29 Sep 2023 09:42:36 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1qm88y-007GOC-IG; Fri, 29 Sep 2023 09:42:36 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] packagegroup-base: clean up setting packagegroup-machine-base's SUMMARY
Date: Fri, 29 Sep 2023 09:42:34 +0200
Message-Id: <20230929074234.1731279-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 07:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188391

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 83907ca20663..70a10350031d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -129,7 +129,6 @@ RRECOMMENDS:packagegroup-distro-base = "${DISTRO_EXTRA_RRECOMMENDS}"
 #
 # packages added by machine config
 #
-SUMMARY:packagegroup-machine-base = "${MACHINE} extras"
 SUMMARY:packagegroup-machine-base = "Extra packages required to fully support ${MACHINE} hardware"
 RDEPENDS:packagegroup-machine-base = "${MACHINE_EXTRA_RDEPENDS}"
 RRECOMMENDS:packagegroup-machine-base = "${MACHINE_EXTRA_RRECOMMENDS}"
-- 
2.39.2


