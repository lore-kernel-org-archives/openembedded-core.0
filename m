Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44805C87FCC
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 03:21:04 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.73319.1753672855549376953
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 20:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=flbFJJHA;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74924255af4so3388915b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753672855; x=1754277655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHVTqc4K8iQb+F319d0rsi6tHpEFYYwajPdVBUqm/zk=;
        b=flbFJJHAGteanD7JOr8UGmqsoc9/qoytCwXDXLO6VMJdbECoFVZXyRaHkR/LivaR8D
         M/piVgJ7jZgGET1dP2dPc8VRca9osjTbS1biGLkOPZQfTPjfKmeGaYn+evkd8zedVmkc
         rI2hQ/uwaW9lm5POWwzCtysw9J3TlvASYb8U7tfYKxhmTI9DW3hLAswsHw23AoorpReK
         kBrmm6HBHTyZuEvV0hiaKoyBIkjBoZ1x8uiPNNax7WT+8niZXyhK3AaMOBnR6VCoNPbr
         aFmLij6OojTSlWNX8JSiXzIuNXoW9C7GzHCv/3zYmj0UXrEjp80VwOo2Cij1J9Lztw7y
         VgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753672855; x=1754277655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHVTqc4K8iQb+F319d0rsi6tHpEFYYwajPdVBUqm/zk=;
        b=P7OJqnGvxBxXg/tbKMWdXpeQ4b2rsnOMPtvqGtUKTEP1BXddEV//wj8TP+iih0waPE
         Y+JJBM2JHpwO7xe98m9LiRX5VKNfuFsw9jcvpvsvj30mRsu23cuhwkAhqLAItTxaEgtF
         J/xfZjAhBTlvJi913n08Af1UJmzCGuogXfZGn3tvrptWCP3+Uzgb3S6lRA6l4301+MAs
         dfxTsmdbzl4TVJs4VxzHIXBOCHi5Oq6kHfr5/7ewjBKHgxBgdWov9gkuiRX+JL0e1YU5
         pZfz3bwfunYiYJPIlEziFqOC0B+LYL/Eu/SlAq/8VBzI8/DMd1eywtE3q3NmdY45nsjQ
         8q1g==
X-Gm-Message-State: AOJu0Ywx9O4GuVS/OY/b5VNnM/hIUDHwMV3+8/fZspeVHgogDPxih90U
	QfdTTwnYi2Nj7pC4g/XSBHegqWD9uoQ6XcCK5e8CZaMH4qVfIDT2Vnp3jN3HaShlZWc=
X-Gm-Gg: ASbGncs06mGSMjgiNPMfzSIVOz+e/xAXP00qWqTM+W1I0rKmZz5w9fDFE8CP0mDdSUD
	QaLWEqZF+9dWz1vedS1wNf5TLewOYRwwxQNzIS+ZdPVLChyt0Lz8GlYun4fy8E08K+5ZRb2SH4o
	xmMsLU9ZCKdVSNWLGwUb5cXmf8oK4r3nel9Aa0fedIcVKZQbOqDXJ8eRZ7TbKpqFGvNtSNXfcMD
	V+t3cPDERvN9THJ4gtfcQQTvhLUIyMMKjzO9A7XvDslCKXik/3eBWtPKf9ji8gsWswxuo37L/qm
	E0EUxYRvb3gFVUQy+051eYbQv6OFrWPCRSusEiTozbsyG81915xrA0vXilF5KTRhbIxZ+vQuuu2
	9nMJ5MOMP7hd8XQ==
X-Google-Smtp-Source: AGHT+IH0ljOsSsx1mVNqECuMLkXp627Lb+BTsgiLZSRjFWd8EYIA2ldwsKaKTcdN+tB8+2uom90EFQ==
X-Received: by 2002:a05:6a20:431b:b0:238:e4d8:2bba with SMTP id adf61e73a8af0-23d70212c27mr18102445637.35.1753672854440;
        Sun, 27 Jul 2025 20:20:54 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c024c1sm4359785b3a.33.2025.07.27.20.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 20:20:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/5] compiler-rt: Add missing VER_SUFFIX to installation directory name
Date: Sun, 27 Jul 2025 20:20:42 -0700
Message-ID: <20250728032045.2783514-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728032045.2783514-1-raj.khem@gmail.com>
References: <20250728032045.2783514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 03:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220987

This helps building, pre-release snapshots e.g. -rc1 etc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb | 2 +-
 meta/recipes-devtools/clang/compiler-rt_git.bb            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index 198942ec359..2ef206fba04 100644
--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -56,7 +56,7 @@ OECMAKE_TARGET_COMPILE = "compiler-rt"
 OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
 OECMAKE_SOURCEPATH = "${S}/llvm"
 
-INSTALL_VER ?= "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}"
+INSTALL_VER ?= "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
 INSTALL_VER:class-native = "${@oe.utils.trim_version("${PV}", 1)}"
 
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index c88000d33b0..a2ab63eef50 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -72,7 +72,7 @@ OECMAKE_TARGET_COMPILE = "compiler-rt"
 OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
 OECMAKE_SOURCEPATH = "${S}/llvm"
 
-INSTALL_VER ?= "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}"
+INSTALL_VER ?= "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
 INSTALL_VER:class-native = "${@oe.utils.trim_version("${PV}", 1)}"
 
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \

