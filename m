Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.2817.1593654088910792307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 18:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PLZuzRXx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id g67so11749230pgc.8
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 18:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=l40nCyN72Qky1Hu3PQcXDoScfaOeruAFqQTaS+JWvGU=;
        b=PLZuzRXxyT8c1IXwCmy7Xfv1uYAxyr7+JXg9V2ZIEooanaN2sinkz0p0HkXd7cy5JN
         yfLA4jI66BVscH8l4VSjNNZKULcKOvOgMpaki/Bm3Fo4aHA1WJuS2b1LJYfiLj//F8PX
         z/bd3nQF0jZwynN0F9rU4bieDQotYOmro8M+7PP7DFxne8ZUKaoAAFiC1ESCgSwU5N0y
         l7FyJU/KfekAgbQSKfWUdBPX3l7m0pUxM5LWl4s2F3DLeOwZ4QEdl1LUrMxxwnIo9Bsa
         E9sLMpQJJ3kVJ0PwuQVVXA2XQgSAjdVxVRBgN7xOJm0wEGExU1yGlspwSa1IaYQ6iBMm
         QyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=l40nCyN72Qky1Hu3PQcXDoScfaOeruAFqQTaS+JWvGU=;
        b=WhYbXkcPzEz5tv7m6Sw/ZhLUiZq36fOnBETwdgupuxc5N5tgDHH5diQNhCANtUsO7u
         QLB0rrOdpmCaoJKJetao9B6LTL7F2zeAmQZmJEd2oHOvxlgNX9C16kw4y0dXaET+iu/U
         Gk6kAHcZjWSc+UAC/uF9PlxCV9diAAxkO253fdXm5Tg4Q3wYxo6OIDcplIfJF/RWDSAp
         PLQtQY/oP232VzOeSdRl1wAGSeMTC+rjvwA77iW+xRlr512jI2P0v26FF0zt0G22QtCt
         SCRD8RG2UVakCjyLDFaU2mlEeO5iDXktUIDJMDFPm1iUJ0Dn4Ga/HfQHUj1d246RzO7c
         UqRQ==
X-Gm-Message-State: AOAM531fJfjfxl1PTV8RrO1eP4PNZ/BPHByQGs87G4mbfKXzh9KG8Ucv
	BKUojnQVXE734hjZ6WDAk71wF15bIy5naA==
X-Google-Smtp-Source: ABdhPJzGHiq4U/se0wTXX2w0HAKAEPBGDXOnEkhx+HLcHSo1n/VhzoUyIpRbQhJOc9eGtrT156Kg9A==
X-Received: by 2002:aa7:8141:: with SMTP id d1mr27599753pfn.209.1593654087595;
        Wed, 01 Jul 2020 18:41:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e16sm7067278pff.180.2020.07.01.18.41.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 18:41:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/22] Pull request (cover letter only)
Date: Wed,  1 Jul 2020 15:41:15 -1000
Message-Id: <cover.1593653993.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 1a98936830ba468d63e2e49d766add9e9cb75998:

  gstreamer1.0-plugins-bad: add support for vdpau (2020-06-23 04:33:47 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  linux-firmware: upgrade 20200519 -> 20200619

Andrej Valek (1):
  oeqa/runtime/cases/ptest: Make output content path absolute

Armin Kuster (2):
  curl: Security fixes for CVE-2020-{8169/8177}
  wpa-supplicant: Security fix CVE-2020-12695

Changqing Li (1):
  mime.bbclass: fix post install scriptlet error

Chen Qi (1):
  systemd-serialgetty: do not use BindsTo

Konrad Weihmann (2):
  runqemu: add QB_ROOTFS_EXTRA_OPT parameter
  testimage: enable ovmf support

Lee Chee Yang (2):
  dbus: fix CVE-2020-12049
  perl: fix CVE-2020-10543 & CVE-2020-10878

Lili Li (1):
  kernel.bbclass: Fix Module.symvers support

Ming Liu (1):
  u-boot: introduce UBOOT_INITIAL_ENV

Nicolas Dechesne (1):
  checklayer: parse LAYERDEPENDS with bb.utils.explode_dep_versions2()

Pierre-Jean Texier (1):
  ell: upgrade 0.31 -> 0.32

Richard Purdie (7):
  pseudo: Fix attr errors due to incorrect library resolution issues
  oeqa/selftest/runcmd: Add better debug for thread count mismatch
    failures
  oeqa/utils/command: Improve stdin handling in runCmd
  scripts/install-buildtools: Update to 3.2 M1 buildtools
  scripts/install-buildtools: Handle new format checksum files
  oeqa/selftest: Clean up separate builddir in success case when
    non-threaded
  populate_sdk_ext: Fix to use python3, not python

Steve Sakoman (1):
  u-boot: move redundant-yyloc-global patch to u-boot-common.inc

 meta/classes/kernel.bbclass                   |   2 +-
 meta/classes/mime.bbclass                     |  13 +-
 meta/classes/populate_sdk_ext.bbclass         |   2 +-
 meta/classes/qemuboot.bbclass                 |   5 +
 meta/classes/testimage.bbclass                |   6 +-
 meta/lib/oeqa/core/target/qemu.py             |   6 +-
 meta/lib/oeqa/core/utils/concurrencytest.py   |  23 +--
 meta/lib/oeqa/runtime/cases/ptest.py          |   4 +
 meta/lib/oeqa/selftest/cases/runcmd.py        |   9 +-
 meta/lib/oeqa/selftest/context.py             |  36 ++++-
 meta/lib/oeqa/utils/commands.py               |   4 +-
 meta/lib/oeqa/utils/qemurunner.py             |   5 +-
 .../remove-redundant-yyloc-global.patch       |   0
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   1 +
 .../u-boot/u-boot-tools_2020.01.bb            |   2 -
 meta/recipes-bsp/u-boot/u-boot.inc            |  55 ++++---
 ...allow-event-subscriptions-with-URLs-.patch | 151 +++++++++++++++++
 ...nt-message-generation-using-a-long-U.patch |  62 +++++++
 ...HTTP-initiation-failures-for-events-.patch |  50 ++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |   5 +-
 .../dbus/dbus/CVE-2020-12049.patch            |  78 +++++++++
 meta/recipes-core/dbus/dbus_1.12.16.bb        |   1 +
 .../ell/{ell_0.31.bb => ell_0.32.bb}          |   3 +-
 .../systemd-serialgetty/serial-getty@.service |   3 +-
 .../perl/files/CVE-2020-10543.patch           |  36 +++++
 .../perl/files/CVE-2020-10878_1.patch         | 152 ++++++++++++++++++
 .../perl/files/CVE-2020-10878_2.patch         |  36 +++++
 meta/recipes-devtools/perl/perl_5.30.1.bb     |   3 +
 .../pseudo/files/xattr_version.patch          |  54 +++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
 ...20200519.bb => linux-firmware_20200619.bb} |   4 +-
 .../curl/curl/CVE-2020-8169.patch             | 140 ++++++++++++++++
 .../curl/curl/CVE-2020-8177.patch             |  67 ++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
 scripts/install-buildtools                    |  10 +-
 scripts/lib/checklayer/__init__.py            |   7 +-
 scripts/runqemu                               |  11 +-
 37 files changed, 979 insertions(+), 70 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools => files}/remove-redundant-yyloc-global.patch (100%)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2020-12049.patch
 rename meta/recipes-core/ell/{ell_0.31.bb => ell_0.32.bb} (83%)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10543.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10878_1.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10878_2.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/xattr_version.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200519.bb => linux-firmware_20200619.bb} (99%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8169.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8177.patch

-- 
2.17.1

