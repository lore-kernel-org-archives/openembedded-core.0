Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.193.1610113684317868060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 05:48:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ozkKbEuH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id f14so3660007pju.4
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Jan 2021 05:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7O9YYKAfXsayET7lVUFmYzOB0dXUYw+oiytrn4OBb0s=;
        b=ozkKbEuH6VW/57QeUXkrqp1kTf7igj/41TB/XlmAzRZvvAaEWBBKokGiX5oKiJGxI7
         0kSHHLBtQUaVp7j6hrJjf45z7cFL5WZwsIGTqyuXHUFQBjpLh2X2i08Er5AB1WsOdLbW
         VwskRZR2cJnA6DIl+hruS1+LBSIlQTyQt/6X189k4JabkQGi405shRdFiyUoaWalsIUe
         Vcl0NGccjGBtSmwL0U+o36/3r+o0uETpOUhBxdFukL88N/wKIV7/41WRVd2C6WCz1Eoy
         d3wfDaEfSigSAHT/ooHEVO2oAkJoYUrs4Ki8j3ZmX5hjgnrSsLkzYepfmVN5q6XCzcpN
         risg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7O9YYKAfXsayET7lVUFmYzOB0dXUYw+oiytrn4OBb0s=;
        b=QnPOl2kggcIfsalzNMcJF82G0/eVSHXDoj5n6s79Aad7z4x3VIZBH2wYHjpo4wykeH
         r/5OBN/xuDB/VKeKCAbDt+FLv0/7kTSL7Krb2UaSp5CeOwB9eYOd/1+35hMqohtglpVw
         ICvosilOTVsiIHO4PfHdg07m/cgC3Tt/huMgvo45KCLjN4QFidGJHJnLu4+6pAtEq1E1
         AyHzVsMoGBkMNgAmeloFNNJcPy0IRspvK2X8diLXZFqWje6qAb/0VBiohVXgZ7IEoiyv
         CNqJsuqAqmln3A7ctkAVgI+K7yqh9McxhFVRGwamHpHAS7rbyOJUiR3c0Bezt1Gv3V77
         gLuA==
X-Gm-Message-State: AOAM531huchklyfmpO2RhNWIQTmaR05ZQeXK+DR4vf86aL7rDScW821u
	YaqK0KUiWYjtzRg4f+MZREzGY0Gds/7DUV52z58=
X-Google-Smtp-Source: ABdhPJxiTWscXeUvuAJvwRx9mkz2xUbJ3pHwkgg268sfpX43TOnGa40LT1quTJ7g3tw0pilTPY6yLQ==
X-Received: by 2002:a17:90a:e60d:: with SMTP id j13mr3941527pjy.52.1610113683225;
        Fri, 08 Jan 2021 05:48:03 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id t206sm9088462pgb.84.2021.01.08.05.48.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 05:48:02 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/30] Pull request (cover letter only)
Date: Fri,  8 Jan 2021 03:47:52 -1000
Message-Id: <cover.1610113592.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fcd335e2a721d8db6e2fdac483798ced0ff3e1ad:

  openssl: Update to 1.1.1i (2021-01-01 11:55:26 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  valgrind: exclude bar_bad/bar_bad_xml from ptests

Anuj Mittal (1):
  mesa: add more details to elf-tls patch

Changqing Li (1):
  libexif: fix CVE-2020-0198; CVE-2020-0452

Christopher Larson (2):
  grub-efi-cfg: exclude OVERRIDES from build_efi_cfg vardeps
  uboot-extlinux-config: exclude OVERRIDES from
    do_create_extlinux_config vardeps

Diego Sueiro (1):
  modutils-initscripts: Use depmod -a when modules.dep is empty

Dmitry Baryshkov (1):
  perl: fix installation failure because of shell issue

Khem Raj (1):
  initscripts: use quotes for shell variable comparision

Lee Chee Yang (2):
  wic/direct/kparser: ensure fsuuid for vfat and msdos align with format
  gdk-pixbuf: fix CVE-2020-29385

Maxime Roussin-Bélanger (1):
  meta: add missing descriptions in some support recipes

Nathan Rossi (2):
  ncurses: Prevent LDFLAGS being emitted in .pc files
  coreutils: enable xattrs by default for nativesdk

Ovidiu Panait (1):
  timezone: upgrade to 2020e

Peter Kjellerstedt (1):
  apr-util: Only specify --with-dbm=gdbm if gdbm support is enabled

Richard Purdie (3):
  oeqa/commands: Ensure sync can be found regardless of PATH
  grub: Further reproducibility fix
  man-db: Fix reproducibility issue

Robert Yang (5):
  buildtools-tarball.bb: Fix PATH for environment setup script
  ncurses: Make ncurses-tools depend on ncurses-terminfo-base
  minicom: RDEPENDS on ncurses-terminfo-base
  archiver.bbclass: Fix --runall=deploy_archives for images
  weston: Fix PACKAGECONFIG for remoting

Ross Burton (3):
  ncurses: remove config.cache
  wic-image-minimal: only depend on syslinux on x86 targets
  lib/oe/qa: handle the 'no specific instruction set' ELF e_machine
    value

Scott Murray (2):
  grub: fix "CVE:" line in one of the patches
  patch: fix CVE-2019-20633

Tanu Kaskinen (1):
  pulseaudio: Remove OE_LT_RPATH_ALLOW

Tomasz Dziendzielski (1):
  populate_sdk_base: Fix condition syntax if SDK_RELOCATE_AFTER_INSTALL
    is disabled

 .../recipes-test/images/wic-image-minimal.bb  |  5 +-
 meta/classes/archiver.bbclass                 |  1 +
 meta/classes/grub-efi-cfg.bbclass             |  1 +
 meta/classes/populate_sdk_base.bbclass        |  2 +-
 meta/classes/uboot-extlinux-config.bbclass    |  1 +
 meta/lib/oe/qa.py                             |  1 +
 meta/lib/oeqa/selftest/cases/oelib/elf.py     |  2 +-
 meta/lib/oeqa/utils/commands.py               |  3 +
 ...low-checking-primitives-where-we-do-.patch |  2 +-
 meta/recipes-bsp/grub/files/determinism.patch | 16 +++++
 meta/recipes-core/coreutils/coreutils_8.31.bb |  3 +
 .../initscripts/initscripts-1.0/checkroot.sh  |  2 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |  2 +-
 ...-Do-not-include-LDFLAGS-in-generated.patch | 29 ++++++++
 meta/recipes-core/ncurses/files/config.cache  |  4 --
 meta/recipes-core/ncurses/ncurses.inc         |  5 +-
 meta/recipes-core/ncurses/ncurses_6.2.bb      |  4 +-
 .../patch/patch/CVE-2019-20633.patch          | 31 +++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb    |  1 +
 meta/recipes-devtools/perl/perl_5.30.1.bb     |  5 +-
 .../valgrind/valgrind/remove-for-aarch64      |  2 -
 .../valgrind/valgrind/remove-for-all          |  2 +
 .../valgrind/valgrind/run-ptest               | 10 +++
 .../valgrind/valgrind_3.15.0.bb               |  2 +
 meta/recipes-extended/man-db/man-db_2.9.0.bb  |  1 +
 .../recipes-extended/minicom/minicom_2.7.1.bb |  2 +
 meta/recipes-extended/timezone/timezone.inc   |  6 +-
 .../gdk-pixbuf/CVE-2020-29385.patch           | 55 ++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |  1 +
 ...02-meson.build-make-TLS-ELF-optional.patch | 15 +++++
 meta/recipes-graphics/wayland/weston_8.0.0.bb |  2 +-
 .../modutils-initscripts/files/modutils.sh    |  2 +-
 .../pulseaudio/pulseaudio.inc                 |  5 --
 meta/recipes-support/apr/apr-util_1.6.1.bb    |  5 +-
 meta/recipes-support/apr/apr_1.7.0.bb         |  4 ++
 meta/recipes-support/aspell/aspell_0.60.8.bb  |  4 ++
 .../atk/at-spi2-core_2.34.0.bb                |  2 +
 meta/recipes-support/attr/acl_2.2.53.bb       |  2 +
 meta/recipes-support/attr/attr.inc            |  4 ++
 .../bash-completion/bash-completion_2.10.bb   |  2 +
 .../libexif/files/CVE-2020-0198.patch         | 66 +++++++++++++++++++
 .../libexif/files/CVE-2020-0452.patch         | 39 +++++++++++
 .../recipes-support/libexif/libexif_0.6.22.bb |  2 +
 meta/recipes-support/nettle/nettle_3.5.1.bb   |  3 +
 scripts/lib/wic/ksparser.py                   | 17 +++++
 scripts/lib/wic/plugins/imager/direct.py      |  7 ++
 46 files changed, 351 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
 delete mode 100644 meta/recipes-core/ncurses/files/config.cache
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-for-all
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
 create mode 100644 meta/recipes-support/libexif/files/CVE-2020-0198.patch
 create mode 100644 meta/recipes-support/libexif/files/CVE-2020-0452.patch

-- 
2.17.1

