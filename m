Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67F0C54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 16:33:46 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.1447.1662654820681793877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 09:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: otavio.salvador@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id
 h20-20020a056830165400b00638ac7ddba5so12708864otr.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 09:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=wAQ9MK2bOgGcH1GfaG4Hwd8sC6jrZMYuc6GnZUezx3A=;
        b=NIMNwiVdnHJTCiewOXze2wXKi4bXxHPX1GzNb6Q8/Zdgce1lh7XsVov8hfpyuAadoa
         A51SlZw5VGYKO4AFE7t9YYMMkQQ6TY3PKsfaQ22tP9gZ9bneuAlY+D5wD0X2tWPHLG3M
         LPIm2jimo3dKsfEoiKpA2fuCth0IRgwwo/bQEOb9eoAprKfqGq62Rc4HvKC9epUFOfPo
         gIQcY/g2d2NlO1LQqoOFczKKZb1Yu/3e5d+rKJaSij5hgfUxApxMtpGoz2eX0/40uV2s
         DhBfek2/4l5yDfMiteqE+jMHAI009uSIBUo6kkr3g0+sysPzczfmq5WNkH3LtpYh5/0c
         7Vww==
X-Gm-Message-State: ACgBeo0bFEDQmQnz9JwrEKmKuqsxT74eUNr23Xv9jO0JlLpqE25vLTkQ
	ND39+e0Wzs/lndwG8P0/u11+A7gJvXKv/w==
X-Google-Smtp-Source: 
 AA6agR6OpMEy1RaEAOFYYCmSobi+W1+3ES6T6dpHDIolkmjN8CPtki8krCdNuxoxRCOVIqtPeHn+rQ==
X-Received: by 2002:a05:6830:6104:b0:654:fb1:faba with SMTP id
 ca4-20020a056830610400b006540fb1fabamr176025otb.183.1662654819124;
        Thu, 08 Sep 2022 09:33:39 -0700 (PDT)
Received: from localhost ([2804:d51:59d2:bc00:5914:754c:f827:eb4])
        by smtp.gmail.com with ESMTPSA id
 y61-20020a9d22c3000000b00636eeba9209sm8362176ota.52.2022.09.08.09.33.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 09:33:35 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rust-hello-world: move to meta-skeleton
Date: Thu,  8 Sep 2022 13:33:27 -0300
Message-Id: <20220908163327.339038-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 16:33:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170463

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../hello-rust}/rust-hello-world/0001-enable-LTO.patch            | 0
 .../recipes-skeleton/hello-rust}/rust-hello-world_git.bb          | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta/recipes-example/rust-hello-world => meta-skeleton/recipes-skeleton/hello-rust}/rust-hello-world/0001-enable-LTO.patch (100%)
 rename {meta/recipes-example/rust-hello-world => meta-skeleton/recipes-skeleton/hello-rust}/rust-hello-world_git.bb (100%)

diff --git a/meta/recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch b/meta-skeleton/recipes-skeleton/hello-rust/rust-hello-world/0001-enable-LTO.patch
similarity index 100%
rename from meta/recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch
rename to meta-skeleton/recipes-skeleton/hello-rust/rust-hello-world/0001-enable-LTO.patch
diff --git a/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb b/meta-skeleton/recipes-skeleton/hello-rust/rust-hello-world_git.bb
similarity index 100%
rename from meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
rename to meta-skeleton/recipes-skeleton/hello-rust/rust-hello-world_git.bb
-- 
2.37.2


