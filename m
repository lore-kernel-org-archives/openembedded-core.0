Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D2FC41513
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 15:55:42 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.11258.1720799735801176550
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 08:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VGKPmMZ8;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3cabac56b38so1354577b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 08:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720799734; x=1721404534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPDzGPUWgvsLLhSSJh2zPYwmDxoufdxCfCY+FXK8xxs=;
        b=VGKPmMZ80zmiQ0RSNpvYB6SxVJrGiuaEaXMdclAClEGYLt9+kmCbZhs++Y0B7b446O
         BD7GIFIoFt5dGBgVJhX57EUFd+RWtU40k8IS+KFn1avOr9rXzfMYkmIdBKHrHF4aDUwY
         DKR+QWD3pYs6xSqM7U74KrSVfS3MT9ndi2omzGgiqKddcu+2o6sJm0r6lJFR7tA7lNK8
         CSGOQ+uUNPFBR98LmHkXtTxShb0ky3A0VlNqlrRdY8V2bkGl4w/H0eLMmgVnEHi5Og2V
         FVZFSJ0/wroBFLbuJAYeu1eeHJMo5i8dKD7BmdVbthG4GikWgACt5l+yW/efdShB6Vje
         alHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720799734; x=1721404534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPDzGPUWgvsLLhSSJh2zPYwmDxoufdxCfCY+FXK8xxs=;
        b=iJ4LjGGnfNE7aHeix2PJFF2VhNhjrg1M1P9XWJEYVcCVU60/jrZkRZJ/Hz/q8zBgmb
         3OmFUiMD0gZfPmDwesrfJx8Hn5C50Hy8YTmqg+XieGa27eUgEdCaTIkPgQibHgSN6e1j
         P8VFy0HJ1o+z5x9dAky+2oXQZD3sRe0mstaz0iV6oaEukhtaH0Fj+hXzfJc+OA27AU5N
         qcY71DAj4kdbsnRdEwZKOnbEoDmRMvNsEM1Svje9c3vNgTOpuikXWWAX8ePZ0JzozzHI
         WMRO0E4B2Z+bNVG7HkhfDExFYRaXQGNNcg8LgHoBw4mP+bF9LLZy/TNhcYIwUjb/7riY
         ddBQ==
X-Gm-Message-State: AOJu0YxHHKczDNAi5t5vWt7/yqFuIuUJAn3nJaD5Nkv4t2zHAZN16GfH
	Dzf6YLhM3ZZzFZBQeuEG88UUftGVJp3FavCqWvWrOpIWEryq+Hpx0uB9Vw==
X-Google-Smtp-Source: AGHT+IE2FAChmMxOnVxIgxoWygxoZwmO8Jo1lhkVxnVu4iuav+x2reF7Dn+0syQdVSi/6LODXlKPlg==
X-Received: by 2002:a05:6808:16ab:b0:3d9:28e5:5865 with SMTP id 5614622812f47-3d93c065553mr13926625b6e.21.1720799732841;
        Fri, 12 Jul 2024 08:55:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4a71])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3dab0084dedsm90610b6e.9.2024.07.12.08.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 08:55:32 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] icu: Remove SPDX_S
Date: Fri, 12 Jul 2024 09:55:28 -0600
Message-ID: <20240712155528.3512448-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 15:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201833

This variable hasn't been used for some time so remove it.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-support/icu/icu_75-1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu_75-1.bb b/meta/recipes-support/icu/icu_75-1.bb
index 27fe392e4d4..148c393b173 100644
--- a/meta/recipes-support/icu/icu_75-1.bb
+++ b/meta/recipes-support/icu/icu_75-1.bb
@@ -11,7 +11,6 @@ DEPENDS = "icu-native autoconf-archive-native"
 CVE_PRODUCT = "international_components_for_unicode"
 
 S = "${WORKDIR}/icu/source"
-SPDX_S = "${WORKDIR}/icu"
 STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
 ICU_MAJOR_VER = "${@d.getVar('PV').split('-')[0]}"
-- 
2.45.2


