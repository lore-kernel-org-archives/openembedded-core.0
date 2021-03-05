Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.12824.1614955751315363023
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:49:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ExIor0vZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id b15so2005344pjb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aTkpT6aYfxyWfTQcBOdnl4IjDCs/KYogCco0wysjSW8=;
        b=ExIor0vZpDAYPlPKGTXJ0y2qeN4m3W+KKW8SodupudH6ZOZZgLLdqyYzPfsCIJZ847
         jNRieHbxJHITvys45mJob5ls6FYhvr1Jg84HN77Ip+ODZ5OHJbpJEdFdlgzMgO37Tdzk
         K8fZd0w0km/vjecZbJ+Uen4y9VXq2UtnOSLG5vKQA/vVAWfT0TNHkplqXX7pc8IIMYqj
         qJfjf+FAs9Dfp6j782pyk+a74M24A3eceRMW/94ixhDVG8akjeSATmEdx7k4sza8DIiU
         Hwxf00J88ycul9R4NiITDuTd0sdL7LxLF3oVMUo/+ivylu3FTTW34RrVkP+cQLH1PQPY
         y5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aTkpT6aYfxyWfTQcBOdnl4IjDCs/KYogCco0wysjSW8=;
        b=VG27wqIbBRfglpda4fzhVmpKoVeaOc3MbganltT3iqOIYkV8uLS1rp46jtAXgCsrnK
         FYvCqXHQ/vNlcrDdiNB58MaJHGFDs4FM+2w9qG7iNE/6NaaenXW6Kzi1EhD/4is8c46m
         S8cz9NXu4jKzsanxw+MzEHjv7CQL1Z37cETS5h10KS4OCELmahx6uph4GP5heRJLgblS
         Mu3eowp5vji6fKC5H+sNaEvRmgW0RTXx/Q8s2W0l8+ySME2VfYyPR52sO6y9MddUHnu5
         ZbGhAkzkUIKVvlWT0NgrPvNHDiR1BQWoxFdlcjSlCTUdY7LguULn23z3wk92skH7doJJ
         0yDQ==
X-Gm-Message-State: AOAM533JT1EHKE3OGASrUKyeqrIA0GPiPxhq39dkq6dpkGw8MAX8yiqe
	7WZu8c1G94xl6ZyTlArYIMs5sV3Rtjthjkub
X-Google-Smtp-Source: ABdhPJwrugG+agefWvFVI4/mGXoaSWCtIAmOvcdf9gHZZupHgwxT51VQSqFNTIv+CqE1JrDGtLdOiA==
X-Received: by 2002:a17:90a:c588:: with SMTP id l8mr10534882pjt.120.1614955750227;
        Fri, 05 Mar 2021 06:49:10 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.49.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:49:09 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/27] meta/recipes-bsp: Add HOMEPAGE / DESCRIPTION
Date: Fri,  5 Mar 2021 04:46:33 -1000
Message-Id: <ef228792632585d3e13cdebe7313c945b966354f.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

Added HOMEPAGE and DESCRIPTION for recipes with missing decriptions or homepage

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1ce7e76551b3b2f4477f780e67cf894f760529e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.11.bb | 1 +
 meta/recipes-bsp/opensbi/opensbi_0.6.bb    | 1 +
 meta/recipes-bsp/v86d/v86d_0.1.10.bb       | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.11.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.11.bb
index 9954d7f57a..191b0bc176 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.11.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.11.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Libraries for producing EFI binaries"
 HOMEPAGE = "http://sourceforge.net/projects/gnu-efi/"
+DESCRIPTION = "GNU-EFI aims to Develop EFI applications for ARM-64, ARM-32, x86_64, IA-64 (IPF), IA-32 (x86), and MIPS platforms using the GNU toolchain and the EFI development environment."
 SECTION = "devel"
 LICENSE = "GPLv2+ | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=16;md5=e582764a4776e60c95bf9ab617343d36 \
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.6.bb b/meta/recipes-bsp/opensbi/opensbi_0.6.bb
index 56f2d4b915..d8910c0ff1 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.6.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.6.bb
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
2.25.1

