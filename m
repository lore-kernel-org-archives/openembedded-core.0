Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.9951.1614349489799596980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:24:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qZXgO0cK;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.43, mailfrom: steve@sakoman.com)
Received: by mail-io1-f43.google.com with SMTP id 81so6117173iou.11
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5RnL431yNjUTyNfNJEOG30O9gJFtMh+BV2j3xA3rqC0=;
        b=qZXgO0cKgVdbqbMS9ZF9PxCCQGuUyauM1L9Fj+xC03fVPj6qsh7WuMsMMjK+Fx2YUj
         cAlb2ShH1GsotTxc1oAW8TRJ1NvfFz/fa+1q+9RcZghY6giNIZ2YLljld/9Jh1xvvapn
         g8V6oujZTcZOxVWFVjHSIfsY/qSVEoKwfBLdmfbJ7yaHcmJ5bciNMGjTqdF7RNtqFtjv
         XZrp/bB6jz4ybpASYqYLtCOuPJm78YF3nthTAcrn4jcl+MMSp30t0JhzyA6jHOkXErqP
         NPAO8SqhHrfCOHWgzmMEmJ7ODB34b4xGlpVYBLpuh/IjpqoQ6P6dg0snXaNMNOHKewNs
         eopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5RnL431yNjUTyNfNJEOG30O9gJFtMh+BV2j3xA3rqC0=;
        b=crxUARDib9wA6ChagDYJmjBWxEz3NVVqkSNpNeOW0/XbxIIHW//31OgtUrdi8nR5O2
         Bqy907zBDH/KR54PcsK6PPDU8az5Pw6HBsDp0u98tBYJ/VjaZ5mF1QWSufslK56X+PC/
         tVvbqQf8ljIpGKcOkrSXYtooxt/FAIseuoxhUGCZQmVuuMG93TDe+m55JzjFhDRRnAfm
         u3W0JJJJbPRVTCfvhp2nt/MQtEy0Cr5CiVAsNYLdHwhVKwo1wH855PXgtBOeqa5suqN2
         0X3GZUb7YNx71yq8nKspsO8myrbo9uQMTnMxflZ//bPd+Dz3Ednh56xGreGJQmeX23h0
         +fBA==
X-Gm-Message-State: AOAM533qANzjS/5DzeB8HrXZy57kvrOAqXrb2MMjgGid8ilhHM/nupyF
	05Vc3zT4QAEekHWpxmGrxCqNJfmsRp/9uEQX
X-Google-Smtp-Source: ABdhPJyeK7zn+d7ftIGjxHBmO87XQA1tjwoDeb4vHg8VLTP7esJx1FLYn2mSIrEqYhzgBc22lgKWrg==
X-Received: by 2002:a05:6602:14c6:: with SMTP id b6mr3055394iow.104.1614349488465;
        Fri, 26 Feb 2021 06:24:48 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.24.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:24:47 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/40] Patch review
Date: Fri, 26 Feb 2021 04:23:43 -1000
Message-Id: <cover.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1903

with the exception of two known autobuilder intermittent issues which passed
on subsequent retest.

The following changes since commit a8debddd6cbdd70db74e096d72f97fbee008ee63:

  build-appliance-image: Update to dunfell head revision (2021-02-18 23:43:04 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  connman: update to 1.38

Andrei Gherzan (2):
  oe/recipeutils: Fix copying patches when BBLAYERS entries are not
    normalised
  qemu: Backport patch to avoid assertion fails on icache line size

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.96
  linux-yocto/5.4: update to v5.4.98

Chris Laplante (2):
  cve-check: introduce CVE_CHECK_RECIPE_FILE variable to allow changing
    of per-recipe check file
  cve-check: add CVE_CHECK_REPORT_PATCHED variable to suppress reporting
    of patched CVEs

Jan-Simon Möller (1):
  package_rpm: Enable use_source_date_epoch_as_buildtime in package_rpm
    class

Joshua Watt (3):
  oeqa: reproducible: Fix SSTATE_MIRRORS variable
  oeqa: reproducible: Add more logging
  libomxil: Fix up commercial license flag

Lee Chee Yang (2):
  sudo: 1.8.31 -> 1.8.32
  go: update to 1.14.15

Marek Vasut (1):
  weston-init: Fix weston-keyboard path in weston.ini

Martin Jansa (1):
  icu: backport fix for rare random genrb segmentation fault

Richard Purdie (15):
  pseudo: Update to work with glibc 2.33
  pseudo: Update for rename and faccessat fixes
  pseudo: Update to include fixes for glibc 2.33
  quilt: Be determnistic about column presence
  buildtools-extended-tarball: Add glibc-gconvs needed for build
  cwautomacros: Ensure version is set deterministically
  vim: Improve determinism
  vim: Fix a race over creation of the desktop files
  watchdog: Fix determinism issue from sendmail host path
  watchdog: Avoid reproducibility failures after fixing build
  xorg-fonts-minimal: Fix reproducibility
  xorg-minimal-fonts: Really fix determinism
  xmlto: Fix reproducibility
  groff: Fix determinism issue
  oeqa/commands: Fix compatibility with python 3.9

Scott Murray (1):
  u-boot: fix CVE-2020-8432 and CVE-2020-10648

Teoh Jay Shen (1):
  oeqa/runlevel : add test for runlevels

Thomas Viehweger (1):
  mtd-utils: Remove duplicate assignments to alternative link names

Vivien Didelot (2):
  local.conf.sample.extended: fix double 'of' typo
  local.conf.sample.extended: prefer INIT_MANAGER

Wes Lindauer (1):
  df.py: Add feature check for read-only-rootfs

Yoann Congal (1):
  npm.bbclass: avoid building target nodejs for native npm recipes

Zbigniew Bodek (1):
  wpebackend-fdo: Fix missing .so symlink when using dev package

akuster (2):
  cve-check.bbclass: add layer to cve log
  connman: update to 1.39

 meta/classes/cve-check.bbclass                |   46 +-
 meta/classes/npm.bbclass                      |    2 +-
 meta/classes/package_rpm.bbclass              |    1 +
 meta/conf/local.conf.sample.extended          |   23 +-
 meta/lib/oe/recipeutils.py                    |    2 +-
 meta/lib/oeqa/runtime/cases/df.py             |    2 +
 meta/lib/oeqa/runtime/cases/runlevel.py       |   22 +
 meta/lib/oeqa/selftest/cases/reproducible.py  |    5 +-
 meta/lib/oeqa/utils/commands.py               |    4 +-
 .../u-boot/files/CVE-2020-10648-1.patch       |   98 ++
 .../u-boot/files/CVE-2020-10648-2.patch       |   52 +
 .../u-boot/files/CVE-2020-8432.patch          |  114 ++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |    3 +
 meta/recipes-connectivity/connman/connman.inc |    1 +
 ...-gweb-fix-segfault-with-musl-v1.1.21.patch |   34 -
 ...ve-musl-does-not-implement-res_ninit.patch |   20 +-
 .../connman/connman_1.37.bb                   |   17 -
 .../connman/connman_1.39.bb                   |   15 +
 .../meta/buildtools-extended-tarball.bb       |   10 +
 meta/recipes-devtools/go/go-1.14.inc          |    5 +-
 ...t-CGO_LDFLAGS-to-appear-in-go-ldflag.patch |   98 --
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |    2 -
 meta/recipes-devtools/pseudo/pseudo_git.bb    |    2 +-
 meta/recipes-devtools/qemu/qemu.inc           |    1 +
 ...fix-crash-when-compiling-with-uClibc.patch |   48 +
 meta/recipes-devtools/quilt/quilt.inc         |    2 +-
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |    2 +-
 .../cwautomacros/cwautomacros_20110201.bb     |    2 +-
 .../groff/files/0001-Include-config.h.patch   | 1026 +----------------
 meta/recipes-extended/groff/groff_1.22.4.bb   |   11 +
 meta/recipes-extended/sudo/sudo.inc           |    2 +-
 ...Fix-includes-when-building-with-musl.patch |   29 +
 .../sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb}   |    5 +-
 .../watchdog/watchdog_5.15.bb                 |    6 +
 .../wayland/weston-init/weston.ini            |    2 +-
 .../xorg-font/xorg-minimal-fonts.bb           |    8 +-
 .../linux/linux-yocto-rt_5.4.bb               |    6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |    8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   22 +-
 .../libomxil/libomxil_0.9.3.bb                |    6 +-
 .../webkit/wpebackend-fdo_1.4.1.bb            |    3 +
 ...cnvalias-as-a-dependency-of-misc_res.patch |   24 +
 meta/recipes-support/icu/icu_66.1.bb          |    4 +-
 meta/recipes-support/vim/files/racefix.patch  |   33 +
 meta/recipes-support/vim/vim.inc              |    3 +
 45 files changed, 573 insertions(+), 1258 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/runlevel.py
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-10648-1.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-10648-2.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-8432.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman_1.37.bb
 create mode 100644 meta/recipes-connectivity/connman/connman_1.39.bb
 delete mode 100644 meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/0001-Fix-includes-when-building-with-musl.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb} (89%)
 create mode 100644 meta/recipes-support/icu/icu/0002-ICU-21175-Add-cnvalias-as-a-dependency-of-misc_res.patch
 create mode 100644 meta/recipes-support/vim/files/racefix.patch

-- 
2.25.1

