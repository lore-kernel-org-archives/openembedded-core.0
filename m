Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5B6C3F6B0
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:58 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.53.1659106073450855349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2IBP0k7g;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so5469589pjf.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=40dCjRrlmCjctDbbIGsRTkowY/QYcVToyO8f5+9mRNA=;
        b=2IBP0k7gdQbTLUDf5loVxtfwwkuGuDxaNFHIIIOP7UrFBqcIR/dyxwRluoZwi7Acvy
         hhMlDgNl/C7/sxLkH29IT+wsUzRMhtJiXcCgGzIQuFSmH1U8ao0HWstTykxUZqp7PglY
         ikAgOrfGmuS6l+b9madCE9N7C33FMlJDumRBl2oQD8IztL4uqFfA9IhmrdK7+0ytFk1B
         BaxURQd2wMCBSwWz9FXB7me8HXNfTBDcqm4gTp4NzXV1OuEQDnyUO5pc2lcIFZ4c9U5H
         8UZveJtSJDofin55NTSHmDMIsyjKgNCV0PpblUYm8cmtwpLmxCpBEy/dGlbli21Ol5Ur
         c1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=40dCjRrlmCjctDbbIGsRTkowY/QYcVToyO8f5+9mRNA=;
        b=Fe1K6/axgu4GIGr7kIwmUvVTjjnGfr3KfjpEw1AJQRffF60Mp4Auvgtryejt7zMA1i
         kh8RkPCDnU6M4us5juxvHEFptckOZsxHL8dcYQ/QFm0WQeJRHFwbKV28C7wYExEIZMi7
         QfuhRukzOh2w2pElOSZCnUF1b1aQRGDMunbjsfXrd5qLMoV7E0i2/vPMXtA7QtRaDwxe
         gIDOukbeqEIR2ls7v+X5bz3M3m8hV+pY5E054oO29R4rPcCx5ZYutXy5xl3vr/wvor+V
         s8mAc3aQgxJduVyPF6oN1sY/sYHGITViuU2ZYdOyQmKyc4dURODb+L1gNY0xRXwm9AwQ
         qMcA==
X-Gm-Message-State: ACgBeo1Am03ser6l47VAxaKMagLXqJOk9v4Cco8Q5yxcXI9rhVirjpbl
	4X4CkanlFRJBse5f0LBkt+j/8wF0pp/Rj8bT
X-Google-Smtp-Source: 
 AA6agR7DgtAR1EXbTg88u7okoY+q2fW3FQgW3kIsKdjCK5CfD63YmzzaZtD2Obe/uQ8xaFCtTy4rrA==
X-Received: by 2002:a17:90a:bc1:b0:1f2:435f:94bc with SMTP id
 x1-20020a17090a0bc100b001f2435f94bcmr4676919pjd.5.1659106072377;
        Fri, 29 Jul 2022 07:47:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/29] libuv: upgrade 1.44.1 -> 1.44.2
Date: Fri, 29 Jul 2022 04:46:29 -1000
Message-Id: 
 <c785f1d3a7f8ef2c7047fad7a2a483c5ebd658e0.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168648

From: Alexander Kanavin <alex.kanavin@gmail.com>

Important bugs fixed

loop: better align order-of-events behavior between platforms #3598
zos: fix fs event not fired if the watched file is moved/removed/recreated #3540
win: Fix pipe resource leak if closed during connect (and other bugs) #3611
zos: don't error when killing a zombie process #3625

Regressions fixed

macos: avoid posix_spawnp() cwd bug #3597
kqueue: skip EVFILT_PROC events when invalidating events for an fd. #3629

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ccd589604c2d7648dcd3541c61a2b48e692ca258)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libuv/{libuv_1.44.1.bb => libuv_1.44.2.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.44.1.bb => libuv_1.44.2.bb} (93%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.44.1.bb b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
similarity index 93%
rename from meta/recipes-connectivity/libuv/libuv_1.44.1.bb
rename to meta/recipes-connectivity/libuv/libuv_1.44.2.bb
index 4c96d80a65..4c1b8eed56 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.44.1.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d"
 
-SRCREV = "e8b7eb6908a847ffbe6ab2eec7428e43a0aa53a2"
+SRCREV = "0c1fa696aa502eb749c2c4735005f41ba00a27b8"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


