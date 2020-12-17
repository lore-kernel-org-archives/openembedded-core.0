Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.2789.1608175463466096814
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 19:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ArW0YBTf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id 4so14364689plk.5
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Dec 2020 19:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=vRVAP5HmM6HVxPM/ZXYlxLtHj7OEfQGPqFDhqkOOAFs=;
        b=ArW0YBTfMNcBI0YgWT+4NW3z7YmMEjVxwwT/N+vLmk/V/KXVRvx0g0qmgN6LTU+t+N
         ooi+HVUgUh4QI0GAtCBtT4td7QXR3hHdowzzaWdGvUFfqITmqBrCoII9kMxOb5tIhflQ
         vWDTHC0PwzbUy1gT3WYES89flrDfKXAS7OxB/20T72rZEUrEpLncMKxyLOqvqCH3Rird
         Ssvj975tPtQDCQNPsWXK1qpcqofPJ7fQJ2Cv0ebdaK7CeF3LKnlw1dl6Q+X7zBeFBw4k
         QHh3foICsBubzRuiYhFk8rNX37njKaGx+Ofy8iNjIsIDHqVxAAx9jf9zhZcAVt88VIYY
         7cWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=vRVAP5HmM6HVxPM/ZXYlxLtHj7OEfQGPqFDhqkOOAFs=;
        b=WlrxNusMbObAMMoKF8Y0PxDmq2DLu1ZelU0ZW8rXmvAHTHoOZ9tK/S5cyqjUP4U4qM
         mA18qSnn/1IzTSkSiWUwagFkiwmBS0gHLBv/SSS/hX81XIM6vy7ch1RIxQnqWql1qnLw
         teo6QJXSNejhrPNVfBKwgxWljqtNG2m/m55ZnWY+7ZOVGVyZ1uVSl/oQ2BHM0ola4kBO
         GZ/4QAJgl1dw3koVE9xVIhcdzRZ9J6g/6BbLdPFWFoiexB9M/h4k7cW3P2Nj1R+qra03
         viU/eNjbedpRQvM1R6GgcYpC0qaCrzngzb67BaIPc935bAobek5uZ0NE3rLQb377s9Ce
         Wykg==
X-Gm-Message-State: AOAM532l9eh3auQZvJFvTNTyv2sC7AqAZwhMTHEm8ngWIf8Q3kHANhhG
	5v4z6pRQw8SG8B0SbS0NXOVdx1mM4b7oJ/Fp
X-Google-Smtp-Source: ABdhPJy0ccAv0Lk8JQLOD13lqN5xm+WEnBadwZrfLViXT1KU8UNoKtvSuEyUYi2QJuS9X1tpIMuwZw==
X-Received: by 2002:a17:90b:33d1:: with SMTP id lk17mr6060894pjb.174.1608175462183;
        Wed, 16 Dec 2020 19:24:22 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id m77sm3666144pfd.105.2020.12.16.19.24.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 19:24:20 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/28] Pull request (cover letter only)
Date: Wed, 16 Dec 2020 17:24:07 -1000
Message-Id: <cover.1608175306.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1


The following changes since commit e216b2223cbe8c459348262f98b3cfbe79d12023:

  go: update to 1.14.12 (2020-12-03 07:35:27 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (7):
  meta/lib/oe/reproducible.py: gitsm:// works just as fine as git:// for
    timestamps
  llvm: fix reproducibility
  ruby: fix reproducibility
  webkitgtk: fix reproducibility
  ffmpeg: fix reproducibility
  serf: do not install the static library
  llvm: sort the lists in generated source reproducibibly

Andrej Valek (2):
  kernel-dummy: fix executing unexpected tasks
  python3: fix CVE-2019-20907

Brett Warren (1):
  libffi: add patch to revert clang VFP workaround

Changqing Li (1):
  buildtools-tarball: add wic dependency into extended buildtools

Dmitry Baryshkov (2):
  linux-firmware: upgrade 20201022 -> 20201118
  linux-firmware: package ath11k firmware

Gratian Crisan (1):
  kernel-module-split.bbclass: fix kernel modules getting marked as
    CONFFILES

Hongxu Jia (1):
  glib-networking/btrfs-tools/dosfstools/parted/bmap-tools/libsoup-2.4:
    add nativesdk support

Lee Chee Yang (3):
  glibc: fix CVE-2020-29562
  qemu: fix CVE-2020-25723
  binutils: fix CVE-2020-16592/16598

Mark Jonas (1):
  libsdl2: Add directfb to PACKAGECONFIG rdepends

Richard Purdie (2):
  lz4: Use the new branch naming from upstream
  metadata_scm: Fix signature handling of METADATA_REVISION and
    METADATA_BRANCH

Ross Burton (5):
  oeqa/devtool: use Yocto mirror for pv-1.5.3 tarball
  devtool: remove unused variable
  image_types: sort tarball file listings
  cve-update-db-native: handle all-wildcard versions
  coreutils: add SUSE-specific issues to CVE whitelist

sangeeta jain (1):
  meta/lib/oeqa/manual/oe-core.json: Update test_bitbake_devshell

zangrc (1):
  wireless-regdb: upgrade 2020.04.29 -> 2020.11.20

 meta/classes/image_types.bbclass              |   2 +-
 meta/classes/kernel-module-split.bbclass      |   5 +-
 meta/classes/metadata_scm.bbclass             |   2 +
 meta/lib/oe/reproducible.py                   |   2 +-
 meta/lib/oeqa/manual/oe-core.json             |   2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   2 +-
 meta/recipes-core/coreutils/coreutils_8.31.bb |   3 +
 .../glib-networking/glib-networking_2.62.4.bb |   2 +-
 .../glibc/glibc/CVE-2020-29562.patch          | 156 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |   1 +
 .../meta/buildtools-extended-tarball.bb       |   3 +
 .../recipes-core/meta/cve-update-db-native.bb |   7 +-
 .../binutils/binutils-2.34.inc                |   2 +
 .../binutils/binutils/CVE-2020-16592.patch    |  61 +++++++
 .../binutils/binutils/CVE-2020-16598.patch    |  32 ++++
 .../btrfs-tools/btrfs-tools_5.4.1.bb          |   2 +-
 .../dosfstools/dosfstools_4.1.bb              |   2 +-
 ...r-sort-ClassInfo-lists-by-name-as-we.patch |  31 ++++
 meta/recipes-devtools/llvm/llvm_git.bb        |   8 +-
 ...20-8492-Fix-AbstractBasicAuthHandler.patch |   0
 .../python/python3/CVE-2019-20907.patch       |  44 +++++
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-25723.patch            |  52 ++++++
 ...e.in-do-not-write-host-cross-cc-item.patch |  32 ++++
 meta/recipes-devtools/ruby/ruby_2.7.1.bb      |   1 +
 meta/recipes-extended/parted/parted_3.3.bb    |   2 +-
 .../libsdl2/libsdl2_2.0.12.bb                 |   2 +-
 ...20201022.bb => linux-firmware_20201118.bb} |  11 +-
 meta/recipes-kernel/linux/linux-dummy.bb      |   4 +-
 ....04.29.bb => wireless-regdb_2020.11.20.bb} |   2 +-
 ...e-assembly-with-full-path-from-sourc.patch |  97 +++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |   6 +
 meta/recipes-sato/webkit/webkitgtk_2.28.2.bb  |  12 ++
 .../bmap-tools/bmap-tools_3.5.bb              |   2 +-
 ...m-sysv-reverted-clang-VFP-mitigation.patch | 104 ++++++++++++
 meta/recipes-support/libffi/libffi_3.3.bb     |   1 +
 .../libsoup/libsoup-2.4_2.68.4.bb             |   2 +-
 meta/recipes-support/lz4/lz4_1.9.2.bb         |   2 +-
 meta/recipes-support/serf/serf_1.3.9.bb       |   5 +
 scripts/lib/devtool/standard.py               |   1 -
 41 files changed, 688 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-16592.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-16598.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
 rename meta/recipes-devtools/python/{files => python3}/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch (100%)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-20907.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201022.bb => linux-firmware_20201118.bb} (99%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2020.04.29.bb => wireless-regdb_2020.11.20.bb} (94%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
 create mode 100644 meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch

-- 
2.17.1

