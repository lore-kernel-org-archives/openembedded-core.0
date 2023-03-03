Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2BCC7EE39
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:17 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.27577.1677860282984369368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xKf6eMJO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id ky4so3207207plb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oE8886/SakktqjbcnxBRaORL6k7fYBvmTDUHvl3z0Uc=;
        b=xKf6eMJOIeNByaL0f8S1xu62gvelcuIoaLWB4eqmIxx67m7f61rLqTs+sVA1tzsq1C
         5zU2bR9Ow6U07UhWHIg6lJlUPzE3PNk5M26/a/wo6qZLfuwSFvSSxnbBUUsq9KWsuu6o
         qm0yi4dd4l0BT1TXMrFKzCoWHLAPQa8F7UrWFygDp9Uwqch9pLsp6o45wKrEnyJSvGqA
         xpPVepNCrupx5jkPqshZnk2geCWVAxHK3K65xxsI5ohF6ww8UJuyKoLcjlXm1Q8ZkV1S
         7C9t6DmJ9IsYNcUl3EvhFAC20uO7ErLX7axj931qwqIeFBWLL4ZpL9hmDMgFizLzKpr0
         2Kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oE8886/SakktqjbcnxBRaORL6k7fYBvmTDUHvl3z0Uc=;
        b=p5HRM1wY9oOTKMwcx/V8AT3JjGmYaHu4puparvRpEdT85j59pGokAxMKjuF6w58cRE
         tNhl7hSUkcfK5kI/z2m2c7R1MuMhe2ILwnbdReGZZMvEOWFmQ1IZarBtkQvYIBNlYR34
         TZdYIWQg0/1tiW5IgQti+p91bRoAFv5M4Fxuzx2Rnw4q1nPZxwlB38EJ9ofzWX4qU4rp
         g8ymU+lGDq5HOIPgnx+y3OTS05xAv4X2ln5rR4SHgAAly+XKn2XHeDBltNfEDYqStTia
         W5a+6aLHwRzA5qgPGTBPvMBLpXyDQxd1v74n+LitjBBPsldk5hLrx2lSlyiK5PdmnREX
         1UTw==
X-Gm-Message-State: AO0yUKXFkgsvwQ0bY9eliNXCvu8vyMCI4cWaFnD9/fMz0NUx3C59Pwmz
	wzO/4i3ADsm8N+dce9M58DTSnAJh4aXw3mx1uxY=
X-Google-Smtp-Source: AK7set/uu3fgb8VEnvFtvtOuIrV20bQdVRLkBk9ctOJxsX39XSnjRnxxLIKWsVeeHBtY+88G5iD3dg==
X-Received: by 2002:a17:902:d509:b0:19c:65bd:d44b with SMTP id b9-20020a170902d50900b0019c65bdd44bmr2922064plg.60.1677860291860;
        Fri, 03 Mar 2023 08:18:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.18.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:18:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/29] oeqa/selftest/resulttooltests: fix minor typo
Date: Fri,  3 Mar 2023 06:17:21 -1000
Message-Id: <39e1a9960a4911d7519be496be20e6c35a08b618.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178012

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 80cfa56d133bd3abbb1f37272607d8e15ce70861)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/resulttooltests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index dac5c46801..490f3fc5cf 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -69,7 +69,7 @@ class ResultToolTests(OESelftestTestCase):
         self.assertTrue('target_result1' in results['runtime/mydistro/qemux86/image'], msg="Pair not correct:%s" % results)
         self.assertTrue('target_result3' in results['runtime/mydistro/qemux86-64/image'], msg="Pair not correct:%s" % results)
 
-    def test_regrresion_can_get_regression_result(self):
+    def test_regression_can_get_regression_result(self):
         base_result_data = {'result': {'test1': {'status': 'PASSED'},
                                        'test2': {'status': 'PASSED'},
                                        'test3': {'status': 'FAILED'},
-- 
2.34.1


