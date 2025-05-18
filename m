Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E73C54E65
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:30:58 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.37987.1747603853176978084
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jbqbzjGt;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742c7a52e97so423741b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603852; x=1748208652; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKRD1a2ZZrh0b3nlUbf/DRM6Y43WykfFA0U8Pgpv9Bs=;
        b=jbqbzjGtIChMjywsXLWq0IRpXpV0cvUw16d20X9uzXFdcIzm4e6vXUadh3rIuZt3mp
         tqawJlKutzOxrdrXRzypKjSFgORLZ9Qc2i6XQnzlCZd/yYIqSFTq6XmSxPchLNzPHnLy
         I12mFnwkP/G45mTt94BAlowgGDqngo7UwnnZ+14CmjYXQFPpG+sLe5G2lB0NWzICrG2y
         HVb9AIMBdB0KyNrZcJ2/h3WYQ8MTbWDE3vw3S3xpZ3fMlzytoBzook3+zW9d5nYlGmSn
         r8KygRjcm4rmq1E8wa503lyUaDWUnsuKP5TrVXUFVwnZMftegZcxGyDZ4MQpAGV1fZb3
         pzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603852; x=1748208652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKRD1a2ZZrh0b3nlUbf/DRM6Y43WykfFA0U8Pgpv9Bs=;
        b=NPq9K5BvvMc1lTIr7A0GSzqMC3TR2/lJtcxu1uc5Gfd4YJ0NRMDc6uKiGPgyZWcfAF
         x4dCxMTpMs5lhc2SrJawTUjdKujssAmitnm4zqw/UaXz0h1dPq+RVp/M9M9pYtnyl9z/
         eGhqNQWKc4MbYkkzibD76wvQedOsA5/zd56GVyZvGYRfTx6Kod5Y3o+d2iWw4QMQhOWC
         oQdzcpt0Baz5GeTuAJ/zsIl8ujkvXFUGpf0JrvPy+RIEiAAsf04JKlauJe3QzB1PQU/X
         6atyCgDDpnCUM0rZH4MiZYC3KFqycLMsy9mlu0OsjYrk29PBKRzRIs4MOHfuYhBjStDc
         f51g==
X-Gm-Message-State: AOJu0Yzp0IfHq+m/hTW0zyJHffbSv220FOk61SIN+99yetYHatsDWGhL
	htHDEhcJvN25GBBIsBSZ2MwIbZEcfRYrQQK/yMKbE+dNdVj3ZNx5PQXr//ZN6gXV
X-Gm-Gg: ASbGncvjQzXGZzfTaFZIct3VeoqJTCk0vkKEHJC2uy9v+jeeOsxkua4X+MCp1J9ObZu
	4ulM6JRnD2V7yx7puW1vSeC0cEL9/Vje0nCEs0kyNFIGgLcUX5jeXPlUT2BKrynmH9TzH5licLn
	Md2DLisbyhg/V6KDMRjyN09Bm57/g+QYozcCmD+QG7GvrkYVFqdL4a71NuGTcn5ymGY6HDLOk5i
	pSYbIgH5vzsVo2KRUDO64R8dHJ/Ow2T5lWsYa3iPmttYtgCGLYZ1tYHM9ghOkLr2jbvBZgVtkFc
	NwYoctLFg46njZPWCtqDps3JaZVXF8eJSu2B2rOWtFo=
X-Google-Smtp-Source: AGHT+IHHAalifPSY3q+Cd0I5tBfNtvIDeJc9tyFhPox9yP/C/AVzO5dLriH1l49rtKQKUHEi8Fuu9A==
X-Received: by 2002:a05:6a21:3a89:b0:20a:4698:9d3 with SMTP id adf61e73a8af0-2170cafa323mr14723584637.8.1747603852167;
        Sun, 18 May 2025 14:30:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:30:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:38 -0700
Subject: [PATCH 03/21] clang.bbclass: Specify ldso when using usermerge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-3-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216787

This matches the expectations of distro setups and clang's understanding
of what the ldso should look like

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/clang.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/clang.bbclass b/meta/classes/clang.bbclass
index be8b888918d1b4b4ae1d245df2c9da013cdc826e..ddf8f350f951744940893698188a1e6056edf7cc 100644
--- a/meta/classes/clang.bbclass
+++ b/meta/classes/clang.bbclass
@@ -25,3 +25,8 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
 
 TCOVERRIDE = "toolchain-clang"
+
+TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-prefix=/usr", "", d)}"
+
+LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
+LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"

-- 
2.49.0


