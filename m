Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E27BC6FA82
	for <webhook@archiver.kernel.org>; Sat, 10 Sep 2022 20:24:48 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web08.3443.1662841482474809792
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Sep 2022 13:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: otavio.salvador@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-1279948d93dso12846458fac.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Sep 2022 13:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=H9BOz/VSIlOT6gNTqCz/03Wi+p/Dzo6V307Fd1pVNpE=;
        b=7o1UCz3S207ZZ4ZK+Bqo9yWYlLYax+Cgp7CDkEseRDSS5zS2PBo/Eo9GWO+rReR79r
         bXd55v2+hL0BqgrNDRiS2n8vf+49EBtETLu4IKl7zMlNyAOXy0eVhlvH9AoLLKtF1hH/
         E6HrTrcEOR0p+hS4A7kWLKSrRG+499X602nq/n0eo/8JlnibSnl3efdt7JFcEp+kn4gD
         vReUybNk0FRXxyBHcmEe0ajv0clC66PdLuQsENhGMPK9yPM3ug9iHJkUcoIhwRzpRkW8
         lNsp5KrKRz2HREAJDXZiLxBvZWPUEE3CegTELJOIQZM125PS1QZ5HlreLDRx8DV9Vr20
         CYNQ==
X-Gm-Message-State: ACgBeo1EiHAejB+bAdBmBiGDLc7SuvIsnspC3xH9YUPpAeRIqdwWMRlS
	wdLKs7539xP/slDZ7DXbSqStP3n3CokOPg==
X-Google-Smtp-Source: 
 AA6agR6qu5fhsvjlsMasI9sLXYMi0wpdDy1ew0zLsthERTmphr7kGRb8tkXZhWZb4eTGtI+QAq9l9g==
X-Received: by 2002:a05:6870:40d4:b0:113:82d9:e0f0 with SMTP id
 l20-20020a05687040d400b0011382d9e0f0mr8222535oal.194.1662841480862;
        Sat, 10 Sep 2022 13:24:40 -0700 (PDT)
Received: from localhost ([2804:d51:59d2:bc00:35cb:2777:e70e:4140])
        by smtp.gmail.com with ESMTPSA id
 h20-20020a9d6414000000b0061d31170573sm1849173otl.20.2022.09.10.13.24.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 13:24:39 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] rust-hello-world: move to recipes-extended
Date: Sat, 10 Sep 2022 17:24:31 -0300
Message-Id: <20220910202431.564584-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Sep 2022 20:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170513

There is no need to have a single recipe in recipes-example; moving it
to recipes-extended put it with other recipes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3:
- rework commit log

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


