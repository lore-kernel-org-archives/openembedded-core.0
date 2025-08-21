Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654B9CA0EFA
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 06:45:39 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.3237.1755758736223758663
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 23:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nAZX8HCb;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b47174beb13so409534a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 23:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755758735; x=1756363535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zveqAofo2QnTDyb81OGSPWSh+cL5j7ggY7AY4lrxLUM=;
        b=nAZX8HCb8m4yaGUIZZ92a0WgvZWYy/PhLRZIAznK2QcVqBic9sRBNJM2QEmwZ5syBa
         tvsvrTeTj3MZnNcSLj10bu81xhXYxd6i1VZUxCctr3+vvFB7B/NAvdGAvIwUCCYq8ZWB
         3KjE2DcjyL8CJudRnQsFO2wCuR39vbAGbbBbIiDu4lWZzGTzPq6nIPbEE6B8/C+VIiJ3
         Zf0AQgOAuZbTDxq0Mt0j19Eq/HFhEXOTOte2lEGDaxGq8wL9Ix/ICdw3OsAzInJHuwe3
         +Df00I04srWpkmWuvqsQvL8EhnjzjsuRV77faD0PLQlJ+aCFVYW5wl8NCly3Zt4kIDa5
         mAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755758735; x=1756363535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zveqAofo2QnTDyb81OGSPWSh+cL5j7ggY7AY4lrxLUM=;
        b=AiH2p3Nwqx/om+4liyu68qf4J0Tzwn4TQlqW+254qCnn4IGMuootMjf7neYz25A4sY
         IEqSEIWcefbVhvBpCcAksONb+v4YqlXIsBeP3SXkeeBYbLB4xRSWeSnBp9k1UEIxmpdo
         YzlcJA63xzdbRI4lMSJ0kWuaD9gf4BksFBiutWuKs8T2dJleIN05jZ5MMRQdZfZcW/K0
         hTaDuU1EOq8iK4SjnHPSULEBjJjVBXMKtvLGUTxWpwG5zzPeV1cLvSNxTyWG03I4jbhu
         3ZJ+8FYHcdGinvF012zn8dW2Q7Xc3OhvVcUh/BbhaO5m+6ruRg7hvupydCrA8q3SryO3
         u7IA==
X-Gm-Message-State: AOJu0YxohwPLaS3QOQ8nh22l199pufs0XeEGEquc+PZZe/w/vicoZtCA
	qvKxoDdAbMvVeOhZPBow7eJ/FPlx3bhPMZxZphafnJYjAP87nSVqXFB3gWQDYrGJ
X-Gm-Gg: ASbGncvF5M69uKiG1YIUFVSjvWGKjsZh61QeILdnQ9QXt6Rj6MnZm+OSC1e1rFYmTbT
	L1TTW5f0D5Zmo9UMrefUSRD7w0TkBakFCMgPP9c5e/aRHeT7gBF3MspsHR4LJ+zavXPqoX6KK55
	FiA8Q2mphlaxeBZQnIuMkWgppnpZAc49VucU3QwpngGIzr+FAyuCC3vFiwOuc2xSv7DI9PHOVt7
	Tb6H4dzAjMGks6+sB74JemmcY8bKbzEYZJmEuIrp9gSO8twU8/yGaC0tdwgaABVQm32nkGwd8Y2
	gZxl+dWfSw2zZ5csCCWuEsjFukiohTEV1WVxnP/GSmN/Hm08m2IZc2EpZurD75Fb9G0LlvWnnov
	YcayRK5LkXJfD/gcmX0znQA==
X-Google-Smtp-Source: AGHT+IGj3+cktfitqbtPM/zDjs7HglvoMyzsHlcjHfQgjBTRDcOwZxtUleniaOUV0Ej/MSk6FcJCSw==
X-Received: by 2002:a17:902:d4c1:b0:246:61f:e975 with SMTP id d9443c01a7336-246061fee14mr14918665ad.58.1755758735342;
        Wed, 20 Aug 2025 23:45:35 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed35d778sm45876685ad.49.2025.08.20.23.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:45:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/9] libc-test: Upgrade to tip of trunk
Date: Wed, 20 Aug 2025 23:45:22 -0700
Message-ID: <20250821064528.754633-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821064528.754633-1-raj.khem@gmail.com>
References: <20250821064528.754633-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 06:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222213

Brings following changes

functional: add mntent test
fix malloc-brk-fail
math: add fma(x,y,z) test cases for z=0 and x*y rounds to -0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/libc-test_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index 71a111cfa43..c3b562862ac 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=43ed1245085be90dc934288117d55a3b"
 
 inherit ptest
 
-SRCREV = "18e28496adee3d84fefdda6efcb9c5b8996a2398"
+SRCREV = "f2bac7711bec93467b73bec1465579ea0b8d5071"
 SRC_URI = " \
     git://repo.or.cz/libc-test;branch=master;protocol=https \
     file://run-ptest \

