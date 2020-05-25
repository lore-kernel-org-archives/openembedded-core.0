Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.40968.1590446236795828282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ATzqVeu6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.67, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f67.google.com with SMTP id q9so408171pjm.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Objv/IU//4MpKSpxjp5rOb8Hsv0FyIhVbFkkuD3RqHA=;
        b=ATzqVeu65MGLx7m/XL1Os55fUt16pG5LmLt9maSrUk1S7NlbhzNcUoNUwpg8KAxvra
         8hHBO7P/3/2QYGSUyiwv+Cz0Nf+jkQkvkhKVNP03rUwn+D8y6CQ4QQ8rfG/vPDsmiAYC
         6oTyowBQJJRfiVOXPGCJXPdDq540x9fIpd4uklTwjMjHT2J5bOtu6VR4XQKYSXS03lz9
         cT53ziIowdz6YaW9OWYZQrraIG1TIBOC2XSUpXcIaaDvPefphHZMzcKjK0H0RBsGfZLs
         m8z9avm9ZXzLzkTcPFxkvncr64sCPcnSs23+FAHpMYXMQ6NKwNYu2yKJlBz/U1vMq9ld
         Yuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Objv/IU//4MpKSpxjp5rOb8Hsv0FyIhVbFkkuD3RqHA=;
        b=W8KCmXkfHw3CpN4aDxXWS5RBKwR6GzTRx5MYQczaLpg3nJwz0U756pv1AdUe5K07Y1
         H2oGlqvu38qmbUma49AYO3H92q1rNEyi++6MMTHnAkF0uFtbgJz/6R7ERLmu4yVAAm5R
         O7+xXhCtMci6WhbqzouuuIr+Gzchfgq4rVH05ObZiX7CTe20cG0v1Nx7VMUNoXw0Em4B
         7BN2qUnvw+3tVdnREDY/44sVZr75RCQZ+yp9XXjar7T5p3EmIjaQXJh7An5eEjXaAaMU
         SGn/ocTCEVTyXKfH5ET/4QUHeDI2471+8Is0A+dVdArfc8hzPLhHJl4ihexbGN8W2a47
         8Utg==
X-Gm-Message-State: AOAM5327bHCfm3zn6YxxJ6Iobdc2dY/eajy777djmsKRFm4Qr2+Cr5gm
	IFx2FVqDvpbyhva8vE+q9pW/o9uvx7c=
X-Google-Smtp-Source: ABdhPJx/mv3TDuZaaqTRroFs5+RMJBlqegpcfjM4EwiVBgJff/7tTF9Iyt2YRf0l3kevYaLvgff/4w==
X-Received: by 2002:a17:90a:23a4:: with SMTP id g33mr22269238pje.79.1590446235673;
        Mon, 25 May 2020 15:37:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/17] Patch review
Date: Mon, 25 May 2020 12:36:46 -1000
Message-Id: <cover.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back
by end of day Wednesday.

The following changes since commit 5bfdb6bfbd6f1de10d415228e5a5ebe01a623e2a:

  file: add PACKAGECONFIG for auto options (2020-05-14 06:33:16 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Adrian Bunk (2):
  git: Upgrade 2.24.1 -> 2.24.3
  wireless-regdb: Upgrade 2019.06.03 -> 2020.04.29

Alejandro Hernandez (1):
  newlib: Upgrade to latest yearly release 3.3.0

Alexander Kanavin (1):
  testresults.json: add duration of the tests as well

Aníbal Limón (3):
  recipes-kernel/linux-firmware: Add wlanmdsp.mbn to qcom-modem package
  recipes-kernel/linux-firmware: Add adreno-a630 firmware package
  linux-firmware: Update to 20200122 -> 20200421

Jan-Simon Moeller (1):
  file: add bzip2-replacement-native to DEPENDS to fix sstate issue

Kai Kang (1):
  gcr: depends on gnupg-native

Lee Chee Yang (1):
  qemu: fix CVE-2020-11869

Marek Vasut (1):
  libubootenv: Depend on zlib

Mingli Yu (2):
  bison: fix the parallel build
  python3-setuptools: add the missing rdepends

Paul Barker (2):
  archiver.bbclass: Make do_deploy_archives a recursive dependency
  avahi: Don't advertise example services by default

Quentin Schulz (1):
  base/insane: Check pkgs lics are subset of recipe lics only once

zhengruoqin (1):
  make-mod-scripts: Fix dependence error.

 meta/classes/archiver.bbclass                 |  4 +-
 meta/classes/base.bbclass                     | 13 ---
 meta/classes/insane.bbclass                   | 21 +++-
 meta/lib/oeqa/core/runner.py                  |  6 +-
 meta/recipes-bsp/u-boot/libubootenv_0.2.bb    |  2 +-
 meta/recipes-connectivity/avahi/avahi.inc     |  5 +
 .../{libgloss_3.2.0.bb => libgloss_3.3.0.bb}  |  0
 meta/recipes-core/newlib/newlib.inc           |  3 +-
 .../{newlib_3.2.0.bb => newlib_3.3.0.bb}      |  0
 .../0001-bison-fix-the-parallel-build.patch   | 63 ++++++++++++
 meta/recipes-devtools/bison/bison_3.5.3.bb    |  1 +
 meta/recipes-devtools/file/file_5.38.bb       |  2 +-
 meta/recipes-devtools/git/git_2.24.1.bb       | 11 ---
 meta/recipes-devtools/git/git_2.24.3.bb       |  9 ++
 .../python/python-setuptools.inc              |  2 +
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-11869.patch            | 97 +++++++++++++++++++
 meta/recipes-gnome/gcr/gcr_3.34.0.bb          |  2 +-
 ...20200122.bb => linux-firmware_20200421.bb} | 12 ++-
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |  2 +
 ....06.03.bb => wireless-regdb_2020.04.29.bb} |  3 +-
 21 files changed, 220 insertions(+), 39 deletions(-)
 rename meta/recipes-core/newlib/{libgloss_3.2.0.bb => libgloss_3.3.0.bb} (100%)
 rename meta/recipes-core/newlib/{newlib_3.2.0.bb => newlib_3.3.0.bb} (100%)
 create mode 100644 meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
 delete mode 100644 meta/recipes-devtools/git/git_2.24.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.24.3.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200122.bb => linux-firmware_20200421.bb} (98%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2019.06.03.bb => wireless-regdb_2020.04.29.bb} (91%)

-- 
2.17.1

