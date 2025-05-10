Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47660C3ABC3
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 22:06:01 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.19579.1746914746960902077
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 15:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nNVkgZcL;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so2695345a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 15:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746914746; x=1747519546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4SEPNOJFxuxFSr3APBaJJuUYafWPlHvbvujMRedCUhs=;
        b=nNVkgZcLhz3Lo/IZm8MkBYyJelOYzxeDZVt9URQnWf7HNHa7ROPzMqW7gmk+hcFjM4
         sZqdsqjKI7daVBW39WWZXRrsqSXKNlBeaBi4/H2jYMFEzxPJmy7VJ5Vx0bs7uIfnF+PE
         cP1+AYVNvYDxNyvvRhY3mEjP/B5rN9YVj7vVOLe6ZOwtjR4/ZXUZZqMzq+yN0IYdifq4
         gnX1Uc9OWu8EJ2EgAkg4cWeO5I0T+pK52NzXO/OtbfAidZesxpgw/BnEFzMPDGBIrbrM
         HCJjAThp08eZBsbncMyCQCBtPorQ3pevfq6DtAgDnnV9nUgok9+Zf7eAwWVAxA9z3RFD
         JdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746914746; x=1747519546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SEPNOJFxuxFSr3APBaJJuUYafWPlHvbvujMRedCUhs=;
        b=oM4VC3D/sP+ITuL/lZlc0WyjrxX54R4RgwbxgA7s0i5fenoMlzqea5YuPxEmbKbMfW
         uqRyClFLB5Q6usXB3CizbV5jB5fYfOGZZ/mnEQeeRkDjm6Lv6mvjt7j9hBAmugs7Kl+Y
         +zeheyXKtRYEjwc2fhfNolOSVheITi6tpCHz5wuurDwhtZ4bHBeC1lWIo9NF2mXA4E8U
         6jh/6u6rdjAF1Ifd/dio2ZawYkxnrxJktY8qcX7bS6JPlFa0NhVITqf9uEJaukv2dad5
         AAGJMUuV5MEc0XoPIovEPKgkLHG/VbnpA1bt6gTZhLQMvhgo6PMgSJ6Zou0tbWSTk65h
         td4Q==
X-Gm-Message-State: AOJu0YzXrZ7vtQ+pmoLD4t0rPsJF74rAsLN1d3edm4Wc4dfNjCGepJSz
	LztynwekyunT1go/2gn7rJj8pdtrTWCqMX7euve66l5kOA44udgQfqYPVEQA
X-Gm-Gg: ASbGnctFm4qSBdQJbMSSwchxx1kX3QvoRGB/W9qdMqaOxYNx9Mkzzli+rsEFW4gn+UA
	WM12FdSllfjdUe11l5mLczR0X2Sl/XzUWBEoPuF8nzGOSrYghT1kKhdl8nWRg259Gy6Bw1I+/Ra
	6KHLJepbVH3UrL5rIiJwJN7U9FeHGrPDv42KkVKFfBAvM8Ud7IYpnLEi30oKYMV6lJbz6y1iOT3
	8ocblszNLN0v3vE0aYx2tjPvKa09e4JDX8lvk5F9gwFUZK/0jiOCuEC7oqAx5fuBEj4RtXdIVfW
	AiACxBzrwkT7WK6zNRjErmbz6BOgMc0URzsOBvIW9Y4+lzlvI+4Tlg==
X-Google-Smtp-Source: AGHT+IE5qwkjscViTl1RfMn+d4Cq/rlby7p3vweGa3hwp2ADTTcnQI9OSSRHntwY9nKDCVIO4TU4+Q==
X-Received: by 2002:a17:902:e810:b0:220:cd9a:a167 with SMTP id d9443c01a7336-22fc8affe60mr117073695ad.4.1746914745972;
        Sat, 10 May 2025 15:05:45 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::efc5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a0e52sm37515965ad.216.2025.05.10.15.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 15:05:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] compiler-rt: Map the COMPILER_RT_DEFAULT_TARGET_ARCH
Date: Sat, 10 May 2025 15:05:42 -0700
Message-ID: <20250510220543.884520-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 22:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216278

COMPILER_RT_DEFAULT_TARGET_ARCH is not 1 to 1 match with HOST_ARCH
especially for armv5/arm4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt_git.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index 0a0ef6be807..5044db6249d 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -58,6 +58,15 @@ BUILD_CXX = "${CCACHE}clang++ ${BUILD_CC_ARCH}"
 LDFLAGS += "${COMPILER_RT} ${UNWINDLIB}"
 CXXFLAGS += "${LIBCPLUSPLUS}"
 
+def get_compiler_rt_arch(bb, d):
+    if bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', True, False, d):
+        return 'armv5te'
+    elif bb.utils.contains('TUNE_FEATURES', 'armv4 thumb', True, False, d):
+        return 'armv4t'
+    elif bb.utils.contains('TUNE_FEATURES', 'arm vfp callconvention-hard', True, False, d):
+        return 'armhf'
+    return d.getVar('HOST_ARCH')
+
 OECMAKE_TARGET_COMPILE = "compiler-rt"
 OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
 OECMAKE_SOURCEPATH = "${S}/llvm"
@@ -70,7 +79,7 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
                   -DCOMPILER_RT_BUILD_SANITIZERS=OFF \
                   -DCOMPILER_RT_BUILD_MEMPROF=OFF \
                   -DCOMPILER_RT_BUILD_LIBFUZZER=OFF \
-                  -DCOMPILER_RT_DEFAULT_TARGET_ARCH=${HOST_ARCH} \
+                  -DCOMPILER_RT_DEFAULT_TARGET_ARCH=${@get_compiler_rt_arch(bb, d)} \
                   -DLLVM_ENABLE_RUNTIMES='compiler-rt' \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
                   -DLLVM_APPEND_VC_REV=OFF \

