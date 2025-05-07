Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B16CC3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 15:04:01 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.793.1746630239331583985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 08:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bH3hQaTQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af548cb1f83so6705320a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 08:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746630238; x=1747235038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZ26saHA0RjhB3UbtsRxKfbt/NWMAqFDm3u4ueZjTqw=;
        b=bH3hQaTQLt8uRubmHaPCefSTK7XZInR5xbz3JedKLrpkOZQT2qVw+zNiWSw8iXBBLb
         ONILibGRaAhUwzLoDwpZpRqrRBaRssIP3gEmdiN7UZghSYLdph4IoJZsLgfu0HpBE1Ky
         4CRRjYBsq832urZ2w/viM4BpzNxZ9P9jAVOU6ADNg2tlHJQBE9YrKMpIGaaSQIhOJPJ4
         MZLsraC83Wg7kMzI0UB7Nx4c3z//h+fXK8ECJiIdcihmCy+lYV+w3JFVCBGZQ6RuEphj
         5jqhggBFG+PXTSr/0lKyWwTsrS53sdS3fJ3JukLu3Ra3WKabOZ4mI+voi/ixlPTL5XL5
         W8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630238; x=1747235038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZ26saHA0RjhB3UbtsRxKfbt/NWMAqFDm3u4ueZjTqw=;
        b=tooGvEaVJ02uXKSoQ9hVGzS+y16ZoS4D1TD7rNnP8dr1RRV93mUgdvWxHDyyDTksNK
         +PMuX94kI66UtaNc4YZsEf3NmNIZyipfWPqfxwH3kSPAr2UlHg7YWAU+d+N2HZKAErhw
         FoQirbnyYLVCK43Aa1CMfF0LB++SmsB38/VpDxyo2PMagGpvzi3yiMQ4nl5Hshyb7op8
         K+pn8QKvzBXBhC2Mm5cbm8CT/GNpF8MCt3ijj5Is3RzfqxHy1ky9js6DyYnSbR/cUkqv
         vRhh3UK/aJu83w/cWCDdAbUsYHlJMEj9K5aYgeaG9/axtx6kbZoXJj6BEIZqAT7RBfyD
         fEmg==
X-Gm-Message-State: AOJu0Yws2Pm3GoOHVrcH5NoYyws57JOJ943sOzoFvhFkXbktoJF4/01l
	C3AbOF+8lRlnpvU2A1MVGj70i3Ct7dntIQ5aUDMKCFGeNrSxvwHrxoWPJ8Co
X-Gm-Gg: ASbGnctfmUGkKbP5mGGN+577SMqLD0kRUBtXMjr+Pf9lcRCIcj0vkD4+bDIEA+Wqh4l
	qxeTb/nop2V+cSi5VWtYyuxfl5zbH+wDZoKfLpkslG+xUlqxAsFq/ji762AUby3KNYGJYVyuncA
	P95A5K11u2jk3S87rBJnrjjtz4LsAz8A3tD0PuRczasbLNgQvKcms4sVW929vQit/bkShCR20+I
	IQagvplQN7A5JhwBzhFesqy7tZDEjwlFiUTOEzhrGecAv+mhvbycYyNE2nNaz/gWAApguy2Wj9S
	k2bzRiKI+D9oApos+o1Lcr4cx11Rctci
X-Google-Smtp-Source: AGHT+IF9XOtRjghEjZJfSiGdYjq3A2w8EzNuFe7jJAZAVu8wdSDC5o2KrAFLPLzF9srJ+6GQqEf8wA==
X-Received: by 2002:a05:6a20:cf8a:b0:1f5:709d:e0c6 with SMTP id adf61e73a8af0-2148d42ecf4mr5343611637.42.1746630238183;
        Wed, 07 May 2025 08:03:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c3f297sm9643417a12.58.2025.05.07.08.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:03:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] clang: Space optimize clang recipes
Date: Wed,  7 May 2025 08:03:54 -0700
Message-ID: <20250507150355.1131830-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 15:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216116

They can consume quite a bit of build space, we don't debug them as often

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/yocto-space-optimize.inc | 4 +++-
 meta/recipes-devtools/clang/clang_git.bb          | 2 --
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-space-optimize.inc b/meta/conf/distro/include/yocto-space-optimize.inc
index 407e8937f08..b83ba426e78 100644
--- a/meta/conf/distro/include/yocto-space-optimize.inc
+++ b/meta/conf/distro/include/yocto-space-optimize.inc
@@ -3,6 +3,8 @@
 # and build speed.
 
 # With -g, llvm workdir is 40GB, llvm-staticdev is 1.3GB, llvm-dbg is 1GB
-DEBUG_LEVELFLAG:pn-llvm = ""
+DEBUG_LEVELFLAG:pn-clang = ""
+DEBUG_LEVELFLAG:pn-clang-native = ""
+DEBUG_LEVELFLAG:pn-nativesdk-clang = ""
 # With -g, qemu workdir is 10GB, qemu-dbg is 363MB
 DEBUG_LEVELFLAG:pn-qemu = ""
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index ba037e59785..c93554622f1 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -153,8 +153,6 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_BUILD_EXTERNAL_COMPILER_RT=ON \
                   -DCMAKE_SYSTEM_NAME=Linux \
                   -DCMAKE_BUILD_TYPE=Release \
-                  -DCMAKE_CXX_FLAGS_RELEASE='${CXXFLAGS} -DNDEBUG -g0' \
-                  -DCMAKE_C_FLAGS_RELEASE='${CFLAGS} -DNDEBUG -g0' \
                   -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
                   -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR} \
                   -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \

