Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C02FC83F27
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 01:29:43 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.4229.1753234180011259717
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 18:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kb94ukHY;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23636167afeso58842785ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 18:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753234179; x=1753838979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NaMDO1Aq7jN7HY/fPPZTiJsr0bc9z/IF3Y0hQjznxbM=;
        b=kb94ukHYfTTgvOuNJZV0E6FOu3A3Mvbw6P7j37NHCtHNItywDBfrDCFW1NBuJzMtbe
         jiyJGMgKJ+lQ27UfGORQUaAWsOl9rGZqGOvNMRJJWNyaWBnIxHEpiHdepwFWDfFHhM4m
         LLTIJljd4tbQWl0RhZXP8axBsT5pQO8gaZjtzA4ROiuVoHo5Giy+KWKj1g0XFbWNGmPl
         1L5ZavGK3KItVOK13NYpObqfXdTvrXWXZk9jtToL5HeCuRaBYY5OJBC+yrPOHkakH0LF
         wlZsgD1DgbMMdWMUIqtMGPDpm9ErO9/qqg2HdN8wlgL2rhoFmsTIQGmKL66casVyE/xv
         quhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753234179; x=1753838979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaMDO1Aq7jN7HY/fPPZTiJsr0bc9z/IF3Y0hQjznxbM=;
        b=oEcoxsL0t4zmoUYM1kDLDMtnvn2R/TLJ+PBO3ZXR2rdfzMqgucSlM/MAJaii+40cv6
         VeX3HNk/cJmvRxqWQGiUhYeMYAp6TiAN7Owp08GI7vOQ81DGt7K0grhVQT/MLwOAryMK
         urwoeNwZOg7raTnHubIGoQUbXzduU7iveYkD5eSnB2DZJtKXSv+f1nnZgJjjgod7aRAt
         RobogGZiaCag4zQRj2mTROgJpKdskEj+JyAWHnE7eXKgjEnx8AYnKPC/kN0rKgPwkHC5
         t2jMzq+wDKHk/Qtjs2ZQ4MgwE4eGHnQA5I6pN0uNDQLJ5Yr9jWxxaCxTQl8V7lr+Nbox
         SgxQ==
X-Gm-Message-State: AOJu0YxSd0OvXvF2RLQB6z32eTpMYS6P8FrU6dLiVr6XAqTEdaz8jhfG
	lVenEYn2A85muz89WDl64TkIX2dLeXLVO3N964YQ9BBG1BfmkCFFrOAKnPhAgFbRdf4=
X-Gm-Gg: ASbGncvifaYVz/bAnfHaNeVfuzbBLzM9tGqENDNdkHJ/lDg7OYOR9GOKdDJ/n/apC4l
	Ky+HapowRNoVhjUpOA57vwre5MHSaJatrrT864hcAlGL8D0W4BKBkJl5dU3vYxhqoDFDcVQ6i49
	zLkJHuTQe7tDtue/KYjnEsvRCrveWTs+M0ynzTBhYg6MTyUvnMoD2r2AcKORbqOdpI4qRjMgqT8
	9k5v5VLkyhfsM4/l4sc4mogcDZIRlienKaIi+kISbHvE5gmBJnYTz7XfUjlJeuTsKOte34lV3P2
	Tiu1nkauXJwdGjG1bql86CtsirHxBnql1dIRW/FGRajic0Yxm3ID6tjOlO4jGZqkvHadAnUlOT6
	HcVHWM/eWqfmNug==
X-Google-Smtp-Source: AGHT+IFd7T2s3iwRJY97tTiWqy6m+iFnMW5o/t+jfBzJYp2bB1sMfAKEf1lYAKx+QRc0wBefr45dMA==
X-Received: by 2002:a17:902:f647:b0:234:ef42:5d69 with SMTP id d9443c01a7336-23f9814e2a1mr17111505ad.13.1753234178964;
        Tue, 22 Jul 2025 18:29:38 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4cf8sm84641325ad.107.2025.07.22.18.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 18:29:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v3] feature-arm-crypto: Add +nocrypto to -mcpu when crypto not in features
Date: Tue, 22 Jul 2025 18:29:36 -0700
Message-ID: <20250723012936.3799471-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220774

When crypto is not in tune features then add +nocryto to
-mcpu explicitly. This makes the behavior between clang
and gcc match. Currently -mcpu=cortex-a72 has different
behavior in clang and gcc in terms of what features are
considered default. Clang enables different set of common
features than gcc on other hand. For example clang
enables crypto with default set but gcc
does not, gcc recommends to disable unavailable extentions
in -mcpu [1] explicitly. crypto is optional on cortext-a53
and cortex-a72 while, this is not as common but Broadcom
SOCs in raspberrypi3/4 have dropped crypto for cost
reasons [2]. This results in illegal instruction
traps [3] [4] when building components e.g. chromium,
qtwebengine, weston etc. with clang using -mcpu=cortex-a72
for rpi4 target.

Adding +nocrypto makes it behave like gcc does today. We
do have separate tune if crypto enabled cortex-a72 cores
are to be targeted (cortexa72-cryto) as DEFAULTTUNE

They are added to default feature file since crypto extension
is available in multiple arm architecture versions e.g. armv8,
armv9. It is optional extention as per spec [5]

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

