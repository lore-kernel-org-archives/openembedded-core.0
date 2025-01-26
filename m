Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA91C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 11:51:53 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.28809.1737892298386756625
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 03:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tc1Au-0006Ir-1a; Sun, 26 Jan 2025 12:51:36 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tc1At-001wmq-2E;
	Sun, 26 Jan 2025 12:51:35 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tc1At-004orF-22;
	Sun, 26 Jan 2025 12:51:35 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Andrej Valek <andrej.v@skyrain.eu>
Subject: [PATCH] busybox: drop net-tools from defconfig
Date: Sun, 26 Jan 2025 12:51:04 +0100
Message-Id: <20250126115104.1148761-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 11:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210276

The 'net-tools' have been deprecated 15 years ago! [1]
Let's remove their busybox pendants from the defconfig to prevent people
from accidentally starting projects with ancient technology.

[1] https://lists.debian.org/debian-devel/2009/03/msg00780.html

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-core/busybox/busybox/defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 38b82457b7..22c9dafcb3 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -899,11 +899,11 @@ CONFIG_FEATURE_HTTPD_PORT_DEFAULT=0
 # CONFIG_FEATURE_HTTPD_LAST_MODIFIED is not set
 # CONFIG_FEATURE_HTTPD_DATE is not set
 # CONFIG_FEATURE_HTTPD_ACL_IP is not set
-CONFIG_IFCONFIG=y
-CONFIG_FEATURE_IFCONFIG_STATUS=y
+# CONFIG_IFCONFIG is not set
+# CONFIG_FEATURE_IFCONFIG_STATUS is not set
 # CONFIG_FEATURE_IFCONFIG_SLIP is not set
 # CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ is not set
-CONFIG_FEATURE_IFCONFIG_HW=y
+# CONFIG_FEATURE_IFCONFIG_HW is not set
 # CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
 # CONFIG_IFENSLAVE is not set
 # CONFIG_IFPLUGD is not set
@@ -950,7 +950,7 @@ CONFIG_NC=y
 # CONFIG_NC_SERVER is not set
 # CONFIG_NC_EXTRA is not set
 # CONFIG_NC_110_COMPAT is not set
-CONFIG_NETSTAT=y
+# CONFIG_NETSTAT is not set
 # CONFIG_FEATURE_NETSTAT_WIDE is not set
 # CONFIG_FEATURE_NETSTAT_PRG is not set
 CONFIG_NSLOOKUP=y
@@ -964,7 +964,7 @@ CONFIG_PING=y
 CONFIG_PING6=y
 CONFIG_FEATURE_FANCY_PING=y
 # CONFIG_PSCAN is not set
-CONFIG_ROUTE=y
+# CONFIG_ROUTE is not set
 # CONFIG_SLATTACH is not set
 # CONFIG_SSL_CLIENT is not set
 # CONFIG_TC is not set
-- 
2.39.5


