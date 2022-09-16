Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031BAECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:55 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.900.1663362525808510024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a+sjLMEZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 n40-20020a05600c3ba800b003b49aefc35fso553849wms.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=JLC/DJ7moBxX/rvQ5uHgbhtfSjqmKMoXPbV4gF1RIko=;
        b=a+sjLMEZMjes7wEoL6MDViDOulWJ5scouTZeYCYho6ryRfqzGJIay/TO/k9G5Mw0fm
         3SNtueAXjJLxaCBigAOpZQK9GrMUk1QfRhYLu5yl27ArrfqZzlrOV6myzL0Z4RL8nZsI
         XntLe8mqxSoJjGFCMjs/IOnLCdkbVM51oGQmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JLC/DJ7moBxX/rvQ5uHgbhtfSjqmKMoXPbV4gF1RIko=;
        b=pMRB1hVBMuI+8fJ2aey8LWcOhZrCUjyowilPGgesDcGQgL4AWft5HUPsehLiXNwD4g
         V6hOHF+xKK5O91HDqUIi5apXOGhvFL6pEW3vJXCwU38J4DBefY+9OCHYluYB0TyRfN2c
         21yZrHHKqoHYZtZhQpmizxK/dDRL/Sq9UrGI4Ysr4RXD2MzQrMU0Ds8zZliOxbwuEWEf
         a2LOIAdlv8C1/wKoWmIVwyHCWgVGmvIdbOYf1KhN6qVJfM7hWOliiD23QadFKH+oC0+o
         t49jWDbCXPU/6L0Om/m7c3+PePTHxm2Zu1+Fde/kRP48SRJiHsWqlQYOy3FIM1EUWE2t
         yXTw==
X-Gm-Message-State: ACgBeo1XkyMpDO4ZrZvpdLJJ9jzFiiE5wzzQ+keEIl6nZ94TTXGJgJVd
	f+yZXvOAefizFg6ODrviYdoKy2alVWkCUg==
X-Google-Smtp-Source: 
 AA6agR51Mc60TOK4AWzFkTJorfuLkaNkgOWuCRVI8p9VopJ5mK01asoaDdUFS1p6Odkf5mpF89CSpw==
X-Received: by 2002:a05:600c:34c2:b0:3b4:76f2:9c3b with SMTP id
 d2-20020a05600c34c200b003b476f29c3bmr11182368wmq.179.1663362524009;
        Fri, 16 Sep 2022 14:08:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/24] repo: upgrade 2.29.1 -> 2.29.2
Date: Fri, 16 Sep 2022 22:08:14 +0100
Message-Id: <20220916210818.1228761-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170818

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/repo/{repo_2.29.1.bb => repo_2.29.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.29.1.bb => repo_2.29.2.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.29.1.bb b/meta/recipes-devtools/repo/repo_2.29.2.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.29.1.bb
rename to meta/recipes-devtools/repo/repo_2.29.2.bb
index 740132c2f6e..42fd18ac246 100644
--- a/meta/recipes-devtools/repo/repo_2.29.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.29.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "4112c07688d0e0e568478e9f42be349bdd511d45"
+SRCREV = "891e8f72ce3551a19c377456574bbfbeac5c8b8e"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.34.1


