Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8603C636CD
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 00:02:05 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.7141.1675814521050207248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 16:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1pPXuQ-0005ln-TJ; Wed, 08 Feb 2023 01:01:58 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pPXuO-003Obz-JF; Wed, 08 Feb 2023 01:01:57 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pPXuP-007AYM-5D; Wed, 08 Feb 2023 01:01:57 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] update-alternatives: fix typos
Date: Wed,  8 Feb 2023 01:01:55 +0100
Message-Id: <20230208000155.1708817-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 00:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176835

---
 meta/classes-recipe/update-alternatives.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/update-alternatives.bbclass b/meta/classes-recipe/update-alternatives.bbclass
index 55e0b954d62e..36a7497fec8b 100644
--- a/meta/classes-recipe/update-alternatives.bbclass
+++ b/meta/classes-recipe/update-alternatives.bbclass
@@ -5,7 +5,7 @@
 #
 
 # This class is used to help the alternatives system which is useful when
-# multiple sources provide same command. You can use update-alternatives
+# multiple sources provide the same command. You can use update-alternatives
 # command directly in your recipe, but in most cases this class simplifies
 # that job.
 #
@@ -35,7 +35,7 @@
 # A non-default link to create for a target
 # ALTERNATIVE_TARGET[name] = "target"
 #
-#   This is the name of the binary as it's been install by do_install
+#   This is the name of the binary as it's been installed by do_install
 #   i.e. ALTERNATIVE_TARGET[sh] = "/bin/bash"
 #
 # A package specific link for a target
@@ -68,7 +68,7 @@ ALTERNATIVE_PRIORITY = "10"
 
 # We need special processing for vardeps because it can not work on
 # modified flag values.  So we aggregate the flags into a new variable
-# and include that vairable in the set.
+# and include that variable in the set.
 UPDALTVARS  = "ALTERNATIVE ALTERNATIVE_LINK_NAME ALTERNATIVE_TARGET ALTERNATIVE_PRIORITY"
 
 PACKAGE_WRITE_DEPS += "virtual/update-alternatives-native"
-- 
2.30.2


