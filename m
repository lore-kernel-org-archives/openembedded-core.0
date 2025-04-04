Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90385C3601A
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 02:09:59 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.2476.1743732592278843323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 19:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YvGSIfdy;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so1336209b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 19:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743732591; x=1744337391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quWLf36Ew2a6HfCBqtYqV5q6hW5ccQkrs0PFOVIFyhU=;
        b=YvGSIfdy9Vz3mcIHNCD6CcOYnMxDcjv3zwOIGYhKfW+bYbWUk1MPLlShaWNxTapz6i
         Jp3W3Zlq9BRGxnMRjh35tJmywDPO3FUlNY/HqTVjLEu91cFteqKtwayml3bfOdgFc0s/
         ffC87OvjZpZWGUKaqscM2SvUgaJZUn78rdav8p8YS7Ob8Vn3u1PmevwFfWFxqK12ajGd
         fgOxD2o4YeJ+JDN44jnids/PLtwgWMewTBQrJfrTdPOKoLwy5Y5fTWu0cKiix1LhcUvH
         HTGSfRLqge4GBmbbf8UfLzQoiR+yeqHgl6X9L3juHINU8yyTxKxVKpFGedSSho38waf+
         dUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743732591; x=1744337391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quWLf36Ew2a6HfCBqtYqV5q6hW5ccQkrs0PFOVIFyhU=;
        b=i7KKhcUg5zLy7AGi4R4u9o4Q10mGgl+an8j5A8DqiftRvb7Zz8BKIlXOJJKwSlJg0s
         OykVENjApVsWKRHqGOF44Qn/INnLXGwceyrSsk2F/MxdfbJ4FxKYucBf7As0TsMYRu1n
         pcAP02lrZwGIOLPac4gtN/eKwP4VG6r/UVe8vCmD7gHeJPu8dZT98VY6cHkdcs0jr9LR
         aViu5/0GG9lcxOBjfqwdx2UNtpJooOFhAduvtYtwNkS72wujhr62Qj/9X2q8S82qN2gy
         y2i6mosj3qlN1nR/ED44RoGGi1lm0Hgx41erWecQgMUNOhJSrBdDLn/LGu1g/R8mHA4a
         zxeQ==
X-Gm-Message-State: AOJu0Yz1Ouk8delrE7gpUdM14Woi1/i1UWTL3W7P7fzbM9VVaPhIbPz1
	rnIrwFTAQ5Ff1xtyhpaCuf56KW269z7GnTQIHEDVzPKCjyBZQjnMF1EhXkR9
X-Gm-Gg: ASbGnctc7KCxy0/18DkqlG7/kKNyGm+xTvbxu15osybTsHVzd67YBnXhUCxaH+mcr2o
	MMO6ck83VFvHEoms9Lja4uwM2AqXodEw/AFLy/x2YcmvCkONXq3/WiaebREBcclYXKtq/aFKSMk
	agVF5esLlk015U8gu2/RPARtXte5aO6/g0TdsbEF952+ySslaA1KbxMh1q4EBIjYvHF1BYdaht1
	l416Ijefy05aEvZy7YM5n4htBTcCRRtaS0UHGJvD99PGHa9Gv8C1Hq0NV3m0bZ6k0LH95yazN/Y
	c5fLcA533vXYdoaTdfiw6SbKQ3Av60CtFGrK
X-Google-Smtp-Source: AGHT+IHWKA+f2606aGQKh5PGdqTEAmH00cjw0E6NFQD8TWa07EKKqrw/dRBi4YEqkZbZV3GQvTHG4g==
X-Received: by 2002:a05:6a20:2447:b0:1f5:9024:3254 with SMTP id adf61e73a8af0-2010458cc9amr2609531637.6.1743732591243;
        Thu, 03 Apr 2025 19:09:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::78d1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41ad1csm1895578a12.73.2025.04.03.19.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 19:09:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] oeqa: Update lzip version in buildzip testcase
Date: Thu,  3 Apr 2025 19:09:48 -0700
Message-ID: <20250404020948.3903214-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404020948.3903214-1-raj.khem@gmail.com>
References: <20250404020948.3903214-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 02:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214334

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/buildlzip.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/buildlzip.py b/meta/lib/oeqa/runtime/cases/buildlzip.py
index 44f4f1be718..921a0bca616 100644
--- a/meta/lib/oeqa/runtime/cases/buildlzip.py
+++ b/meta/lib/oeqa/runtime/cases/buildlzip.py
@@ -15,7 +15,7 @@ class BuildLzipTest(OERuntimeTestCase):
     @classmethod
     def setUpClass(cls):
         uri = 'http://downloads.yoctoproject.org/mirror/sources'
-        uri = '%s/lzip-1.19.tar.gz' % uri
+        uri = '%s/lzip-1.25.tar.gz' % uri
         cls.project = TargetBuildProject(cls.tc.target,
                                          uri,
                                          dl_dir = cls.tc.td['DL_DIR'])

