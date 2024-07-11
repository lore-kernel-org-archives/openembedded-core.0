Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E5BC3DA49
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 16:37:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.888.1720715874851039962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 09:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PTiIlKB1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28F6740007;
	Thu, 11 Jul 2024 16:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720715873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bU6lI7Pdm7ntmkyzfGQ5rU3NDPvr9g2eImLdGXUM8PA=;
	b=PTiIlKB1fPZN9/KV9b3MQ7JcmfDkaqB8wpMOSnVg+QxVgs54jFtQTmDZuGpmARFAh5vgfn
	l10FAxxX4RCGvEEb7J+ZS6WFq91dT6V2BQ5F4KGrYoSqA6b6d6TorbPFyQ07rcjy/Yp0g6
	nSr0tjGZTMJi0rPgEsLBo+4EdiTUOnwJBwbw0utfOHNFIxxPAVBoUjjiZJ4h0ByVNobj5N
	Rg4KH8bfNonqkP5zLrGorroEhh9+b+l2UZGpp9nfV8UJs1ItXqrg+dfuOui45SzdhI02Tu
	fx6dvcj/ApKSBqgTkW93SabmX5iUH4Po4Jx1YvVtaYqbNTU2elszTlovufkH3A==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] oeqa/selftest/oescripts: pinentry update to 1.3.1
Date: Thu, 11 Jul 2024 18:37:46 +0200
Message-ID: <20240711163746.934465-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 16:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201784

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index fcfe54af7407..bfbc33b08d1b 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -175,7 +175,7 @@ class OEListPackageconfigTests(OESelftestTestCase):
     def test_packageconfig_flags_option_all(self):
         results = runCmd('%s/contrib/list-packageconfig-flags.py -a' % self.scripts_dir)
         expected_endlines = []
-        expected_endlines.append("pinentry-1.3.0")
+        expected_endlines.append("pinentry-1.3.1")
         expected_endlines.append("PACKAGECONFIG ncurses")
         expected_endlines.append("PACKAGECONFIG[qt] --enable-pinentry-qt, --disable-pinentry-qt, qtbase-native qtbase")
         expected_endlines.append("PACKAGECONFIG[gtk2] --enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0")
-- 
2.45.2


