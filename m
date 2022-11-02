Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E460AC43219
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:42:51 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.1989.1667356969097259721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TG7g3hMt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id g24so15305409plq.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxZLV9VSvYu9p6eXvRzdb0gBwUixM4Wi1T2Q35/vgEY=;
        b=TG7g3hMt+UCRCBD5qj3XDygdmOKB2h4GWbm8gyaoGRbPtX5z27d/5e2WeEE20PzJ5y
         9GGzJhIoerCkgszJ3MrvF5jnesNX5GPoq0VpAdXl56AZNskNgWvbp9tM7O1WwIFNTCcb
         1OwWUxtUE6akqB0x83jDA30HMB8G1r7YH10r54iOThTutAa53jPjypLJBfwxV4OCVeoq
         vKrBX6mAKMHpKz7MxAKsflTLm0FT3g6Yrp3NzDg6s+rtzBtlyUjCbmS+nKpn1osjCXGc
         INNbSrytOP/T3DoZ9/V/JcUS681PWGTF26HEgEUgNMv7QQVXEgOjOJ3aIHHGNg/CoNXf
         OiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxZLV9VSvYu9p6eXvRzdb0gBwUixM4Wi1T2Q35/vgEY=;
        b=vqBDYAWUMtTffRR6FeOYxAuxtjG7qC6KptI5eBFGW18MaSl1wEsAI4U4DOXJlhc1DV
         gMEDVXu4biq7+qoQ2evOK23dOute8VRlfrCGEq0p5eS2Jpokmm0v4gLkX7NrNRt+U6py
         4SYCs1nIWlVZcTH56fxp7OHllY2KLzpQVOS+Cydvr5zK9gOKXbaxoIwZTyahTbJP8/zX
         VM1jNvnVsh156XjuX9mCnFGD74qGnY8A7WQCoAFu8QNUKDh7Jl6+oZszOYnCP0LpiUMC
         GQJ/tplvtCa2XVSPqpje/c/f/4Kw0xZvV5oYGfcTGabLzG1q5grLb4D7xqhrYY8vRI6w
         GEHg==
X-Gm-Message-State: ACrzQf32ciH7Xiys+su2XK7Um0AW71IfICDyP6N1P66BIXBGF3nl5l1P
	T40tZBUGNavMWAYvIGfHuXjrzMujhzU7oZjs
X-Google-Smtp-Source: AMsMyM5lA0eo39jYi9n41PanPTJCH10owZTzsBOd0Se35355YVVTvM/pRIBIFP583A6RImPK3CKrbw==
X-Received: by 2002:a17:902:a611:b0:186:9ba2:148b with SMTP id u17-20020a170902a61100b001869ba2148bmr22509316plq.164.1667356968051;
        Tue, 01 Nov 2022 19:42:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/20] mtools: upgrade 4.0.40 -> 4.0.41
Date: Tue,  1 Nov 2022 16:42:02 -1000
Message-Id: <9ac0de44f11123876a92f7d7819d5ff2c20475b7.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172552

From: wangmy <wangmy@fujitsu.com>

disable-hardcoded-configs.patch
refreshed for new version

Changelo:
=========
- Made it possible again to have FAT32 filesystems with less
  than 0xfff5 clusters
- Make FAT32 entries 0 and 1 match what windows 10 does
- Misc source code and configure script cleanup

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b19127f0cd0e10c7180c138284b38c97fa9db7af)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mtools/mtools/disable-hardcoded-configs.patch           | 6 +++---
 .../mtools/{mtools_4.0.40.bb => mtools_4.0.41.bb}           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.40.bb => mtools_4.0.41.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 8f46174a5b..2d42fa531a 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 3a05dc2c0acff1713dd44cef5e9f328f0706eb3e Mon Sep 17 00:00:00 2001
+From c496cad7b7a84e599f521f289648373df9fad80f Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -12,10 +12,10 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 630f99d..07dbf53 100644
+index 8c5fa83..346048b 100644
 --- a/config.c
 +++ b/config.c
-@@ -834,14 +834,6 @@ void read_config(void)
+@@ -843,14 +843,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.40.bb b/meta/recipes-devtools/mtools/mtools_4.0.41.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.40.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.41.bb
index 200c7c7681..29e7427a10 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.40.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.41.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "a22fca42354011dd2293a7f51f228b46ebbd802e7740b0975912afecb79d5df4"
+SRC_URI[sha256sum] = "2542152264fb3eff7ed70662abf4f4eef8133bc37d0b7a686c240df2b5f80a13"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.25.1


