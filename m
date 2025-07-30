Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8B2C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 00:27:55 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.23849.1753835271526153348
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 17:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dmWQeMZX;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76aea119891so180337b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 17:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753835271; x=1754440071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dCTqLGkrlz7740uj5ANvmHASzn1qOh3ioVtwm8iKFtE=;
        b=dmWQeMZX4blgT4yLA7mE7uy4TBQVTAaj1X7DcaW6cz2pqfAEWzrTsTNOvqH76A6bbO
         QV37ZtiYjPRrsM2byNXJcrtp79nKhPGlaRYBsQvToVqNNdO0nkBAeKQV3UIPHxoonjS1
         FhK8W1pjWTVDJjFwk1cbTDqejovEki9WmL/L58yW1YrWZas7RX4RSTfpwd/jULaT3OH4
         bpAq0ohU2i8BoIufmoAWD1E4P/ukWwPycxb6EOGfXsYX4nYqBQQpo7pWaAWvOtE7kZBY
         8gFXGR6OH4JJtxo/QVBIFVyUbhc7mm3qlnLV4UydrUZA844wQwDn0cEX1OMMdP75hNjZ
         BiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753835271; x=1754440071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCTqLGkrlz7740uj5ANvmHASzn1qOh3ioVtwm8iKFtE=;
        b=WfYjk+VzAPzKqTSr3V+pY57cp9N1tPq+qOstoK4SMkFDi6yMYdI6J3AJay/9g3Da4M
         GGud/H8mciNsE3F5h6kxw3h/zG6bABw08X0b7IdbBHYoS2YjMkuc421qGhO8rkgS8mZt
         GwWpcAW9n4eZoBM6teEcy+80YqtB48mACxz/rbhh9PgkSGcW9gQrYIZnhCncUQOR54By
         ao8HbbOeeF0fhLyjf5sPaO5Qc25EBbDiXdV8A2KE7IOuUbStErRkHpnh2kAVDzzM0L3C
         WzDUwWb/MtXpmuU986Oy0kXz6+pxBdo0pkkm1k+zFHkfGgM0KxFqhX6ofLXDTtZWbhZq
         vTzg==
X-Gm-Message-State: AOJu0YzBBejvHwz4Gtiyp+N05Om7B9fzYluf6GMOgWb7XNooK7gwBpRd
	f+5I/RSNP+rA+o4mDB2i/1a7sqWKt44SRCSTCW40k5dJVtBrEaxOy5K09yAkApyKQvE=
X-Gm-Gg: ASbGncsQEk2v7ziFz/RBRbxQVx1RAO5em+d7yHw5ee+rtIe3wZnVWAN1Yt3UygS1JL6
	LE3y3n/ds1ErPl8SDWl8PYiUMNRIMCeYpNGlYtHiTXvQBRFecfpAfs8SoZjRmNAJi/d1CEzz9n0
	lCfOu1r2jgPw5m5FV+9MakvJiTJqgjAn62+4SJztrYBzTpHxaGyny6nQ9wXSMUaqqlS3zzAedFb
	nGu23GBj6P1lIGiyBAqefsJcEZ4zHf5xlUOqBW8CBgwER9aV9PmMCva78Qf0rT/focr+qRnUiwD
	X/GYiQDd2pTExA6elPTpol81t2+5eET+Rw+oTlgmRwX6kFqUtQF3NvZHaIHqUZzC/S8+8m2lihV
	H0qrXV6lOloDhrA==
X-Google-Smtp-Source: AGHT+IEDUgEI5Y1eHuoWpxPhCglS7bdRdE4RtKH+6KWNESTg52P9rRXP8WfE33mjx1Iwf/UJuY8Kgw==
X-Received: by 2002:a17:903:90f:b0:234:9fe1:8fc6 with SMTP id d9443c01a7336-24063d8ba20mr84657085ad.18.1753835270425;
        Tue, 29 Jul 2025 17:27:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24025f4a8e5sm56935825ad.130.2025.07.29.17.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 17:27:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] libcxx,compiler-rt: Remove use of non-existing runtime-llvm override
Date: Tue, 29 Jul 2025 17:27:45 -0700
Message-ID: <20250730002745.2179836-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 00:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221091

Provide libunwind based on TC_CXX_RUNTIME
When TC_CXX_RUNTIME is set to be 'llvm' distro wants
to use llvm provided runtime elements therefore provide
libunwind when TC_CXX_RUNTIME = "llvm"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Remove all use of runtime-llvm as override

 meta/recipes-devtools/clang/clang_git.bb  | 4 ++--
 meta/recipes-devtools/clang/libcxx_git.bb | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 5d914597775..e6aa78fbd95 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -358,8 +358,8 @@ INSANE_SKIP:${PN}-libllvm = "dev-so"
 #Avoid SSTATE_SCAN_COMMAND running sed over llvm-config.
 SSTATE_SCAN_FILES:remove = "*-config"
 
-COMPILER_RT:class-nativesdk:toolchain-clang:runtime-llvm = "-rtlib=libgcc --unwindlib=libgcc"
-LIBCPLUSPLUS:class-nativesdk:toolchain-clang:runtime-llvm = "-stdlib=libstdc++"
+COMPILER_RT:class-nativesdk:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
+LIBCPLUSPLUS:class-nativesdk:toolchain-clang = "-stdlib=libstdc++"
 
 SYSROOT_DIRS:append:class-target = " ${nonarch_libdir}"
 
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index f54bc364d88..6c584decc74 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -101,7 +101,7 @@ CXXFLAGS:append:armv5 = " -mfpu=vfp2"
 
 ALLOW_EMPTY:${PN} = "1"
 
-PROVIDES:append:runtime-llvm = " libunwind"
+PROVIDES:append = " ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "libunwind", "false", d)}"
 
 do_install:append() {
     if ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "true", "false", d)}
@@ -115,8 +115,8 @@ do_install:append() {
     fi
 }
 
-PACKAGES:append:runtime-llvm = " libunwind"
-FILES:libunwind:runtime-llvm = "${libdir}/libunwind.so.*"
+PACKAGES:append = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", " libunwind", "", d)}"
+FILES:libunwind = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", " ${libdir}/libunwind.so.*", "", d)}"
 # Package library module manifest path
 FILES:${PN}-dev += "${datadir}/libc++/v1/ ${libdir}/libc++.modules.json"
 

