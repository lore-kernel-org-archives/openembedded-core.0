Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.26694.1592249757222719115
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wy4E0E8v;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id i4so302878pjd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=uqZxBK9DCSYPJfJWZTCXUDwOWRnJV/ACzAZ4rvhGaYc=;
        b=wy4E0E8vVFvUNejCQ20DpsHNAWw+j70O1+qayIpE6DrwYCImwAobM5iIIEB79EiopZ
         UpePl68QkMK1BsESvQddINpgkYFUV0UNzGLSbcK/ogccDgrGpoWEw15NeGeclkFGpyTP
         cNbNzaXbxGPmdl5CparF7gFOR6JsK6Qsv88jpB4MnAj78VMT1+B2pGhZQZq17UqMDW/n
         Uo0lEyPWCf2hKcHNg2QwXuT1vUgWae52FM7VHGUIcCyIaiDfvdMfF/rtabYGUaXlfJn2
         bWTSlFKq7y15iqWD0Tr4mj3ulsx44H/mStAhlsSS8o1RhpzjHUXobGKQwCYby86JSei+
         crtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=uqZxBK9DCSYPJfJWZTCXUDwOWRnJV/ACzAZ4rvhGaYc=;
        b=bycKnxklyX6JGDsa81hnUkCLmyrTYqijlmI7XpHb+jqGvVX53N86wCc+fix1kAjXB5
         e1lyZmEDeNBf+kTOCDttoKTJRoy3SAmE/t2aBm4Xo2XWLKDdwkKb+4GmrwOjImZS8sVU
         ge2pf8ILDEHbvC0J2IC/EqakFUbYSlp+kUkhVbJbgtQ5muIrejqlUBEaJNHTvQYy2KeX
         XZ341QCcNQ0plMqv/2tAVJ+81Uuhh42avM7EvXRfb1zNEI8bbl79qHc425cmXF9jhJDu
         9DdSE3HNssVK5CgwZY0TxWg594dy0oBPIcCGLXwGK5KR8cMOZIj1r0QxQ/Vzl7WotMrT
         vqOQ==
X-Gm-Message-State: AOAM533YqfuRn/cqGCxRcLdssulHM1sEhoSaNVLD2GTAfjpl5s2bOQvx
	Ncx0bLSUYU4mFt97ST4nIWDh/i6rxJ4=
X-Google-Smtp-Source: ABdhPJxSiQo2UByxd+g1/TDMHAnDtOdawWYHTLhe+QqHHP6+UrWGO8JRuJV+lF/A7flHPToyZQUN3g==
X-Received: by 2002:a17:90b:895:: with SMTP id bj21mr828883pjb.148.1592249756009;
        Mon, 15 Jun 2020 12:35:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.35.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:35:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/21] Patch review
Date: Mon, 15 Jun 2020 09:35:19 -1000
Message-Id: <cover.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Wednesday.

The following changes since commit 6fa967f194edd314c9026c80f8d93360ac6d9efa:

  build-appliance-image: Update to dunfell head revision (2020-06-08 21:45:09 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (3):
  lz4: disable static library
  linux-firmware: upgrade 20200421 -> 20200519
  build-sysroots: add sysroot paths with native binaries to PATH

Chen Qi (1):
  db: do not install db_verify if 'verify' is not enabled

Joe Slater (2):
  qemu: force build type to production
  vim: _FORTIFY_SOURCE=2 be gone

Konrad Weihmann (2):
  sysfsutils: rem leftover settings for libsysfs-dev
  cogl: point to correct HOMEPAGE

Marco Felsch (1):
  util-linux: alternatify rtcwake

Paul Barker (3):
  archiver: Fix test case for srpm archiver mode
  oe-selftest: Allow overriding the build directory used for tests
  oe-selftest: Recursively patch test case paths

Peter Kjellerstedt (1):
  cairo: Do not try to remove nonexistent directories

Ralph Siemsen (1):
  cve-check: include epoch in product version output

Richard Purdie (5):
  ltp: Exclude the memcg_stress tests due to timeout problems
  maintainers: Update Ross' email address
  logrotate: Drop obsolete setting/comment
  oeqa/targetcontrol: Rework exception handling to avoid warnings
  patchelf: Add patch to address corrupt shared library issue

Wang Mingyu (1):
  ca-certificates: upgrade 20190110 -> 20200601

hongxu (1):
  core-image-minimal-initramfs: keep restriction with
    initramfs-module-install

 meta/classes/cve-check.bbclass                |   2 +-
 meta/conf/distro/include/maintainers.inc      | 126 +++++++++---------
 meta/lib/oeqa/selftest/cases/archiver.py      |   1 +
 meta/lib/oeqa/selftest/context.py             |  24 +++-
 meta/lib/oeqa/targetcontrol.py                |   5 +-
 meta/lib/oeqa/utils/commands.py               |   5 +-
 .../images/core-image-minimal-initramfs.bb    |   4 +-
 meta/recipes-core/meta/build-sysroots.bb      |   4 +
 .../sysfsutils/sysfsutils_2.1.0.bb            |   2 -
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../patchelf/patchelf/fix-phdrs.patch         |  37 +++++
 .../patchelf/patchelf_0.10.bb                 |   1 +
 meta/recipes-devtools/qemu/qemu_4.2.0.bb      |   5 +
 .../logrotate/logrotate_3.15.1.bb             |   7 -
 meta/recipes-extended/ltp/ltp_20200120.bb     |   4 +
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   |   6 +-
 meta/recipes-graphics/cogl/cogl-1.0.inc       |   2 +-
 ...20200421.bb => linux-firmware_20200519.bb} |   5 +-
 ...0190110.bb => ca-certificates_20200601.bb} |   4 +-
 meta/recipes-support/db/db_5.3.28.bb          |   3 +
 meta/recipes-support/lz4/lz4_1.9.2.bb         |   2 +-
 meta/recipes-support/vim/vim_8.2.bb           |   5 +
 22 files changed, 162 insertions(+), 93 deletions(-)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200421.bb => linux-firmware_20200519.bb} (99%)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20190110.bb => ca-certificates_20200601.bb} (95%)

-- 
2.17.1

