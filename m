Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C0C10BA44F
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67448.1774600272590129699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XSnL9++3;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486507134e4so21412775e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774600271; x=1775205071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2XCD+evDEDj7+bfxUGa9bK9PncTQN+DcrjsaPrGX6s=;
        b=XSnL9++3+GwSbw1ulgalpKYel7oZg4SjIH1YZNqUmsOHWVmKhhktQWFPH+GizEmThV
         TXzrchvqTHUawScj91/ol+axByDoSi/YxRtD7FIWrObh2Tu/YbJTHIqqwtQoyiOLk5RA
         DV8SOFKoimCDfxuN8vEj62KNxIFUtt8XdnQ9NYpC930vKmfy9Q3E6sCyEo84Ld8XCzjI
         UtDJgf+kUOhEBU5AObkMX+be0irSvbMqLBtoqKf0DJ54eOQVBHiQJDXkQS8cn2YFs9sp
         7O2lyHPPy/iBNDqLeAQYXKUoI3Un/KMceexev3sHWxgs8Fb+WhkGHraS/kVPZnWx+IMd
         lxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600271; x=1775205071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y2XCD+evDEDj7+bfxUGa9bK9PncTQN+DcrjsaPrGX6s=;
        b=Vjd3ByvsSahPSl5aoEk7jRNWSXx0i4ZhCg4NI0zcQubHFvWRiuaKNmfFMTFEB0+Rl6
         PWGhsNiizmocQzF9VByVeBUHBZCX3iX3yHfQvIvbgW0jwjN9hT3kDOdzXfeCRZo3BbWd
         Ny6Xj8pwka6Ld8pndXZFd9fVlq+MjcGlFb5A6ArjSo+xKL3+GWwjdwsLoEJXhrqDD/iv
         34t8tx8X+C5WUQYesOif2bnf5qLF5pgRgKhv2KZ8anDbcZ4mWkZNo/jo2p39QVGM0anT
         NS2O/ilXozW1XZj36RBgdmOVDTiOLbll6WNXXJq2jNm70J6JEK3mDaCeJKqHvFhDHqCD
         18vA==
X-Gm-Message-State: AOJu0YyOkVpWdBSHvzvG1zqyf5nMuYwTSTAbQwT7eSUXqr6XjqTY5ddU
	jlLwevnQo5F/SBNWesobaGnyHiwn5eA/atyWFq7CWaF2QysSnOcPxNvTtIzn9A==
X-Gm-Gg: ATEYQzxavU1x93OBuk8EJicsS5M4ukkyz3HZ7D+0qEogqV2tVyBffepbHhf4LbtaMOH
	Mc9pp3vpkGdQOpdqxPJAicRX7D2aXoaBYfgBVJs84SfbetcwWotg1LXqsg6KYG+t+LHEzJjvr7q
	TO9RwIVGBsCt6vjC0Fq0L1Jgng5UOUEPv2cxoA6f0lXGetQqwAYsoLDjrhf+hWatS2Gk6wDWfo0
	dHJrs46Bqddqpc5ju2WurSK/QOif97US9M8zksYGN7YRfVQzIzDq+caSeHuB1+3Xb47VnBf5ChP
	5na07MU7LW02bQT9BAy3+eHha9jwJkR6Z/albxBj8eIE0hwRo5XGAOpmL9qPqTYryb2XLOVopxz
	AlrskEAQHZmU6iVYOdI5ZZ/Voz3TiUQGxBqevhsmGTVgrHQo9+bYRJdU3/KNRJtdhWygtjPKF8G
	DJMALyqfvtw/w2yg==
X-Received: by 2002:a05:600c:638d:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-48727efadcamr23256335e9.16.1774600270576;
        Fri, 27 Mar 2026 01:31:10 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm76411485e9.6.2026.03.27.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:10 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 06/12] clang: Use PYTHON_MAINVERSION for python module versioning
Date: Fri, 27 Mar 2026 09:30:49 +0100
Message-ID: <20260327083055.12571-6-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327083055.12571-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260327083055.12571-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234061

Use the new complete main version setting instead of just
PYTHON_BASEVERSION that does not include PYTHON_ABI.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index e10c327a2a..d5f8aa777f 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -46,7 +46,7 @@ PACKAGECONFIG[lld] = "-DCLANG_DEFAULT_LINKER=lld,,,"
 PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[unwindlib] = "-DCLANG_DEFAULT_UNWINDLIB=libunwind,-DCLANG_DEFAULT_UNWINDLIB=libgcc,,"
-PACKAGECONFIG[libclang-python] = "-DCLANG_PYTHON_BINDINGS_VERSIONS=${PYTHON_BASEVERSION},,"
+PACKAGECONFIG[libclang-python] = "-DCLANG_PYTHON_BINDINGS_VERSIONS=${PYTHON_MAINVERSION},,"
 
 OECMAKE_SOURCEPATH = "${S}/clang"
 
-- 
2.53.0


