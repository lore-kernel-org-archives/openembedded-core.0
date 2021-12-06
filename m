Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0ABC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 11:43:10 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.50209.1638790988197443681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cDqY1Xtg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id a9so21750684wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wq8qWLab9c9Pyuj2l0WJyo2NTng/KV8wIFINp3QZKtE=;
        b=cDqY1XtgtJyZ9pfobS3c+qQNyG/rJfCrvG6wM99p2Ztz+RUlcyW6Oma2+sdYYL8AsP
         iFFs+mKbLQfWKanSuFk5cuX4VLYG0XvLVXypEqYNnbLZ62kp3x0/JN2nQiz/IfKNlpF3
         /bbt4zsn3I7mfrgxO6fZJVqViXFMAUT9QArK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wq8qWLab9c9Pyuj2l0WJyo2NTng/KV8wIFINp3QZKtE=;
        b=emziN6tYZCFWJOBCer3EPDlojfoAdhkuA24qB1GWPm35fNThvEJwhPpjrG2sziGBYi
         AR3H6pYkzahHUfLgUgOJNat05ts2GPQ7CXML7Zb5lWUXJvUDA9DH44XMJ3VIxNKLXnWi
         gn0OZaZL3PUQl00hJrVtDtlsGHsgBND0B4pATREO6tk4D0jyoPt4GKcxFFR1s4BdbA+g
         0kMeRfkN51pbOpFocLeXlOihgbqhiE6ra2tR8x6Le1jYDI6UwGbLd8d8+/X2YMVPBC/h
         3SVuwTGoAJn2nak58BEJ9V4ki9R0bq03XFXhZb14bw9bLq33c6+7cWvbBuA9bdFo7wR2
         iVMw==
X-Gm-Message-State: AOAM530goEvea4v+JcGLAlTy6vdIcgdL5fVejlVAjkCHqXghYxF6Hzjs
	ugrDHkgqauhHofS09lDhIskE8T1YPkSj3w==
X-Google-Smtp-Source: 
 ABdhPJwA/9jJGiF8lA2S1lpWDFNcYvHF0Zs5wL/R9ZUY+DXB8J13EmGao/Zs45FjnMYo0qR+Q+Pf+g==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr43976275wrd.105.1638790986075;
        Mon, 06 Dec 2021 03:43:06 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:50e7:dab5:2141:24aa])
        by smtp.gmail.com with ESMTPSA id
 r8sm13711799wrz.43.2021.12.06.03.43.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 03:43:05 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] minicom: Mark patches as backports
Date: Mon,  6 Dec 2021 11:43:05 +0000
Message-Id: <20211206114305.496452-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 11:43:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159225

These three patches are backports from upstream, mark as such.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Drop-superfluous-global-variable-definitions.patch     | 2 +-
 .../0002-Drop-superfluous-global-variable-definitions.patch     | 2 +-
 .../0003-Drop-superfluous-global-variable-definitions.patch     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch b/meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch
index 4c6e2493155..01b23898e71 100644
--- a/meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch
+++ b/meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch
@@ -11,7 +11,7 @@ can be dropped.
 This fixes linking with gcc 10 which uses -fno-common by default,
 disallowing multiple global variable definitions.
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://salsa.debian.org/minicom-team/minicom/-/commit/db269bba2a68fde03f5df45ac8372a8f1248ca96]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/dial.c | 2 --
diff --git a/meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch b/meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch
index 1740051e0a5..e86b470b7e1 100644
--- a/meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch
+++ b/meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch
@@ -13,7 +13,7 @@ variables in minicom.c and only declare them in the minicom.h header.
 This fixes linking with gcc 10 which uses -fno-common by default,
 disallowing multiple global variable definitions.
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://salsa.debian.org/minicom-team/minicom/-/commit/c69cad5b5dda85d361a3a0c1fddc65e933f26d11]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/minicom.h | 2 +-
diff --git a/meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch b/meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch
index 58cd58eda8b..3225a0c32af 100644
--- a/meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch
+++ b/meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch
@@ -14,7 +14,7 @@ and only declare the variables in the minicom.h header.
 This fixes linking with gcc 10 which uses -fno-common by default,
 disallowing multiple global variable definitions.
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://salsa.debian.org/minicom-team/minicom/-/commit/c8382374c5d340aa4115d527aed76e876ee5456b]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/minicom.h | 6 +++---
-- 
2.32.0


