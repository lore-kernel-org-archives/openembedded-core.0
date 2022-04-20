Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B8BC636C9
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.8049.1650463766782047457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7upek8/A;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id h5so1718001pgc.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rqHTrAov0iKRsoEU/FZRGmoPGbzFyQe5FQx+tOzcA0E=;
        b=7upek8/AyOSz/4tC7vIG6q/6s+eLW4TvACk+gwDlhhnAOEF9WQ0F3rPhtDn79DSfNn
         A4tsczJzEXGtLSK4Es33tIOTaIzmZYcN3FIHVmKKSL8ON7ChqXp5YLl+3W+lSLA/EwB1
         AaVkocMfY7ovhmTrZLhxpC+9vP7XygU4kltU8zCX4LigxxZrC0ytoOeZsMmYY7eIz4SK
         eUXNRMKUghosJH11arutd2Rl3Q86Rv/7Tt2D/T9cMzGiniZQyDLCMAITyM4/pFzItJAR
         3q5Cn/krpYyx4Dz2lHa4XuL/QAm4tznYT/9lYO8dJ67ky0oxuvUbfAHacfciX+39i8eV
         Si1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rqHTrAov0iKRsoEU/FZRGmoPGbzFyQe5FQx+tOzcA0E=;
        b=hyN3e3Az5a4ebJPTdtCu6aCSI9QB29hcVvtVKtd5wYNTDGfJ5XiZVWWBpc/VjYhv5x
         mYudYRqPBBPnj8C0RVX450xK7K5atuAJJ6Zz4Wply3DAUjCR3nhorC+q6zc8Ygmc33e/
         eOwKTIMYyt5Poq3XmbnPE5Xh65IcWUyeEAc8sZ8IEm4W9Tj6orgtzgJEDkg/kp8Rhefk
         RpG1gQmBaZ1HyjU5dLDKOhfjT4SxKv9jf1SMotbSmrKMg/s1uNO3iRyoP4QPtC+5xNYX
         MPGuQGefHO0nlgvWUFFkGbwfIDQjSM4iQY8pOX4Tj81mY6ij1uJQrDH5nnWEYVZC65Gx
         sWqg==
X-Gm-Message-State: AOAM533u52132N9McHslE7BKPnJyBh4DEse9rAicy1bu1hrlR3xatM7Y
	ilml0y2qfO4zfhGqao63PjM9C0lrMNZW0y8uY2k=
X-Google-Smtp-Source: 
 ABdhPJwp3wd70dL8P4if5rmKPH3Jv3lubcEEgWtp0DEZSppA4m/G7Nk4J41NE9gHjWplFCSM7vh1RQ==
X-Received: by 2002:a05:6a00:cd0:b0:50a:64d0:b90b with SMTP id
 b16-20020a056a000cd000b0050a64d0b90bmr19246898pfv.59.1650463765835;
        Wed, 20 Apr 2022 07:09:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/27] linux-firmware: upgrade 20220310 ->
 20220411
Date: Wed, 20 Apr 2022 04:08:07 -1000
Message-Id: 
 <4d7fc7ea9cf3ba8f29c197646c59eeefc0554883.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164687

From: wangmy <wangmy@fujitsu.com>

License-Update:
    Version of driver files updated
    Added files for some drivers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 01684df3a51be476081ee21eb54c24fef00acb3f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20220310.bb => linux-firmware_20220411.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220310.bb => linux-firmware_20220411.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
index fa0f906db0..c7d9e1126e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=45a9c4a92d152e9495db81e1192f2bdc \
+                    file://WHENCE;md5=4cf67d71a21887c682c3989a4318745e \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5938ee717b2023b48f6bfcf344b40ddc947e3e22c0bc36d4c3418f90fea68182"
+SRC_URI[sha256sum] = "020b11f6412f4956f5a6f98de7d41867d2b30ea0ce81b1e2d206ec9840363849"
 
 inherit allarch
 
-- 
2.25.1


