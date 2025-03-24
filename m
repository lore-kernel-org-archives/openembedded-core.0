Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91EAC36008
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:34:13 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.43726.1742834044383442107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OYoxwFF6;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224019ad9edso13546445ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834044; x=1743438844; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7UY6n+JgID+Q09CMhSqrh5tMJ8sfwyiy6qkW0aWcfw=;
        b=OYoxwFF67zEsi+uoVFXh5Ql0dLWnxfPtfWmjYBwpsGTE0gAVTllsYBYCxl28BvoX8I
         GGXRinxJNWrebkR/dm12z2X8KfSe0MVLgbLR+Iv+mYNbwM6RleKP3zCyy4Le7TIAF8nM
         T/LVF56bBZPA/J0dtocdiyi87SuUAC/Ebaomgow9pINlYKoH1A92b8SabWs6eBXB9+Ef
         +6BioLPR/d2bs5J6N+GtQZ4GI1UbxlstnuVSnhvhVwj3p0bwkNMr3epsV4y1nEpLb/o0
         6bN6JhXWbj7dN3uwFqVBv5O/XLGyQLIQE87f59TOYD0Xo+d2efWnLlCTIshIFcxTzrAo
         HCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834044; x=1743438844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7UY6n+JgID+Q09CMhSqrh5tMJ8sfwyiy6qkW0aWcfw=;
        b=bf0JriE4BT51PfYtIRLMBKso87P60a12JC/nwzIkSTOTcO2dvroOVzWL2gpW8qFcEG
         kT6ERCXCP1pjJXRL+0p6cScBno+f+EISHlSIfWcfVlHdyg4n7TOhdHxTJjLXaTHNE/Es
         f9Rlnm+EDER5NDt2Zfsd1zyv1AOYavJA3hmCra0TvYU4zl97L2EI5x/Eh7Zj315+rGTO
         GhwoFWGGXWFv0n99xy68dRWYlaRV0jdivAZVdu0A+pFLwQwrfG9FVyWpfJ5RSfGLc7R8
         hnxrOzBHU9/DL0XeuB6MO9nHAruvumKSnVWUUkoet4hPdOiM9vowxURv9Rz2Y1VWTsCe
         uaBQ==
X-Gm-Message-State: AOJu0Yy68kO+6SDL8vlxX89VS7jwAsNvsdHuFfxbGcBuSedpGMqKrwlt
	kXH3ZcQHVL+ESOEY/Zg3A4+og+Fy1AQV+JQ1h0lsMIZStwqQUwvJS8nxjy8Z
X-Gm-Gg: ASbGncv9Zn925uHMsUhElq1RQr1wI5C6H42AIu3ULHewoVPvkjyEaqI62nIPAZG0tdO
	QO7fODVPoXMuawJwqRr5u0TANYbauO2o8BOxFTl1uUZE+fdZuqzTjQjcrZWPGSO5LirW4Mzy2TD
	CN4RS/sNvWbYS7SsVTUR2qYhNJBahnfgq20oFIp+Q187c1tAiLAjAsObgHRyaZpAjgEzCcoNk0L
	kUZ0IdR6IZoEmYiGKEMYzWW+g87q/l5TfHd32UHD7tpCXdTnY7iJiVWkQGE+k0eDj5pE8GY8WUN
	cMZc8hkSqAneg6RO2G1Rx59uEXnm8RPpAfir
X-Google-Smtp-Source: AGHT+IGI0tHEQnLGXZiHItrCQNs/NnkJnlVjJ8qeKi40/0FQaBEyBk7M+8w6I4i3DRWhKf4T3//EJg==
X-Received: by 2002:a05:6a21:6197:b0:1f5:717b:46dc with SMTP id adf61e73a8af0-1fe432065b3mr22842002637.27.1742834043640;
        Mon, 24 Mar 2025 09:34:03 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:34:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:42 -0700
Subject: [PATCH 21/21] vulkan-samples: Fix build with GCC-15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-21-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213553

Include cstdint for uint32_t definition
Update to tip if trunk as it helps with GCC-15 fixes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-SpvBuilder.h-add-missing-cstdint-include.patch | 28 ++++++++++++++++++++++
 .../0001-framework-Include-stdint.h.patch          | 26 ++++++++++++++++++++
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb |  6 ++++-
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch
new file mode 100644
index 0000000000000000000000000000000000000000..392f515b701a62da12535ae059dec85c4c014da8
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch
@@ -0,0 +1,28 @@
+From e40c14a3e007fac0e4f2e4164fdf14d1712355bd Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Fri, 2 Aug 2024 22:44:21 +0100
+Subject: [PATCH] SPIRV/SpvBuilder.h: add missing <cstdint> include
+
+Without the change `glslang` build fails on upcoming `gcc-15` as:
+
+    In file included from /build/source/SPIRV/GlslangToSpv.cpp:45:
+    SPIRV/SpvBuilder.h:248:30: error: 'uint32_t' has not been declared
+      248 |     Id makeDebugLexicalBlock(uint32_t line);
+          |                              ^~~~~~~~
+
+Upstream-Status: Backport [https://github.com/KhronosGroup/glslang/commit/e40c14a3e007fac0e4f2e4164fdf14d1712355bd]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ SPIRV/SpvBuilder.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/third_party/glslang/SPIRV/SpvBuilder.h
++++ b/third_party/glslang/SPIRV/SpvBuilder.h
+@@ -56,6 +56,7 @@ namespace spv {
+ }
+ 
+ #include <algorithm>
++#include <cstdint>
+ #include <map>
+ #include <memory>
+ #include <set>
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch
new file mode 100644
index 0000000000000000000000000000000000000000..8d323f2cef826a0c2f87e587321b0b3eb5ee169c
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch
@@ -0,0 +1,26 @@
+From 445fcfd7b9245881d769880a5942ce9faa893045 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 23 Mar 2025 20:09:35 -0700
+Subject: [PATCH] framework: Include stdint.h
+
+Needed for uint32_t used in this header
+GCC 15 gets upset about it.
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/1314]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ framework/platform/configuration.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/framework/platform/configuration.h b/framework/platform/configuration.h
+index f6a9cae..c15f76f 100644
+--- a/framework/platform/configuration.h
++++ b/framework/platform/configuration.h
+@@ -18,6 +18,7 @@
+ #pragma once
+ 
+ #include <algorithm>
++#include <cstdint>
+ #include <map>
+ #include <memory>
+ #include <string>
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 2dd4bba5230d3c8955e6e7094792c10e3d74abe2..645c13479ad0c8e5fd615daa4f4e8b210f245a09 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -7,16 +7,20 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0 \
            file://0001-vulkan-samples-Fix-reproducibility-issue.patch \
+           file://0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch \
+           file://0001-framework-Include-stdint.h.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "4838e02a4b08236931bec0532fc26ee3871b466a"
+SRCREV = "8547ce1022a19870d3e49075b5b08ca2d11c8773"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = 'vulkan'
 
+# Avoid erroring on including <ciso646> instead of <version> in c++17
+CXXFLAGS += "-Wno-error=cpp"
 inherit cmake features_check
 
 FILES:${PN} += "${datadir}"

-- 
2.49.0


