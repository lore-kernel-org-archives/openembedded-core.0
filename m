Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57BCC433FE
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 23:55:35 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.9327.1665273331392210828
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m+eD4LTM;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 d7-20020a17090a2a4700b0020d268b1f02so801302pjg.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xac+FO09lPbDyhB7coXH7BAcCPD/sh4IlPJ6ct5ZUk=;
        b=m+eD4LTMWzRBXktzHi0WnSKUSr9eQrhW4SjBFEte+chpKb5qefQ9aSd6uMYtKgYlEp
         iz15sbCgks6b2O+E0FrGlku2gCqFZFoO4KGCPZ+VYan3qDmrEx2ohyBGD0rLefuJBTj5
         iPHqgIWZT+7qygGd5sie6ckfrlad5TRvehVQZtOqfPQHj/MV8tAW9F6xX0PF7sECqgha
         qblvTgAFFiDWhxyNpY+uj3azAe7AuVc59zRVhxzhtj3+L7NWiOfp4ngm4XdYs4RpiOaM
         xlkNxNRcYhfmLCd847ezxF4nCrBR9HWuEDBCUrLNQ7D8W5h06kEKDYYekqoqbDK/QBX6
         e6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xac+FO09lPbDyhB7coXH7BAcCPD/sh4IlPJ6ct5ZUk=;
        b=Fx/qgU3Y+g/Kt+PhAKbXZJrdOAnLHHvCyTeeB1E8HybIJEv3Ja6Ls+df+T4GYulbKo
         PVp2yWH8Xn8gIx5UdbZW4C+SqC/kKwOaLZEunVWtx8e1agGMeev/2h0HfRsMxIGTlJb8
         JHtodM/LvDrVkW9H3QCl3UjjAHW6U4GMz2QCNuQsmhw9qfun5wAEgmOPf6EUvaSZofTU
         HA1ZVDOvzWxhiirJOEdWDU2oJTLeYAz8s3FGBrY8aH1DTvUlOAPXezBRmOeYLu+iidSX
         ezwbeCJXEQY0BEWxpRw+60s3yt/kdkAbPyPb34Mjy7RNPuCz4kaAzb1hl3Q/MGZibfBO
         Vfwg==
X-Gm-Message-State: ACrzQf0qMQV+Q/5I/e7Q8kpI1OHY7fti04JDiI/vTMrYrsHCmJfjAeiM
	glznCZH6J2YtQ/0HJNHYUtNtgRemKzE=
X-Google-Smtp-Source: 
 AMsMyM6mOjalUgysEYhWJDcXJrXUhhosv5YoutbrVLQ4tbDj3vOtJ2exPLZmF7xQUtRBW7Lp58ySQQ==
X-Received: by 2002:a17:902:f609:b0:17d:311c:b5ad with SMTP id
 n9-20020a170902f60900b0017d311cb5admr12056759plg.43.1665273330413;
        Sat, 08 Oct 2022 16:55:30 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net
 ([2601:1c0:ca00:cea0:170:23ea:e88e:bfb7])
        by smtp.gmail.com with ESMTPSA id
 k11-20020a170902ce0b00b0017f57787a4asm3814710plg.229.2022.10.08.16.55.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 16:55:30 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] python3-setuptools-rust: upgrade 1.5.1 -> 1.5.2
Date: Sat,  8 Oct 2022 16:54:52 -0700
Message-Id: 
 <14b45d2df0ab559a502f03468171f6d1dae5be05.1665270768.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665270768.git.tim.orling@konsulko.com>
References: <cover.1665270768.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 23:55:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171546

1.5.2 (2022-09-19)
Fixed:
* Fix regression in dylib build artifacts not being found since 1.5.0.
  #290
* Fix regression in sdist missing examples and other supplementary
  files since 1.5.0. #291

https://github.com/PyO3/setuptools-rust/blob/main/CHANGELOG.md#152-2022-09-19

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...etuptools-rust_1.5.1.bb => python3-setuptools-rust_1.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.5.1.bb => python3-setuptools-rust_1.5.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.5.1.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.5.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb
index 24a4f4abef0..502967fd20e 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 SRC_URI = "${PYPI_SRC_URI} \
            https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "0e05e456645d59429cb1021370aede73c0760e9360bbfdaaefb5bced530eb9d7"
+SRC_URI[sha256sum] = "d8daccb14dc0eae1b6b6eb3ecef79675bd37b4065369f79c35393dd5c55652c7"
 
 inherit cargo pypi python_setuptools_build_meta
 
-- 
2.34.1


