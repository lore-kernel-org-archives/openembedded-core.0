Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597E9C87FCE
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 03:20:54 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.73674.1753672853145376598
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 20:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f4WXvY4D;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b34a8f69862so3327719a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753672852; x=1754277652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOkFV04eo8BUeklwDiOmBwMW7PsD/K1JoXhKQzBHny4=;
        b=f4WXvY4D0nJXnUKYPZxe8fbbKA/kdVhFEHczxFGtOuhoGhC5fXa6BJla5SOtaIhsZN
         uXLLUb0lFb/cSauY5WXwa2J8WZUJ9rAx+R26XTU3mFozpkvDLmg9A3AkaKmMuzdtK7gW
         HISNWvgIDfBFJK4QH64dWdJuerya+BdjQLtpEbLwDWkJkB7+0MYvcbLvM23vLp/twLs7
         Pqvsd0WVUyTFzfUZfkWIJHoc/v/YxHHYmDiMdF7ScH7WoL1x0klOpUIVhdUXM/WllQCo
         mSC7OGPmoUiid6JnuGzp9RkCOZz1MBD3HCwbz7ZbgiZ/RmIOKJHXCZBWhqpChwNrngV5
         yQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753672852; x=1754277652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOkFV04eo8BUeklwDiOmBwMW7PsD/K1JoXhKQzBHny4=;
        b=q7a6Xzn+PMf+XA4Tx2S4tgLGoOA0Le+mI6QLVfmPRfyHIUkVDROHmz2HEJnMInmyOf
         cTxG4sDdwiNyE1GM0NC5CTZ4ACy7ErKZ+WwYOwEEyAvTYxsE7MfRoQqO6zGf/C86BOOZ
         taEWrPrEfjEDcPjFAha0PHA/GwviUkcvH5MHsyw33NqifJbuM+EHCg5FO0quNI3sIVQG
         L+V1YWkpTmmHPvaGzVp6OGFCYC8JF2TSpGzBEPpIufboUO8VG7tE/lIbb156D7NISswq
         CCIW6vlPx2iNK11AglmPDT7ILziGWMh7BIvLCfEqtuuo9Iq6agetmHx8EnknIL+JuYhk
         VPLw==
X-Gm-Message-State: AOJu0Yx+QGADlTqAPmUjRLxS2bl+P57PcFKc2ckj1xr1J9vccq05J4DC
	xGwJuuVam/6Zzu8IeIEKR7LD3XzRfnC43hZ88Bj1wJOKUN7wlzt8k2YudpnCovnvD3o=
X-Gm-Gg: ASbGncvQen7lrSETl75e2EFmsgulY9ZiZ+w//omsO5ExkEfkn7eYJ9oQlJUT1VAXCNH
	D2n5dDQsZG5PxiIHnf46PvFnwbxVEz1LPHSx9QZlw1WnmNRxjyOjKVNygyVwBcSVICfUkW1Ui44
	L+vBSTbs/ruJaEw7T7XFY2TgYbjOvlnYjiR/38/lH17WN7XWkqOv/dBEYKW0YoZFmdZO2eGfkP3
	hWo9Avbw5o4n9a/pezABJv8LozIosVVTQ5XNEcJlQdmqJwjGaM0U8TuAC+1NU+yFQ/BevJHEbJu
	0bA3TTsEbclWgn+xqNrwLA9VVnzQQV3i0A1dm4kexrOo8qx1N6sw7s6yvPb1Eo20BX89uGijWgu
	UF8Fr6mrrd7DK8g==
X-Google-Smtp-Source: AGHT+IHum9U/aT2OVZq1APlhgxc8LUPMtoXTkI08xK2WJgx7k9H6S6vP1FUBkJaT0OnG4l1OeqVK+g==
X-Received: by 2002:a05:6a20:244c:b0:21f:5aa1:3124 with SMTP id adf61e73a8af0-23d70048cdcmr16997676637.13.1753672852100;
        Sun, 27 Jul 2025 20:20:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c024c1sm4359785b3a.33.2025.07.27.20.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 20:20:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/5] clang: Drop dependency on spirv-tools-native
Date: Sun, 27 Jul 2025 20:20:40 -0700
Message-ID: <20250728032045.2783514-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728032045.2783514-1-raj.khem@gmail.com>
References: <20250728032045.2783514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 03:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220985

spirv is now a separate recipe.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 830c0282cd6..5f0ddd1a2db 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -185,7 +185,7 @@ EXTRA_OECMAKE:append:class-target = "\
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
 "
 
-DEPENDS = "binutils zlib zstd libffi libxml2 libxml2-native ninja-native swig-native spirv-tools-native llvm-tblgen-native"
+DEPENDS = "binutils zlib zstd libffi libxml2 libxml2-native ninja-native swig-native llvm-tblgen-native"
 DEPENDS:append:class-nativesdk = " clang-crosssdk-${SDK_SYS} virtual/nativesdk-cross-binutils nativesdk-python3"
 DEPENDS:append:class-target = " clang-cross-${TARGET_ARCH} python3 ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
 

