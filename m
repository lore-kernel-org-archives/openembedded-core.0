Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0048C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 23:59:03 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.26742.1676591933907842177
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 15:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RIoWcYkD;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id k13so3897165plg.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 15:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8UqgeEqizbbBaMiI9ycdcpVm6xqm2XBXUOarmTRJqI=;
        b=RIoWcYkDnMFrVNzLkFoTmBT0I/c4uxSccKs4Iol2E4WZD2uzh5FzvHyClttk4M4/Zk
         XaurYbHrV9Zpcdy41jXFYZBq8hfuq5nte826PNwuuGie4E8AJRQdjpAXVf812J5MeCtL
         G/rfkZ1jvrgzZocA2394spFDLUEiLP81XmTYrgzzbAI6UgqB3pHu1738Awto8o1fPLZI
         7mVY0xTgajkmTWP/csn1vD6ZuxVYEvJZc/mRN4vTwb+CAC6vcADQvlIkA8+udwx2Egi1
         znpREQVjklCewDe19ZDoZhFODIvwZWISY1b213Urzi6ix6zbZrhhDuQwHTXEjQzNOYcS
         3vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8UqgeEqizbbBaMiI9ycdcpVm6xqm2XBXUOarmTRJqI=;
        b=S0KmMgIBYloh0bb7g129CV0EwGit+su0Y2r0BdMpGgmPdJfH3Rljz6fP2V7l6QC/TY
         iM6QPHU4pK9SrpDE0XhyXOkDsbXXQrIR5CEs+g3FCEH7pV3/lkPWg19RSg20w/bTgG4p
         lbib1hyqVbagoAezjR+ZBtWoLiDVA2k7p0/8XvItw6shrfsqepYjUy/+WuiMQcTn9ihT
         /PtUPJLYC3h+j/YlnZ0g3PSCBcYjnZ7tCLVqlDzFBWIIOPTfPa8Geb5JZA6Rm/v7WqDf
         hWS6jIn6ff8x9Ms+lkaZksvXJBmc/K+2zWu6mGEZ4aYw4aGcV1D1uaVJGHMkn5z9I8g+
         gLjw==
X-Gm-Message-State: AO0yUKVa0Xkth7QHJxuxg+10d8FzOQxObiBzrlMeORFBa3Mf6J5ZX9so
	fTj0fxo8q8DDdmUrFWZka467bwkNGZ4V4w==
X-Google-Smtp-Source: AK7set/VgG6Gp7s7xfWbWMRcl/sVKfQ4ELaH6WiBE1Ob0CcSGm1cyngFNS6bRykVl+N5jve7S+gItg==
X-Received: by 2002:a17:90a:18e:b0:234:8cd:c0e4 with SMTP id 14-20020a17090a018e00b0023408cdc0e4mr8623405pjc.23.1676591933007;
        Thu, 16 Feb 2023 15:58:53 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f2f2:691e:e829:c393])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a174600b00230dc295651sm1729300pjm.8.2023.02.16.15.58.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 15:58:52 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] python3-cryptography{-vectors}: 39.0.0 -> 39.0.1
Date: Thu, 16 Feb 2023 15:58:32 -0800
Message-Id: <289e3b5d1a9a6c562cf208af8227b02adf5e28f3.1676580166.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1676580166.git.tim.orling@konsulko.com>
References: <cover.1676580166.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 23:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177303

https://cryptography.io/en/latest/changelog/#v39-0-1

39.0.1 - 2023-02-07
* SECURITY ISSUE - Fixed a bug where Cipher.update_into accepted Python
  buffer protocol objects, but allowed immutable buffers. CVE-2023-23931

* Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.0.8.

CVE: CVE-2023-23931

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All tests (except those requiring python3-pytest-benchmark) pass on
qemux86-64

 ...vectors_39.0.0.bb => python3-cryptography-vectors_39.0.1.bb} | 2 +-
 ...n3-cryptography_39.0.0.bb => python3-cryptography_39.0.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_39.0.0.bb => python3-cryptography-vectors_39.0.1.bb} (90%)
 rename meta/recipes-devtools/python/{python3-cryptography_39.0.0.bb => python3-cryptography_39.0.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_39.0.1.bb
index 6aaf6501b46..458ca2adbd6 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "52e59670a0820b5bbfa85f724b8aebd61385787eb8b6607f64d533969124b2a0"
+SRC_URI[sha256sum] = "0cbaeb50bdb7f3c9d7a93b26a0462ef6e97c768ca78d902854fe045c30b680c6"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb b/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_39.0.0.bb
rename to meta/recipes-devtools/python/python3-cryptography_39.0.1.bb
index cca192bc84c..abc8d8e0ef4 100644
--- a/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "f964c7dcf7802d133e8dbd1565914fa0194f9d683d82411989889ecd701e8adf"
+SRC_URI[sha256sum] = "d1f6198ee6d9148405e49887803907fe8962a23e6c6f83ea7d98f1c0de375695"
 
 SRC_URI += "\
     file://0002-Cargo.toml-edition-2018-2021.patch \
-- 
2.30.2


