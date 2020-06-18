Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web11.10517.1592494881822920569
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tkMgnOyq;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.195, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f195.google.com with SMTP id s21so5456711oic.9
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=byElzeg39Y376ZIs8ovPdG8fp9l1ApYLhVqfKmn3owE=;
        b=tkMgnOyq/cZc9TCWfYru8q45GJEnE1MQkrfK7MHfJka3E7/D50U18zymIQqK9Tuwby
         0rct5iCej4MHF9mJesfzdo/Eg9dbhRXRQs1aE+t5RF70pb1msaYSizszJyto5D1LKY2r
         LRz02iulsEPLVhldqddHxE6vWgnzDFBShoFDzfHUv+krvyVuBThXYnwZTE+pqCTnncj+
         eap0JBZ+I/4yUmpcuHAww/rvqT0FOT1HJIy4EWG8+fbSMGA0rbyUGVeBUkHkGH3q6xot
         jFvQRoC4NIa+yi5B1ExnuaGWOMGWltCBDq4PHbtj9g+jPiCKFYsNVlbxBgEBWAJigVjP
         M3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=byElzeg39Y376ZIs8ovPdG8fp9l1ApYLhVqfKmn3owE=;
        b=hHA+XO5M5TeWt5+JUlnzGQ/7/33rqPwP9B9C01qA5L/OHk2PDTbYqBCC8WUsoUX5Xf
         V3PV3HxiM1qEDmguBDfT0T/9XkjnRpYlYO5gwE9iuN81olnzOoixkJNpqTguQuKcpPJJ
         PoH/sbD9Sc+jK9XH56UDndDV1vzR0ZfdDkX6ThBO90I7yL3oQwVSnBgOppOchbftb/fZ
         WjwR3gxDtOC/SGMaHIrtACh7w3xPMzjkO5fladi9ETzqm/zrIKbsHNyQSgNxjoc2wTI5
         jkWdS7L/RvyVBDqKte+W40Fo/h57BH8KbY+uD5LoW7FdO+3WXvwczImj0twRRvlrU3DB
         /4jw==
X-Gm-Message-State: AOAM5338wamyDhALUt8yM9tEosKsXQO4wwSeIdN1iwISWrQlxT/Z9Hit
	QR1+xwyayKXwwe+yOg93bKXNQNydJ1zJ/A==
X-Google-Smtp-Source: ABdhPJyy2Oixq80zPchNzmxYFmrMYBZUdYEho82aq9Mtd2TKTK7fmLfio9QyXbXGDNtmSyTr1CGPKA==
X-Received: by 2002:aca:ba0a:: with SMTP id k10mr3318612oif.13.1592494880484;
        Thu, 18 Jun 2020 08:41:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.41.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:41:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/21] Patch review - gcc 10 build support
Date: Thu, 18 Jun 2020 05:40:30 -1000
Message-Id: <cover.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

This set of patches consists only of patches related to supporting builds
on distros using gcc 10. All patches are cherry-picked from master except
for "u-boot-tools: backport patch from upstream to fix gcc 10 builds"

Test builds of oe-selftest-fedora and qemux86-world using the autobuilder
fedora32 worker were successful. An a-full build using currently supported
distros was also successful.

Patches to add fedora32 to the supported disto list will follow at a later date.

Please review and have comments back by end of day Monday.

The following changes since commit d9de155f6452f916edd3131addd0c2eebaf4d639:

  vim: _FORTIFY_SOURCE=2 be gone (2020-06-16 10:14:02 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Adrian Bunk (6):
  iproute2: Remove -fcommon
  libxcrypt2: Remove -fcommon
  mesa: Remove -fcommon
  at-spi2-atk: Remove -fcommon
  menu-cache: Replace -fcommon with fix
  matchbox-wm: Replace -fcommon with fix

Jacob Kroon (1):
  squashfs-tools: Backport fix for compiling with gcc 10

Joe Slater (1):
  acpica: Upgrade 20200214 -> 20200430 for gcc-10 fixes

Khem Raj (5):
  glibc: Update to latest on 2.31 branch
  wayland: fix condition for strndup detection
  syslinux: Fix build with gcc10
  valgrind: Do not use outline-atomics on aarch64
  valgrind: Backport upstream patch to fix __getauxval needs

Richard Leitner (6):
  libtirpc: remove extra "-fcommon" from CFLAGS
  gdbm: add patch to fix link failure against gcc 10
  dtc: update to 1.6.0
  libcomps: update to 0.1.15
  binutils: add patch to fix issues with gcc 10
  cpio: add patch to fix issues with gcc 10

Steve Sakoman (1):
  u-boot-tools: backport patch from upstream to fix gcc 10 builds

zhengruoqin (1):
  libtirpc: upgrade 1.2.5 -> 1.2.6

 .../remove-redundant-yyloc-global.patch       |  27 +++
 .../u-boot/u-boot-tools_2020.01.bb            |   2 +
 .../iproute2/iproute2_5.5.0.bb                |   2 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../0030-Improve-IFUNC-check-BZ-25506.patch   |  47 -----
 ...-with-GCC-10-when-long-double-double.patch | 170 ------------------
 .../glibc/glibc/CVE-2020-10029.patch          | 128 -------------
 meta/recipes-core/glibc/glibc_2.31.bb         |   3 -
 meta/recipes-core/libxcrypt/libxcrypt.inc     |   2 -
 .../binutils/binutils-2.34.inc                |   1 +
 ...dundant-program_name-definition-fno-.patch |  61 +++++++
 .../0001-Add-crc32.c-to-sources-list.patch    |   9 +-
 ...-__comps_objmrtree_all-static-inline.patch |  35 ----
 ...YTHON_INSTALL_DIR-by-running-python.patch} |  12 +-
 .../{libcomps_git.bb => libcomps_0.1.15.bb}   |   6 +-
 ...ols-fix-build-failure-against-gcc-10.patch |  45 +++++
 .../squashfs-tools/squashfs-tools_git.bb      |   1 +
 ...multiple-definition-of-symbol-errors.patch |  97 ++++++++++
 .../syslinux/syslinux_6.04-pre2.bb            |   1 +
 ...d-needs-__getauxval-for-linking-with.patch | 144 +++++++++++++++
 .../valgrind/valgrind_3.15.0.bb               |   1 +
 ...{acpica_20200214.bb => acpica_20200430.bb} |   4 +-
 ...ove-superfluous-declaration-of-progr.patch |  28 +++
 meta/recipes-extended/cpio/cpio_2.13.bb       |   1 +
 ...r_float-do-not-include-bits-endian.h.patch |  34 ----
 .../{libtirpc_1.2.5.bb => libtirpc_1.2.6.bb}  |  10 +-
 .../0001-Fix-build-with-gcc-10.patch          |  41 +++++
 .../matchbox-wm/matchbox-wm_1.2.2.bb          |   3 +-
 .../0001-Support-gcc10-compilation.patch      | 111 ++++++++++++
 .../menu-cache/menu-cache_1.1.0.bb            |   6 +-
 meta/recipes-graphics/mesa/mesa_20.0.2.bb     |   2 -
 ...build-Fix-strndup-detection-on-MinGW.patch |   7 +-
 .../dtc/{dtc_1.5.1.bb => dtc_1.6.0.bb}        |   2 +-
 .../recipes-support/atk/at-spi2-atk_2.34.1.bb |   2 -
 ...gdbm-fix-link-failure-against-gcc-10.patch |  47 +++++
 meta/recipes-support/gdbm/gdbm_1.18.1.bb      |   3 +-
 36 files changed, 637 insertions(+), 460 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-tools/remove-redundant-yyloc-global.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0030-Improve-IFUNC-check-BZ-25506.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0031-Fix-build-with-GCC-10-when-long-double-double.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-10029.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
 delete mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch
 rename meta/recipes-devtools/libcomps/libcomps/{0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch => 0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch} (85%)
 rename meta/recipes-devtools/libcomps/{libcomps_git.bb => libcomps_0.1.15.bb} (74%)
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0010-Workaround-multiple-definition-of-symbol-errors.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-gcc10-arm64-build-needs-__getauxval-for-linking-with.patch
 rename meta/recipes-extended/acpica/{acpica_20200214.bb => acpica_20200430.bb} (91%)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch
 rename meta/recipes-extended/libtirpc/{libtirpc_1.2.5.bb => libtirpc_1.2.6.bb} (73%)
 create mode 100644 meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch
 create mode 100644 meta/recipes-graphics/menu-cache/files/0001-Support-gcc10-compilation.patch
 rename meta/recipes-kernel/dtc/{dtc_1.5.1.bb => dtc_1.6.0.bb} (81%)
 create mode 100644 meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch

-- 
2.17.1

