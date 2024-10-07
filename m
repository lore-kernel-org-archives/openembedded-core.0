Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B33CFB43F
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 12:10:03 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.51430.1728303001943714669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 05:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYq-0004Yy-4h; Mon, 07 Oct 2024 14:10:00 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYp-0007YB-D1; Mon, 07 Oct 2024 14:09:59 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYp-0047Oa-19;
	Mon, 07 Oct 2024 14:09:59 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 6/9] busybox: disable defconfig options from unicode.cfg
Date: Mon,  7 Oct 2024 14:09:47 +0200
Message-Id: <20241007120950.975803-7-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241007120950.975803-1-ejo@pengutronix.de>
References: <20241007120950.975803-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 12:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205262

Accidentally enabled in
4335cd24 ("busybox: refresh the defconfig from 1.33.0").

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-core/busybox/busybox/defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 838a46631f..defe60c2ab 100644
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


