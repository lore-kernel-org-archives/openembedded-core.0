Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.22543.1605858987062514609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 23:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TQnVnmK4;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id q28so6640084pgk.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 23:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l8548I2fgeGNYU3roDTd8p6Z3RSzI/7GaoEgxezElU4=;
        b=TQnVnmK4WTPOmrAYhhyay+cy37JjG4JyxFNvGfPkUUS5Nt4O7FT2OOo7VpA+LUIp2g
         LdTBJRuF9ou6SxrnbNLYjTkoiCjrYaVphQs6OiSUlYvbcWU+enReSV44NyvdTYwTfuyB
         ffdWUZ0xoN8ifJo4hpHT3aOdKwsYBBWvbaPhQSlHGNhpyq7geCZhOUT2PL36nwb9QzXF
         CwZTYsszcJomK4lds0QLkMASC2+X1fD93xZqzt9qjyMQorZsBB1MgxwP6H4C9GVr3yOm
         BdC6TpqoWaKfuMmK6PjVHz+Gz6UYnEiCE+BpKrJAppQsVLHlfOP0p7FKW/P+T/D5r58P
         c3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l8548I2fgeGNYU3roDTd8p6Z3RSzI/7GaoEgxezElU4=;
        b=M5tHzeZm2dxYFe7MAIHq7stdi0/Rh5H2axOOLq+/563EuHv0yyGT9bBAC26BYk/yhN
         y1JHDdyicFCNjmPRU2IxGiTqu4izFCxulMwuXGAGaB4nOD1ui3uDC2dap6EmX/8jdEAB
         ErsJ5MeY8LXhd1yQk6VEyf+QwUWzWw0s4I9uqY1RB14oVifAqssTyI2MPpmUzgAlipB/
         FRrnjTyQgpWZgTH1cC6hlXkS91ar2mGdkHTm3mLPOw+I/kYnUA32cPC8j1Uzz3e2BA4D
         XZORxqtqNIaSOsIf0LWjSvUYbc2tWuzwM2ZYKkymXzdmvNsEAODy0wBTeUXh1W8mhdKT
         h5yQ==
X-Gm-Message-State: AOAM530sivfLZl3QhMHgskLyfP5JyWxwMwav/LofAsFAUr3J0OHeMRLV
	+XtgcFlWEt6TxQwLXmZp42sJ/Cnvxm9+pA==
X-Google-Smtp-Source: ABdhPJxSnRAXhWyWtaV6lw8FvHPOkGtI2kYI0wNsGRjMued5QFXlfsRB8UPEnxeU8jMCSFGELmZhBw==
X-Received: by 2002:a17:90a:4d47:: with SMTP id l7mr8751874pjh.121.1605858986021;
        Thu, 19 Nov 2020 23:56:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id h68sm2496237pfe.74.2020.11.19.23.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 23:56:25 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] go: Update to 1.15.5
Date: Thu, 19 Nov 2020 23:56:21 -0800
Message-Id: <20201120075621.1257101-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define CXX_FOR_TARGET and CC_FOR_TARGET for target go
since we are cross building it, it helps in defining the compiler
for cgo on target

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-1.15.inc                          | 4 ++--
 ...{go-binary-native_1.15.3.bb => go-binary-native_1.15.5.bb} | 4 ++--
 meta/recipes-devtools/go/go_1.15.bb                           | 2 ++
 3 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.15.3.bb => go-binary-native_1.15.5.bb} (83%)

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index a35921c1f8..31e68d14ee 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.15"
-PV = "1.15.3"
+PV = "1.15.5"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
-SRC_URI[main.sha256sum] = "896a602570e54c8cdfc2c1348abd4ffd1016758d0bd086ccd9787dbfc9b64888"
+SRC_URI[main.sha256sum] = "c1076b90cf94b73ebed62a81d802cd84d43d02dea8c07abdc922c57a071c84f1"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.15.3.bb b/meta/recipes-devtools/go/go-binary-native_1.15.5.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.15.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.15.5.bb
index aeab91a80f..1fb11b0435 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.15.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.15.5.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "010a88df924a81ec21b293b5da8f9b11c176d27c0ee3962dc1738d2352d3c02d"
-SRC_URI[go_linux_arm64.sha256sum] = "b8b88a87ada918ef5189fa5938ef4c46a4f61952a34317612aaac705f4275f80"
+SRC_URI[go_linux_amd64.sha256sum] = "9a58494e8da722c3aef248c9227b0e9c528c7318309827780f16220998180a0d"
+SRC_URI[go_linux_arm64.sha256sum] = "a72a0b036beb4193a0214bca3fca4c5d68a38a4ccf098c909f7ce8bf08567c48"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go_1.15.bb b/meta/recipes-devtools/go/go_1.15.bb
index cc4c3fe45d..d4812c0f0a 100644
--- a/meta/recipes-devtools/go/go_1.15.bb
+++ b/meta/recipes-devtools/go/go_1.15.bb
@@ -6,6 +6,8 @@ inherit linuxloader
 export GOBUILDMODE=""
 export CGO_ENABLED_riscv64 = ""
 export GO_LDSO = "${@get_linuxloader(d)}"
+export CC_FOR_TARGET = "gcc"
+export CXX_FOR_TARGET = "g++"
 
 # mips/rv64 doesn't support -buildmode=pie, so skip the QA checking for mips/riscv and its
 # variants.
-- 
2.29.2

