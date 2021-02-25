Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.14081.1614271454351886335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 08:44:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EzetNJBX;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id a4so4130789pgc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 08:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rAgOM/NpvUk3JYgJJIuVSyZxmKWY3w/vNtLmLHoHIfU=;
        b=EzetNJBXLY7XGKmOmjOrMnxsvF16oByvZE9rqgZkAY2Hw+Yi4QYZQtZ/xBe5syt/lK
         3d3qqAfNopIhb13JrIIp9Pxki4GzTt4UY/UNQITbTyeaktQMiAuAmbm9XSiMSKFolNOf
         nA9SzcFX1llzBjQouaCPVoVU5T0WZSB56hJANRzAbCht5W5PegLqCeUqU45V1WvL4uk7
         gH1BgbNihjCA72Y6pGbhg2oZbyLSw9r678JOHG0ienigwTJl9A/4Z4NJmEj+JFlyCbA6
         pjjSZYUB4JdtMkBDxwfosDRXQCEGJTrlQufUq+vQDRaO48mCSRh+0GrBtVOzc//EAx7d
         vzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rAgOM/NpvUk3JYgJJIuVSyZxmKWY3w/vNtLmLHoHIfU=;
        b=WUOkHTuCJxAlLD3NsFp46nOPhiwHYnX4ceixYvqQ4wVxegIi+uvxdY6859gNuxvsgX
         oHpSYwfSlODAHBTa4p/hdICuHTYwwwazvk9yq4DyznuJJ1T5NYZhHYQ3QaLke/9WZZwb
         xLXxwOuju9m40+MZjsK+pmp2hbJrTkH4AR5Sdku2NcuMveQzWYd/3OWZKnat9qxeHmWz
         tz8KUm7xrOlYCufDTAyumQ+WgNjDEi793scxa92xdbI8VUDK3X8HbDDiPAYb149hdoZp
         6cndITWhM2bhp7+dDn6WlaqcvReIiHn0473eV+U6+MUr26Uh+Bk/Nj6dYk/DeirPzFVF
         oyag==
X-Gm-Message-State: AOAM533IUbvCrOjIntO5GEl3l9eS/7Y7KQKRn3jo5OixB7RE90I3yM2P
	YUcp0ME3YOxsfQ+LrEBMSOzixkXpLUkK+g==
X-Google-Smtp-Source: ABdhPJzvFhYXL8ql7sb75ofX6KYIYujoNlttTIRNV9egdVAMydszF1eeZ9jTctOs/EwaVMz4PyopCg==
X-Received: by 2002:a63:ed07:: with SMTP id d7mr3855710pgi.164.1614271453380;
        Thu, 25 Feb 2021 08:44:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id z13sm7363442pfk.178.2021.02.25.08.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 08:44:12 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Upgrade to 11.1.0 release
Date: Thu, 25 Feb 2021 08:44:11 -0800
Message-Id: <20210225164411.3333168-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc               | 2 +-
 ...atcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb                    | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 8e454f74a5..76ada982f9 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "5.2%"
 GOVERSION ?= "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "10.0.1"
+LLVMVERSION ?= "11.1.0"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index 20eea060b1..48af6fc283 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -7,7 +7,7 @@ Otherwise, there are instances which are identical in
 every other field and therefore sort non-reproducibly
 (which breaks binary and source reproducibiliy).
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://reviews.llvm.org/D97477]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 43395f8cfc..86def0878c 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,9 +19,9 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-MAJOR_VERSION = "10"
-MINOR_VERSION = "0"
-PATCH_VERSION = "1"
+MAJOR_VERSION = "11"
+MINOR_VERSION = "1"
+PATCH_VERSION = "0"
 
 PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
 
@@ -29,7 +29,7 @@ LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "ef32c611aa214dea855364efd7ba451ec5ec3f74"
+SRCREV = "1fdec59bffc11ae37eb51a1b9869f0696bfd5312"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-- 
2.30.1

