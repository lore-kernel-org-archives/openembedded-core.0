Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.878.1594159846492588733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 15:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=k+lq3y1Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id l63so20627440pge.12
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2020 15:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=BfLha4ygBDAgr6+fP9HfonX5ZQ8Wopb8n1nYTvCZ29U=;
        b=k+lq3y1ZdlVEK7+ws4AB0XQqciPEFGxD8s3WEbB6k+tOnlxbqeDfzwk4zizDQNsCNf
         v3FyZwzfpnGV0YizZiPnT3AVFiSrV5iPl7MqmZuyDm2hw6P2ITEOIk87qSOTs7Yo6/gL
         SjfYtgoePvVjAISxNGfeWcir9nk2eczldhdRXKObBG09QPqzjmBVsY2uYpOXkSElvVig
         yyzoilavIzioJ7J/8AhduJriFDSSwdRX3xVldcr1gIKQPo5ZQ3qnH5jNlpC9/tv1WXlY
         wbA3x7B3DOKMv59r8xeRupjfa288vBTk8UZf9RWhuKg/F7YY3O9n/L8uUCsqGC5+KESK
         EDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=BfLha4ygBDAgr6+fP9HfonX5ZQ8Wopb8n1nYTvCZ29U=;
        b=bGid+X203scztxL9eS8zHD3iekJQm6ip9OOAmxQD4fL+9VSUiAMPEmXXvyR4exsrU/
         0oIwyg0/VGUISWbd4rT9Zw944XciBZw/Py/NP1pJH+0H7ohfkwjLMqwHOsNGUtvc+JA0
         sISilf4dclE1zzbCx4+1eaq5QyWYEB03ruW2ghLKAS0ZlE5/KC2eNdpGDK/jyANR6glQ
         FnS+6VHiJ21mFoKL/cSeRH3WaLmQRPrAiOT100JtU3UNBbOy88z5YgZW5RUFcdL/9Vgf
         K5nN6QCeIfV9ziPCOrxvXKcNSInz/X5XPLG2mX+frBr5l+jhsxRwUngEr9RU0n37T9P4
         92gA==
X-Gm-Message-State: AOAM532VwdbM3VRKtZjOo/6KcqKSvfpmxHFLALXNl48QAC3sRh5YW6dQ
	nqBbxQ1qyHdQj9XmYVN04CmbV7ni/xN+IA==
X-Google-Smtp-Source: ABdhPJxhaprsV5RzJQckdOjjNRucVbpODHcrNXRM37Xsz6SAXMov8UJ5eaWo9kYTgWirMP+QEwcvcw==
X-Received: by 2002:a65:4149:: with SMTP id x9mr48183964pgp.424.1594159845133;
        Tue, 07 Jul 2020 15:10:45 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b14sm22713914pfo.28.2020.07.07.15.10.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 15:10:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/24] Pull request (cover letter only)
Date: Tue,  7 Jul 2020 12:10:34 -1000
Message-Id: <cover.1594159659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Speeding up the process a bit since we have two patches in this set
which are causing build issues for people:

iso-codes: switch upstream branch master -> main
libdrm: upgrade 2.4.100 -> 2.4.101

The following changes since commit 2e128a775a3d51dc1856a35e2f5135d3c156d10e:

  u-boot: move redundant-yyloc-global patch to u-boot-common.inc (2020-06-29 05:17:44 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Armin Kuster (1):
  sqlite3: Security fix for CVE-2020-15358

Bruce Ashfield (5):
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

Hongxu Jia (1):
  iso-codes: switch upstream branch master -> main

Jens Rehsack (1):
  u-boot: avoid blind merging all *.cfg

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

 meta/classes/gtk-icon-cache.bbclass           |  19 ++-
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
 .../iso-codes/iso-codes_4.4.bb                |   2 +-
 .../sqlite/files/CVE-2020-15358.patch         |  47 ++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |   1 +
 29 files changed, 587 insertions(+), 82 deletions(-)
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

