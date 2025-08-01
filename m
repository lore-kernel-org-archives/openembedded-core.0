Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AD2C87FDA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 04:22:55 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.80228.1754022165520281352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 21:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NvLNG2/g;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso410515b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 21:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754022164; x=1754626964; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t8+VXKAe9VcHIppDrR6fKJUO3yIAO7n7vC1xYY15+Yk=;
        b=NvLNG2/gCr7mABjLS9d9NfwTs/olSnIpqmfiabc6F/vfgY4/vATwB6oqHYTuX4wrv3
         qnnnFDOz1y20gbBm2HL4HfEqb5AHLdmFN5w4F0I6cW3/M/pWh6qfd8B2OL7BuHaAKV4H
         PGUa5xlg6ddinCZfg7nbmAcpwAkVfjCSGXuTDKj0RP3EPKAYgXPcFrrXLPyV5Ew7Rjv9
         MfacP0xueIuDhz7rgjp6sRjR9sBl/ANKAs+L1BJlh/oYY3vxsw0CBxeaOWbKWQUK+pOA
         RPF/arrc11AXuk0xVO9IRDIF0xuMRL4d1jiCzTXFbHZd5TKd0IiiUNmcZNMX4sYGO2c5
         QEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754022164; x=1754626964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8+VXKAe9VcHIppDrR6fKJUO3yIAO7n7vC1xYY15+Yk=;
        b=TXk3MAHuh8KNtwSxulJaANa5uaYIxoKtjE2NWP34TjEmh8bIctNg4yq5di+uU2M0M3
         bDd4nOe3iiTZ0OL7V5ve/TxY5+kwDovhloUt1huCNnOfHYQEOWRTvYlvFt+tcrXJmdo1
         FOolGCo5+BKyrt2UryB7698PRP/88WOcv1tDFLcAhtrFmsDb0J5Yhb1UzBYRuOVSVD0b
         6+NhO8VVutCG1sIVLycLgC1knRJ2fjjpjaKVGlzTO1qkdeAJbfp92vFZbCFvRVc4kOTE
         JJohK5S3xO+wPtncdvP1PlizDy4/DLd7QJQL0yFqdufESf6wl5clkqh//WnxstgSxcN+
         +t0A==
X-Gm-Message-State: AOJu0Yy3P4Yu6yWqwHuxLjeftbx1Ot6u0UvSxzYI/HR8HYBDE5dD4j15
	aTPusRHua81OZshy+ZqGzGwNdHyW/cjNAL5aokJeXOcWvwmR0sMP42EMSEMI5fzruok=
X-Gm-Gg: ASbGnct3GJn8kNJZcCXinv9grikDkXFqu3y2i5oQFqvKEyxX0kkgB0c2pqITLmlXQe2
	P2X51iocpCDLrXca1J02nsydozZn8fUtDXsKz9gfOOur7TwA0vuV0uKCZisbtAtu2epG90ZHEvS
	1IpJD4A9dW05vwYySMumty4Nkw7MaDUne6EqDvqaZV2ZOFUOLYrCFMwULLoA3xZIseb5iUiM2eP
	O6ZcuRIe7QQQhAopG31hnoML8tP+5VDden+7Oj9YZoq0NImC5xG29VwQbrzePL43c7JqESfCpKU
	mTdm2RcbvrjPv1YNdXzETezEFceItYld6KZ8fhMaXLVuI2rHRi5wHAESOVZE5MrKaSfBu0LnXSb
	pNn4sadd0e6XHPxvw2vO/wR/x
X-Google-Smtp-Source: AGHT+IHpvgvlO53qhOpKvU656qhBieXW7jo6VHm8e8RJB5mxIC1cUPzAKNE2/5lii4SahcEPB0+6VQ==
X-Received: by 2002:a05:6a00:854:b0:76b:a439:be4a with SMTP id d2e1a72fcca58-76ba439c1dbmr9792055b3a.12.1754022164344;
        Thu, 31 Jul 2025 21:22:44 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe9003sm2950780b3a.125.2025.07.31.21.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 21:22:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/7] toolchain/clang-native: Set BUILD_LDFLAGS instead of LDFLAGS
Date: Thu, 31 Jul 2025 21:22:35 -0700
Message-ID: <20250801042242.3076232-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 04:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221213

BUILD_LDFLAGS is used by other recipes to emit native LDFLAGS
into their cmake toolchain files especially in QT layers. it
will usually be inherited by recipes wanting clang provide
BUILD_* variables so this is more appropriate than LDFLAGS to
pass these options.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/toolchain/clang-native.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toolchain/clang-native.bbclass b/meta/classes/toolchain/clang-native.bbclass
index 4de491a1cb5..006be9fadd6 100644
--- a/meta/classes/toolchain/clang-native.bbclass
+++ b/meta/classes/toolchain/clang-native.bbclass
@@ -15,4 +15,4 @@ BUILD_READELF = "${BUILD_PREFIX}llvm-readelf"
 
 DEPENDS += "clang-native libcxx-native compiler-rt-native"
 
-LDFLAGS += " --rtlib=libgcc --unwindlib=libgcc"
+BUILD_LDFLAGS += " --rtlib=libgcc --unwindlib=libgcc"

