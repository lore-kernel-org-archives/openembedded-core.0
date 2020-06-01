Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.38013.1591020735949324431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iQyFJnhH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id q24so5154410pjd.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Y2ltRvl1u9nogCeRqZDkgls7Vyxm6FwK8iROEBPnazM=;
        b=iQyFJnhHk8gk7NK5WhOmeY+uXBg3a/u+JImX7cWGv2J8tRLupps75Z3pkvnVTdTHJG
         a2Ct0DKmLTthrsQxTel1+qD/c5Wgo9wLXbjhowYS7TGSkHozjCdrNruqIoRttsvIRoBe
         y4UKX2YPnoFMGFb1lac7nYMr8T9ecHU5VrpZ7GIr5z9QuAkEvUQ1bg7zXxTlO4+AxhYR
         3RpspYdqb7oTKD9916LNyfkCvfZuHpLK5WvZqf8dEgtR3AhlUbGIpS3bcA6Ibwa6J9en
         t/Q/03N93+I8ycTjfg6MivX1QPjlVe4i6J6CNB/Q+HsozbRGi4kNyqSvLt1HYC5DOpnH
         pg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Y2ltRvl1u9nogCeRqZDkgls7Vyxm6FwK8iROEBPnazM=;
        b=QJXi+FtlJJC6sW9xBuMUhmBrwzbB5eSODAy1KqnpZTfkK70DqJXScbBqZ1kWqNBD9j
         Ko9i12iv+knoAvprDmyh1auHxHEwmRZ5qHp9KPWOh6isp3MbuqmknYkkgBzMwCnYoTWj
         WEbyoxS7coQoDc/AP/p6v7DmtxJo0F0XAyRHoUmHAZdj6oJ9SC+qGhsBZyGJQZhQ59mY
         Bkm5XCvQYQlV1U+/EUj+w6BKcvoAfip84vnsJ9sNp3WlxCnMiRuKncHBKgJqhF4v2OQk
         51/QrtRDmC2dJY6rUznGRWrTUYWNpXEABFXApyxcrE7uluLtSKmIv4FMK7vK1iJ9uAmG
         W7mg==
X-Gm-Message-State: AOAM5337c2vO8rf338U7xPHSzU1QnRsETRyF0NBp/Tv0PGGK7kpvur82
	WJc1ZVe32EYsJx0kr6xsXkOhPX6+qCU=
X-Google-Smtp-Source: ABdhPJy1dBOWzcaetCBUrn8vUmINEleMU3EBQV1pxksSHCmfGoW2X8o3d6WZWkFSkD9fLH1iz+nEag==
X-Received: by 2002:a17:902:a515:: with SMTP id s21mr20659675plq.334.1591020735043;
        Mon, 01 Jun 2020 07:12:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.12.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:12:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/16] libubootenv: Remove the DEPENDS on mtd-utils
Date: Mon,  1 Jun 2020 04:11:19 -1000
Message-Id: <ce5500cc07da270322b67db5001fc1476b6bf2fe.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: Adrian Bunk <bunk@stusta.de>

It was only used for pulling in zlib, but this is now
a direct dependency.

Also move the DEPENDS to a more common location in the file.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a99fd8b705be3b8c70cb0f17f60b013d989d625c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
index fa90a12bf8..ea29b668e8 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
@@ -1,5 +1,4 @@
 SUMMARY = "U-Boot libraries and tools to access environment"
-DEPENDS += "mtd-utils zlib"
 
 DESCRIPTION = "This package contains tools and libraries to read \
 and modify U-Boot environment. \
@@ -21,6 +20,7 @@ inherit cmake lib_package
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
 
+DEPENDS = "zlib"
 PROVIDES += "u-boot-fw-utils"
 RPROVIDES_${PN}-bin += "u-boot-fw-utils"
 
-- 
2.17.1

