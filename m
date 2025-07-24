Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04549C87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 17:06:10 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.8.1753376764294952905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 10:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GvDCVVTd;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b1fd59851baso984460a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 10:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753376763; x=1753981563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UTzyiTizxqjb3I8oMxFcFuF3vMYSXSara0+GQDa6180=;
        b=GvDCVVTd7dbG8SK0bRESUWdfIhaKV2jpRCl2hOokq+Z3jee/EbjESXu6JQGgArq4EU
         oFVJ/EjFRQvCAF2uCbnaX7DMMQ+86Ms/5s5ucY131JNaU9xSxE5k90WySxPeE+Redwfj
         TogE1985/56vk9+4VOaaR7/y0SksjAs4sfsIzTAoUVwSnJcjscX8YTMWKxAarxgtP8L5
         cP1N/kSn5vwCeV0CUTN3f5nLCWupR4NA31qUfdB8Xl647XrXLetOWqxpiyxerd8iFsvx
         2OrXFpksGWjvSDClcTue9Wgk+Zo5nNZ/n6MIUsoa4fotZiQn+G6uRroA8D8ESSiSpE+M
         pEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753376763; x=1753981563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTzyiTizxqjb3I8oMxFcFuF3vMYSXSara0+GQDa6180=;
        b=IjxXkCnVAaZl5e/4/sHjY/eBLplTiRPP0+iSPBEN75qlkxmCLzW4tgMre1rKhnbhw7
         9YsNtorhonA5sBb8ECQQvLO+d0ykCruKs2M7qgR5i7vZ5+ZFKmofpJ6TyLLTMWiF2ALM
         Y6XecBBO4fBAeocBoGqigVPO5nL2qeQYmK++uCENmoOhUy0RAR2lSbP0wNWk9/5mOFrK
         e2tXuyxiFohqtlGf7NvtfWuGeyujJGojKp8GUQBYUUo+5CSWJGRgXoCNO9cW/yJ+BYDE
         4VuKLbLTa9/3lsbHqHmrY/dUj+q6N63lsNKjjiS+4OlnqPvDMH2mpXI1dHvBFsrDlaJF
         OKKA==
X-Gm-Message-State: AOJu0YzFwuaG/YzoUx5lPusssNGDEtrm++dm1EiAPjx26f1cvekPMaWR
	yZUnAOuhYuwE9BWud/CiaPaUV9/ET3YUQ0v+AZLXrljXrry5v3xAawb7l3PvzwuZ2F4=
X-Gm-Gg: ASbGncstyvrQP3SScJRokpYvJd/qfVWc98oRK8I/Pm8rKXcp70z06Y7LPQyx82FWbQH
	uF/9BFcZdAKLxbqY97WMIPloYVsiseV1tEbvrAIoyp9lmOkXMc6dOX2dcpuHx3o7GvHv2+7jphH
	tClQSN33p7Mk4EGkg5Skpx3Dv8bJSeMQ1pqLQEJnOOCJ3s8YlRQYUsgmY8XLFCFbp/P4t4UMqG8
	ZfJpJ3Y/enQempou+iIm6q5D5MtilCnMJW+Un2R3EYlzxkkuztfwMVdRAeKtXUyesUo77YV8B8b
	fYFZ67pC1AsZJAe6MBl969XQj5q/62hT/DXCP5vV/+RwDnZ11gxnlZ18MN1mHz0d9gEvpLXyAqv
	5gaupePhStsuZBA==
X-Google-Smtp-Source: AGHT+IE/AS0EWcklzwxXeDWqMsSSr7QNAtogDMIOjkp3IwK19XCQ7drav+dZZEXINvBsSegzafkeZA==
X-Received: by 2002:a17:90b:1e10:b0:312:da0d:3d85 with SMTP id 98e67ed59e1d1-31e506df8efmr11848060a91.6.1753376763179;
        Thu, 24 Jul 2025 10:06:03 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66269940sm1788730a91.4.2025.07.24.10.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 10:06:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v4] feature-arm-crypto: Add +nocrypto to -mcpu when crypto not in features
Date: Thu, 24 Jul 2025 10:06:00 -0700
Message-ID: <20250724170600.1113476-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 17:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220853

When crypto is not in tune features then add +nocryto to
-mcpu explicitly. This makes the behavior between clang
and gcc match. Currently -mcpu=cortex-a72 has different
behavior in clang and gcc in terms of what features are
considered default. Clang enables different set of common
features than gcc on other hand. For example clang
enables crypto with default set but gcc
does not, gcc recommends to disable unavailable extensions
in -mcpu [1] explicitly. crypto is optional on cortex-a53
and cortex-a72. This is not as common but Broadcom
SOCs in raspberrypi3/4 have dropped crypto for cost
reasons [2]. This results in illegal instruction
traps [3] [4] when building components e.g. chromium,
qtwebengine, weston etc. with clang using -mcpu=cortex-a72
for rpi4 target.

Adding +nocrypto makes clang behave like gcc does today. We
do have separate tune if crypto enabled cortex-a72 cores
are to be targeted (cortexa72-cryto) as DEFAULTTUNE

They are added to default feature file since crypto extension
is available in multiple arm architecture versions e.g. armv8,
armv9. It is optional extension as per spec [5]

Extensions can be enabled and disabled with -mcpu using the same
syntax as with -march, and have same effect thats why it is
intrumented via TUNE_CCARGS_MARCH_OPTS

[1] https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html#index-mcpu-2
[2] https://forums.raspberrypi.com/viewtopic.php?f=63&t=207888#p1332960
[3] https://github.com/llvm/llvm-project/issues/85699
[4] https://github.com/llvm/llvm-project/issues/90365
[5] https://developer.arm.com/documentation/109697/2025_06/Feature-descriptions/The-Armv9-0-architecture-extension

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
---
v2: Move the change to feature-arm-crypto.inc.
v3: Adjust commit message for clarity on reason to be in common feature file.
v4: Address commit msg comments, add section on why use TUNE_CCARGS_MARCH_OPTS

 meta/conf/machine/include/arm/feature-arm-crypto.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-crypto.inc b/meta/conf/machine/include/arm/feature-arm-crypto.inc
index aade6ce08d5..8202de78e46 100644
--- a/meta/conf/machine/include/arm/feature-arm-crypto.inc
+++ b/meta/conf/machine/include/arm/feature-arm-crypto.inc
@@ -2,4 +2,5 @@
 # armv8-a, armv8.1-a, armv8.3-a, armv8.4-a, armv8.5-a, armv8.6-a, and armv8-r
 
 TUNEVALID[crypto] = "Enable cryptographic instructions for ARMv8"
-TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
+# See  https://github.com/llvm/llvm-project/issues/85699
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '+nocrypto', d)}"

