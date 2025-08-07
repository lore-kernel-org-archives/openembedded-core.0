Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0619C87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 04:36:07 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.43381.1754541357715088868
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 21:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IgoS7k1E;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23fc5aedaf0so3697355ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 21:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754541357; x=1755146157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SaeW7t61kM6P7zGTvLxomsrmh+q4gJZHH7NAqLGcL7g=;
        b=IgoS7k1EkHJUy0RyrdpBQCi1qqhAor3UT5XfqDMDjbqYB9p2z4z/ohZ3s8614Q2Ff4
         EqTkKVSNMkKSQkrjNzjynGt+NbMbdjq7R+s3Hj7yYUiGacAFPQRXxumV5dJLsi0T0rac
         upUqqbnzmzGVBV7+HUvZbmNpGIqSm83s6sDNtt0oa1pm0E2V/YYjwVDoGWQrtve90wuj
         mC41glhVkdEXFjAGv7Ipfv+ajxPs7FAtkFdxl5rLkzpoYtNCM6hnIaWAyMeuwM9qR1DT
         Q8oM5heAys6tPKjiaJ/MRfxP3RgDxnyu47y2Jz2Pn5b8AxpyW0q1Szcwr0A8kbZjYQjS
         Bhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754541357; x=1755146157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaeW7t61kM6P7zGTvLxomsrmh+q4gJZHH7NAqLGcL7g=;
        b=UE0tVRsyzUDYHfDvajRTY8UDYgdr5uvmFTCcPH3A/n8vh7NJSVdP95mf0vDXs/C+F1
         7Jmpkdcg5WBNxyjnfRkBtyXy9iKdy6aKPwov5iV86xaHi6Ug0fzDkLwP0hqaqBQXElM6
         Sd01TOGY5J8PjiW79jhbgFP9JQPuPM8VxImlcfp+FTwOK6oP6mMytuKkRTRtlhUt9+Z+
         E1u9T1reSd35g2B5TroANHMaPm6a20J+qKOW9qwns9VYOWF52981s7yJ90uiOLdU9Er0
         zFz+KxsJMcRE0uuv3RtcAVGBov7sGhl+KKJnnmMHW7PkoQ+b650UCg0im3JJfSTVF+Kj
         BaaQ==
X-Gm-Message-State: AOJu0YxBbraVvgV9raIn0HJ4B/3thhVO+gWo/nIZSDFEXde2k/54tVz9
	neJwf40pDx8XDU0VuknmEI+eGLPxjp38oETOS4l60PoT96cg2xxS6nSJf7ca3UlO514=
X-Gm-Gg: ASbGncvPMB7IAvVN1wOmZWr7dffOvE5PYF+xYGFqon8afffbObxu4ij//wWtzyjt8Ar
	GlRrLF4+V8kl75FpK0c+IBdszWcenIWUJE1DgNAxrsrM7TmwXWpeegBxG8EN4VQIuQdrSnaZwGh
	H+WWjikQ9pge25BWU5G7HLtIDSKO4Pyhx9kO3/WrS6B1eZwj8dCZ9UWkmV09/ucp8yRu8gY1HAn
	WFD6gE2EY6M18xLUpcaZehFhZqFW87siufgLaUXkNnQFppW2tmTr5MsiHQOUPiQvuRkOkCoDeKz
	q8Zzo93UcoV0300j1vcvOKuGIIi2s8vXjf3IuRTqZ4Zh99p4QjDBnANjjbZBTS/FvXGnW+eWCQQ
	kbmWjHmlNNcEqCTosn1Ggaw==
X-Google-Smtp-Source: AGHT+IHCuK2xGP5WHmySxG2yxgbORu4sEtirkjjEMq0MBr6/K/aqA02ZiCUFQxiXapSMUXP0PFv4dg==
X-Received: by 2002:a17:902:f54f:b0:235:c9a7:d5f5 with SMTP id d9443c01a7336-2429f559139mr64997685ad.13.1754541356788;
        Wed, 06 Aug 2025 21:35:56 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ccc5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aab0ffsm174926735ad.166.2025.08.06.21.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 21:35:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-numpy: Always use libgcc for unwinder on aarch64
Date: Wed,  6 Aug 2025 21:35:54 -0700
Message-ID: <20250807043554.1825077-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 04:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221557

With libgcc (working):

Result: inf
Warnings: ['overflow encountered in cast']

With compiler-rt (failing):

Result: inf (probably still correct)
Warnings: [] (no warnings generated)

The issue is likely that compiler-rt on AArch64 doesn't trigger
the floating-point exceptions that NumPy expects for overflow
detection in type casting operations.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3-numpy_2.3.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.3.1.bb b/meta/recipes-devtools/python/python3-numpy_2.3.1.bb
index c6ab326990d..7ecb9521ca1 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.3.1.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.3.1.bb
@@ -26,6 +26,9 @@ PACKAGECONFIG[svml] = "-Ddisable-svml=false,-Ddisable-svml=true"
 TOOLCHAIN_OPTIONS:append:toolchain-clang:riscv64 = " -march=rv64gcv"
 TOOLCHAIN_OPTIONS:append:toolchain-clang:riscv32 = " -march=rv32gcv"
 
+# the overflow tests fail with compiler-rt on aarch64
+LDFLAGS:append:toolchain-clang:aarch64 = " -rtlib=libgcc -unwindlib=libgcc"
+
 # Remove references to buildpaths from numpy's __config__.py
 do_install:append() {
     sed -i \

