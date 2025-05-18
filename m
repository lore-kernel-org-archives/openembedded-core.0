Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7885C54ECC
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:31:08 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.37984.1747603860348675484
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fxse9ynP;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-73712952e1cso3492629b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603859; x=1748208659; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U48re4z2gGwsh7doGBRZzWmpNJmm9WpMzMS4mFuI3dg=;
        b=fxse9ynP55FrJ3XoY8gE/AND9C268tkLXgUtUFTNGzNLPQBoVR8gOdeVrJhgK8BeqM
         NfrIbFmMi7aI98hwMPjRmLQiInI8HIxTiLUwLsTYhnFwIh5cD3HPClJthqFV6WVMMtOS
         5oAgh4q2JywTypYL95TZHQYnI7v0fNWuTVoHtx1ucdgjb/eH5bexhxY32uH8TNFSe90C
         +TMKlZkVMNFnVNwh6CNbjbmZmDfPiSy1LM0bMXQurBsWcyE37Ys3lwds1rMCE9owQ4y/
         cOK+2o+5aacPvJsouiwODVHqFgG21qz6LFbg+DYX7ScmDZtgZLM61qfDvc2FUYxnSD1U
         2WfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603859; x=1748208659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U48re4z2gGwsh7doGBRZzWmpNJmm9WpMzMS4mFuI3dg=;
        b=vbbb9m+uO1WPmqR+xde6ZJ7YjA6f0sQNO1rEleFVD8CVYIliKyLJgkewTZkYmRszWU
         MeoRIWQtpJpFrLyPa/fJz4w0kV8SDDtEg/lRjp0FUWXz6edWgR8sRZvfcohAyqioAsdL
         ME/Q8CUfBuDP5hWN/uQKSok8xqNcB1ApLX1u7bEAyD8cWzBF4KEFFlUse9C2TNEWxha1
         aLG0gIOJrKF3kpvguE20S9atUT0VQKvR3jlPM2ge30As8mqAO25KbuFpALzk/FCP5f+N
         EPIdxcVBQNDvdkWmdQctdNhKp0Gz+RCowpDMvRv7iHyoif+umMZfMrV02SofmY6KrOVi
         hrBg==
X-Gm-Message-State: AOJu0Yyrc4QqWsDclqNXjj1fGAm0O2qf6gkufoqWgRA7MquNIl8OIiVD
	xOn6ZrgBR0IT1ueT2N/mi9xBArFSS1y/q9Arg9NppeFkyV/x6IcFeTBUr5Hrzqo6
X-Gm-Gg: ASbGncuBbHaKUi1V4BQl17RQMQ5EVBG5UP7vp6WZ0QLEf/p5i2DdRnqXdjTUMppM0Wn
	71QXPBT7zz3wsH02geEBKDb0xGtfr/Ri2nJ6gmhzCE4ehbgJRrUj8D5flqUxaqJyRGkaeNSztIt
	x1Q7XJ2YGyFSqIpvnwE3Q50QlyMsIGLa2iwR/QzOggVvC8+ihOVkXBK6xi3CrvzSY71DdRqoZtA
	XHTeasgu57Ajt3fAEiL7DL0Ke5WxxMcCkGtFwsPvAXAPadQupp1q8nBO1biVeJ4y1WR26LBQolF
	ceGOh0qqFh0qx6CHRNIFhAvaG+1uukh4v8eVRaRpGYakACXe5zXklg==
X-Google-Smtp-Source: AGHT+IEsRT+VPBj3o6k6HUnX9DZBBmizaGkAnaBROsJ0/byDYVh6L0+fFN84NiBdbQ0cFs1nrDa0Kw==
X-Received: by 2002:a05:6a20:6f8e:b0:1f5:83da:2f9f with SMTP id adf61e73a8af0-2170cc3d5f4mr14602491637.12.1747603859544;
        Sun, 18 May 2025 14:30:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:30:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:47 -0700
Subject: [PATCH 12/21] tcf-agent: Fix ranlib call when using llvm-ranlib
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-12-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216796

This ensures that binutils-ranlib or llvm-ranlib
behaves same as gcc-ranlib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 235936288ba792c86af4dd1899b2f6585328141f..41706f4b60f1f25233ff91c8f112b8122a5c6c30 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -51,6 +51,11 @@ CFLAGS:append:riscv64 = " ${LCL_STOP_SERVICES}"
 CFLAGS:append:riscv32 = " ${LCL_STOP_SERVICES}"
 CFLAGS:append:loongarch64 = " ${LCL_STOP_SERVICES}"
 
+# This works with gcc-ranlib wrapper only which expands $@ shell array,
+# but it will fail if RANLIB was set to <cross>-ranlib or
+# <cross>-llvm-ranlib has same behaviour
+RANLIB:append:toolchain-clang = " $@"
+
 do_install() {
 	oe_runmake install INSTALLROOT=${D}
 	install -d ${D}${sysconfdir}/init.d/

-- 
2.49.0


