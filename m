Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.4937.1614213550104589204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 16:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hul/PC/H;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id o16so3403298wmh.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 16:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=uxTSqdovQiCIRDbL92uJmAx4RVUjMPiCwVXG8XcWPvQ=;
        b=Hul/PC/HG8OZ6SVQv3QXJgxPPiFdVtKqT7qTMi5p3eu6c+8VC8llGbe6EfPmaeavek
         FB/A/VruLuWpYqr5chaHojInTFP8ju+M3eSaL4DKW+42Dn43Yh/8wvTWfZwxU98e2mKJ
         2BElyAs98YOabkR66wRq7oZQ59Q3HZHNzwiGd8eA814+Ttq5acQMl2CqeBYwiY09TKjX
         JZDpNFC1sDTrbB5Gb4gwhMLwvjiHS2Fb6wzjhgeY675L9YXqeehK2Nhm4rnXMOgYcmHi
         vj8cIKHLab82xqfwf7Fbj1YpXDhjti/ziAtvgqTzw4N1SdJ4vSo0Da1PE/WMfAACCFUB
         yUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uxTSqdovQiCIRDbL92uJmAx4RVUjMPiCwVXG8XcWPvQ=;
        b=oY3nXsFAcIwQU6hG++/FlDA66xNeKOaDu8BvJ8in5vsd1ICr+zxdJp7PgYT3gO9rss
         qLgCqzmHW9Sa3vgRgAR7z6oZkDNbCjtoVWJT+oJS0GtkTEYdZl9l9e9EZY9QQ7UWDZ0x
         lW2L1Za+E8exSLXw5NRfgJTvFOIDvCEu882txDAhI/rQlIBgCLuqUy8QeGviIsF5JiFi
         1MJNQ12pjCh8Uh7+ZW+r4320QBENUosBQFHmEfyBRNVaUUzD3J5ylwCynT2KEQMtOcAQ
         ffh2tHt+sY4jLs4ieNj/xTOeAOiqB5IgIXwMLjLnWQvjWzlAMl7P0x7Fdqnq0Yscw2Es
         Y3cg==
X-Gm-Message-State: AOAM530lbKKX92bp/7Z18gxUXTR5zNvBTcRXgYzlvOU1768nK43lL1Bt
	mn1llarmgYFJrwi7LmrSfh+SPnxQia8=
X-Google-Smtp-Source: ABdhPJzko228lbAp2xzA/MzRwk63UlgbTjspvv85pCol/TJIz2SnuUxmGRvUvFVl1HhOwJPdaoPOWQ==
X-Received: by 2002:a05:600c:204d:: with SMTP id p13mr566563wmg.140.1614213548265;
        Wed, 24 Feb 2021 16:39:08 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.99.217])
        by smtp.gmail.com with ESMTPSA id a1sm5965962wrx.95.2021.02.24.16.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 16:39:07 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 1/4] meta/recipes-bsp: Add HOMEPAGE / DESCRIPTION
Date: Thu, 25 Feb 2021 01:38:58 +0100
Message-Id: <20210225003901.18196-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

Added HOMEPAGE and DESCRIPTION for recipes with missing decriptions or homepage

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb | 1 +
 meta/recipes-bsp/opensbi/opensbi_0.9.bb    | 1 +
 meta/recipes-bsp/v86d/v86d_0.1.10.bb       | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb
index 7888aba0fb..d27126603f 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Libraries for producing EFI binaries"
 HOMEPAGE = "http://sourceforge.net/projects/gnu-efi/"
+DESCRIPTION = "GNU-EFI aims to Develop EFI applications for ARM-64, ARM-32, x86_64, IA-64 (IPF), IA-32 (x86), and MIPS platforms using the GNU toolchain and the EFI development environment."
 SECTION = "devel"
 LICENSE = "GPLv2+ | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=16;md5=e582764a4776e60c95bf9ab617343d36 \
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.9.bb b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
index 9f17258edb..cb1c3f2ebf 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.9.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
@@ -1,5 +1,6 @@
 SUMMARY = "RISC-V Open Source Supervisor Binary Interface (OpenSBI)"
 DESCRIPTION = "OpenSBI aims to provide an open-source and extensible implementation of the RISC-V SBI specification for a platform specific firmware (M-mode) and a general purpose OS, hypervisor or bootloader (S-mode or HS-mode). OpenSBI implementation can be easily extended by RISC-V platform or System-on-Chip vendors to fit a particular hadware configuration."
+HOMEPAGE = "https://github.com/riscv/opensbi"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=42dd9555eb177f35150cf9aa240b61e5"
 
diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index a8df80fdd6..e614de0c48 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -1,5 +1,6 @@
 SUMMARY = "User support binary for the uvesafb kernel module"
 HOMEPAGE = "https://tracker.debian.org/pkg/v86d"
+DESCRIPTION = "v86d provides a backend for kernel drivers that need to execute x86 BIOS code. The code is executed in a controlled environment and the results are passed back to the kernel via the netlink interface."
 
 # the copyright info is at the bottom of README, expect break
 LICENSE = "GPLv2"
-- 
2.17.1

