Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12CDD1359E
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 08:30:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.46761.1730104216154917910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 01:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8g-0000iS-3Z; Mon, 28 Oct 2024 09:30:14 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-000omA-2R;
	Mon, 28 Oct 2024 09:30:13 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-001oD3-2G;
	Mon, 28 Oct 2024 09:30:13 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Andrej Valek <andrej.v@skyrain.eu>
Subject: [PATCH v2 5/9] busybox: disable defconfig options from login-utilities.cfg
Date: Mon, 28 Oct 2024 09:29:09 +0100
Message-Id: <20241028082913.418505-6-ejo@pengutronix.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206433

Accidentally enabled in
4335cd24 ("busybox: refresh the defconfig from 1.33.0").

Since this would also enforce wrong ID ranges due to busbox kconfig's
bad handling of 'inactive' options, manually add them to the
login-utilities.cfg fragment.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-core/busybox/busybox/defconfig   | 28 +++++++++----------
 .../busybox/busybox/login-utilities.cfg       |  3 ++
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index d2a210d535..116286227b 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -524,41 +524,41 @@ CONFIG_INIT_TERMINAL_TYPE=""
 #
 # Login/Password Management Utilities
 #
-CONFIG_FEATURE_SHADOWPASSWDS=y
+# CONFIG_FEATURE_SHADOWPASSWDS is not set
 # CONFIG_USE_BB_PWD_GRP is not set
 # CONFIG_USE_BB_SHADOW is not set
 CONFIG_USE_BB_CRYPT=y
 # CONFIG_USE_BB_CRYPT_SHA is not set
 # CONFIG_ADD_SHELL is not set
 # CONFIG_REMOVE_SHELL is not set
-CONFIG_ADDGROUP=y
+# CONFIG_ADDGROUP is not set
 # CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
-CONFIG_ADDUSER=y
+# CONFIG_ADDUSER is not set
 # CONFIG_FEATURE_CHECK_NAMES is not set
-CONFIG_LAST_ID=60000
-CONFIG_FIRST_SYSTEM_ID=100
-CONFIG_LAST_SYSTEM_ID=999
+CONFIG_LAST_ID=0
+CONFIG_FIRST_SYSTEM_ID=0
+CONFIG_LAST_SYSTEM_ID=0
 # CONFIG_CHPASSWD is not set
 CONFIG_FEATURE_DEFAULT_PASSWD_ALGO=""
 # CONFIG_CRYPTPW is not set
 # CONFIG_MKPASSWD is not set
-CONFIG_DELUSER=y
-CONFIG_DELGROUP=y
+# CONFIG_DELUSER is not set
+# CONFIG_DELGROUP is not set
 # CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
-CONFIG_GETTY=y
-CONFIG_LOGIN=y
+# CONFIG_GETTY is not set
+# CONFIG_LOGIN is not set
 # CONFIG_LOGIN_SESSION_AS_CHILD is not set
 # CONFIG_LOGIN_SCRIPTS is not set
 # CONFIG_FEATURE_NOLOGIN is not set
 # CONFIG_FEATURE_SECURETTY is not set
-CONFIG_PASSWD=y
+# CONFIG_PASSWD is not set
 # CONFIG_FEATURE_PASSWD_WEAK_CHECK is not set
-CONFIG_SU=y
+# CONFIG_SU is not set
 # CONFIG_FEATURE_SU_SYSLOG is not set
 # CONFIG_FEATURE_SU_CHECKS_SHELLS is not set
 # CONFIG_FEATURE_SU_BLANK_PW_NEEDS_SECURE_TTY is not set
-CONFIG_SULOGIN=y
-CONFIG_VLOCK=y
+# CONFIG_SULOGIN is not set
+# CONFIG_VLOCK is not set
 
 #
 # Linux Ext2 FS Progs
diff --git a/meta/recipes-core/busybox/busybox/login-utilities.cfg b/meta/recipes-core/busybox/busybox/login-utilities.cfg
index cc9b2db502..8a21e80619 100644
--- a/meta/recipes-core/busybox/busybox/login-utilities.cfg
+++ b/meta/recipes-core/busybox/busybox/login-utilities.cfg
@@ -1,5 +1,8 @@
 CONFIG_FEATURE_SHADOWPASSWDS=y
 CONFIG_ADDUSER=y
+CONFIG_LAST_ID=60000
+CONFIG_FIRST_SYSTEM_ID=100
+CONFIG_LAST_SYSTEM_ID=999
 CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
 CONFIG_ADDGROUP=y
 CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS=y
-- 
2.39.5


