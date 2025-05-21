Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF79CC54E90
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 20:24:14 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.8707.1747859051986460987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 13:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BBHedil6;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: hiagofranco@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so4567851b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747859051; x=1748463851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDY3jSP8+4515Voxai8NdtR5/w748T3OFzvD/paXGpw=;
        b=BBHedil6Q0s8xobkMnY8eBewbTUxdAIkxJdS0mNoUSSJoJjK17I79VISuPz9dmEy6i
         07OJqqBnByzCjARS3jw9V8b8vjFK652B68YTvJ5MXeM0ojZEaB7rEIe3TfAnUhLyRhzq
         1/lCyHIeJpJKWDtZMjvIWuwhT8TBYkuwGlXmi5rlXEq7MHRtL6w3+a0h2se6RVeuh6C/
         nmrYkqpeUUmNxfLf0ZCcQlXmC18S7zer8xUxEgqhQ2a1upDTBe/nPwtO+lkZtpFI2IO/
         boEcMwrzqwQGUJtPZkdBAbAiB//5VFeA+XOKEMzcQQV8V+CQ0oWQW8jgbI9RoJfn0dKP
         tUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747859051; x=1748463851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDY3jSP8+4515Voxai8NdtR5/w748T3OFzvD/paXGpw=;
        b=C0Wc8g0eKPcmXwZUR0evG+nEc6STJ5nAun5+GL7pg2dOXY/Tej5xtHCAWjOWduTX8+
         T5YvbC0xA1ZTlujvE1cy6fA/0yyz81szpANlkXMRytPOy1aAjouRW11HoMWm0lIWn1F3
         9ebMRhJX21V0L8gxJnDbY2BGhcmn7yVXidjVsMQl0jGyz4FNF+wMwvP+VXaePwcSVR4+
         02ojJBfE2AvD54r9Mjq65c0w2Qcr4LziiOLPwc64AEkBLKjsvHiZJuU6iUYETR/VQKl9
         YfY7U4PxrPLfW3G8NmrFiXVa9mPU3l46ZLXam//cM9Li814DxE2Fc0gGQeHCHb6B6T7D
         BJgA==
X-Gm-Message-State: AOJu0Yy5Nz8EbsM1dKvkRCKsmJcC5Ox7biKaGK0nYnzSeR+ZLU4ep9pt
	vKlU6NFUAY8WBz3g0WZxaTWTreutOtOzOZgX69u4lJT/KRgeLkEus7rjEfElRQ==
X-Gm-Gg: ASbGnctci0xRX2vWW/ShyPIia829Uz+AFCC2kcIDdIBKi8BtXceXkNn6ORX5Dgrp2Cd
	zAG6xOPNsuzkBpRHnzX3hfU2hZQrVzl5K0ufuVg59Zxy3IpbOlzUqmHyKLhveVhwvUDwNe4OiI/
	gOdVtZNLShaDjsJgyvxqOtQrkwh0HmrsslMTz4PYLAQ/dYoyAqUEz7vBWvDxBGqZhV3fDOzRcUw
	NL/bggkoBUrKEuQYD8BSO9axv66frM0dM1rStfsrln3xD8KsSkn5Q6rOwasyq3WIb9nfwm+Bljp
	ppun7VxNcWvD3gFPK3N4gJgrpvHZHifufECcAPsL9uKfdh1ndVi8id3Cvek2fuyjB+vO6Cz8QQ=
	=
X-Google-Smtp-Source: AGHT+IEAjP64BFQVAe1lNeqeOhj8hjM4U5uK2bRPQ1+ubvaH+dHA3oP8xVVXRklGcjOKeFPn5W+/RA==
X-Received: by 2002:a05:6a00:2d04:b0:73c:a55c:6cdf with SMTP id d2e1a72fcca58-742a978ebbbmr28799531b3a.1.1747859051016;
        Wed, 21 May 2025 13:24:11 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970b764sm10054014b3a.39.2025.05.21.13.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 13:24:10 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH] base-files: refresh patch to fix fuzz
Date: Wed, 21 May 2025 17:23:37 -0300
Message-Id: <20250521202337.113556-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 20:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217058

From: Hiago De Franco <hiago.franco@toradex.com>

This is due to changes to nsswitch.conf file on commit 0cb122f17cf2
("base-files: add gshadow entry in nsswitch.conf"). Fixes:

ERROR: base-files-3.0.14-r0 do_patch: QA Issue: Fuzz detected:

Applying patch 0001-add-nss-resolve-to-nsswitch.patch
patching file nsswitch.conf
Hunk #1 succeeded at 9 with fuzz 2 (offset 1 line).

The context lines in the patches can be updated with devtool:

    devtool modify base-files
    devtool finish --force-patch-refresh base-files <layer_path>

Don't forget to review changes done by devtool!

Patch log indicates that patches do not apply cleanly. [patch-fuzz]

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 .../0001-add-nss-resolve-to-nsswitch.patch           | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/0001-add-nss-resolve-to-nsswitch.patch b/meta/recipes-core/base-files/base-files/0001-add-nss-resolve-to-nsswitch.patch
index a6e39e095688..de67543a2994 100644
--- a/meta/recipes-core/base-files/base-files/0001-add-nss-resolve-to-nsswitch.patch
+++ b/meta/recipes-core/base-files/base-files/0001-add-nss-resolve-to-nsswitch.patch
@@ -1,6 +1,6 @@
-From 830abe652428d9d31780c3ace121635ad7b64274 Mon Sep 17 00:00:00 2001
+From 1d11dc93f71dcfa88c9eec21020b5851f35c8ba7 Mon Sep 17 00:00:00 2001
 From: Eero Aaltonen <eero.aaltonen@vaisala.com>
-Date: Wed Sep 27 15:50:48 2023 +0300
+Date: Wed, Sep 27 2023 15:50:48 +0300
 Subject: [PATCH] Add nss-resolve to the Name Service Switch (NSS)
 
 Add `nss-resolve` so that `systemd-resolved` is used for name
@@ -14,12 +14,12 @@ Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/nsswitch.conf b/nsswitch.conf
-index 06f03d2..34b165c 100644
+index 53279c1..ec6ce15 100644
 --- a/nsswitch.conf
 +++ b/nsswitch.conf
-@@ -8,7 +8,7 @@ passwd:         compat
- group:          compat
+@@ -9,7 +9,7 @@ group:          compat
  shadow:         compat
+ gshadow:        files
  
 -hosts:          files dns
 +hosts:          resolve [!UNAVAIL=return] files dns
@@ -27,5 +27,3 @@ index 06f03d2..34b165c 100644
  
  protocols:      db files
 -- 
-2.25.1
-
-- 
2.39.5


