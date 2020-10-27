Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.7356.1603761060809849400
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 18:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KWnNzZ2a;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id i26so6730868pgl.5
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 18:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=ywi0nuv4tgSEU+JebC00CCNLglhQzffGQoe7CGVOMVM=;
        b=KWnNzZ2aV+XlGto53eqgbf3tnevcIXMnOH1uhupjsD2SRkNkF3mmTppz42APPMwy+x
         6nEkX65W3S7xDIwz0VIRC7U7UvAD4gqJcf+34oCkMq/b3gfMXrM9D1qomOM782gXBawi
         vb2h80ruZxvRYugcYR2OXYbCj9+XRiVw22NwCNuj4LlxVbV2KJ+m4/+AaS8H+CvS/9Ru
         r2hl2Vyez6RGJ5TCbXEOLINyJVuzMkNKMSjcmy3FSB5+SelGxMvtH8oNTN3rmBXiqyZI
         TEdCYxLaPzy4R5ybc0CiFXZvAYtWPyEjAbMS/e5ChwjhIo4nlsUtJ806cXmATsCkylBA
         cyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=ywi0nuv4tgSEU+JebC00CCNLglhQzffGQoe7CGVOMVM=;
        b=PU3E+JHF1oPR0aAhZiEZF5A0MDFQ0sSmVATs+SmMswXK07XboprqHI6jypVLEPQbQN
         GTiAUwQTKhDQBkYFltzs5NsUleZMh9CJkODGQ7UVCXweWBqqIAteF0chQvdX3bWCDEke
         WHQdkMCdAS7iwasHTvYQv2N9OUmDOK1Xg4MPnBoGBiPylbHnPBslXAZJmVbVBiYFEWzp
         ByPlN8k9ucn/1TCRjKBxVyGr7lHfuLwIXOmqCysx761Btr43wVylsDkYhVhuGXduSAtK
         LrVpVZmk2wCtEBAgzztl1Oglnk6ARtKuiYrZnhN7wL4EwArrV2PFu5g83238iXkswmiN
         X3NA==
X-Gm-Message-State: AOAM533GFRsyi+mKXAHrB2hzGphCaaLPN2/+AJhiUzcLrOA5GpiyaYXI
	eeUjyEUzEyeHdXBx9xnsZ+Xf52upnEcYdifu
X-Google-Smtp-Source: ABdhPJyPhHTuG0TJltgMvKcl5nJHrSvCRQJzTZia9vBmKkxBi+VTPRD2Vjgujrd6JMdiDylaJNldaw==
X-Received: by 2002:a62:7fd4:0:b029:15c:dea2:4f67 with SMTP id a203-20020a627fd40000b029015cdea24f67mr391689pfd.51.1603761059655;
        Mon, 26 Oct 2020 18:10:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c12sm12781492pgi.14.2020.10.26.18.10.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 18:10:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Pull request (cover letter only)
Date: Mon, 26 Oct 2020 15:10:48 -1000
Message-Id: <cover.1603760941.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 3ee9590f96cb50e93864db768b254773e2ff9465:

  uninative: Fix typo in error message (2020-10-19 04:27:15 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  selftest/virgl: drop the custom 30 sec timeout

Changqing Li (1):
  toolchain-shar-extract.sh: don't print useless info

Khem Raj (1):
  packagegroup-core-tools-debug: Disable for rv32/glibc as well

Lee Chee Yang (3):
  libproxy: fix CVE-2020-25219
  python3: fix CVE-2020-26116
  grub2: fix CVE-2020-10713

Martin Jansa (7):
  arch-armv7a.inc: fix typo
  arch-mips.inc: remove duplicated mips64el-o32 from
    PACKAGE_EXTRA_ARCHS_tune-mips64el-o32
  tune-mips64r6.inc: fix typo in mipsisa64r6-nf
  tune-ep9312.inc: add t suffix for thumb to
    PACKAGE_EXTRA_ARCHS_tune-ep9312
  tune-riscv.inc: use nf suffix also for TUNE_PKGARCH
  siteinfo: Recognize 32bit PPC LE
  siteinfo: Recognize bigendian sh3be and sh4be

Victor Kamensky (1):
  qemu: change TLBs number to 64 in 34Kf mips cpu model

 meta-selftest/lib/oeqa/runtime/cases/virgl.py |   2 +-
 meta/classes/siteinfo.bbclass                 |   5 +
 meta/conf/machine/include/arm/arch-armv7a.inc |   2 +-
 meta/conf/machine/include/mips/arch-mips.inc  |   2 +-
 .../conf/machine/include/riscv/tune-riscv.inc |   4 +-
 meta/conf/machine/include/tune-ep9312.inc     |   3 +-
 meta/conf/machine/include/tune-mips64r6.inc   |   2 +-
 meta/files/toolchain-shar-extract.sh          |   2 +-
 .../grub/files/CVE-2020-10713.patch           |  73 ++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 .../packagegroup-core-tools-debug.bb          |   2 +-
 .../python/python3/CVE-2020-26116.patch       | 104 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...ease-number-of-TLB-entries-on-the-34.patch |  59 ++++++++++
 .../libproxy/libproxy/CVE-2020-25219.patch    |  61 ++++++++++
 .../libproxy/libproxy_0.4.15.bb               |   1 +
 17 files changed, 315 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-10713.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-26116.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch
 create mode 100644 meta/recipes-support/libproxy/libproxy/CVE-2020-25219.patch

-- 
2.17.1

