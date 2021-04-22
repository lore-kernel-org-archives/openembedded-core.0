Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.750.1619107475281638882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 09:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aaIRms2c;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id e2so19449948plh.8
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 09:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ds60bdQEv5hFaDhvdg3PN3OBYZKZkEtxZx8v82ltbo=;
        b=aaIRms2cLfkowH4A1e89qL8CkqoQWjoLG8xBxoov6JqMEGvwOng6kreLqlBoD03x+u
         5UIgocmMK9Ldwcxn8ZCXOcNE6085GbVoK+FZzkUUAH63SSP9ROcZTPYzwKnCJrug2DCO
         5NqTAPXns4mcuPxXvuFogdhP6zcyy186PnkiEndvwzNbiJLOEl3HfwDNOYh4VT4c2bQ6
         vx47v+Rhdb8RX1VOG7aRBuP+5VHvrIwT6ccc1DmqtPF9nTXtOZkqmEz0L/gS0xldlyHF
         glpXaqO9mvWFThcanX1aKbFIMDrslFFNZBkpQHze/YJTEVNLr/grZ+C43Byhs0rzz1jt
         6teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ds60bdQEv5hFaDhvdg3PN3OBYZKZkEtxZx8v82ltbo=;
        b=Ab6mG7dNV/JK0nYPYm6QD46v4YRqxBMZCmXNqXhMKNW8ZXRSPfE4YrLM3H33tGj65l
         9Svdu1wN6DK/UHkc3NQ/CM447rnHoor27NXLNcbYTErVJ/+zxVIh8dAww5OAThTXw51S
         8SuUmxj8OdLq46aCd0Pg/pdumseSW5apOEdPhqOl2gqX4K0ZbaYHk0PHSdkavYusW2+z
         aKmkO7wbq5qBiN1BaBFraRPV3OXe9byBWpg2CElnS9sFL0tnxu3avsCyK9/VIdCBxOhG
         fFl8iIFO5mQsa1o+xYC6eynY1VcfoIRzFfhfsuoDUUEvNmu5+PW0mP4mRoktd203FDDK
         HDOQ==
X-Gm-Message-State: AOAM533lFlyvGbb7jF1hUdgyiJavhYSTGEXI2OpbUujeJsV6H8LOp4Du
	aaTYSvvmtvotsy3Q9c7BvStKVzTXyYcsXQ==
X-Google-Smtp-Source: ABdhPJwcF9Aqbqlie+dGdPQL658/hnSQCq3nJXPhHfXtx5g1nRliqQUiDxsAd7dSNQmxpRQDmsNnRw==
X-Received: by 2002:a17:90a:644b:: with SMTP id y11mr4647932pjm.229.1619107474433;
        Thu, 22 Apr 2021 09:04:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id j27sm2856861pgb.54.2021.04.22.09.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 09:04:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Upgrade to LLVM 12 release
Date: Thu, 22 Apr 2021 09:04:32 -0700
Message-Id: <20210422160432.584499-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop backported patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../llvm/0001-nfc-Fix-missing-include.patch   | 26 -------------------
 meta/recipes-devtools/llvm/llvm_git.bb        |  7 +++--
 3 files changed, 4 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-devtools/llvm/llvm/0001-nfc-Fix-missing-include.patch

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 594108ec1c..a0c35eed09 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "5.2%"
 GOVERSION ?= "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "11.1.0"
+LLVMVERSION ?= "12.0.0"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm/0001-nfc-Fix-missing-include.patch b/meta/recipes-devtools/llvm/llvm/0001-nfc-Fix-missing-include.patch
deleted file mode 100644
index f6dee77ab2..0000000000
--- a/meta/recipes-devtools/llvm/llvm/0001-nfc-Fix-missing-include.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 3b7e611bd58ba842470d17374c550e14bceca5c7 Mon Sep 17 00:00:00 2001
-From: serge-sans-paille <sguelton@redhat.com>
-Date: Tue, 10 Nov 2020 14:55:25 +0100
-Subject: [PATCH] [nfc] Fix missing include
-
-Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/b498303066a63a203d24f739b2d2e0e56dca70d1]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/utils/benchmark/src/benchmark_register.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/llvm/utils/benchmark/src/benchmark_register.h b/llvm/utils/benchmark/src/benchmark_register.h
-index 0705e219f2fa..4caa5ad4da07 100644
---- a/llvm/utils/benchmark/src/benchmark_register.h
-+++ b/llvm/utils/benchmark/src/benchmark_register.h
-@@ -1,6 +1,7 @@
- #ifndef BENCHMARK_REGISTER_H
- #define BENCHMARK_REGISTER_H
- 
-+#include <limits>
- #include <vector>
- 
- #include "check.h"
--- 
-2.30.1
-
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index db6694339c..8a5d3dc9bf 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,8 +19,8 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-MAJOR_VERSION = "11"
-MINOR_VERSION = "1"
+MAJOR_VERSION = "12"
+MINOR_VERSION = "0"
 PATCH_VERSION = "0"
 
 PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
@@ -29,12 +29,11 @@ LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "1fdec59bffc11ae37eb51a1b9869f0696bfd5312"
+SRCREV = "fa0971b87fb2c9d14d1bba2551e61f02f18f329b"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-           file://0001-nfc-Fix-missing-include.patch;striplevel=2 \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-- 
2.31.1

