Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A67C47072
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:45:08 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.9053.1700037899060861268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:44:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=IuyOgQ05;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so4485117f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 00:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700037897; x=1700642697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qy9cp4j1+5+kZJ5T40t/iS9d5kBulrgyvMBdY1uP8K0=;
        b=IuyOgQ05TzgwYuh9/NDtuxkOxie9/qDeE25zBbafHDEdInl7F3RME7SuGgRaB1o+ZF
         CbfGdQ2zmm0JgQ8HDhhUZl1hmdp1eFyE1UFiKvCIVrwDVMuAtkGGx4t1rws1K6Sg5dwB
         zHh0QyMOAZtHA2xKUd1FRyafOaJcNAmdenCVU20wxOAys6rekCUyqiIk/un/Va/XR8+k
         cYU+p1WU9vqSFflaGzZzdaETOrX6iiaMZgo/8F3PqiaOuElA7/Ryfz9uAVHGZnoVxkKI
         oiwOsLOjyzDN2uUl6n6tLugaoWUJAsG0YjjFnEF5gQo9HhqbCCPR+TqNxhpVT7kkUi26
         mt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700037897; x=1700642697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qy9cp4j1+5+kZJ5T40t/iS9d5kBulrgyvMBdY1uP8K0=;
        b=tqEyn+PHKimbgqrauOvhn2jUOI1dEUbrxQ8r8Y9eiTTdGCRi6NWquIPGpGka/vIEA3
         v5GCwM8RE/4CajXKrDe+HOUlMpwdXc/NtsuHTLOGaAUyOc7Nc3r40wZypUEhR/0NR0ln
         hYVicTdcMLIGHmeyU0Ik/ZRTCXYQjIYEX+4xtRyW+Yc+P5OXyDNLjZrBghlYGZt3Gzkw
         YGmD6JCT0vQKZlc1utSxNB22MPNVOMbGR9PMnWT2HwI5E3JTe+1ykBaYJOB6ecH0RLC5
         94FUxmi7aCg1ep8rALZw1XCu4AdqnOED8sjJbQ3DUwwPc/Btlwci2pAxR9tflVlB8F8/
         xvEw==
X-Gm-Message-State: AOJu0YyuMyUxcdy/6mApppJRxS+qBDAjuj//F7FP+ee6/Lxztqzmqs/H
	wDEJG7jjQxQEC60rHaDvKLYhA3IDyO2FnWdhqrc=
X-Google-Smtp-Source: AGHT+IFGBFOcBfYETjAzQPmS/FHvTi78fPSq+kenwkHW5nrHpqlV7ySYaghq/kWTjnHQPJLpL9x4bw==
X-Received: by 2002:adf:a414:0:b0:32d:8872:aac8 with SMTP id d20-20020adfa414000000b0032d8872aac8mr9357373wra.31.1700037897144;
        Wed, 15 Nov 2023 00:44:57 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id a15-20020a5d456f000000b0032ddf2804ccsm9899290wrc.83.2023.11.15.00.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 00:44:56 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 1/2] selftest/reproducible: Split a long line
Date: Wed, 15 Nov 2023 09:44:40 +0100
Message-Id: <20231115084441.543855-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190576

No other change.
Just cosmetic to avoid tripping the maximum line length of patchtest
when the next element will be  added to the list.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 84c6c3a05f..db24bf24d1 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -153,7 +153,15 @@ class ReproducibleTests(OESelftestTestCase):
 
     def setUpLocal(self):
         super().setUpLocal()
-        needed_vars = ['TOPDIR', 'TARGET_PREFIX', 'BB_NUMBER_THREADS', 'BB_HASHSERVE', 'OEQA_REPRODUCIBLE_TEST_PACKAGE', 'OEQA_REPRODUCIBLE_TEST_TARGET', 'OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS']
+        needed_vars = [
+            'TOPDIR',
+            'TARGET_PREFIX',
+            'BB_NUMBER_THREADS',
+            'BB_HASHSERVE',
+            'OEQA_REPRODUCIBLE_TEST_PACKAGE',
+            'OEQA_REPRODUCIBLE_TEST_TARGET',
+            'OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS',
+        ]
         bb_vars = get_bb_vars(needed_vars)
         for v in needed_vars:
             setattr(self, v.lower(), bb_vars[v])
-- 
2.30.2


