Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7D0D1359C
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 08:30:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.46746.1730104216245641083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 01:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8g-0000iT-1U; Mon, 28 Oct 2024 09:30:14 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-000omC-2X;
	Mon, 28 Oct 2024 09:30:13 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-001oD7-2J;
	Mon, 28 Oct 2024 09:30:13 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Andrej Valek <andrej.v@skyrain.eu>
Subject: [PATCH v2 6/9] busybox: disable defconfig options from unicode.cfg
Date: Mon, 28 Oct 2024 09:29:10 +0100
Message-Id: <20241028082913.418505-7-ejo@pengutronix.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206428

Accidentally enabled in
4335cd24 ("busybox: refresh the defconfig from 1.33.0").

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-core/busybox/busybox/defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 116286227b..a65ae674d8 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -116,13 +116,13 @@ CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
 # CONFIG_FEATURE_EDITING_WINCH is not set
 # CONFIG_FEATURE_EDITING_ASK_TERMINAL is not set
 # CONFIG_LOCALE_SUPPORT is not set
-CONFIG_UNICODE_SUPPORT=y
+# CONFIG_UNICODE_SUPPORT is not set
 # CONFIG_UNICODE_USING_LOCALE is not set
-CONFIG_FEATURE_CHECK_UNICODE_IN_ENV=y
-CONFIG_SUBST_WCHAR=63
-CONFIG_LAST_SUPPORTED_WCHAR=767
-CONFIG_UNICODE_COMBINING_WCHARS=y
-CONFIG_UNICODE_WIDE_WCHARS=y
+# CONFIG_FEATURE_CHECK_UNICODE_IN_ENV is not set
+CONFIG_SUBST_WCHAR=0
+CONFIG_LAST_SUPPORTED_WCHAR=0
+# CONFIG_UNICODE_COMBINING_WCHARS is not set
+# CONFIG_UNICODE_WIDE_WCHARS is not set
 # CONFIG_UNICODE_BIDI_SUPPORT is not set
 # CONFIG_UNICODE_NEUTRAL_TABLE is not set
 # CONFIG_UNICODE_PRESERVE_BROKEN is not set
-- 
2.39.5


