Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCE8C83F27
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 05:47:50 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.33713.1753076845347430593
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 22:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mMkFGEAs;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-75ce8f8a3cdso296079b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 22:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753076844; x=1753681644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fjVmvZwBjnGUgc0+Z6h6CwzK1g7CZ54446Hh6WP2mxM=;
        b=mMkFGEAspdcWO9Gv5c+6bbD739MddB1cNjWbb7gQspN2vBRmVEXgdsc+1DtkvI0TvG
         tKl6BacZQYrncc1S/FuKi96sAcgjsuDgGQTOz0zaf9mO8sjIZwmgz7VVOArZP/QomhFr
         FK8UhBi8lif+bUHYm9zpiVWRl+BxaFqr8ZV1JEPMZnVT5q7WXMzb8CPnIEIbEjU1ITyf
         tJnF4wrIZsjNeZvN+q6mv6QFGOHlHW3cm50AL1mrFr2xkDES8G0RFXwXXkdnJdD6ZrQh
         Mc5nCuC2nFv86tcA4UcqKiCUtSKfW3BpEaBkI/BRdOdH7ZgWE8wIy8H/GzgDEtyRGisS
         Z8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753076844; x=1753681644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjVmvZwBjnGUgc0+Z6h6CwzK1g7CZ54446Hh6WP2mxM=;
        b=meMrq54Uo/LLbEEgyVg9sW2cUb7gKJpealAJPMvlWqC9lNxKLY2O05pFuyoa1uVxd3
         5n4+4Tc+F8q38ZXcP2dmQ52XK/6XlJ3/6Ghb1xsDmwNN5lTzT260F8RU6NlP5fyefGhY
         Nh/gJBiINEnh1Si6+jmjky4VfrMcF6gVyQhR9l9CKGj4CZaqPW3tYq6REleoAYAqC2gY
         HrNsCrLLVkajw4tKzoyw1vH8gTTreY41f98JlPN7WhDK/R982407OSHBmU0t90XQkaVz
         St9KIx+4N8ofXmomuS4LzwaG4PjzFSpNM+bco6fNCTWy8Af35pnPneZ+p1DOB7+R5xbc
         u9sg==
X-Gm-Message-State: AOJu0YyrJftEmGj0aCsVwhiUJSO6wDtelWQu7fJV2apcETecqFBWyfvX
	Jc5IsqJlFcSgt1eIfItPGbaRmX7ooPgAFogC9I9MGXibW73yoV7UIMx/BlivKwt+h08=
X-Gm-Gg: ASbGncsWvVMA+DIxMRr+bVAEopGWYI1D8yluKTT4Ues5xUxED/IAI/LasvHWI2F+r52
	CJi8X2FEbTus1jxKpoWy6Wrfz/QDMV4uXWj+/ONEXJZ4HqOWHleKmR5NmCxaeRCQ7CJB/RDyZ3m
	iYF7RUklZeEu2peqXQrmXMGRDwuSOvFTeRQgX79dIt0i8+Pk5DjMRjliEoE9WhxyFGfT7TXyWsV
	7tHHF1YyVxj/Occo8OyKqiTgYRKDzh7n8tV1wxAltyWR4EEW8KQoTQG+8SS2R0kfc8Y22m06CxK
	hlavOTW6S/1AVZBVTPhRQyAQkpok5XASc2suceQOc8WAZhPP1WcAZ77EtYvOgHA6AoWTWvTLazT
	fSH8tvkjx+sbJXA==
X-Google-Smtp-Source: AGHT+IEMVLzSDQTWOk+B+Cgx+iQrrH+LsMOVPm+Ic35ww8rAvYxvR1cNbodUEg8YAmMWUFKYRphIrQ==
X-Received: by 2002:a05:6a21:112:b0:234:4f73:e664 with SMTP id adf61e73a8af0-237d661c7femr33690350637.15.1753076844348;
        Sun, 20 Jul 2025 22:47:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b985])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb974ca5sm4871172b3a.131.2025.07.20.22.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 22:47:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] tune-cortexa53,tune-cortexa72: Add +nocrypto to -mcpu
Date: Sun, 20 Jul 2025 22:47:21 -0700
Message-ID: <20250721054721.261911-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 05:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220658

When crypto is not in tune features then add +nocryto to
-mcpu explicitly. This makes the behavior between clang
and gcc match. Currently -mcpu=cortex-a72 has different
behavior in clang and gcc in terms of what features are
considered default. Clang's philosophy to enable common
features but maximally, gcc on other hand takes minimal.
Clang therefore enables crypto with default set but gcc
does not. crypto is optional on cortext-a53 and cortex-a72
while, this is not as common but Broadcom SOCs in
raspberrypi3/4 have dropped crypto for cost reasons [1]
This results in illegal instruction traps [2] [3] when building
components e.g. chromium, qtwebengine, weston etc
with clang using -mcpu=cortex-a72 for rpi4 target.

Adding +nocrypto makes it behave like gcc does today. We
do have separate tune if crypto enabled cortex-a72 cores
are to be targeted (cortexa72-cryto) as DEFAULTTUNE

[1] https://forums.raspberrypi.com/viewtopic.php?f=63&t=207888#p1332960
[2] https://github.com/llvm/llvm-project/issues/85699
[3] https://github.com/llvm/llvm-project/issues/90365

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc | 2 ++
 meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
index a88575eb156..65fd6333198 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
@@ -2,6 +2,8 @@ DEFAULTTUNE ?= "cortexa53"
 
 TUNEVALID[cortexa53] = "Enable Cortex-A53 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53', '', d)}"
+# See  https://github.com/llvm/llvm-project/issues/85699
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+nocrypto', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
index cbb6418c069..cf09db00664 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
@@ -2,6 +2,8 @@ DEFAULTTUNE ?= "cortexa72"
 
 TUNEVALID[cortexa72] = "Enable Cortex-A72 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=cortex-a72', '', d)}"
+# See  https://github.com/llvm/llvm-project/issues/85699
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+nocrypto', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 

