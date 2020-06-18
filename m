Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web12.10551.1592494931767505821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EYhTsKM8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.68, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f68.google.com with SMTP id n5so4898245otj.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=e/BqXb2IlDajCGxPFC8Ji/LN6GQaPqH1UkaMehE3aq0=;
        b=EYhTsKM88fDibdN7lEfIc9wbDxGsydOsx2JmYvZFJSmHcRIi8OrAR853lxs2ZSF3R0
         0vLEw2Y8MASROO7wkHvIWRO0s9PgBq2/+mDsxayRIwqhFCLRoB6kFtSMjsA+JSHtu5PF
         6GirxA+i24BM27u8AkhpBY9P+l/IjBck9xhCNaSApKSHk4D8x7yLhgl2xi8eGiTrdmCb
         P3+Ff0sPmKwvxcNtp/8Gwgbqu2rZmDLCyEGvmFpGt0HNy6B4y90MmQuxTdQs25FO1WUC
         elr9UDL9DOq30LcpOGzMq4mIn4LtXKyY9DEj1HuYMJ6b6SAilJS6Zuw0tmuooHZwcLwa
         GqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=e/BqXb2IlDajCGxPFC8Ji/LN6GQaPqH1UkaMehE3aq0=;
        b=oI5kxPBdnxLhXqNqAx8TDp3l52mgI4yVjTDRQr6dLEJM8OgQUEW2K08QTGZJLzBnZv
         rEiU/QotG/e0JHDG6h1Xn0u6HmvXnzY6dKXm1jpSI3w0Pz6UASYevtKZBvReV+JRrrFZ
         sGqOKCS30M/8CrjVsJtxFbMTC+tl4xys3NcERk6C1SU7+8TanIU4IY1Vd2siwjEY/78r
         rPmT8lUAn2gDrshJ813HnxotejbJrdC6wtV7Ya7i6pzqrRqqErcj+/djG91Lym1PXzTU
         7h+BUqETSYSmzWNE+2qdMoF2Q7inzxd5Iz6kkUkia2kFzktmIJ+XXaS/RuzgOUfSzRQV
         6YnA==
X-Gm-Message-State: AOAM532+RKOJQ1ix43n/3NpE3xBGzSYmdTp281ajWNdbtdORbojTRN07
	Y/nRdmcvlIUxw3SUB3TaKIV3qPWrPt6Gjg==
X-Google-Smtp-Source: ABdhPJxTxAXVGSGsZqdMOf8G19yQJDRE1U3J/AjeSXdlokjsjP1UT2SFORBfNgQCauFxc/SQ5kWDEw==
X-Received: by 2002:a9d:456:: with SMTP id 80mr3908324otc.2.1592494930576;
        Thu, 18 Jun 2020 08:42:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.42.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:42:10 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/21] iproute2: Remove -fcommon
Date: Thu, 18 Jun 2020 05:40:38 -1000
Message-Id: <433d3856151e095afb640a567241bebaf2e84b87.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Adrian Bunk <bunk@stusta.de>

This was fixed in upstream version 5.5.0.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a9f67b7c50a8c28a75fc48c8abcb8a7bb35f0e6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb
index ad0ab13c9a..7ad4b8eee6 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "bac543435cac208a11db44c9cc8e35aa902befef8750594654ee71941c
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS} -fcommon'"
+EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS}'"
-- 
2.17.1

