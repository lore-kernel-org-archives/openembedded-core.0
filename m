Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AB7C54F30
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:52:46 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.40731.1747972366162623810
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 20:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d+txPiKr;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-231bf5851b7so68283325ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972365; x=1748577165; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TDgSeiON2DSlztTqoGsmc/YcfVasK1Q0hgCvdaZVRc=;
        b=d+txPiKrA6alqtO2zA2D/alCqayYJFKb0wWbbBDrVCmNa5umTXV4Klo9kU2d4QGwpi
         LVLQUb1gUl75/Rmz03tE4CWHkUhQJMPzQrzX25E7OQV89XIsIrPNCEfBBu6ISWqRsCEj
         u7opmxOIlK9I4gIVT9nC2npd1W9PcPBu1gn20N4XSknhNVohCXX80c+k17Sc1qwDVdCW
         DbP6G4lz4UMlJCEGFtuOcDCfsNCxmYQji4blDa2uIkFNRj4xiSyxZI93xbrFEWhCijxq
         KiTD7YVjFPmZpCKssWpKtr9PcjJYl+w4mY9+x4zUAd9hceI0qQJUw6A9CKIvYkgIjqLE
         6CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972365; x=1748577165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TDgSeiON2DSlztTqoGsmc/YcfVasK1Q0hgCvdaZVRc=;
        b=P7/ZyqqwgqqFXLfXlbTpkC7NOCRA+THUEmMPBrDG9i9DeP9ToYnZW7s4QEn/+sQ+Cn
         ZVOxH9k2fSJyCYXgKgKwEGCerNQmHVv1OhWOOKR68+tTyKfcGQKTc9AeU/beA/HXr6hr
         T1JmGs64PyVbOCJRNQkaemedR/d4xtWWVP4TGveJr224miyfLkQdA3cicVtrD4t2zvAx
         bSgy+Zsa3b0zEfZMtuenjK6i4yoaPEaVb8mwIEiFdULI0sqCzRRsf8e53Xljgnvg5j1g
         2Qg9RfZGRiJcspP6ZhLh/3xS7Hpa4aFHUUmd33FJ1Sd1cPRSbRRauia3yu1mKqlp9B3P
         u0Og==
X-Gm-Message-State: AOJu0YxEAHiwVEJIdmO3gdfEDDHYXkr9RzUyClabbcpJJM2i7f2ozjRT
	KqR4gHlXZn7M/CapY0fHaUxpgQ3heW9NuqJc5BBJWiD+yzsLoSJUSVpz
X-Gm-Gg: ASbGncvtAMgatat3rCVJIi6xNId+NESpKboL6yHnguGEIX9DqLQ72aJH12SYBulXsZK
	DWIs/HaMH3wXF7ed5GvNBxi28yDB9+xj9nwgWKTIuYrQSLtSVJ86vuf8Lzi69YpU2S3J9LsBPqv
	BSJLYdRYjD+6JEFMLaLoAxH4VvWntolx5RjNEB2r7QBJ2QFIXVr3jc3+xJ2WCpFmsu9sHWDXPBq
	yaTHOgn42pdUxKIgtt7WhArT3rMnu5/vzbYg0MYtdRM3iTSzVjWuu/EJp+GvWA+7S9I6eQrHT7o
	9+chWOk6OZIPIE0AMut6kDbLaSoeNg9RvKhHNaUE7u4=
X-Google-Smtp-Source: AGHT+IE4bYqdJxf00ZY8H1mIM7tk9FjYqMe/AkxKO95jDtPT/lSGqAoYegpn3CQkhM0xb72FvBvngw==
X-Received: by 2002:a17:902:c951:b0:223:66bb:8993 with SMTP id d9443c01a7336-233f260cdf8mr22951995ad.43.1747972365587;
        Thu, 22 May 2025 20:52:45 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm107181155ad.228.2025.05.22.20.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:52:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 20:52:38 -0700
Subject: [PATCH v3 04/13] clang: Add compiler-rt to default deps when using
 clang compiler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-clang-toolchain-v3-4-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
In-Reply-To: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 03:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217164

This provides needed built-ins which clang uses along with libgcc
its not yet a full replacement for libgcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/toolchain/clang.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
index 6cd150cbd146af82aee89467c176d800dac95c70..cc4cdc0356b397e07ea2d6fb5840e3fc9f9955b7 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -24,6 +24,8 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
 
+BASE_DEFAULT_DEPS:append:class-target = " compiler-rt"
+
 TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-prefix=/usr", "", d)}"
 
 LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"

-- 
2.49.0


