Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C3EC64EC7
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 16:53:25 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12509.1676393595245742296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 08:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HAzGL+XO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 75AD5FF807;
	Tue, 14 Feb 2023 16:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676393593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4JKrDMxPGITgj6t0yAr3ej8p6IEuXtwEKin0/+p6/yk=;
	b=HAzGL+XOjOYyxuoyy+I1wRSb1KrOs24gZHUpK+8xfH9PGACmYviJjn7m06QISbZZHaAhFM
	H68joeQkNV7rVW4LFqPumeh6+n7j8UAJ6o4eoA2mkZ+DZpaL5Sm+FG/0IGtQ0of+KP2rDv
	mhWnLgrjrxKOMHNLrB6u2HVpQugZlw8qeGQ0h4Hvr+qeiOR50mMpaC5vhxhQCYReS0u8Ct
	835Cpm99HrCRVKDefNLPc2/ByK2z+8sRtnwQCpv+42A0Zy2f7vrnSKAf4To+eWVscQGmbS
	hsQV66Ox2ePNQV1EcHTct0JLl8cz0y/umNmiw8uQ2/KT5fCcl54Wdw87mf1QOQ==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH v2 2/4] oeqa/selftest/resulttooltests: fix minor typo
Date: Tue, 14 Feb 2023 17:53:07 +0100
Message-Id: <20230214165309.63527-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214165309.63527-1-alexis.lothore@bootlin.com>
References: <20230214165309.63527-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177162

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/lib/oeqa/selftest/cases/resulttooltests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index c2e76f1a44..efdfd98af3 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -71,7 +71,7 @@ class ResultToolTests(OESelftestTestCase):
         self.assertTrue('target_result1' in results['runtime/mydistro/qemux86/image'], msg="Pair not correct:%s" % results)
         self.assertTrue('target_result3' in results['runtime/mydistro/qemux86-64/image'], msg="Pair not correct:%s" % results)
 
-    def test_regrresion_can_get_regression_result(self):
+    def test_regression_can_get_regression_result(self):
         base_result_data = {'result': {'test1': {'status': 'PASSED'},
                                        'test2': {'status': 'PASSED'},
                                        'test3': {'status': 'FAILED'},
-- 
2.39.1


