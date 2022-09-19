Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E81C54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 15:26:11 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.381.1663601161572981502
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 08:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VxJZVT0s;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E3B26FF80A;
	Mon, 19 Sep 2022 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663601159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mO0VsaFT6MUm8RuBndzsE6Uj/Uej3PRZ05xkAUQNLbA=;
	b=VxJZVT0sWEbx1obcEbVanmGadRU85jY/QTtYa7RJJY/7rJtw4DHXnNYaVO1G6Ve9W8njuh
	19iSJYYJZ5aD+Ikmk5IdZqj5R9cEadA1u6UcDGlE7bDF6J32ah/iivSMJhBfWcF/K7Mv3k
	u9EVRrD8BaABKi+HbDrFtyOD/B2H+9AHFf4umEJGzG4BYTxoMx3uzfhGujhPNyLlWcdpAQ
	IAw1DnUOGrITxqNyncmD2BUBqKD7Q5bCcrkwURwQjIy4RTWSn5vEb6SJYOrpau20fHb1EN
	Pzy1EL4seKpZn0YLWXLKTPU3+tANZo7kPLyQPsno0LjIAX5CR6EMWKH0I1syTQ==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] oeqa/runtime/dnf: fix typo
Date: Mon, 19 Sep 2022 17:25:52 +0200
Message-Id: <20220919152552.177693-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 15:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170879

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/lib/oeqa/runtime/cases/dnf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index a8e23e596e93..e0b91090b20b 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -146,7 +146,7 @@ class DnfRepoTest(DnfTest):
         self.assertEqual(0, status, output)
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
-    @skipIfNotInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when enable usrmege')
+    @skipIfNotInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when enable usrmerge')
     @OEHasPackage('busybox')
     def test_dnf_installroot_usrmerge(self):
         rootpath = '/home/root/chroot/test'
-- 
2.37.3


