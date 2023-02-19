Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A32EC6FD19
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.3842.1676835072492801080
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C/ND82uv;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id g7so781202wrd.3
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYYaOwHxk7MRkQs6NpNpb3wpOz0jLoYijcZijmPlsz8=;
        b=C/ND82uvGDOca3FdRzvq56OSulpwEz/SJD023lnK+WJIHEIjWAvX96rIxuPvCfg/Ik
         5Z+gKRzSH2Hp6oMIuLng0wbSvtpXWQ8LGPIyPK13JHMHb7klu0/eSmNHIOXHO1aye23n
         o/g1HkXsPR2DOOhEjRYRyNwsEY4bHU9Nws19tfsmgFitgaWl4Np3UW7LKY2FLzRXLLvU
         IkDI8FsLHUjsHYB6XpMrX4JvnB9+Hqh/5s37QQX4EF/UcbkIZGMcfcbbI7sMXu7JroVp
         0+VLFvWkL23F8v/9+moszELbZWZ4BpBXNXhuBMFynNQ+iGfJQ1Z7WuXAOTeiZ7/7BXvr
         TJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYYaOwHxk7MRkQs6NpNpb3wpOz0jLoYijcZijmPlsz8=;
        b=TIR9HJq5zGVTScyGGOHyktyFkdAEE6Yi2mh5nlOwV/6IVj1ndeLpMbBTfM4tpmopIx
         k2wWnm0Vx1Zrmw+SnJvy21lwXMisRUfeU4HFDGDPsNt7XDoUlxXjttv4eUjyu9VZJcjs
         2me69Lspa2ZNtEX1rhkAd5kvkMDWQtihpEX/9y0GmaACyuLffNu2j813iy7/k2ae2twX
         /Fm8nZlhfgzsAF4s45Qexbv7zFUHctiq2BovfVwjP/VQdZk6LfQXg8RUH4bgyr3SFbjL
         TN+zK0JkZnD6b0SDm7wgONq+ZshdXBglcexPoOmWrNh/EAAd2cg5MWk8pOlq5RSaubnl
         pNgA==
X-Gm-Message-State: AO0yUKUk5sZGyd2gLHk+Oq6v4ddv1tV4ccUbxh8Qy+VF91pN0FDBVVf9
	Za4WQF0jTEPk7SWFHaKEKtfN/cpIo3I=
X-Google-Smtp-Source: AK7set/Bwk8gJkDw21d4IsiSp5JYZHl7IQL14emArevFV69Ea4Fqgu/SjsxOeMZiLforXnXG7ynlHw==
X-Received: by 2002:a5d:6789:0:b0:2c5:5ed8:77d4 with SMTP id v9-20020a5d6789000000b002c55ed877d4mr588847wru.57.1676835071000;
        Sun, 19 Feb 2023 11:31:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/39] vulkan-samples: update to latest revision
Date: Sun, 19 Feb 2023 20:30:32 +0100
Message-Id: <20230219193101.338397-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177353

Drop patch as it's merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-parser.h-Including-missing-cstdint.patch | 37 -------------------
 .../vulkan/vulkan-samples_git.bb              |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-parser.h-Including-missing-cstdint.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-parser.h-Including-missing-cstdint.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-parser.h-Including-missing-cstdint.patch
deleted file mode 100644
index 3f6b37dce1..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-parser.h-Including-missing-cstdint.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 590bd5f81207bb55bd02b4a37f73a1f64dac452d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Jan 2023 13:20:58 -0800
-Subject: [PATCH] parser.h: Including missing <cstdint>
-
-This is needed from gcc-13+ see [1]
-
-Fixes
-
-../git/framework/platform/parser.h:282:43: error: 'uint32_t' does not name a type
-  282 |                 *type       = static_cast<uint32_t>(number);
-      |                                           ^~~~~~~~
-../git/framework/platform/parser.h:21:1: note: 'uint32_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
-
-[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/602]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- framework/platform/parser.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/framework/platform/parser.h b/framework/platform/parser.h
-index 215f3d80..a5bd1344 100644
---- a/framework/platform/parser.h
-+++ b/framework/platform/parser.h
-@@ -18,6 +18,7 @@
- #pragma once
- 
- #include <cassert>
-+#include <cstdint>
- #include <string>
- #include <typeindex>
- #include <vector>
--- 
-2.39.1
-
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 0a936a78e2..20f39905b1 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,11 +9,10 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            file://debugfix.patch \
            file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;patchdir=third_party/spdlog \
            file://0001-Deprecate-u8string_view.patch;patchdir=third_party/spdlog \
-           file://0001-parser.h-Including-missing-cstdint.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "a42d4eab1e5fe7814dfbe91e3bbaf8ab62cf03f6"
+SRCREV = "3df7dba1b1f428f24cd9a242af78540a518f4b67"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.30.2


