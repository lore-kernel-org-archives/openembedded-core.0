Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48218C54F30
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:14 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.4740.1747808410477738929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jKN6PDsS;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742b614581dso5004351b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808410; x=1748413210; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p05+3hw3SbTiXCnGO5G//+uAwmZ9XZfxAVG/q+sWEP4=;
        b=jKN6PDsSkLggYjEv9s2VlBVxhP3A0Q8/MnQOc7QXs5Ekh7Smx9Ir2b/IL9qC35aewV
         QZsX5yiBEkt5JMLCK4ksJg1xXQavalta2QYH6pndiw+22W3HYGfgDVoxX/6YhEgE0r3G
         PuHa504Nn61yHYRTf9o2tuXXKsQQ1tBLmPVcdwVxFZbKsYitcITyfLwdQ1Th/gHyAtIT
         SsnO89VW8G0u9YFx2Trhxy1OTC0EDz4m89J8Pkm69b6JJPweyxHAf67HVCt4vrTLRpI8
         XjcnaFTL0iO6rodxhRHUZy/U2sTcsRe5hee2zNUYHI8HOW2Tl03rbbgU/HkMong4+49c
         1R1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808410; x=1748413210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p05+3hw3SbTiXCnGO5G//+uAwmZ9XZfxAVG/q+sWEP4=;
        b=g5JtSxMa+nITPn42L4MJj6cbogEH7qo4xdXlX6IZxNzmRNHJS9NcHzzsyZf+toANUx
         /y5aT09WVJfp2ctH00EL7cLGsigXNNqpRxcYWsIbm4oxdfxnhRisAdw2jDXu30cEUnC7
         qoyRhHmXlTGzJ9jIcjJeujhbcv51PftwzcwUX9SwNCc5Q/BLp12n5zlXgsS35LOb+ILK
         NvZKezs7QF8uzzn/PhaxHXChpYtzCPhbhTpzlbTfcmnj8DJIlM6cQYn4PgVNuY0Acuom
         5v2kaJpHM5gplvjt6FocUeS07uPSSGWQKrsI+K7d6FYjPywvRijwGcwnO1bBlNXlFouK
         DOcQ==
X-Gm-Message-State: AOJu0YyRZygz27kvRNo/c35GRegtXRlpXKI7cRuwngbAtxW5korGK7Oh
	iXaJKuT3FMImqiU76ghRs99dB2DlrNkWCT2JeK+bCJVowV2XKtaSas565+Bx5Miu
X-Gm-Gg: ASbGnctY77cXlUQm83rtGxZGRRhkA8Ca496R5v2c0SjMk3gnhErWKHhlePMJ4GZSgZi
	h0kuiHve2KLij+h0F9ufUMSj2TseHq8uMNcmt2U93+ZRgAhB1rJTlD/fpiulYN3YhyR5otiurso
	jHdIGM4wJPUBX1wfjMXqYdoCJUa6x6Sd9PLCT6z77XCJRwX8VRyaCZEmEEEpsZEgkvYXItCvY6k
	/2y1rU4hkEoqQgTLhNvls+R7/EmUxX+bnodrsiDP3X+0EBjyoJuL74FmUmJNfb9bVLS+yn6P6Fd
	tZNRco+988F4qjnex/6ZHSYAnZIyxwkiJFVchfrCAs+qpdTBPXRXKw==
X-Google-Smtp-Source: AGHT+IEf4PfmJvUQ+EjoVYD72aM0QoSnADXtsekQdxkbJ3fTAXs88SdRcsFeNQ3NML38lt2Q2cr4Lw==
X-Received: by 2002:a05:6a00:1d88:b0:736:546c:eb69 with SMTP id d2e1a72fcca58-742accc5783mr22075951b3a.9.1747808409612;
        Tue, 20 May 2025 23:20:09 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:58 -0700
Subject: [PATCH v2 22/28] pseudo: Pin to using GCC compiler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-22-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216990

It uses compiler built-ins which clang does not provide

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index d7528d336b14351b99e7a8c6a8ab3d96b1cbb224..4693afcaf62cb1fd48b802db78b32a1f51e44df3 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -25,3 +25,10 @@ TARGET_CC_ARCH:remove = "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_TIME_BITS
 
 # error: use of undeclared identifier '_STAT_VER'
 COMPATIBLE_HOST:libc-musl = 'null'
+
+#| ./ports/linux/pseudo_wrappers.c:80:14: error: use of unknown builtin '__builtin_apply' [-Wimplicit-function-declaration]
+#|         void *res = __builtin_apply((void (*)()) real_syscall, __builtin_apply_args(), sizeof(long) * 7);
+#|                     ^
+#| ./ports/linux/pseudo_wrappers.c:80:57: error: use of unknown builtin '__builtin_apply_args' [-Wimplicit-function-declaration]
+#|         void *res = __builtin_apply((void (*)()) real_syscall, __builtin_apply_args(), sizeof(long) * 7);
+TOOLCHAIN = "gcc"

-- 
2.49.0


