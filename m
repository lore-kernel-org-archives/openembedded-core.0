Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001EFC07E9D
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 02:59:55 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.3662.1664333986123848689
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 19:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vJyjAls6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 l9-20020a17090a4d4900b00205e295400eso509178pjh.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 19:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=ukjAqn8SLUbucVWE6rdZ7Ruj/Wo/dJmFw99EAU69Yjw=;
        b=vJyjAls6Zv0I/9SFI50D9Va7osJKANTRGTGE8cNPRT0qcS3xuIl7nUYXn3RLx0SLaB
         +NXPC/SEJhuZYSnzVgvUerd+IE7K4FzVXcaeqpurZ0zc7/aYb+qkJQWH/eVeOQZcknqC
         /oXA7Ftyf5Dbzm7sPdFkc6qJ95FZtx7tFX0KrP57R7BantQ1BbSyUUPA0KjF1/lLzDjf
         Ke7pribgvXL/4HijJQv2fWN2haAm98AQZ02DlBCqu8duHMEnJEnAMOq06Iqh60xP2QQC
         dSjFvTxNwkoUX3GBUIddumfZVzyKsl36Ob3ymSVxoxGGXft2WhsiXmM4pIklq39yvrP/
         /82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=ukjAqn8SLUbucVWE6rdZ7Ruj/Wo/dJmFw99EAU69Yjw=;
        b=t7tYcIz9kkXdRyd4ox77BIhLFVY6VpyVgQe3fQF+DSXsE8Fxcsyri4XcBau00KhY0N
         WC3kBoOsmT8GTJA+o8JxnAaphkzJ4tiRn+UxtACuw9IRsH/M7SSPdWzInsXrlFYZfIQA
         kv1QuiIwHYAjyMkfa7CxQrXzcO89jaWbnaIwvXTFUmOuaDI4ALATAcX8fjKigAl3C9J5
         RuLhrlIW2sQaKFsKCJjRz85KvG69VHWoNQbjK5BYm+PtijypkoCm39uLJ3A2/IOAf48m
         LD8kDLoqjXuhVzjQp2uaqpMAjZhn/x7Y9nH63gw59AaBEWzx8gpRe1mHqNRzsQ+DvGMc
         hE+w==
X-Gm-Message-State: ACrzQf2GJ8mvO8V/9c91gK8pxTJvIuzHv9/9ZG7Ssvt0xRkRlhUF4QTy
	CN3XMjatvGMPeGyis4TXEKihv+d6d+BMALXo
X-Google-Smtp-Source: 
 AMsMyM5X3S49idycpOOICMwZ1rzCouepR6XLRB+m/6SDK+7wJRDdbA1raz1Qz9pvYwEf7/9K3600ug==
X-Received: by 2002:a17:90b:3c5:b0:205:dc5b:5436 with SMTP id
 go5-20020a17090b03c500b00205dc5b5436mr6374895pjb.35.1664333984890;
        Tue, 27 Sep 2022 19:59:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 n36-20020a17090a2ca700b001f94d25bfabsm266952pjd.28.2022.09.27.19.59.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 19:59:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/33] Pull request (cover letter only)
Date: Tue, 27 Sep 2022 16:59:27 -1000
Message-Id: <cover.1664333913.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 02:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171138

The following changes since commit f7766da462905ec67bf549d46b8017be36cd5b2a:

  build-appliance-image: Update to kirkstone head revision (2022-09-20 16:07:21 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexandre Belloni (1):
  oeqa/runtime/dnf: fix typo

Bruce Ashfield (9):
  linux-yocto/5.10: update to v5.10.141
  linux-yocto/5.10: update to v5.10.143
  linux-yocto/5.15: update to v5.15.63
  linux-yocto/5.15: update to v5.15.65
  linux-yocto/5.15: update to v5.15.68
  linux-yocto/5.15: cfg: fix ACPI warnings for -tiny
  kernel-yocto: allow patch author date to be commit date
  kern-tools: fix queue processing in relative TOPDIR configurations
  kern-tools: allow 'y' or 'm' to avoid config audit warnings

Dmitry Baryshkov (2):
  linux-firmware: upgrade 20220708 -> 20220913
  linux-firmware: package new Qualcomm firmware

Florin Diaconescu (2):
  expat: upgrade 2.4.7 -> 2.4.8
  expat: upgrade 2.4.8 -> 2.4.9

Mikko Rapeli (5):
  u-boot: switch from append to += in SRC_URI
  glibc-tests: use += instead of :append
  go-native: switch from SRC_URI:append to SRC_URI +=
  python3-rfc3986-validator: switch from SRC_URI:append to SRC_URI +=
  linux-libc-headers: switch from SRC_URI:append to SRC_URI +=

Mingli Yu (1):
  busybox: add devmem 128-bit support

Richard Purdie (3):
  libpng: upgrade 1.6.37 -> 1.6.38
  vim: Upgrade 9.0.453 -> 9.0.541
  perf: Fix for recent kernel upgrades

Robert Joslyn (1):
  tzdata: Update from 2022b to 2022c

Ruiqiang Hao (2):
  gcc: add arm-v9 support
  tune-neoversen2: support tune-neoversen2 base on armv9a

Samuli Piippo (2):
  Revert "gcc-cross-canadian: Add symlink to real-ld alongside other
    symlinks"
  gcc-cross-canadian: add default plugin linker

Sundeep KOKKONDA (1):
  glibc: stable 2.35 branch updates.

Teoh Jay Shen (2):
  go: fix CVE-2022-27664
  inetutils: fix CVE-2022-39028 - remote DoS vulnerability in
    inetutils-telnetd

Xiangyu Chen (1):
  ltp: Fix pread02 case trigger the glibc overflow detection

pgowda (1):
  binutils: fix CVE-2022-38126

 meta/classes/kernel-yocto.bbclass             |   6 +-
 meta/conf/machine/include/arm/arch-armv9a.inc |  28 ++
 .../include/arm/armv9a/tune-neoversen2.inc    |  10 +-
 meta/lib/oeqa/runtime/cases/dnf.py            |   2 +-
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   2 +-
 .../inetutils/inetutils/CVE-2022-39028.patch  |  54 ++++
 .../inetutils/inetutils_2.2.bb                |   1 +
 .../0001-devmem-add-128-bit-width.patch       | 128 ++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
 .../expat/{expat_2.4.7.bb => expat_2.4.9.bb}  |   4 +-
 meta/recipes-core/glibc/glibc-tests_2.35.bb   |   4 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0016-CVE-2022-38126.patch        |  34 ++
 meta/recipes-devtools/gcc/gcc-11.3.inc        |   5 +
 .../gcc/gcc-cross-canadian.inc                |   3 +-
 ...rch64-Update-Neoverse-N2-core-defini.patch |  42 +++
 .../0002-aarch64-add-armv9-a-to-march.patch   |  89 ++++++
 ...le-FP16-feature-by-default-for-Armv9.patch |  38 +++
 ...rm-add-armv9-a-architecture-to-march.patch | 294 ++++++++++++++++++
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2022-27664.patch           | 102 ++++++
 meta/recipes-devtools/go/go-native_1.17.13.bb |   2 +-
 .../python/python3-rfc3986-validator_0.1.1.bb |   2 +-
 ...er-to-avoid-glibc-overflow-detection.patch |  58 ++++
 meta/recipes-extended/ltp/ltp_20220121.bb     |   1 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 ...20220708.bb => linux-firmware_20220913.bb} |  26 +-
 .../linux-libc-headers_5.16.bb                |   2 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 meta/recipes-kernel/perf/perf.bb              |   6 +
 .../{libpng_1.6.37.bb => libpng_1.6.38.bb}    |   5 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 39 files changed, 973 insertions(+), 68 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-armv9a.inc
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
 rename meta/recipes-core/expat/{expat_2.4.7.bb => expat_2.4.9.bb} (84%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0002-aarch64-add-armv9-a-to-march.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-27664.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-pread02-extend-buffer-to-avoid-glibc-overflow-detection.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220708.bb => linux-firmware_20220913.bb} (96%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.37.bb => libpng_1.6.38.bb} (83%)

-- 
2.25.1


