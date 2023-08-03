Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B84EC001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 19:49:13 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.3827.1691092149839456840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 12:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZVxKQqNF;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3a1ebb85f99so1041706b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 12:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691092149; x=1691696949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vVXlgiCY4cL5MoDBxAa8AAxBfKUbwB2SQtReSCbFIjQ=;
        b=ZVxKQqNF5PK24W11e3+pjsR5tF0JqrxZZpuid0YOvo1q+KuS3v5csRpc0jpTvzvYa2
         2Y9mRtd5oxg1WA10nw9J8mrGnl5voERF7njNMpGAtZzYqSifyKnm/HUCK2MNhSwQTIgL
         DQaWaVDeHmpaAryypOT/Aa/Lxif+rK37s1W5hwH+lxygkPEjvJssVzaI4oZOeRSdd7TA
         Npy3DNUoEXeR0Aokn4mKeOR5TuGF0K/g9DUi1uXdzPPtynps7mYVVvWyDD65fruVy7Qh
         acKa4RFPsWu1IFPtGE4ACqclkKJihgjMx9TnMRsBVuTm+8XPSnG5ueFE/3JB6Ga8yMZq
         mESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691092149; x=1691696949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVXlgiCY4cL5MoDBxAa8AAxBfKUbwB2SQtReSCbFIjQ=;
        b=gAhhMHeBPkTxw3gpgSlHsHV6F8ehJ6wWosA9diQRM4VkF4HkawYrlmQRQVFdcpyTwy
         XSKBYzvGaws9QqO3fvC5rTsb0G4oAPcZcsBkGfCIIc3/AYmp7n5I8dNXi8wUZvAIYBkW
         JczQ7XUanCVndZv+8LoVNis5HwZWFEXLooXjrqhpLXnNTittYvc64W0smsCpjEcXSL5s
         zDNBucu0sT3rpmn86cFN6lchzLMomXvw8LruPVyEcR2v3ZfkcXz1xcl4nlApBzHhtDIy
         9DD1NdUAlmhDlVnvS4/SQX0Aopicmt2e8nwDkMYHm97+/IOyZ54WQRSmc3xH2EX59Ln1
         /B2Q==
X-Gm-Message-State: ABy/qLaIjO7LZIJLEVG3CxPWwW2WS3BVCPBdpx2/7h8o9PBQ4LvFURx8
	nxAo587jKynXEdbzKPdBiV9dwr8SODs=
X-Google-Smtp-Source: APBJJlE7GMnvwkjCqeIEa0z13xXBEmy7ou5UaMYReanidighcTLkdKuLzpqhW4FdlRKxPbQQAvCzAA==
X-Received: by 2002:a05:6808:1211:b0:3a7:6b7c:8b5e with SMTP id a17-20020a056808121100b003a76b7c8b5emr3008173oil.11.1691092148716;
        Thu, 03 Aug 2023 12:49:08 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:70d1:27f8:1df1:4ce4])
        by smtp.gmail.com with ESMTPSA id n27-20020a638f1b000000b00551df489590sm62916pgd.12.2023.08.03.12.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 12:49:08 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-cryptography{-vectors}: upgrade -> 41.0.3
Date: Thu,  3 Aug 2023 12:48:03 -0700
Message-Id: <20230803194802.3057173-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 19:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185500

https://cryptography.io/en/latest/changelog/#v41-0-3

* Fixed performance regression loading DH public keys.
* Fixed a memory leak when using ChaCha20Poly1305.
* Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.1.2.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests passed (except those that are skipped) on core-image-ptest-python3-cryptography on qemux86-64

 ...vectors_41.0.2.bb => python3-cryptography-vectors_41.0.3.bb} | 2 +-
 ...n3-cryptography_41.0.2.bb => python3-cryptography_41.0.3.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_41.0.2.bb => python3-cryptography-vectors_41.0.3.bb} (91%)
 rename meta/recipes-devtools/python/{python3-cryptography_41.0.2.bb => python3-cryptography_41.0.3.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_41.0.3.bb
index 52f2c35315c..1b499e02999 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "028dff94a8522ca818b11295ff12df55f348f33a193c0597ddfe8239e53d1582"
+SRC_URI[sha256sum] = "80de0452c4b34f56f5518e81ebd75b6b905f5728aaed521d42e41f4ebc8a43fb"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_41.0.3.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_41.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography_41.0.3.bb
index 20d6c97f36a..b6ea6608eb8 100644
--- a/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_41.0.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "7d230bf856164de164ecb615ccc14c7fc6de6906ddd5b491f3af90d3514c925c"
+SRC_URI[sha256sum] = "6d192741113ef5e30d89dcb5b956ef4e1578f304708701b8b73d38e3e1461f34"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://0001-Fix-include-directory-when-cross-compiling-9129.patch \
-- 
2.34.1


