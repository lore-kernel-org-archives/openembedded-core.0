Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF21DC54E94
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 02:38:06 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.6202.1674527881847595900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 18:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LzPqcFFp;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id g205so10294474pfb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 18:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNRjydMRdg3pBwR3vyihjAUwUa6z3czRJAZt9Ze8x5E=;
        b=LzPqcFFpHc4rw8McDJFsc357avmr8XiiUWgFJFm8D7HRRHexw4V552KeLNI4NMk5fX
         WmX2C2FIduHTJxgkZh3OT2XPSBbWIVn1LTBhOGrgasnMtGpm1LpNyheIxINxZM3b2CeN
         qpzzYtvNoZy7KrRq7FDavige6FCXDytfUmJEE82dJ+Be/+oJVo9WNAnvMGkcmneoAIJS
         VDq01M4x4JlTJ/nzhPwqELKsb2riwLMZqUfXdND0sJ7I7bi9f3CHIHLG1QRTyRz8orql
         ts98J3R1r8x0yjK6SByPj9NbwHmviNRALCprnzuLwG1p0+uJPcWJM5jyumbyWn5wadiJ
         QPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNRjydMRdg3pBwR3vyihjAUwUa6z3czRJAZt9Ze8x5E=;
        b=4lDmSJ4VsYa+Ae54zkeSy66SWpUJsa10E9E34lkR1z07vy/sQ7syLAGn6gZ68cX85g
         L+Y5vJu1zar8F5HSvZVqec/pMjPuJgRtGy9QJoGxw7/8Sbs2UYzI1OK4eq3jCihwFLkg
         y+Vzinljd+2jAtYbYTq1xy1ILytaP1JcBz4YZSFm5eFnAu0HP1U/elqPmwM2NBI4zuWE
         6F6DXjR51+u9SDQR1kTUL5n8e0TijMfXcOZQpXvKVd2iswaqF7EIdeC8N5F2jY7FEXbv
         6GO8AbqzeH2Fps4tAVEmIfezUfwWhk6uiosxMdvpXc2ybNA7c5ZSFwIl4ZvtMBvqlXvo
         khJg==
X-Gm-Message-State: AFqh2krw8ZMLA4PIJZ+A2FAjn6YT8dT+1kzTuVKpTlDYoFRKSA+X7Uf1
	Zs1os9wuaqi9MQJn9vo0vJewFZODiJqGOA==
X-Google-Smtp-Source: AMrXdXtQSkxRt36tC9HzQfSEtCNT5MQCq3fNqXFAHczfwGXlPklm7aUi9nV1jSUGFaGMIQqow6JDkg==
X-Received: by 2002:a05:6a00:b53:b0:574:a541:574a with SMTP id p19-20020a056a000b5300b00574a541574amr37453992pfo.0.1674527881039;
        Mon, 23 Jan 2023 18:38:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id b26-20020aa78eda000000b0058b9c9def36sm289810pfr.139.2023.01.23.18.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 18:38:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] vulkan-samples: Include missing header cstdint for uint32_t
Date: Mon, 23 Jan 2023 18:37:56 -0800
Message-Id: <20230124023756.543982-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230124023756.543982-1-raj.khem@gmail.com>
References: <20230124023756.543982-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 02:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176323

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-parser.h-Including-missing-cstdint.patch | 37 +++++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-parser.h-Including-missing-cstdint.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-parser.h-Including-missing-cstdint.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-parser.h-Including-missing-cstdint.patch
new file mode 100644
index 0000000000..3f6b37dce1
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-parser.h-Including-missing-cstdint.patch
@@ -0,0 +1,37 @@
+From 590bd5f81207bb55bd02b4a37f73a1f64dac452d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Jan 2023 13:20:58 -0800
+Subject: [PATCH] parser.h: Including missing <cstdint>
+
+This is needed from gcc-13+ see [1]
+
+Fixes
+
+../git/framework/platform/parser.h:282:43: error: 'uint32_t' does not name a type
+  282 |                 *type       = static_cast<uint32_t>(number);
+      |                                           ^~~~~~~~
+../git/framework/platform/parser.h:21:1: note: 'uint32_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
+
+[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/602]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ framework/platform/parser.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/framework/platform/parser.h b/framework/platform/parser.h
+index 215f3d80..a5bd1344 100644
+--- a/framework/platform/parser.h
++++ b/framework/platform/parser.h
+@@ -18,6 +18,7 @@
+ #pragma once
+ 
+ #include <cassert>
++#include <cstdint>
+ #include <string>
+ #include <typeindex>
+ #include <vector>
+-- 
+2.39.1
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 7f52cb66c9..c0ce393201 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,6 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;prot
            file://debugfix.patch \
            file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;patchdir=third_party/spdlog \
            file://0001-Deprecate-u8string_view.patch;patchdir=third_party/spdlog \
+           file://0001-parser.h-Including-missing-cstdint.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.39.1


