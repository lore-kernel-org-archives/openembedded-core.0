Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B42DC7EE2F
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:03:16 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.69590.1677430960513286978
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vuq74Ue9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id v11so884842plz.8
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E77WoTqPPrCGhRHDtEGMKIKXL+9/gdOS1msEQL4moyw=;
        b=vuq74Ue9B2girE4BPC5BRjvFcVOFEC+qfk4P4G7pgjLA6UprSxELaAB8ValECXB/Vp
         Ut3WVklRoZJ2TU4LoqeAcRb5bhDkmOXeogMzNrs3nRdvzcA/ITv/T89314y26SIA/rpL
         OpN2GqKXTEQmRgeqKX8rCBVaCX7YTtTG2FUp23LtuUrU3it6dz8GHKVOm/+r1vlTRWHU
         7M+5A69XRYcwz2D8XsLonnjlfyG1U/kadY8m/UqBi7myhpSq7GA6v+iERTIrNs/NTknZ
         053Xxy+Cgm4EilsZT8OQJgDkDkSCHaUJzCyWUyMh2XN/NXUgg39AkVOKXHRujF5vH2cV
         36JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E77WoTqPPrCGhRHDtEGMKIKXL+9/gdOS1msEQL4moyw=;
        b=ssWerwztDOzc6NXH6c1op8ouC2oplCpOe5GuuXnTCbPAWQCjl2nnWNw4OmZoYQKCtd
         MxdoTakdcjVmKa5LI39mtMbp+jK6yXIRSQMAkUwtQKBb4Go2M9DI/U7Jyou1HX+U4AK0
         8CW+MyRNkAYajGaaeLg2oz2lVT2b1PsOnXhOeoIwfvs37ir3hq+eEmfrZikWoSyPLlpt
         gPIHVSV0SM15IaSOUL1lIF3lh929liDd7bDg0coxtczhZCpGaUtRtFNhnUSaQivU0sO1
         TxPI7BAgyQLDOmUNS28A2RIPVSyoD56/mlYiXSg0DIxO19FDJO1XU4lC9EfmRmq10oDW
         REKw==
X-Gm-Message-State: AO0yUKULJvWuIlT6eKUvjCSLdLJyvhGhequufC00M3nbwyV2S/JnzBH3
	Nb+IwwLlwtVf2C8eLJe9y42wuO108JHpBg7rapE=
X-Google-Smtp-Source: AK7set+HooLW1E5qLxgtS9e0xPf0o/3VQ3Dshj06Kq2NLPWurMZ0rVNFlAnOT6Vg4EqqT26YvVYwlA==
X-Received: by 2002:a05:6a20:9147:b0:cc:d386:ec1b with SMTP id x7-20020a056a20914700b000ccd386ec1bmr4527116pzc.12.1677430990156;
        Sun, 26 Feb 2023 09:03:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.03.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:03:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 22/28] oeqa/selftest/resulttooltests: fix minor typo
Date: Sun, 26 Feb 2023 07:02:18 -1000
Message-Id: <fdabdb6bd5d190446d15bdefd1032add81c2ebf3.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177760

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 80cfa56d133bd3abbb1f37272607d8e15ce70861)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


