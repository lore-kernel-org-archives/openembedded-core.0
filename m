Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D12D13599
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 08:30:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.46759.1730104216053795116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 01:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8g-0000iV-5S; Mon, 28 Oct 2024 09:30:14 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-000omG-2j;
	Mon, 28 Oct 2024 09:30:13 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-001oDF-2P;
	Mon, 28 Oct 2024 09:30:13 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Andrej Valek <andrej.v@skyrain.eu>
Subject: [PATCH v2 8/9] busybox: disable long options in defconfig
Date: Mon, 28 Oct 2024 09:29:12 +0100
Message-Id: <20241028082913.418505-9-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028082913.418505-1-ejo@pengutronix.de>
References: <20241028082913.418505-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 08:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206432

These are activated by the longopts.cfg fragment, thus there should be
no need to set them in the defconfig.
The individual long options where enabled without mentioning a specific
need, mostly while adding the corresponding command, thus it should be
safe to disable them.

Note that we cannot disable the general 'LONG_OPTS' feature in the
defconfig since this is e.g. required by CONFIG_HWCLOCK (since v1.37).

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-core/busybox/busybox/defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 7481ea2d6b..ab74d2616d 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -148,7 +148,7 @@ CONFIG_FEATURE_SEAMLESS_Z=y
 # CONFIG_UNCOMPRESS is not set
 CONFIG_GUNZIP=y
 CONFIG_ZCAT=y
-CONFIG_FEATURE_GUNZIP_LONG_OPTIONS=y
+# CONFIG_FEATURE_GUNZIP_LONG_OPTIONS is not set
 CONFIG_BUNZIP2=y
 CONFIG_BZCAT=y
 # CONFIG_UNLZMA is not set
@@ -399,10 +399,10 @@ CONFIG_SETCONSOLE=y
 #
 # CONFIG_PIPE_PROGRESS is not set
 CONFIG_RUN_PARTS=y
-CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
+# CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS is not set
 # CONFIG_FEATURE_RUN_PARTS_FANCY is not set
 CONFIG_START_STOP_DAEMON=y
-CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
+# CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS is not set
 CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
 CONFIG_WHICH=y
 
@@ -1000,7 +1000,7 @@ CONFIG_TRACEROUTE=y
 # CONFIG_FEATURE_TUNCTL_UG is not set
 # CONFIG_VCONFIG is not set
 CONFIG_WGET=y
-CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+# CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
 CONFIG_FEATURE_WGET_STATUSBAR=y
 CONFIG_FEATURE_WGET_FTP=y
 CONFIG_FEATURE_WGET_AUTHENTICATION=y
-- 
2.39.5


