Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F20C54E92
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:14 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.4708.1747808406966772343
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TeDw0BUh;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7399838db7fso6046076b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808406; x=1748413206; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YCTv12WtjRKEBf4++0CguO8RKwFZ2kxeN4vjoCSLQA=;
        b=TeDw0BUhItf3tMfMozU04z74emn+ZJYAi0u0F8BbIPeE+/QYh9vdXApzPl+FDIbOwE
         pdFRSRoR+TM6EJMH1LRClbIfvJXP5hxt5yhoorB6vq0DWZADSg+MXO9bXeDcxmfsnSDW
         pBJOHnToHae2m5t3JtFrVNAeWZz8T1QY5d0UbwCJJy3OWN30z4ADfNmBjzuj+XjR+0Pk
         8n48pV67j2d2vimrBjF6uMKWHCJoc8A/L3tS90NiSrtvIPBhZ06BLyg2FmShZ10o1Hi6
         q3Ugx34lWZsURzgPcbn8BRvhnE/CmMi0UOak1Tj6BDAHnfhcZp/66jSYUPdGW/xx6w2N
         it7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808406; x=1748413206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YCTv12WtjRKEBf4++0CguO8RKwFZ2kxeN4vjoCSLQA=;
        b=UUtQ/JWtJAa8S/jHPafw/nbpWKEwLfHD1uBIKBTmGM/TYo/nmIyuI9YYuLLLx6uJy3
         xMQiC1s8w+UtM3Nlx8j/gh6TodfRfk3rhQL2SpvYbKkmAxPZZ0sUk1idVkdlRKNS1TFV
         IcTve18bxAXqBDC1BlPcPvLZCIyhdLA1fHTJNcQdPsN/sR4dZmQ4AXqngnz0CUtdeyBh
         vh6VieRa6hqiDL0sE57ccNkyDTdKfwlvnIzcHDwsw4Osvqeva7k7rhyLfz4Ar4Heajbc
         QU457jorDkIE11ZC1AFGeHA8ggVXtFfMCaRo6tsCXn7UsOJXOfQ0Oh+5QyIiqf5/m6Ey
         0YTw==
X-Gm-Message-State: AOJu0Yx56bYVZHJlEHEZOMu9cHjLJERjhKOKu490I2PblIXWeosqxxfL
	gzk7vtA8w1c0DbGeO6kdHgrE0W3EDmU5hk/+TdORPGdRZWIzStwJ9gpzUXNFheAK
X-Gm-Gg: ASbGncvRwry3+dtDsaJsuPKubqDsD4oZTvsedwTnXofLMqHunDNpVnfETQDQkujFPkJ
	cJPqnKUkBD7KZGK3TNDwx5hKuRD3OmymmFMfkMOaujmjh0D72SPzgDOtQbne+Ap8navqIJkWA8P
	syw/E/D8zcsy5CpW1gh6LfOWdaNoieHQf414JIwhdDEulq69y/QNtjdHGFlxmsSJwj2RO5JvbOc
	0SQud/dVXwJX8cSHsa6YtCkEq4wxz8ovSKX/kMmWqVk9WksPP7Q+oxFf6XYA8KeiK+RaXio7hc+
	AJuDC5ziEvjVaxIOi6tVbuxaSnqrOKQdU9NLwfT1FSAF0YxPAOma3Q==
X-Google-Smtp-Source: AGHT+IGgc920qvryThtVH8aicn7ZvSx4b2Pi7PoJkgAXdX3vfovR8qiqb5dsObIBnnwvOxFP60kPYA==
X-Received: by 2002:a05:6300:2189:b0:215:dacf:5746 with SMTP id adf61e73a8af0-2165f87aecbmr27167847637.19.1747808406081;
        Tue, 20 May 2025 23:20:06 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:54 -0700
Subject: [PATCH v2 18/28] valgrind: Use gcc to compile on riscv64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-18-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216986

clang does not yet support __builtin_longjmp on riscv64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.25.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.25.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.25.0.bb
index 6650dcedbfd09e03493306207aa2bf210741976b..3ae5db0ecacefb4307685c00d467806b0bc986fc 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.25.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.25.0.bb
@@ -106,3 +106,11 @@ INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libexecdir}/valgrind/vgpreload_memcheck-
 # valgrind needs debug information for ld.so at runtime in order to
 # redirect functions like strlen.
 RRECOMMENDS:${PN} += "${TCLIBC}-dbg"
+
+# Valgrind needs intrinsics which are not provided by clang
+# m_signals.c:2213:7: error: __builtin_longjmp is not supported for the current target
+# 2213 |       VG_MINIMAL_LONGJMP(tst->sched_jmpbuf);
+#      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+#
+# It needs something like - https://bugs.kde.org/show_bug.cgi?id=369723
+TOOLCHAIN:riscv64 = "gcc"

-- 
2.49.0


