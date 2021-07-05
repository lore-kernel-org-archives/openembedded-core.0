Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.539.1625524615741640268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vT62G5Ah;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id h9so22362908oih.4
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dKiiKYHUxIbzg0j/racQPAupG+3elTe/P0WIzZ4iLOk=;
        b=vT62G5AhxRzzbpsty8diSRbcBHxcL3fhYeJ3IQ1/d+X4NmqFeeruAtVA1Fbm49bBuF
         eSf/x9/UxLdqhe/FYeeaYSNlbV60G8MpiWPrkOZAIUlGa7FGwvg97CHQhF6JYzN0Q4dY
         EyWiQ/wvwf8LW0Iw48VP4ZyEycSMsTJMHbhAZJjkercYJpDheKfPqG3Majkr21158aBM
         B0CUn9Bae0VeoGaSXLnVJIGauYTOAhVbSD3xlUYRmRL3IRv0wvxFc5nKnK9uuF1HnfAb
         gm2ECsmDNiC3IX18SMny+2xUf3oUlWiKAtoaSl3so6SvTbr3R/oowseakKoEFyODU2Zj
         JC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dKiiKYHUxIbzg0j/racQPAupG+3elTe/P0WIzZ4iLOk=;
        b=VPAMXPivb2RFCxCfSFBMQXR8gOm/t7I8Zm4xlak9HDxmKl6Wsgo3QYA/Jv6hlNnAMi
         js8q1KIMG7XS6HGpX/A6VYMBBP5FxVj5jORXWick4Bv/NBdea1FTLRLoqngo98HP4xQ2
         pMc2SzpeGNMA1pmmTSDUAS7t2kcaidSzvd/f2O4IvnSjGmhogRMVAQFDA1VH/SRyojBB
         Y2x8KfwQfwmsvv4yB+0WSvQhO8iZn1f0oBCJfONLjgz9rpcC8jkv2twjuFfWbyA3ydh1
         4VMw/8Tj00sSnO9vEgMUVVQxn4P8StZFVEaBhaDvWxM4nT7VrKP9EU5JTQE/rScx19oU
         oOLg==
X-Gm-Message-State: AOAM533iPP6fDStjoFq1ovyLJLkxeXaoSeuL231wuxhpCUJoasyjvu/U
	1LW3Y5qmXs+S4NVcnP704RFKsX5F1tlHw+Y1
X-Google-Smtp-Source: ABdhPJzwwPgYxoQ449+9LOvFxODroxXxaloISRBIDnTqzxt/NxOVVPyMl2FGaBIqg+8CypT8FS93sQ==
X-Received: by 2002:aca:4952:: with SMTP id w79mr1045187oia.33.1625524614702;
        Mon, 05 Jul 2021 15:36:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.36.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:36:54 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/19] oeqa/selftest/runcmd: Tweal test timeouts
Date: Mon,  5 Jul 2021 12:34:53 -1000
Message-Id: <d5216cd934a28fd99dfba7d1a27c743e21f0b9c6.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Load on the autobuilder meant we see occasionaly timeout issues with these tests.
Slightly increase the test timeouts to better reflect the real world timings we
see.

[YOCTO #14262]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fccd2ade0e345625ed9a4b74a7431b000ce2214f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runcmd.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index fa6113d7fa..e9612389fe 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -27,8 +27,8 @@ class RunCmdTests(OESelftestTestCase):
 
     # The delta is intentionally smaller than the timeout, to detect cases where
     # we incorrectly apply the timeout more than once.
-    TIMEOUT = 5
-    DELTA = 3
+    TIMEOUT = 10
+    DELTA = 8
 
     def test_result_okay(self):
         result = runCmd("true")
-- 
2.25.1

