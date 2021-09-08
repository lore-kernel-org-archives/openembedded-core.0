Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.15614.1631124099651183069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KDmq4pKm;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id z4so4549810wrr.6
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qznG/aACqJ47/hU3HPBVH+xX8w4gzNEOHldaIGFuuD4=;
        b=KDmq4pKmgdJeey7Zw89wdYsqMaCP45gKVSS9jA4BR6JNvpt4I6xVL9UJyuy6SaDvpX
         +DomR0L3pbzsLuZ1dJuXNiSLUtRGbALc/abyoI5GN2WDjUMQMpKsqSH9mFi3C1527QjN
         G3dsmNUhCwkVnKsQDro7RTb0RAAlpi3YoKiLBavJEG2dKds8WaQaW60fcBPYHICRL1of
         tpBexmnu3nZfBE6xceH0dSyL/EAvYlZPUpD5WaAfqWMeGRHdxw0x+8wp7RN06kUjytIN
         yPWTv91jmlMljP+4tthSLrDvPHuKKAls2CrVLzQUas/VltCSFmBF449zSFh3dowjO+TD
         IYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qznG/aACqJ47/hU3HPBVH+xX8w4gzNEOHldaIGFuuD4=;
        b=0EWiuSeqaoXh0Fqx+KAqDwGtnckJ+WV1iKNGoP7nrn8liMrIeZphUJueOWc2wYvWRc
         YiPWOzPT4ZIf4Xayv3PbSorc0yuVWF3g9sdl+U6H4kBTwmGybLVMq2sWoNBhqZb1UyLx
         CwITDDq4sb6wUXDQ4uf3r19tpmds3k+0XHf2rfWlyOC0JGkg9ensJw739rVg4wzK+yAl
         UOe/RSYpSeYd6TBwGdB5kE7G4k5WT7gKjFkLa/mAL1nI6JzEvoUzRPuiQ4dtWhV7hejK
         uAE4Cp9tcOBPheQf9JrQ4ZMOCINQN3oVzofZwrGWJxHS5CkVPi62Od4xjK9ixk+Kt333
         alAg==
X-Gm-Message-State: AOAM530q87yG3lGeShCczguZ1X7MFKr1dKriVpbklATLGfE99dpn/0wn
	AbVjuTWeDZ9HNsC429ZMdMiK/9Cidas=
X-Google-Smtp-Source: ABdhPJwOrxCutAdme18EJFha5RPbP/UR5xyHP0IUmE3w0+anZi1LC8q4Af03DDborbffNSGQQbqZ8w==
X-Received: by 2002:adf:efc7:: with SMTP id i7mr5537531wrp.9.1631124098312;
        Wed, 08 Sep 2021 11:01:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:38 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/26] spirv-tools: update 2021.2 -> 2021.3
Date: Wed,  8 Sep 2021 20:01:13 +0200
Message-Id: <20210908180125.103473-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

Drop 0001-fix-strncpy-bound-error.patch; issue fixed upstream.

Bump spirv-headers revision to avoid outdated headers causing
build errors.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../files/0001-fix-strncpy-bound-error.patch  | 30 -------------------
 .../spir/spirv-headers_1.5.4.bb               |  2 +-
 ...-tools_2021.2.bb => spirv-tools_2021.3.bb} |  6 ++--
 3 files changed, 3 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/spir/files/0001-fix-strncpy-bound-error.patch
 rename meta/recipes-graphics/spir/{spirv-tools_2021.2.bb => spirv-tools_2021.3.bb} (86%)

diff --git a/meta/recipes-graphics/spir/files/0001-fix-strncpy-bound-error.patch b/meta/recipes-graphics/spir/files/0001-fix-strncpy-bound-error.patch
deleted file mode 100644
index bc59faa37b..0000000000
--- a/meta/recipes-graphics/spir/files/0001-fix-strncpy-bound-error.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 1ba007583b83468494c4146bcb7267d863de6a7b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 Feb 2021 23:54:10 -0800
-Subject: [PATCH] fix strncpy bound error
-
-This patch fixes the following error while using gcc 11
-error: 'char* __builtin_strncpy(char*, const char*, long unsigned int)' specified bound depends on the length of the source argument [-Werror=stringop-overflow=]
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/SPIRV-Tools/pull/4151]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- source/diagnostic.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/source/diagnostic.cpp b/source/diagnostic.cpp
-index edc27c8fd..77c29d70c 100644
---- a/source/diagnostic.cpp
-+++ b/source/diagnostic.cpp
-@@ -37,7 +37,7 @@ spv_diagnostic spvDiagnosticCreate(const spv_position position,
-   diagnostic->position = *position;
-   diagnostic->isTextSource = false;
-   memset(diagnostic->error, 0, length);
--  strncpy(diagnostic->error, message, length);
-+  memcpy(diagnostic->error, message, length);
-   return diagnostic;
- }
- 
--- 
-2.30.1
-
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
index 7a43af5e6b..8f8206d15c 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "bcf55210f13a4fa3c3d0963b509ff1070e434c79"
+SRCREV = "6cae8216a6ea19ff3f237af01e54378c1ff81fcd"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/spir/spirv-tools_2021.2.bb b/meta/recipes-graphics/spir/spirv-tools_2021.3.bb
similarity index 86%
rename from meta/recipes-graphics/spir/spirv-tools_2021.2.bb
rename to meta/recipes-graphics/spir/spirv-tools_2021.3.bb
index f55bd5194a..62330f285d 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2021.2.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2021.3.bb
@@ -7,10 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "e198c6a785d388db68eb9166b43ac5e5208fd5cc"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git \
-           file://0001-fix-strncpy-bound-error.patch \
-          "
+SRCREV = "1fbed83c8aab8517d821fcb4164c08567951938f"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git"
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
-- 
2.31.1

