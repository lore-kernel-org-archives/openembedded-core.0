Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39416C433FE
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:50 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.32836.1635699529289080629
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oUOX1Xx+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id j9so6913652pgh.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XJfIdTS56JhAyIWRXg7r47goeF2sMAFbfGlJ0SdOmlc=;
        b=oUOX1Xx+lmuCOnAmQkf58OLBvcRa+cbPNuG9rYCguH3+Dr/NSU2ZC6WFjIPSXwDhib
         RvfPqjgOG62b9OCPa+dXcAjpIyTdi8EHglC9huWcnVGMFzQPNiUTiRifXqLkAwtoW5bo
         HJfC6mgCVzZjfuSnwO2wpvQZ8vG+Tcqortd1x032Fppdh3pykftQGfUP/JtXFEXx3MCR
         CrKlOrJ9mtFed3coPs5SHIU9VhUVoxVeYOS1ZGrT5igT3U3lo8m04Y5oUXglqUQTC5VK
         NuXlN0BCBzFiA5nipxbtK+rbjPawV0kB6ESjvjwGTRMAfwop8mzA5cGhqWUp8ciLw6If
         RzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XJfIdTS56JhAyIWRXg7r47goeF2sMAFbfGlJ0SdOmlc=;
        b=703a9Mlgl4rMsEqBKD3cn3cnoowuz7O/iV+d+Wr0Xw4buad9JEPZ01hvYzuVX21aF7
         aSvVYL8/PcoypYPrZQsJ4Hc1ozotz7wtK/ajMS6/c6CJhzkUyI+MwptDUikGf1JR6+oz
         8Bj/FkuO8se0X0t/d0ewMj9qD62L0pDVcMdrO/CRgxQb1yVaKC2iaUnLPEeOO14DmGnV
         ee1ZTDthHotJT6FG5281UQ/lIOhA0bYgPJmGhkyh9bNgC3lF6aus0huEtx+L33FTGyn2
         Ej/9kTCB/9o7EgX9qvVIVFBwmFRpiS0jodVz775RE1s9Y5Ye9P0+cdi8UrvH6s+3YxO6
         kntg==
X-Gm-Message-State: AOAM532lvq9YDU3L7vMjwR4Ua/6QbdJd43gVFCr5qt12KWW2FhdMm9oC
	YqbIvhRkpaDOQAJus7FU2ozqt0BqdlPe2vZZCfc=
X-Google-Smtp-Source: 
 ABdhPJxMIGJIGsHfQWj8vQTh/WXtgcKIaXL7TY6EQZvTLw6VepAuvkeTCBYoLYI0iAAEzFbg1OTpRQ==
X-Received: by 2002:a63:df06:: with SMTP id u6mr18172397pgg.148.1635699528239;
        Sun, 31 Oct 2021 09:58:48 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/29] linux-firmware: upgrade 20210511 -> 20210818
Date: Sun, 31 Oct 2021 06:57:42 -1000
Message-Id: 
 <7b07f9562c5f2967e83591107e52b61e59a86816.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157681

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: new firmware files, copyright years, file names
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bfceaba4f38771047dfdfdfdbf16b794006dfd78)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...inux-firmware_20210511.bb => linux-firmware_20210818.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210511.bb => linux-firmware_20210818.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb
index 513932984e..7f6db18b69 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb
@@ -97,7 +97,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.ice;md5=742ab4850f2670792940e6d15c974b2f \
                     file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
                     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
-                    file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
+                    file://LICENCE.iwlwifi_firmware;md5=2ce6786e0fc11ac6e36b54bb9b799f1b \
                     file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
                     file://LICENSE.Lontium;md5=4ec8dc582ff7295f39e2ca6a7b0be2b6 \
                     file://LICENCE.Marvell;md5=28b6ed8bd04ba105af6e4dcd6e997772 \
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=727d0d4e2d420f41d89d098f6322e779 \
+                    file://WHENCE;md5=15ad289bf2359e8ecf613f3b04f72fab \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2aa6ae8b9808408f9811ac38f00c188e53e984a2b3990254f6c9c02c1ab13417"
+SRC_URI[sha256sum] = "bef3d317c348d962b3a1b95cb4e19ea4f282e18112b2c669cff74f9267ce3893"
 
 inherit allarch
 
-- 
2.25.1


