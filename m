Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.36658.1598811528407190211
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fU5V/WmZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.177, mailfrom: steve@sakoman.com)
Received: by mail-il1-f177.google.com with SMTP id c6so4682717ilo.13
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zYJ+ZcZaMQ0LGNFZEQ3R8u/PjLVhBzPB9I9IeAW7rbg=;
        b=fU5V/WmZ/LN1bnUIAY5J4tcqrQ1df2+PqNbcVYb0nqkvVukBPVHvhduiS3WXA/xpJh
         jeiyJH8S55qMC6P679QBdDT8rprUXGhuDb/qxEXw48u8RX8+13+pFsG3UZLm+HhmYSpe
         Xz4HTifvD5d+sDfli5G8Ekxd7bMUbbOTfU3oSyOW0UPGJqeCA0FkY23/4Vc435SY/auB
         VZX0ThFE3IqgefTkX+7pUNH+L49NME0yK09do/fTdAQMPmuEkQXgDuRz65TZbzMnlufj
         dp0fXeq1NbB6f40s3M/Oyjj1tNG3nn9GvQF+MuH7wMRXEqzs68HDz0zmkXmoubx4Fysf
         14bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zYJ+ZcZaMQ0LGNFZEQ3R8u/PjLVhBzPB9I9IeAW7rbg=;
        b=V+2x8WNXToCMqrOVy0UkLv0b9lhlJir75pFiXwXmO/zHZ40DDTCBGRqssq4082JCoR
         ULNv4SDix6j8jKm/B9DT0xBxtRzezkKNu4nsDJGmNQa7+kzHDZhQepxDY2iEKWSKk4v1
         0YK97ldW+sgmHFTnNtp6kcQRwVTK8Wujhc7MSkQQnw+3sPm38vKtKeeHBm/MunMF1ZzX
         wUFevwYyqmIZl0QWAOI7T6vfasnnLCJOJ6bwTUKksmt6xnj0QUb91tbmrahIhJ1BeBuz
         q+67mns2j/D+khI+rUFJ5bGSJiz2Z3sNq92LirBwq8Fd5MxvdxbUzGKBqkk91nbG+4cc
         dRXw==
X-Gm-Message-State: AOAM530MQNWb5LOL6GebOdTCpTLMd60Lrzy+rpE/VuQM+juXLToqclxN
	WMQMW0OIRYG/KJX9ZSbrbhY+M1Z7vlKGEn4+KSk=
X-Google-Smtp-Source: ABdhPJyX1/3L8az8oEuezNlXdNOk8lwSdtaUZZQMQ2V/bH7En2p/OFRPYoxPlztM4R8RrMlpylcOEg==
X-Received: by 2002:a92:894b:: with SMTP id n72mr5796899ild.155.1598811527383;
        Sun, 30 Aug 2020 11:18:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/25] multilib.conf: add u-boot to NON_MULTILIB_RECIPES
Date: Sun, 30 Aug 2020 08:16:10 -1000
Message-Id: <eabbf54e22ceef73e2e5c086f4db1e451f2d5ef8.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Ming Liu <liu.ming50@gmail.com>

u-boot should be a non multilib recipe, add it in NON_MULTILIB_RECIPES.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5e7dc0d68efb2d43bbd5b1be9e6d555fc4456fb6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 58f2ac5c86..d231107f8b 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -30,4 +30,4 @@ PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkg
 
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf"
+NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
-- 
2.17.1

