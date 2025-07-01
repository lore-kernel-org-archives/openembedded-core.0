Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B99DC83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 21:18:48 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.8519.1751404727030747418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 14:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NH7DFUL+;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7481600130eso4865497b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751404726; x=1752009526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rks7XCRY9qJyT7e7kItxG7JTm3cfbzjuw/QykJ56ibw=;
        b=NH7DFUL+Bu2FG99giljN5UTHUcRoWVtQp8fWiiHgxTPYzJBpOf25ACkEfdbyy+O0dx
         lDFn4sKi6zgwFy/aX+BqCwgKvD8p3/Tv6egUQRePr+giB0ikv4sDQlkqOTG3fVO7beRM
         vpCvGnuP8fiK0S4Kppc0DDnC9vhMflzgkb5MTDsBNUJlgNt8m3edLNobb0oFGz3zCPE/
         m6I9yXXW9FAGvoLT9iuAN4LPG9qOXiGppD7bGenWVuW32OS+vxynvAeDprxRSpL5mIRq
         AmJma675PgNsnMDZfQuhPbKzOa9mVuniUo6NIG+96tvENTQ1NfQVu2fL+FxrvLEZCeXm
         pHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751404726; x=1752009526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rks7XCRY9qJyT7e7kItxG7JTm3cfbzjuw/QykJ56ibw=;
        b=smEX1mLyjCAhgxthHMFAzbQxW6txbWkd7CUmEdoKgpPxm7iZWaJ5F0J3j/6GizJH2h
         PE9Iqq8XG8aaOebCt3de9k3Q6U+/BsLTP0wb0nqjqBSo5FtsvDdnpN/WTyTbADR6T6m8
         JKr7pfEpU7J+AATn/obI5sqo39cEb/ulr8yB4kV048HwH4Pu+HrQfq0FtKvHUc1JA2CX
         fALlgGH5OGFVBsZe4glbQ4hSVr33dbetiNjdWbV+p7VPI6+/TtmKBGLqi6fTSVYi36p6
         UUPE8lAzvjpc3UtV3i7s1gvCCDlJRbxGRySqbJoc5ZVNuRraPQFP5RSkY8M+5GYNaWxs
         jsIA==
X-Gm-Message-State: AOJu0YykAoPAwJGhPLjGBYwmPigteTeca2YATqP2YwIe405731rklx9a
	f6eUWKtLYMuHukEMnX6M9AVUgRfA3kF/e9ajAPW2mkRx1jXRYwa4tP/1+lG0ZWQs
X-Gm-Gg: ASbGncuznleL88WwZnMbjW6NvwcBQ9A+9UjGJstCIx+kswedmXTikID4MubgMZIQjK4
	NxRx56sTGH1gVPv+caL6wW0f4gxncvmkY3LzgWyWPQDynt8VMViU9Px2xND8oJf70B9PhwaCp9f
	+iuOYDOhupE2tNRwkYgK+UQxhNTh/4ZJrNYYPrfeeQzAUWUUw4kotZZGffednpATkUeeygfU38J
	3U+HBAdQR7L+NprjdCsY5uI7U28C6Ld6UgN+JJWmyfCSu4Lj3Zd2GDInPrtHpTnadaVBE54VJ6C
	Tvu+cuXTjaOHVh12Z1/wmlVsvAeBBCzzGdPCt/ahMOYLUL7I3wy8sHVAvSLmKET+
X-Google-Smtp-Source: AGHT+IF+SYD4up0kviDYkONi2QtK9C95DxxxFEvyAYxbOkj7iDrXD77/CUcMruAaCSMrHcX50IQ4PA==
X-Received: by 2002:a05:6a20:394a:b0:1f5:72eb:8b62 with SMTP id adf61e73a8af0-222d7e92f7cmr893353637.20.1751404726064;
        Tue, 01 Jul 2025 14:18:46 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef669sm12116095b3a.158.2025.07.01.14.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 14:18:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/4] clang-native: Add class to use clang as native compiler
Date: Tue,  1 Jul 2025 14:18:40 -0700
Message-ID: <20250701211843.3960784-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 21:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219725

Some recipes demand full clang/llvm builds e.g. chromium we need to use
clang as native toolchain. This class collects all needed bits to enable
OE built clang to provide the clang native toolchain

Setting

TOOLCHAIN_NATIVE = "clang"

in recipe will chose clang for native toolchain

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/toolchain/clang-native.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/classes/toolchain/clang-native.bbclass

diff --git a/meta/classes/toolchain/clang-native.bbclass b/meta/classes/toolchain/clang-native.bbclass
new file mode 100644
index 00000000000..088b994ed2e
--- /dev/null
+++ b/meta/classes/toolchain/clang-native.bbclass
@@ -0,0 +1,18 @@
+BUILD_CC = "${CCACHE}${BUILD_PREFIX}clang ${BUILD_CC_ARCH}"
+BUILD_CXX = "${CCACHE}${BUILD_PREFIX}clang++ ${BUILD_CC_ARCH}"
+BUILD_FC = "${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
+BUILD_CPP = "${BUILD_PREFIX}clang ${BUILD_CC_ARCH} -E"
+BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
+BUILD_CCLD = "${BUILD_PREFIX}clang ${BUILD_CC_ARCH}"
+BUILD_AR = "${BUILD_PREFIX}llvm-ar"
+BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
+BUILD_RANLIB = "${BUILD_PREFIX}llvm-ranlib -D"
+BUILD_STRIP = "${BUILD_PREFIX}llvm-strip"
+BUILD_OBJCOPY = "${BUILD_PREFIX}llvm-objcopy"
+BUILD_OBJDUMP = "${BUILD_PREFIX}llvm-objdump"
+BUILD_NM = "${BUILD_PREFIX}llvm-nm"
+BUILD_READELF = "${BUILD_PREFIX}llvm-readelf"
+
+BASE_DEFAULT_DEPS += " clang-native libcxx-native compiler-rt-native"
+
+LDFLAGS += " --rtlib=libgcc --unwindlib=libgcc"

