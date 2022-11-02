Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FD2C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:18:42 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.2219.1667359121493179645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MQ5iCa3Y;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id p21so11489756plr.7
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htEDE3GHltVs1USE9YeaE2TwzUtAZI70D8CteyLsbjg=;
        b=MQ5iCa3Y/XVbu7MiDu05wG6BH4stmpwVa51Y7MtpZwCj9TJhcY0RPOhbVHle/8fWPf
         3JZZ/x59BgX/ZfiSncqacol2K42UBOffeFpp0VqpBwwbuJjWI4MydXxrbg79N494VH1B
         zXu9PobMyqVvmnbreomCknp0u78Yj15nDIyVOMIz21H2T7Mmpou431hfHqZDdfCmv0wP
         S1OdYEffuSVRApSYXERKDd4q1gQa3LSu5w5ceUnPNd5zOkINpRb/PNNQ/EV9lANZJJB8
         yYOtKBozPB9SxZt2xxpqtaRKBLLzv6J1hOHqukd75nsw6hyxzRi+Q8TWIsvxNQowNhxk
         Cxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htEDE3GHltVs1USE9YeaE2TwzUtAZI70D8CteyLsbjg=;
        b=t3vysV+Hni5xXBn68NoVyPSQfjxT5hU3wEFvnExpl1F+wtwJQ/9phrxuKMCIzVT5DG
         SkV+xWIdVknaJ+XswL4NnbAH7twHe81kaevOWgKonWcrZEFpoB0W+P2B+KGoCeYDwxJc
         EPZkkTfumQ/oSUCC5L8ogwqw8m3orzKa7HDM+c9tNYcSAdWDavZ6BV4DJY6UyriAOdTB
         as4PdSgQjOBD0vGXJ1yzJ61jlEBZDB9YJGClGM01FVpbjCDmCvKpumZtb7e4FRGm/Joo
         mttrp3LcNK6PI6eB9th+4XRRNEIa6fngp9Jh9Gs50BIz12GhtqIpuGqp+3a4KEWHJ7W4
         p11w==
X-Gm-Message-State: ACrzQf3k9/jUJvz2fcTuIalDZDCwagL0sVEkqCLVqRs265jNgA662hV/
	X4W7wMyIGIRUrzVLMTCtTACR60gFW+RPhg==
X-Google-Smtp-Source: AMsMyM5uPKQ/S4RKR2wm0kpV9F548Sv09JkUa4S+MWTzGYfTWZEVnKf3OgKiT5A0cKdbaG/u/fNAcQ==
X-Received: by 2002:a17:90b:164d:b0:213:6a84:2529 with SMTP id il13-20020a17090b164d00b002136a842529mr23435426pjb.32.1667359120024;
        Tue, 01 Nov 2022 20:18:40 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090a16d600b002139459e121sm269644pje.27.2022.11.01.20.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:18:39 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 02/11] python3-cryptography{-vectors}: 38.0.1 -> 38.0.3
Date: Tue,  1 Nov 2022 20:18:21 -0700
Message-Id: <20221102031830.3606777-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102031830.3606777-1-tim.orling@konsulko.com>
References: <20221102031830.3606777-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 03:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172564

38.0.3 - 2022-11-01

* Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL
  3.0.7, which resolves CVE-2022-3602 and CVE-2022-3786.

38.0.2 - 2022-10-11 (YANKED)

Attention!

This release was subsequently yanked from PyPI due to a regression in
OpenSSL.

* Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL
  3.0.6.

https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst#3803---2022-11-01

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...vectors_38.0.1.bb => python3-cryptography-vectors_38.0.3.bb} | 2 +-
 ...n3-cryptography_38.0.1.bb => python3-cryptography_38.0.3.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_38.0.1.bb => python3-cryptography-vectors_38.0.3.bb} (90%)
 rename meta/recipes-devtools/python/{python3-cryptography_38.0.1.bb => python3-cryptography_38.0.3.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb
index 43e96b48448..9e4c40e0c4a 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "0431fd107c1fbad0377704a7051945b3b391169fddc4f6fa0bd4edc6b6e235dd"
+SRC_URI[sha256sum] = "1cdafd42f5348d77e4e7e4791aefd1f62b16bd552a0274afc9346533fe32e925"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_38.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography_38.0.3.bb
index 68679b745ad..14ad459c1b1 100644
--- a/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "1db3d807a14931fa317f96435695d9ec386be7b84b618cc61cfa5d08b0ae33d7"
+SRC_URI[sha256sum] = "bfbe6ee19615b07a98b1d2287d6a6073f734735b49ee45b11324d85efc4d5cbd"
 
 SRC_URI += "\
     file://0002-Cargo.toml-edition-2018-2021.patch \
-- 
2.34.1


