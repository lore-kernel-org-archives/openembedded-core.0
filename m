Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68F4ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 15:12:33 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.142.1662736352941022733
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 08:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: otavio.salvador@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so4743657fac.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 08:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=7hvjGIiFLIS66tE7VnjVzRX80lGAZr5sSEUa8El4eqI=;
        b=gr0BDSrhaK/mQu/OBN3PPrIccThqxopIpcETXwpXlcIMLmEHhCWywBu/kRqDGoPQzZ
         nwIMomFTC7ko3m0YXNaO4cL1PFZ7fbUyfigzyk4Ai/AHjlt9JXss4I8NQ3viLubjrlSS
         IZjefc2CRvkRdTyGbGbMb1ScZuvsc8gTwVj6UFsq/DaGPioR/yyCGLmJLqAaTHc696Xo
         N4Ig0bS8wiRJgP3r4PRlr97wCWaR1ogeRc2zj/ACzk/8/8isrzahfGcTSyped9wUkKc3
         55hm8OHf7RJ907/B3GGjmD5uk0pelhYsi+bf8jWSDmY8VwDeYE+fX1WQ4hCJbCOdgfYH
         jGWA==
X-Gm-Message-State: ACgBeo0irylzXzQxB1hP13YUvqzbxeXzlF/nNkXx4vRLh1XnTpOuMzph
	fuSPlFVDOQ8sd2FziFrWJtHU2+xH4ZQSfQ==
X-Google-Smtp-Source: 
 AA6agR4ExipSqcdRXW7j3mO2C2v+v5iKfl9Ow0BmS2nePwYM6ULeqGuMfXtopHj/ZuzzK7Qr1enJwA==
X-Received: by 2002:a05:6870:9a12:b0:127:8a31:2d79 with SMTP id
 fo18-20020a0568709a1200b001278a312d79mr5151397oab.216.1662736351530;
        Fri, 09 Sep 2022 08:12:31 -0700 (PDT)
Received: from localhost ([2804:d51:59d2:bc00:b685:e4bb:923a:3aa0])
        by smtp.gmail.com with ESMTPSA id
 o3-20020a056871078300b0010830c24aaasm451406oap.56.2022.09.09.08.12.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 08:12:30 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] rust-hello-world: move to recipes-extended
Date: Fri,  9 Sep 2022 12:12:21 -0300
Message-Id: <20220909151221.434124-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 15:12:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170491

There is no need to have a single recipe in recipes-example; moving it
to recipes-extended allow it being use inside QA tests.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- move from recipes-example to recipes-extended

 .../rust-example}/rust-hello-world/0001-enable-LTO.patch          | 0
 .../rust-example}/rust-hello-world_git.bb                         | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/{recipes-example/rust-hello-world => recipes-extended/rust-example}/rust-hello-world/0001-enable-LTO.patch (100%)
 rename meta/{recipes-example/rust-hello-world => recipes-extended/rust-example}/rust-hello-world_git.bb (100%)

diff --git a/meta/recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch b/meta/recipes-extended/rust-example/rust-hello-world/0001-enable-LTO.patch
similarity index 100%
rename from meta/recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch
rename to meta/recipes-extended/rust-example/rust-hello-world/0001-enable-LTO.patch
diff --git a/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb b/meta/recipes-extended/rust-example/rust-hello-world_git.bb
similarity index 100%
rename from meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
rename to meta/recipes-extended/rust-example/rust-hello-world_git.bb
-- 
2.37.2


