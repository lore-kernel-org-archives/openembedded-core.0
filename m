Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910FFC2D0CD
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 21:29:10 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.19643.1747517339431579505
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 May 2025 14:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=REGzFRYl;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742b0840d98so1251123b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 May 2025 14:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747517338; x=1748122138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0fBCGirmhFtFVigHx/thpwytAVsHo5xYPAiQwQQXwfs=;
        b=REGzFRYlux9fENuZiSU1qJKn7hS2AjXIFTR768a4C4fZ/BzlIAAfJ1mEkbavb7ns3I
         pS2yPUMxdTghTQmYQ0JT8uT+mHRrPUb4boPpq7YTrT6J7+0sOOvJHkTaZk1QHb4L4Dzh
         5/FY+4ggDllAZrPQGKdKNcuvFHvk9xXc6VQbctIb0LOYcWofWSjRYLMG8H6WwT3zsTNm
         wKpbmxCZWFsll/TVvQglzgYCox6lWVewPcnY22PCkL0JaO0XlwsC615KhYZ/Q6tusnzW
         HrqCXuY5rd20Lc+bDq4J3GDVRJ+wOiDY65mHZnqvdcRMYX5mjJl0yzB/d+xU/Edwej19
         H9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747517338; x=1748122138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0fBCGirmhFtFVigHx/thpwytAVsHo5xYPAiQwQQXwfs=;
        b=lnAlmPHEGL0SQddaLmjonykxyn04wgBl/fXip0DL2SRfR+6Kvm4K0LzmTZFpTqNet8
         C/f4d2vK/XfSpDpjca7Y8mSU+6Pc4MwHDNg9KA6035emVWyWJTqhlOqAGYMTcg1trtD5
         TO7LU6UEkuXg6L1JFetmiqrmdMtO/m2+RT0d7nbz+tnSUM2yKBvP/loCpooD0oTGftJZ
         wnvu2fJxLN/SRdHk2vTYpxPc/z69gb30Dvj281kWYH0HntC5JMflGTxIwNphuYFFHbEA
         HUVNPCLg9lrYfn0+BpXkkI2Vx4oBn1wuXEycOPYN+x1pRNJ+WK/FyhVsMzkDoTcE9985
         iGug==
X-Gm-Message-State: AOJu0YxMjwglYQ4x1uKxITWZPl6RAc2MsaC8mw89YJIIqxEofT10HVZp
	KjvZvWqxzuLd4dw3RwPMvggJN2X+ZXfmuflolbyM+nyznRWEZOQtTS4ovvi6HXQf
X-Gm-Gg: ASbGncsLIAJAmmvwjacHvBU76DMx6pdIfGlM90UIn7S1sIyfLe1oJNqErpgVbNMwaEP
	zOUzJr+teQETTTyD1+KaXOqTSg9CauJvoRwkpw5ET5/qW7W8/Ko5SDI+gKTksm1YAoX0vspw1ka
	bo5hJm8G4daw7UchpkjhLzgQqr25sVb3pM7qmHQqTI2Tsq4zrskkQsVNJ2G/EsYqQ/L022kgTY1
	8KKPeBvjC61BEHJTykh3lcHivn8kQU4tdqOXKK2Iy0jpUVSmvMopOTVD+gxl21rhPB0UyXYoIwb
	3NlDkFyAPqURbhl3Nw57JSTuERavLsVDPT6zWBzw0yw=
X-Google-Smtp-Source: AGHT+IGEiKHG2cmNqjOELt+F3iUjKyPGazQIAZJaABMq+TzTu2lsXorMCDFVlaBVQz3WDPW/iuWOBA==
X-Received: by 2002:a05:6a21:10a:b0:1f5:591b:4f7a with SMTP id adf61e73a8af0-2170ce8ce6dmr11117197637.38.1747517338330;
        Sat, 17 May 2025 14:28:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b270808b57esm295383a12.75.2025.05.17.14.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 14:28:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rust: Use patchelf in place of chrpath to edit rpaths
Date: Sat, 17 May 2025 14:28:55 -0700
Message-ID: <20250517212855.349153-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 May 2025 21:29:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216772

chrpath has limitations e.g. the original rpath in ELF have to bigger in size
than the one being edited into it by chrpath, some toolchains do not use RPATH
but emit the RUNPATHs into ELF files and chrpath is not able to handle the
runpaths, this is the case with mips and pp32 build of rust, especially
when using clang compiler to build them.

patchelf can do more:

Modify RUNPATH entries
Add RPATH/RUNPATH where none existed
Set longer paths than the original
Convert between RPATH and RUNPATH

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rust/rust_1.85.1.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.85.1.bb b/meta/recipes-devtools/rust/rust_1.85.1.bb
index dc4f5648552..3b7226ae408 100644
--- a/meta/recipes-devtools/rust/rust_1.85.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.85.1.bb
@@ -207,9 +207,9 @@ rust_runx () {
         mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
         cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
         if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ]; then
-            chrpath -r \$ORIGIN/../../../../../`basename ${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
+            patchelf-uninative --set-rpath \$ORIGIN/../../../../../`basename ${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
         else
-            chrpath -d ${RUST_ALTERNATE_EXE_PATH}
+            patchelf-uninative --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
         fi
     fi
 
@@ -266,7 +266,7 @@ rust_do_install:class-nativesdk() {
     install -d ${D}${bindir}
     for i in cargo-clippy clippy-driver rustfmt; do
         cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
-        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
+        patchelf-uninative --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
 
     chown root:root ${D}/ -R
@@ -301,7 +301,7 @@ rust_do_install:class-target() {
     install -d ${D}${bindir}
     for i in ${EXTRA_TOOLS}; do
         cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
-        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
+        patchelf-uninative --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
 
     install -d ${D}${libdir}/rustlib/${RUST_HOST_SYS}

