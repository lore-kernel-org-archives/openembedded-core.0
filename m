Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D30C43334
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:37 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.21962.1655667096089030958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=K1Iv3aM/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 a11-20020a17090acb8b00b001eca0041455so859890pju.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JJwdquBNbHl0PKJaEU9f0aKhxQ1QmC5XqrCPvSVi3rI=;
        b=K1Iv3aM/wcpIYnQYMCbwgoOZhFVCu4jXe8x18GYmuuAhxRteoK8aBZKuh6031T/4I4
         RrgnLEPm7cN2CPHrxdKLLxyQhcZqxI9RFYOo7RzdhP7JA4ldhErsKci6TAqTP6vo2kf0
         NmHeOEmegA4p3c3qmvZLfvgd2Hy0lm8YK3CB9R54ytPEIP9SaTgPvENt5Cvni82UvrYT
         O3KZgUZAWxlhLS4i8x8VsBE8Q3VeLeINRduFqQIUFkvgyNvCqfdx3bYfwdXqL6EFZWzp
         6Lr3V7KqW3xw1p8w9OezSdTIS0TFVT0ROWNzg3Cv9TzKIKdZdBDpvm9moUsNOwLDSU0E
         UiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JJwdquBNbHl0PKJaEU9f0aKhxQ1QmC5XqrCPvSVi3rI=;
        b=v/PgmY8LLb0GVARW3oaWC+6GySDcIO6lo9DSyo9Rjd0vbDmj3sxm3DEe9vepZ3pa3x
         8aX5tASze0f53Tpb1dUEqyABoOLsVZClvx9R9U2ogliRL+EVwRMhUttUmFgTGcG4uQWY
         wnMdat/zuYW4xBIHrkxZAVVTv/DSd+ZsL6kK/HFd2orAQC+IEkgIBrYmGRE1qzaIbK5u
         kzg8yrt9q4sjeuuWq5yxCJGklkNRDtck+VpatUjWbjNi9C2SY9NbRZogP8PBzbmJ2dNF
         0zqNyOOXlWhyKTUU7656WDF8x6C6ZSO54J7sv/p7o/HxZPl+uBTIMwmIXssDZwyGKt08
         CPuA==
X-Gm-Message-State: AJIora8tZ3SH7tERlY5N2tJp7tXOIdWS1s8LSmybQSBvutOGGhXRvQZD
	MiyRpZXMeoylqPOlOOYMOEWARe7ewetj1kcC
X-Google-Smtp-Source: 
 AGRyM1uqa7K/k+i0yTwPk0TV2yEqPnrqrNWftYmYivjYe03GGvC2U3uROY356LuqE4QAeqzR6n+xUg==
X-Received: by 2002:a17:90b:384d:b0:1e3:1266:d378 with SMTP id
 nl13-20020a17090b384d00b001e31266d378mr33777033pjb.127.1655667095150;
        Sun, 19 Jun 2022 12:31:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/15] systemd: update
 0008-add-missing-FTW_-macros-for-musl.patch
Date: Sun, 19 Jun 2022 09:30:49 -1000
Message-Id: 
 <7cdaac4a5a30e8705fb725fd0d69629f268e7da3.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167060

From: Pavel Zhukov <pavel@zhukoff.net>

Fixes fuzz warning with insane class ihnerited introduced in 4c3f51142b
Kirkstone specific, master has been updated to 251.2 and FTBFS with musl [Yocto 14838]

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/0008-add-missing-FTW_-macros-for-musl.patch   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 4cce9a3fe6..0c0d3d0b62 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -21,12 +21,12 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  3 files changed, 22 insertions(+)
 
 diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index aeaf6ad5ec..3df1084ef2 100644
+index 6c0456349d..5140892e22 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
-@@ -19,3 +19,23 @@ typedef int (*comparison_fn_t)(const void *, const void *);
- #define __COMPAR_FN_T
- typedef int (*__compar_fn_t)(const void *, const void *);
+@@ -14,3 +14,23 @@
+ #ifndef __GLIBC__
+ typedef int (*comparison_fn_t)(const void *, const void *);
  #endif
 +
 +#ifndef FTW_ACTIONRETVAL
-- 
2.25.1


