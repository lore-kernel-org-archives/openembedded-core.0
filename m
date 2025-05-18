Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB9BC54E92
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:31:08 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.37988.1747603861146230084
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=imFvZYHy;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c9907967so551325b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603860; x=1748208660; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iod3/XjXwsq0nZLTV4juhZKGpLrj30ngYyo7jWX5HW8=;
        b=imFvZYHy/2nbvWE3+HyVK7vN070GRqIx2uTOfGJiSDQm0MrlSk/pOrEBLVoYbqUC1E
         3r4lYccSDF4G+2DHyAI7DrsVAtSR4h1yYyhxhnOk3yBIIeutHVgLxc+8Vs520uJtGZY8
         yJKZoRHSiTt9d6RIxH83YdLSwuL09dnIm6Y6nMU4lA/Fk+f9opokkX5js2PgBd16UQ9G
         u+F9NsOKmxAeyMmXU8bDY6Wsl1wu8tVfUaE7UbdY9TTadw+CnXxanA3RcEUMKtpSphYK
         I/Hspn77tLEPrFNx6gVi55X0KDPCSt5K0BxXSaWM4JhmjO+xB7zwTJ6dMNDrKDn8RM2G
         lqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603860; x=1748208660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iod3/XjXwsq0nZLTV4juhZKGpLrj30ngYyo7jWX5HW8=;
        b=th0eH1GVwtH57kOvtvQCgQsw7U/5wmDE94WxiNPmtw6gxLh7JeqwjrSmi1o7Ljjwdn
         q4O8hbTXws4X0NJjYULTjNaUbi8JQkOBuZ02vK27KaPsy6Xm0Lzw8kvSQcv63v6KYzOO
         iqL7oke5CwtA33rFFN2e+m6koV4dcbnLPvoWiT1jGF6qoMkTC0TktlATmvyyvlEPda06
         0DzyeN3gHgXhKnc/ecyqKtWauxdGqYzn3dVWh9K1sGG+pLJemW9SGdKuL0jL8UbciVwr
         VyQyU9IhkeIJm50MyWnVdDUndAt5NOyrN9HF3+iUF59gv8CivMjvwl+as8ny6QBV2zP8
         STWQ==
X-Gm-Message-State: AOJu0YxGEoeaG1K78ImCHlw8KiaVNqNo/uDlxJSJbLRKZ1K2hS2Z0YdQ
	vso3H3EW166HeQ0h4Fn8/70LMwG960Pvq/WDtJ3V9EcFVfoF4gDFkx96v+ip5p9c
X-Gm-Gg: ASbGncvImP1kZYvoJXqvvl1CnHXcOeH283KKaWW5wlfrSw1uhDNKiqUovvNyQL7YExo
	36aXdob6j2mfH/4PSDPhzJhsaPXfH7BL1aJoKSiyWP9z9R5g3gNzrw7aboCQI9nbHjcBp5Aw1hG
	rKhaGVINmHPQj+R2YvfQstW8GFh/Nd4bLM2blba8lmQ4ZNCAk6hLHRCmwFthYN9mnZK+Dq6eO7h
	FiWy69Xvq9rCv/urhP4l2rlpEOF3TENeF/lAzzc/TSzzS/UsSRHUz1rSAwcofRxm5kH7En03MUF
	kZgKaGXQSe9VTR9b41EzgQubpDh9voOKTlKsNtXlweQ=
X-Google-Smtp-Source: AGHT+IF4+wl0YDXvuxvxySq5jyaAD5TB1+Xb97U7IifzWhaTIdfv3dzvO7aFpCPZWUOKXRK4OSuHWQ==
X-Received: by 2002:a05:6a21:100f:b0:215:fac3:2ce2 with SMTP id adf61e73a8af0-2162192a9c8mr15745589637.23.1747603860369;
        Sun, 18 May 2025 14:31:00 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:30:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:48 -0700
Subject: [PATCH 13/21] systemtap: Pin to build with GCC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-13-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216797

clang find a lot of warning
| In file included from ../git/tapset-procfs.cxx:11:
| ../git/session.h:169:47: error: 'used' attribute ignored on a non-definition declaration [-Werror,-Wignored-attributes]
|   169 |   static const char* morehelp __attribute__ ((used));
|       |                                               ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-toolchains.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/default-toolchains.inc b/meta/conf/distro/include/default-toolchains.inc
index 4d3cd9eb4fb92fe6d5d12a2f593092d30d196a0b..738a9696342b1d94caeb742b92f74565a5816651 100644
--- a/meta/conf/distro/include/default-toolchains.inc
+++ b/meta/conf/distro/include/default-toolchains.inc
@@ -29,5 +29,9 @@ TOOLCHAIN:pn-pulseaudio:armv7a = "gcc"
 # https://github.com/llvm/llvm-project/issues/82541
 TOOLCHAIN:pn-rpm = "gcc"
 
+# Emits lot of warning which are treated as errors
+# They must be looked into before disabling
+TOOLCHAIN:pn-systemtap = "gcc"
+
 # Clang-20 issue - https://github.com/llvm/llvm-project/issues/132322
 TOOLCHAIN:pn-webkitgtk:arm = "gcc"

-- 
2.49.0


