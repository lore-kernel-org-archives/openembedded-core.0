Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99905E743D2
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 00:04:19 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.7409.1695945857258832351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 17:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LgkutyM/;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-584a761b301so5202097a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 17:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695945856; x=1696550656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MpHJSDhH+ByLdcTdiMqJE6G0R8jbN9LIBAQ4BG0DGPo=;
        b=LgkutyM/V67ZTHtrpsW4GFGTkC914zRzqjt7MHKAvEl6F1lELtSERF02RQcC5Cc7w/
         BvuadRGoxjD5MG81wGGcgaWAi+z9TcCuE1RgNlG4aZBelPKogqiepmD7oMBezZoKUtMO
         QzKcGBG7NHFN2HhjPnnZpJKHQLekPhdOg+miHjid4SQAKlvbqX/Xh9brJIfLXPjS9vsE
         opHeQ6cUCDrqNJ0keL8X5p5/5DrJOS9asUR/qJNgo0PKrv81efLtzF0ZqHzryJEhvW+F
         AI1zrJWPmr3NLEk7hhgFI4DYf5RY3c6NdRxc8aV83rYwD1ukwLqBfunYgpUpPYtLOdWd
         Tnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695945856; x=1696550656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpHJSDhH+ByLdcTdiMqJE6G0R8jbN9LIBAQ4BG0DGPo=;
        b=uck/OkOg82zUlJo59PkCmzI/1+UGT6OjVlu7FOakUmPg/TRJlgln/uKJyQVCpnAhlP
         c1wpbGyyl3arI/Gce6EXhO9nUqfnuQJp9b/3LYlHjvxGhoNtoIFcEmwrVWTdspadJBQl
         +CxJO8T/koI3lRdQvG2htrXHZ57sW77NzLcjzQ9bx24ohJPTWAMiuaRd6wWXyxbMmg/j
         PHch6xr2bF2w5LKRX3KTmGmy83u1HgQ5PK6BfsIz0/8FjElkEPf4mnyg5O/ZU2GipQ8o
         HItuESqeIXEUS7MCEH7xW/GT2jBMOdaOKtLnpqN8zL4sRbtoWNFHCrftWeR7ZPO9/GTY
         CLGg==
X-Gm-Message-State: AOJu0Yy8oTgEJtK9UaWL883nObgcIzyauQdn86GjiCSm8+s8rXeMF4Mm
	HSTw9Yn//ZfIe7QNAoUOuk5DZJ9Zjn0DBw==
X-Google-Smtp-Source: AGHT+IHRhNZUjJQSPbBFjYij6CgvyeW9JMCA1HGNtbehgpBndUV9xnWwqEg7Ad7bAncSOwdWWMHYuQ==
X-Received: by 2002:a05:6a21:9984:b0:159:beec:79ba with SMTP id ve4-20020a056a21998400b00159beec79bamr3205075pzb.2.1695945856233;
        Thu, 28 Sep 2023 17:04:16 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:15e8:a746:317a:35b4])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902da8500b001bb99e188fcsm15550621plx.194.2023.09.28.17.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 17:04:15 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-cryptography{-vectors}: upgrade to 41.0.4
Date: Thu, 28 Sep 2023 17:02:57 -0700
Message-Id: <20230929000256.1479681-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 00:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188389

https://cryptography.io/en/latest/changelog/#v41-0-4

41.0.4 - 2023-09-19
Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.1.3.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---

All ptests pass on qemux86-64 core-image-ptest-python3-cryptography image
(with the caveat that on Ubuntu 22.04 I had to uninstall llvm-14-dev to get
mesa-native to get past do_compile)


 ...vectors_41.0.3.bb => python3-cryptography-vectors_41.0.4.bb} | 2 +-
 ...n3-cryptography_41.0.3.bb => python3-cryptography_41.0.4.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_41.0.3.bb => python3-cryptography-vectors_41.0.4.bb} (91%)
 rename meta/recipes-devtools/python/{python3-cryptography_41.0.3.bb => python3-cryptography_41.0.4.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.3.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_41.0.3.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb
index 1b499e02999..6b5d8adee97 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.3.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "80de0452c4b34f56f5518e81ebd75b6b905f5728aaed521d42e41f4ebc8a43fb"
+SRC_URI[sha256sum] = "440af2813ea7aeb52181ec651a36d9ae8f0976e8b3a62b411a800fe6fa57a19e"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography_41.0.3.bb b/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_41.0.3.bb
rename to meta/recipes-devtools/python/python3-cryptography_41.0.4.bb
index b6ea6608eb8..94977789c84 100644
--- a/meta/recipes-devtools/python/python3-cryptography_41.0.3.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "6d192741113ef5e30d89dcb5b956ef4e1578f304708701b8b73d38e3e1461f34"
+SRC_URI[sha256sum] = "7febc3094125fc126a7f6fb1f420d0da639f3f32cb15c8ff0dc3997c4549f51a"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://0001-Fix-include-directory-when-cross-compiling-9129.patch \
-- 
2.34.1


