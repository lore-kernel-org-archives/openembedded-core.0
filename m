Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.61405.1594051861724671734
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mCto931p;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.195, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f195.google.com with SMTP id w17so1056217ply.11
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=nnMM1vt0NJ/qyStToeDSLmTewoclkIyVVIUB4j7vhvA=;
        b=mCto931pnsAQu8xxSiTixsoMQNATZnQB1KuNeN+s5vdwMauEiDvLOZWI+V3LODFjVn
         Qd9gnUSoPywX/3gvMvp2Bx9QlYFLkwhI7OZ2ouHD0kcBWF2H3B8f/+loim5KTsMmJC7g
         F4d+G2PhB1kYhCJhwfury5TY/VzR6wHbhV7K6PR6R6hbM2mfebIy2law6V/3lvQ+5x5f
         +WTqUanp1XzfA2mkJhxBze1UcC+QpiXopobXe8fC7igU6Wv32pEWF+g2QQFlTNRNINOZ
         mydIrDzzFzPppdGp4/qpldBmc1xsZ8zX9yadvIXf5v4Qhfwk34Hp1bVEAnRTkqHRzJ+l
         jL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=nnMM1vt0NJ/qyStToeDSLmTewoclkIyVVIUB4j7vhvA=;
        b=tExFvVlu3OsYCjSU1PKsQvqBSDqjwRF64d8lMe5CZck1nKLk1WxQdVayDBr06SPvEY
         OFMZOGAjtLlWs/s6JWVzZ32DLdhIjC5l7To+KZSQYucccnOfIu+JTB4dI1nfH3yotVd5
         K4YvQKo0k41r8FXlVy3trGxec7AzhvF1PWkWmRuBljksZ5uyhWu8F41b+bk+QAtE0yyz
         KzboIMynQqEPtFV7zDEEKV80Dswmp2N/amS/0eHLWKLYRZM/Ms8VlxicdEZAbe1oYpUV
         ViXPWad/sh4iO/NCQEXGlTc5uT/vW7RtUeX8e94yULs7k3qehirt7sJs5jDTdLRKkSIh
         kbXA==
X-Gm-Message-State: AOAM532XBGJ38YxGUE0zI2c4Dc8rdmLRxoZF6xOs43a0XunGNMsW45qA
	JsdekmbQc+hJM3dbiHD6U2bRo6UCuJLEag==
X-Google-Smtp-Source: ABdhPJzjt3hpR0jJQ5xBAqqzNmAmdBdxGNrjRgruVo9UFY9hepHGbno/2Hk97eTqxLBSoZtmWDevsA==
X-Received: by 2002:a17:902:bb93:: with SMTP id m19mr41480573pls.137.1594051860483;
        Mon, 06 Jul 2020 09:11:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.10.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:10:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/25] Patch review
Date: Mon,  6 Jul 2020 06:10:02 -1000
Message-Id: <cover.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Wednesday.

Passed a-full build on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1119

The following changes since commit 2e128a775a3d51dc1856a35e2f5135d3c156d10e:

  u-boot: move redundant-yyloc-global patch to u-boot-common.inc (2020-06-29 05:17:44 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Armin Kuster (1):
  sqlite3: Security fix for CVE-2020-15358

Bruce Ashfield (6):
  kernel/yocto: ensure that defconfigs are processed first
  linux-yocto/5.4: update to v5.4.45
  linux-yocto-rt/5.4: update to rt25
  linux-yocto/5.4: update to v5.4.46
  linux-yocto/5.4: update to v5.4.47
  linux-yocto/5.4: update to v5.4.49 and -rt28

Changqing Li (4):
  modutils-initscripts: update postinst
  initscripts: update postinst
  gtk-icon-cache.bbclass: add runtime dependency
  logrotate.py: fix testimage occasionally failure

Chen Qi (2):
  oescripts.py: fix typo
  oescripts: ignore whitespaces when comparing lines

Jens Rehsack (1):
  u-boot: avoid blind merging all *.cfg

Joshua Watt (1):
  classes/archiver: run do_unpack_and_patch after do_preconfigure

Lee Chee Yang (3):
  oeqa/core/loader: refine regex to find module
  qemu: fix CVE-2020-10702/10761/13362/13659/13800
  python3: fix CVE-2020-14422

Ming Liu (1):
  u-boot: support merging .cfg files for UBOOT_CONFIG

Mingli Yu (1):
  python3-libarchive-c: add the missing rdepends

Richard Purdie (3):
  oeqa/selftest: recipetool/devtool: Avoid load_plugin test race
  oeqa/targetcontrol: Attempt to fix log closure warning message
  rootfs-postcommands: Improve/fix rootfs_check_host_user_contaminated

Ross Burton (1):
  common-licenses: fix filename of BSD-2-Clause-Patent

Wang Mingyu (1):
  libdrm: upgrade 2.4.100 -> 2.4.101

 meta/classes/archiver.bbclass                 |   4 +-
 meta/classes/gtk-icon-cache.bbclass           |  19 ++-
 meta/classes/kernel-yocto.bbclass             |  33 ++--
 meta/classes/rootfs-postcommands.bbclass      |  12 +-
 ...-Clause-Patent.txt => BSD-2-Clause-Patent} |   0
 meta/lib/oeqa/core/loader.py                  |   2 +-
 meta/lib/oeqa/runtime/cases/logrotate.py      |   4 -
 meta/lib/oeqa/selftest/cases/devtool.py       |   6 +-
 meta/lib/oeqa/selftest/cases/oescripts.py     |   4 +-
 meta/lib/oeqa/selftest/cases/recipetool.py    |   6 +-
 meta/lib/oeqa/targetcontrol.py                |   1 +
 meta/recipes-bsp/u-boot/u-boot.inc            |  25 ++-
 .../initscripts/initscripts_1.0.bb            |   2 +-
 .../python/python3-libarchive-c_2.9.bb        |   6 +-
 .../python/python3/CVE-2020-14422.patch       |  77 +++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   5 +
 .../qemu/qemu/CVE-2020-10702.patch            |  52 ++++++
 .../qemu/qemu/CVE-2020-10761.patch            | 150 ++++++++++++++++++
 .../qemu/qemu/CVE-2020-13362.patch            |  52 ++++++
 .../qemu/qemu/CVE-2020-13659.patch            |  55 +++++++
 .../qemu/qemu/CVE-2020-13800.patch            |  60 +++++++
 .../drm/libdrm/musl-ioctl.patch               |  35 ----
 .../{libdrm_2.4.100.bb => libdrm_2.4.101.bb}  |   7 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
 .../modutils-initscripts.bb                   |   2 +-
 .../sqlite/files/CVE-2020-15358.patch         |  47 ++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |   1 +
 30 files changed, 609 insertions(+), 95 deletions(-)
 rename meta/files/common-licenses/{BSD-2-Clause-Patent.txt => BSD-2-Clause-Patent} (100%)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-14422.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-10702.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-10761.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13362.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13659.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13800.patch
 delete mode 100644 meta/recipes-graphics/drm/libdrm/musl-ioctl.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.100.bb => libdrm_2.4.101.bb} (92%)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-15358.patch

-- 
2.17.1

