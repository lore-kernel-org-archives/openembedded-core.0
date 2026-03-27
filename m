Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F2F10BA447
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67451.1774600276245803171
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s5aMp24l;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so18491465e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774600274; x=1775205074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQDWN8sD13TBgoi6JTeU+5Vi9yxSudpaP4uM5+8DvWs=;
        b=s5aMp24l1Yxl8MeL+GD++iLYh4l2CjRBIqTax6gQPkm5gAq+iREN/l1x7lEhc6N/so
         eSteLTCaOqccL+shR/oiM/aBu90X/AhCWigLwJ1PV4+jujKzS7IB/yfkZ46SXnqTwcAh
         m+D7j7B1QS7TSJ/0SCc205xHA94iRjFfVIn2PBzr9oJXSjvh038hWz6ACLYOX+sRoDWC
         +1s4ZKPv2R0HyAdSFTmGrbDqFyOr27bSfeUvjf6rK70Sy2j5JtRyfAocssbOjJKVy905
         GYburP1hzr2ub7AV2YtsNQwbgTCsTnNcTtW8dLoqEacibtzgJzdyRMW/iBsV9SIAZzLj
         v+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600274; x=1775205074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FQDWN8sD13TBgoi6JTeU+5Vi9yxSudpaP4uM5+8DvWs=;
        b=bUYtGWKnzqliLu4UkV2zce/5XlCPhJOZnCNFPCShys1Tm0oSmQy6YyeYo4X1oyH4Pj
         l3RX734n6T6uSit9fRADvczf9H4DY20uVbrT6hV0I8tFPMQzxKXCPIiS+Oa7rqVQIq51
         wAGxaMXZo8mJky9mNIKhiquaS1e3d6KD0OpaXG2dCkjka5XVfgGDjMbGtWTf2Tt2SLeq
         S/vMmcfHiJwqR60JAgbQLZsJ2V5QgbPdhUkbtq0OSEcFZuXlojHi+QJ0Pdwd9zqRWItm
         LK8YQccceFB2AGezr9vwYOTfFMGstO0C+CILfi+LcrI1OfPrPmzQr3/zatk9Z2WSyF9e
         WcrQ==
X-Gm-Message-State: AOJu0Yw8t/giPlE03KjfoL2mWS6OlZh6p3D6DAp5+kkDWWQuUkQgfR4l
	QNT6zWK/U/apG5YOW8dtYxz3FkRwtL/iJuUgfgv6lkucRcy05CvJ45nvkaRPCw==
X-Gm-Gg: ATEYQzzCPNwHlSEBmiqogJoCIspH1lU6GANsxMaFEdUug7FuNobTze0x5TCsiwwGXbf
	Hd6MpZFyZqsgOY5lPx2N8/BeSbdjnNqHd97Jo7Og7jtOCg1k8ZftGe7CmsnvqGtx2JMBHRJVSwI
	5jicVOqZf105h4XekfsXhFx2xLmwpptscqIvFfxZGhcrDojXXQf3C4e5NhSkBm5L9ZgNtjdGtfE
	I8oTLRRs8wx4EcCiV1cmlLHXTbvqFmL++Z99mrYhtfVxl04hddzxQH1ITgVCK8HzND3F0yOdWgh
	y7LJDUhPSBP8h6IBr9GdPoPjX4c/9/UKQn9gh1Tey1ucyx7BlJQh9zcemHb3kkMYGpEo9+nwetj
	ASEVL4rNN/wpXue8EEdu5Kt1+arc/qk6nAwZKw9EkR4JyXoBIXid43QT5REijLBFHpthmWlZrEU
	l1FtBd+RXWX9jkWg==
X-Received: by 2002:a05:600c:8215:b0:485:3baa:af14 with SMTP id 5b1f17b1804b1-48727f5f985mr23926055e9.18.1774600274065;
        Fri, 27 Mar 2026 01:31:14 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm76411485e9.6.2026.03.27.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:13 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 11/12] libcap-ng-python: Use PYTHON_DIR for FILES
Date: Fri, 27 Mar 2026 09:30:54 +0100
Message-ID: <20260327083055.12571-11-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327083055.12571-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260327083055.12571-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234066

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
index f702056f02..f13c2eba17 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
@@ -14,4 +14,4 @@ do_install() {
     oe_runmake 'DESTDIR=${D}' install -C ${B}/bindings/python3
 }
 
-FILES:${PN} = "${libdir}/python${PYTHON_BASEVERSION}"
+FILES:${PN} = "${libdir}/${PYTHON_DIR}"
-- 
2.53.0


