Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539F4C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:37 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.1090.1652811926802058993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Y6tN7k1j;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d17so18117605plg.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1yOzBo5yHZ10yG+SVHA8omhezJmXJdxmeBakqeK6FOU=;
        b=Y6tN7k1jp2aAG8rNvk4UPyPVEmVYX77aVUNrx6taObJ6HM0QN70tWcSt1iZ/1QA5IO
         OShue7t/0C4qXiDd/C55jdy29YD1a/h3YnQyRtiKKKaG279J3DD5biw/TKMTn3X3Yx3t
         RSithDuD7/Jw0tAzOxC9MhQKc7usPnbwaNWAZ/oHMW3fkKS8Rj41jtqr4DWbnKPt1feb
         wVzqyMBVXDx7UhWRaMl6+CM60UL2dBSgIcYMsiVK5qOsEiTRiCdFNw0cEOIFgq9hEAyp
         ctTgpYd52X5gpYD3iolDhpfRQq1qU7LrptyM1MtKSWmoNfTKtZH3hP2mav/bBB/tzBYy
         2g4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1yOzBo5yHZ10yG+SVHA8omhezJmXJdxmeBakqeK6FOU=;
        b=E1b27Y4oARO0e6V3ra+XjUUZ+9dj2rr95qaVNqcv85ADK5APLkubsnQ9FK4mLYGc70
         +JE9K8ObYtWItJPRql1mCvjpx1bZ13/MXVJpVYohoq6MRGUimXjgnVPdMfUGxCjpro5/
         9PwTXiprbuHbQl7RHHntd/c3uvIltDmTrYqEVlMMOyhLYwaHG50COSubQHmSf+IdTPnS
         FBwxKjlefVm13ZIPuXcFjcuUf/kxnnNpKtCDE+fOKyltQ3geFoSSrvDAxalk+9HXH/Y4
         FlSUz2UyTXczl6XP7dCQvGrpRb6B4shYluyBJHjizqbOkBwuKdW1/5EpJarbkEf3Jlid
         9uWw==
X-Gm-Message-State: AOAM531g1s9ZvFGnX1uyNTzS/3v4tAfKZRmPFU0/3alFoo/MjGRuE+V7
	nzbpqoxIjngLGQnFzGD+IkvfkOrOMn8/ajJW
X-Google-Smtp-Source: 
 ABdhPJy/ixMiUmki72HwE/E/MaBG7A3P4ZxOkGxStsa3zUPzC84mg5UQjOXkEt10Y/LwDYFiiqKPaQ==
X-Received: by 2002:a17:90b:4c07:b0:1df:755e:e0df with SMTP id
 na7-20020a17090b4c0700b001df755ee0dfmr8291075pjb.244.1652811928192;
        Tue, 17 May 2022 11:25:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/31] linux-firmware: upgrade 20220411 ->
 20220509
Date: Tue, 17 May 2022 08:24:07 -1000
Message-Id: 
 <9002274362b512142f66ea68ff9837a7dde8f830.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165766

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional files
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 85b1fef733683be09a1efdb2d8b8ffe543053ace)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20220411.bb => linux-firmware_20220509.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220411.bb => linux-firmware_20220509.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
index d396702690..87d2efef12 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=4cf67d71a21887c682c3989a4318745e \
+                    file://WHENCE;md5=d3eb82686904888f8bbbe8d865371404 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -208,7 +208,7 @@ SRC_URI = "\
   file://0001-Makefile-replace-mkdir-by-install.patch \
 "
 
-SRC_URI[sha256sum] = "020b11f6412f4956f5a6f98de7d41867d2b30ea0ce81b1e2d206ec9840363849"
+SRC_URI[sha256sum] = "376e0b3d7b4f8aaa2abf7f5ab74803dcf14b06b94e3d841b1467cd9a2848255e"
 
 inherit allarch
 
-- 
2.25.1


