Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.35399.1607956626300051272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=D0+kNcJ9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id h186so1690990pfe.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=bh0hC2dVI824Tv5kMc4wyF7f4Xb5/JSbEdJ9ydlJtwU=;
        b=D0+kNcJ9cBF0ZIrk++F5bzizjtL2t/8T9+qzylrNpX1y48hib1P1c1iALSoQmVKRpb
         LS0A0Y87SDAD4L7x5xkT5O8PMyU525MThGRUG/HFzbty+aAicLjUDQBdvCl7igAOzKiO
         dBGPB71HqAxeBOWo8kyk33ucb7z44MChUaXycxUrC4Q8UNbYyuf1fyJicW2uC79ZiSA8
         60I7Vj/9v5+i+Y0ULCDWa+vCEqA873UnPwErcJpwzVg8HY/V1KPiU0PavwKciOTeHbeh
         YB4b1qCQUswaxTi3+7PbEzgXbdg33KV4p16REtaGnjX5twlyrdg8S17l+gYmiPcKAGT6
         wyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=bh0hC2dVI824Tv5kMc4wyF7f4Xb5/JSbEdJ9ydlJtwU=;
        b=MLiHLfN/c/SeFe+zWk1q9CMQnI3fCrKlZra54+UyvCQ/VujDBmXFUlvEsEkNYUOeDQ
         79xJl9PPqjbPKMfGohH3LKoh1mhLUFDEMbojVg48qPzzYDPnFs56SAPJ4tC8N6UmAVtK
         eW7ELhTUKbT9g33YIAaTUYiy33Wlc10vlf2LEYGSDUAGkORGrp2bIX+enq2vmx030TIQ
         iLMItV3YGXVVZZF/VVXAF89ZQvx5HLoeOCIRo9XmOHbfUSi9WZpwOTJuoiUJaIFTTMKW
         ojQWnjRDuvo3gwvyV1BxWRYl8wassuc1kxWzpcGmubhiIoDHM5VafX5FkoV6ERhB3xOv
         JliA==
X-Gm-Message-State: AOAM5318IdHI9/DeSfmOk2/lu8mPRPrFm1DszIfOAUJ2Gk+xF5gw2SNH
	8Tf6pAmT6VTJkfEMzdAblcPPETDSYlrU6WJE
X-Google-Smtp-Source: ABdhPJzK/WDMgpq9Nj9zFyGiLmSX2DKVl+sz8/EftpbZcwh8cg7dJh5HnfoEittBS3ul5CysxtbJYQ==
X-Received: by 2002:a62:8683:0:b029:1a4:4f3f:7e75 with SMTP id x125-20020a6286830000b02901a44f3f7e75mr9087841pfd.68.1607956624945;
        Mon, 14 Dec 2020 06:37:04 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:03 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/25] Patch review
Date: Mon, 14 Dec 2020 04:36:29 -1000
Message-Id: <cover.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back by
end of day Wednesday.

Passed a-full on autobuiler:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1673

with exception of known intermittent issue with qemux86-64-ltp. Passed
on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/1443

The following changes since commit e216b2223cbe8c459348262f98b3cfbe79d12023:

  go: update to 1.14.12 (2020-12-03 07:35:27 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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
 .../meta/buildtools-extended-tarball.bb       |   3 +
 .../recipes-core/meta/cve-update-db-native.bb |   7 +-
 .../btrfs-tools/btrfs-tools_5.4.1.bb          |   2 +-
 .../dosfstools/dosfstools_4.1.bb              |   2 +-
 ...r-sort-ClassInfo-lists-by-name-as-we.patch |  31 ++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |   8 +-
 ...20-8492-Fix-AbstractBasicAuthHandler.patch |   0
 .../python/python3/CVE-2019-20907.patch       |  44 ++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
 ...e.in-do-not-write-host-cross-cc-item.patch |  32 ++++++
 meta/recipes-devtools/ruby/ruby_2.7.1.bb      |   1 +
 meta/recipes-extended/parted/parted_3.3.bb    |   2 +-
 .../libsdl2/libsdl2_2.0.12.bb                 |   2 +-
 ...20201022.bb => linux-firmware_20201118.bb} |  11 +-
 meta/recipes-kernel/linux/linux-dummy.bb      |   4 +-
 ....04.29.bb => wireless-regdb_2020.11.20.bb} |   2 +-
 ...e-assembly-with-full-path-from-sourc.patch |  97 ++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |   6 +
 meta/recipes-sato/webkit/webkitgtk_2.28.2.bb  |  12 ++
 .../bmap-tools/bmap-tools_3.5.bb              |   2 +-
 ...m-sysv-reverted-clang-VFP-mitigation.patch | 104 ++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.3.bb     |   1 +
 .../libsoup/libsoup-2.4_2.68.4.bb             |   2 +-
 meta/recipes-support/lz4/lz4_1.9.2.bb         |   2 +-
 meta/recipes-support/serf/serf_1.3.9.bb       |   5 +
 scripts/lib/devtool/standard.py               |   1 -
 34 files changed, 383 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
 rename meta/recipes-devtools/python/{files => python3}/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch (100%)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-20907.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201022.bb => linux-firmware_20201118.bb} (99%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2020.04.29.bb => wireless-regdb_2020.11.20.bb} (94%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
 create mode 100644 meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch

-- 
2.17.1

