Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.7080.1614868166901831714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 06:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=w6gm/A/Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id d9so27360582ote.12
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 06:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fV9HmoqStMR/XVIiTIqdlRXcbTB4gecgyE23XKILIx4=;
        b=w6gm/A/YwlTP9JFBF7/ND/R0eRmRhxB7CbGF9P9nFXex7F3EaRD8orbALwe3t+4kxk
         Yvlupq7TPUvqEuicSr/7G45kmEWopimVlMGsNZbHtX2kQSfKud0bQXqTJwgbteXe994n
         4Sdra1cuvlVfaVjnUzRMaXXCgjmDq6KpPclNIrqX6fQnu1l+5jSn9551Nd1ak+RDtQos
         gUw5XsTp/R4Df158D6eXD9s38BK3GZd/gGLaTOQbAWp1aFp28CChxv80PkE7MHnYBpqE
         ZP6WS9oYVQCy/ZnroYYaUs7tqIsM/+nvu2aTud3ccH0xW9To5/NcENQwqFO1NYIaiCgc
         mu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fV9HmoqStMR/XVIiTIqdlRXcbTB4gecgyE23XKILIx4=;
        b=hbELkSCUN5/8Blx0kdqeTZSKdy1zaFykp2vxP5X+JqIaY+HoR7J0y+8jVcykbfFYEQ
         uXvkfXvQe0tB7HoWPypJXL0T79O/lwx3/ZmcJlEeAcQMjo8lXFfNa0/ViqFNnBUGJQrq
         Uo0DvBIn8GQo7XcNgCZmDCt4ApYAvI8d1mMNRml9bWYrsnMQnHPGRD4JM85oZSjuEU8E
         W/PyA3ON6tjqGQ60TB2JWH71qKH4IvgShC7DRDYDpyegbRXq+H3ytirxNbD3DZEqo1zo
         RSNi8tShFMvWWnIts6naYukX9n4i2NFJ3AUfELmxTi0PF9rVdXSJgrSwTKsEM1INzJnW
         qpzQ==
X-Gm-Message-State: AOAM533/dl0u9gm++bSiu+4QCEfV7gfcHjCm8+KYpqBlye55wrUGaBlt
	ozxe2if73kZazPToNX3GUoOYRbnADPNoFtiL
X-Google-Smtp-Source: ABdhPJyWDiqJ8KiIe28S7AMaXRUUN+0VB5BwuDmikFkCxP0xfclDfRVgpGuLocLQNIE1Zn8ARL7dpQ==
X-Received: by 2002:a9d:23a1:: with SMTP id t30mr3575726otb.65.1614868165657;
        Thu, 04 Mar 2021 06:29:25 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id v22sm5711252otj.57.2021.03.04.06.29.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 06:29:25 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/39] Pull request (cover letter only)
Date: Thu,  4 Mar 2021 04:28:57 -1000
Message-Id: <cover.1614867921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Resubmitting with connman version upgrades removed.

The following changes since commit a8debddd6cbdd70db74e096d72f97fbee008ee63:

  build-appliance-image: Update to dunfell head revision (2021-02-18 23:43:04 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

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

Richard Purdie (16):
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
  selftest/reproducible: Don't call sync between each file compare

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

akuster (1):
  cve-check.bbclass: add layer to cve log

 meta/classes/cve-check.bbclass                |   46 +-
 meta/classes/npm.bbclass                      |    2 +-
 meta/classes/package_rpm.bbclass              |    1 +
 meta/conf/local.conf.sample.extended          |   23 +-
 meta/lib/oe/recipeutils.py                    |    2 +-
 meta/lib/oeqa/runtime/cases/df.py             |    2 +
 meta/lib/oeqa/runtime/cases/runlevel.py       |   22 +
 meta/lib/oeqa/selftest/cases/reproducible.py  |    7 +-
 meta/lib/oeqa/utils/commands.py               |    4 +-
 .../u-boot/files/CVE-2020-10648-1.patch       |   98 ++
 .../u-boot/files/CVE-2020-10648-2.patch       |   52 +
 .../u-boot/files/CVE-2020-8432.patch          |  114 ++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |    3 +
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
 40 files changed, 549 insertions(+), 1197 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/runlevel.py
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-10648-1.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-10648-2.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-8432.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/0001-Fix-includes-when-building-with-musl.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb} (89%)
 create mode 100644 meta/recipes-support/icu/icu/0002-ICU-21175-Add-cnvalias-as-a-dependency-of-misc_res.patch
 create mode 100644 meta/recipes-support/vim/files/racefix.patch

-- 
2.25.1

