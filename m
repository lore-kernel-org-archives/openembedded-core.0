Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D163AC64ED8
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 13:52:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.7340.1676382755921414209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 05:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vf22KTq2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 55BDC60009;
	Tue, 14 Feb 2023 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676382754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1B/APxAQ1uBH71Q8RgPskCWcqE8SLYZzRk9GcsGzVLY=;
	b=Vf22KTq2J/AhB2fctRdKd90uD/l0oF/yaZWSzsxLUTVQQV1ZXDYYR55fdM9v28G02R1xsj
	eH12jzRmN9N8FbeFqwW03kiJ1oAa1BeVEyyTufQwlnUuFgVc0VUhggHXFv3z9xAux4vLjs
	V+ZX89j/fawUPqUnJfnQoZtKRMbu4RUCNh1JieoSqo9a2XjolHYQXUC63xbESLar+DSC+s
	hI7SeBq5HmpzuJIztR4M54VVIhAjAbS9Y9qiET145olPnbjpv2zm/PE+O4cfOyz5PkdBS7
	g9qU4pNhIlq0+h1NmOW8tOacJTVWdH0mJjrc5tY4alho5TBDi2kWf6dVetXJTg==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 2/4] oeqa/selftest/resulttooltests: fix minor typo
Date: Tue, 14 Feb 2023 14:52:12 +0100
Message-Id: <20230214135214.42413-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214135214.42413-1-alexis.lothore@bootlin.com>
References: <20230214135214.42413-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 13:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177143

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


