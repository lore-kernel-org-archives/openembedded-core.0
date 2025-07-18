Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E6BC83F3B
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 04:09:19 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.13355.1752811750539400935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 21:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kn7xWBUg;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b271f3ae786so1250157a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 21:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752811749; x=1753416549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qC7uqwm14iUxUJ1CaZxdqblnSU3f91iJc5GarRmbwLQ=;
        b=kn7xWBUgsYla/OtpgbvHbWOpmKT21PxhAumUJ6TtfrHOi4f2CpSKT28INKeuG0u9Ov
         G9wOJ4gupcyYaIKNZ+dl5pC9TcnEx0BBgfGqQTqLHOkc5iMlaoZFH47OaYgx/4cKNYGK
         ZjiAfh2SizLNJYOZ48RclFyN7M7M778OdvOQC5bfzZOZQYHp8JYoZl+aRhMmKJ9NkXwk
         y4trEYHo9ezEWivwHVysTMnWQjjSAlbwcSE3t7LlYtdINMDDD2hu/nQ+v9PqBOP7CsaE
         zNtL+RmVhdKz5/1RLlAAfOr5M/WNaRjia91n3CzAZkOc6IP9fZAPeFs4JvFNbsjYWR+f
         SO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752811749; x=1753416549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qC7uqwm14iUxUJ1CaZxdqblnSU3f91iJc5GarRmbwLQ=;
        b=BtsrSda6LqtrdtK1gIISSfxYFhirOoBSLEwTzTIhKRUo99H3tNU39LKoScGPsJhRjt
         FxoMJlCA5/bY5HHDkJTh4wws/XyFaHwV9dNP13luD1gtDpKrBVDMXhx4ErHksK+UOrKs
         fFKOHWHtMUKRX4PXbgZn6TqyQQ+iCR3mW/mQ3+P1rvpmMdYUt/DMYM1Bithmx48hjBCk
         ZE8bk/hAB9n+UYkvN+sCHVw/CMLax22hd1RPpQsaMDi1OxXg/DZPR0YUd8bzC5ikkuK1
         Tipz0FsLCjSublerSioYOSt2TeiatHEY20LKIroc1csxQrwrMdY262H843P8Xikmp0bV
         hoJQ==
X-Gm-Message-State: AOJu0YyzHu+wl+6kD6KORFtRWO/ACY87ms+K0i0uwR+eVpnD+/uJd+hc
	xgDZwbHHv3Sz2O85FNDv3jukbrQdF9Zq0lPjWJ5no6wn6JbL2uO9iVHi6uqmsjcMi7U=
X-Gm-Gg: ASbGncvBvZwYV0LfW+FSnlfdbwgG+RZ3+h00ROyLCWYeeP21GIlZqyeFy3Rfm46j6Qj
	7fx15eAcr1PejoKAj1/UWkcT9Ncse9FqE0C6vVsHvUbtFb/CCF9cdNcc5HfvyAxu6FiqiCvASTD
	bqdcv/+8Qwd3vzntuvCTVIQmqwWye9L196HtsjwPlojUE03hzhBwWUdHHrU/5qaJPK7IHSx2bGe
	jCYvSYLfoLosOtmU28LaWP7S4N6rvq69a/Kh4olwH9KhsAmh7tVEXE/hzHnfmHJEV6HEAa4xRPJ
	Vzc7TcPMXNnz1w8F9/w3i3beR4h+SFRedwxE4Dzx2/6TfmPCnV29xKSz7QZi0FLbjU6q+vxqx1t
	kaBezZoFY0zohcA==
X-Google-Smtp-Source: AGHT+IGpXkhdqvY81UM46U9D6KmdNwQmkT4bC9M2cVClRuDDwLplSPHKE8U0/QPtal64R/j9BuMU3Q==
X-Received: by 2002:a17:90b:180f:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-31c9e6fb9b9mr14395323a91.8.1752811749166;
        Thu, 17 Jul 2025 21:09:09 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::519c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe8d14fsm417157a12.26.2025.07.17.21.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 21:09:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] toolchain-scripts.bbclass: Make -mmusl apply only for gcc toolchains
Date: Thu, 17 Jul 2025 21:09:03 -0700
Message-ID: <20250718040906.3591603-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 04:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220566

This option is not respected by clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 3053cd0f1fa..5874a48af84 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -9,7 +9,7 @@ inherit toolchain-scripts-base siteinfo kernel-arch meson-routines
 # We want to be able to change the value of MULTIMACH_TARGET_SYS, because it
 # doesn't always match our expectations... but we default to the stock value
 REAL_MULTIMACH_TARGET_SYS ?= "${MULTIMACH_TARGET_SYS}"
-TARGET_CC_ARCH:append:libc-musl = " -mmusl"
+TARGET_CC_ARCH:append:toolchain-gcc:libc-musl = " -mmusl"
 
 # default debug prefix map isn't valid in the SDK
 DEBUG_PREFIX_MAP = ""

