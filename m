Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FA4C19F2C
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 21:18:36 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.7097.1659215906453940563
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jul 2022 14:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XNt7lge/;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id m8so9466704edd.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jul 2022 14:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=evreIacFbAzQPSZGvk8sKEYb/Bf3F2OLUbFmM5khMlA=;
        b=XNt7lge/tzc1huhj/1mUOGR9hkKOgyrRhW+zt4geDzElGsR9RzhKUCcT3DwCGSZEzw
         hYmTqvFiT0femfOGBNEVOx4rHiGK/57zgsJUae87+XgZNfXk7OnMXAwWJAJiG4Bn/LUd
         CEsK7oEZxHTrT1qxvCXv+kbdHiZXOAi6VnxZVpxVa1JIUpBtKXXbDtmZZgo8hNzqQuiK
         0DLg4DznkbXUytkvC2x8trQNV7UD1GaCXCIL4w+oBxlNgPzV6fdrX+HFmnzg+kj4EhkJ
         aqVepgwCbtnCKJVnfrNk4cE8NXHqp8C3zn043JpGPJF1mK1Zc5BFz48dEB9HAANaS47c
         Inmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=evreIacFbAzQPSZGvk8sKEYb/Bf3F2OLUbFmM5khMlA=;
        b=pMjNnSF9ItzWyZglmV9TAAQmfVt90XWWFbIyAbrTPOLjEqd7OZkA8xWPNj1tr2tY4h
         8fdgkK5M3CZXJHkv8SOYbX1VFD2+pgRdjERoqjdzZSGuBld0tcy9nNEn2mWEY9CKl3L5
         ImsqnmZXTd5TFscTpV2YSzlMVrCaB6xumT0u8SGoCqZqHo/mLwVMRCsVlnDxhI2GnHc6
         eM0ySFQvG4VODK5YAKUxbEFLgZOcWDGGXkOH107QNAap0gYb4VTq3G+mk4Ie7wcWMeVt
         QF8uNDByE3x+b0GTV4woJzicZ9wydDmNVQGuc9yAQZbINDRVwCrdq1lfPT1ejf3R6td9
         YHLw==
X-Gm-Message-State: AJIora8Zh3RWzyrrDSJwnJg+bYYxaoozMEQLCm+LtmwB9WbWj4Pa6Szy
	9XKoqhVqxfKoZQJj1jGxSwHOiAC1u9qw0A==
X-Google-Smtp-Source: 
 AGRyM1tO2luMB7AXm6aHWY2+lbklbTz8ftimZA7+FZU68nWEue2neDuzLilVnRVGP1P25x8oXSqsOA==
X-Received: by 2002:a05:6402:484:b0:43b:6e02:71af with SMTP id
 k4-20020a056402048400b0043b6e0271afmr9163977edv.176.1659215904656;
        Sat, 30 Jul 2022 14:18:24 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aec80.dynamic.kabel-deutschland.de.
 [95.90.236.128])
        by smtp.gmail.com with ESMTPSA id
 s10-20020aa7c54a000000b0043d1eff72b3sm2963154edr.74.2022.07.30.14.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 14:18:24 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH] repo: upgrade 2.27 -> 2.28
Date: Sat, 30 Jul 2022 21:18:21 +0000
Message-Id: <20220730211821.8943-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Jul 2022 21:18:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168683

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-devtools/repo/{repo_2.27.bb => repo_2.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.27.bb => repo_2.28.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.27.bb b/meta/recipes-devtools/repo/repo_2.28.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.27.bb
rename to meta/recipes-devtools/repo/repo_2.28.bb
index 3c1e3acd7c..052108e9e5 100644
--- a/meta/recipes-devtools/repo/repo_2.27.bb
+++ b/meta/recipes-devtools/repo/repo_2.28.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "68d69635c7bfef6ed8a5c7e29246265611471e0f"
+SRCREV = "a8cf575d68e7e211292d967f4a12cf609a028b20"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.17.1


