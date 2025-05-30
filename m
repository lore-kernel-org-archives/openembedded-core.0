Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF4AC5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 20:56:15 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.303.1748638573229881992
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 13:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IX3jGWIX;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-309fac646adso3419031a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 13:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748638572; x=1749243372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/w24/kMlDs/ZM5qBGSEUUKdcl/TxbM65/cqUrKk7BM=;
        b=IX3jGWIX+d2j6vKn1M8oIc9n3AwFVxWdUn8c/5eKegNyzNcgNGR7ZBpT8TIfL/wb/U
         haQWvSebM3oz5yF1Dy9iXAHVlaC1/XxVHOe7qJM0+AA4O0rnoui112S0jExexM80bDl6
         fHXYwaPckckZHWEcC+o0RvktWVhrWSLYuNezuF7Ex1FWYXG1Wu8f3GMvHkX8akKzCLDz
         vtn+DL6yHk285ELYSZy8B9IOvSQBeIDpZFAqMLGlsCWgIzVtGmpzjjWdalwe/Im+CAPN
         w69hXJNGf4AXQdxxBhu+dBvfRUAgmkBZs7srLrfs3LaJW1fjxalbfqBsqD2pGduw1kWm
         GAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748638572; x=1749243372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/w24/kMlDs/ZM5qBGSEUUKdcl/TxbM65/cqUrKk7BM=;
        b=RhJKAeINDqUcQkhQR9u7TwemMeDDvHUTNtOr//gWy9pMj9TAvbUN/z+4x2LcAXzPuF
         uEdZfBGfSKS8UaiS9KB5tFvj0ngOXuS1Fque/jZzpBwO+VRaNXT68YmUtljxubDU5CUF
         OiAKGRsGgCPNTTHf9Urg14SoOeMtNDTNpO7EP/N4M+IilV3op7PRtd5H/+WWeJp5LLOZ
         dNZDR/K51I5v78aEBRFx1kBEU/jEzhHIakTqt2gq83Eaab1u4PT/jBMBCw5arvgSaoAl
         l1KWiSf+QyF4+/BYqfxbWI4r9D/w4bDEEEQIK41uH9GD3wylBMxh41lLKwPNYJSwlyvK
         XY4w==
X-Gm-Message-State: AOJu0Yw/heCtOuyFvTndKbz3YZV7AxSqm28OnrK/E61QlHCeE9Oz47TV
	mHV8sGiYj7gy6gBUnXDkcphtpdOb1pBIwjzvZ4mJbZTZYbn7hgOLF2TTEHWPtVHI
X-Gm-Gg: ASbGncugBNcr+DPpqYOLpwNCL1wK9g9WRSWNq7nfN0e2q42wFHCbwz65Bd1WGaTkWRg
	XA0dhuqqxi6pm15TeAT7TUx22U9RiMtpAVOeUAtFzyYXdISMs8e53lBSC+SWD56pDd8kCR7KGcO
	h7jW1oSJjM6c0Ir9ryQpTNjjVmiC/VSzSMJcbLr/YIDXDXUfwZR/dTMxNeNkOF4Gyyys1n0Xucr
	ZUKZbIL0cyh0YTQRHs5Y/2zBNAZHydgXhbhEv07Yf0FBNQwHYfxcgw+qLWfa+1KUKXFJRCfUi5G
	mqxbmU/KJaJu20pjpnkANnUmWbOqFCMheQraXPfeAP5c18UqxnC9ww==
X-Google-Smtp-Source: AGHT+IHEU9cHOJ/5Od0z3MrCZo1USO67OfoRGvJlPXKydoCCuw6TmWa/BHNa5CiVBxtxWkUcPsE+qQ==
X-Received: by 2002:a17:90b:1343:b0:311:c970:c9c5 with SMTP id 98e67ed59e1d1-31245def13fmr6114032a91.7.1748638572338;
        Fri, 30 May 2025 13:56:12 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3d8dfcsm1619514a91.49.2025.05.30.13.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:56:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5] pixmap: Enable openmp support with clang compiler
Date: Fri, 30 May 2025 13:56:09 -0700
Message-ID: <20250530205609.3185264-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 20:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217537

pixman's meson detects openmp support and if it finds it in runtime then
enables it, this happens for gcc via gcc-runtime, however for clang, it
does not. In some cases e.g. mips it enables it during configure only to
find that clang can not find the libomp during linking. Therefore, add
the dependency on openmp when using clang compiler. This ensures consistent
behaviour across architectures.

Disable internal assembler on mips since it can not handle the inline assembly

Turn openmp into a packageconfig

openmp is not yet ported to all architectures e.g. RISCV32/PPC32
does not have it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v5: Remove openmp on rv32 and ppc32

 meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
index c1c71fd4202..925a7d7b29b 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
@@ -23,6 +23,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
 
 inherit meson pkgconfig
 
+OPENMP ?= ""
+OPENMP:toolchain-clang = "openmp"
+# openmp is not yet ported to rv32/ppc
+OPENMP:remove:riscv32 = "openmp"
+OPENMP:remove:powerpc = "openmp"
+
+PACKAGECONFIG ??= "openmp"
+PACKAGECONFIG:class-native ?= ""
+
+PACKAGECONFIG[openmp] = ",-Dopenmp=disabled,${OPENMP}"
+
 # These are for the tests and demos, which we don't install
 EXTRA_OEMESON = "-Dgtk=disabled -Dlibpng=disabled"
 # ld: pixman/libpixman-mmx.a(pixman-mmx.c.o):
@@ -36,7 +47,7 @@ EXTRA_OEMESON:append:class-target:powerpc64le = " ${@bb.utils.contains("TUNE_FEA
 EXTRA_OEMESON:append:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon",""," -Dneon=disabled",d)}"
 EXTRA_OEMESON:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon",""," -Dneon=disabled",d)}"
 
-EXTRA_OEMESON:append:class-native = " -Dopenmp=disabled"
+CFLAGS:append:toolchain-clang:mipsarch = " -fno-integrated-as"
 
 BBCLASSEXTEND = "native nativesdk"
 

