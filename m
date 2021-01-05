Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.5870.1609856648501455233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EI5gZJ0Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id x126so18419895pfc.7
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ADTEG1vnM56lHcejvhP98K0zgspJCU1dcT2eUo1FGdQ=;
        b=EI5gZJ0YJWboW1TV/DZUSk0SvpIkQi8sFFSZdHSmpQwK65f9AH7YIMp66njQdhTwkB
         ILqoHCW5aMi8kOtjpB35ig2INw7TO1GMOP3jZY8vWfMfL67KH6Jn00G890mB78Ck8rEG
         krD2kZ1jiwwLzdQLoGbRfM3cjqmekWlBKZDUJ3WrX0B24gV8eVWtQpaGwQchJEmDbuZ3
         sG8SRZ0sgipK3013FPvrawvBiX9DdEO3W3kUOmlDK6GnFArDw7Hw/f0SeyAVI/vWD5BI
         se8hm+dcTIhmtMIvRMXOEI/82OCxLYDoO3DzIeiJFQqXnv2YVSg6mptpFUwKAaHrK/4c
         Afpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ADTEG1vnM56lHcejvhP98K0zgspJCU1dcT2eUo1FGdQ=;
        b=iA/rZUacJL4NXT1dNepWGyemm7YRTx9dxwBKm5zcsNwklGPp+mgGpT61bxki8rlenl
         vUtydABGCxkrMqLyI9OIInwHbCH6QgW6eoo6zZWb7zSSnpnREv9HeZO9FzZk9/R1EJ00
         TatBa51wSN8gygUU//A9sgFb6Uirx0L8VLJE2gAK58d/9E4E3rmgd/LgRUJmsEGq+ouV
         Csv0qF7M45bhk2S4++MiTDhWvGNcl2Tf+jydmDRxbrbcQlWizGm1fGAX2IDQafEPgiJq
         HNxoGMXDttsOlovg56PUFDJxx8bvaLOPeE+ZR6NsEk4XFiYx09BOQNpopSqh63BbE8m+
         72Bw==
X-Gm-Message-State: AOAM530gX07OLtxBYn5O6h03wqGQDTS0AnK1kX8jSVjnZ5thFdChDDS5
	ckoEviUdckoOLOXw/UgP2oojKraG+uORt1tJjqQ=
X-Google-Smtp-Source: ABdhPJyHnHGN5bPldewDbxYALuB8gFRJNmuNXYJj0ufuNMy8Z/v8XsgiSY3qjwFe0G6RZS2T71qqXQ==
X-Received: by 2002:aa7:9a86:0:b029:1a6:d998:922a with SMTP id w6-20020aa79a860000b02901a6d998922amr69904655pfi.80.1609856647434;
        Tue, 05 Jan 2021 06:24:07 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.24.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:24:06 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/30] Patch review
Date: Tue,  5 Jan 2021 04:23:25 -1000
Message-Id: <cover.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1722

The following changes since commit fcd335e2a721d8db6e2fdac483798ced0ff3e1ad:

  openssl: Update to 1.1.1i (2021-01-01 11:55:26 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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

