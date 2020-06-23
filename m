Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.10416.1592879885324590102
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 19:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ooeJZssW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id 64so4134729oti.5
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 19:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=5gtm3XshaXbuz2YQLPE0f2VKZdR/clpguSt+JvLwHCo=;
        b=ooeJZssWw2LXk8Ek3n0ZENjkb1rNYg+/P9s8d6f8VuLzrkLp1Rpg+N9XAPJ0nr6Tdo
         7CDOJOvW1TAv191QATmABPmrzCsozycfBXY24W70utVWDD8GA4TrTP9kQYTXBtKzClO4
         DHDv0BOF/1X0Vl2kf4p0Pt2cMxijtCWPyzWIGTgnEJsId0+7/0mn5XnyrzEYEJqUDhsS
         /BD1TPL0pWxU6VPMx4S6+sjMdd1iKUNdJvD7rJcnFZo38BfD4wgYGid+03PnGbPKFUNl
         rtJBhz73fYt1TzRzqkAIeUaw6z0GpirJqKkV3VHOV/Nk7aj8zN8IIWgoq5ewKpLXiPLO
         VN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=5gtm3XshaXbuz2YQLPE0f2VKZdR/clpguSt+JvLwHCo=;
        b=onLeT0AhydJ+BlabPJ8Ru+Lqv8VT96ELiqqRfIzp4cfwh1ap2nkfUYFtCQPk5AW/aW
         2S7EtFUUeVKphT6RnK1yB23CnQIgOFyOdGVVObSnCcqN7Wr4Cj7IWH1lUGTR1DvlinK0
         FYgH1klHWf8cDuivSESJHvxHsyEfO3DhO31D/DGjRJgfQx9IZte4EF8f75CYNb1QJdDt
         HnStTpbTi+J0gOwMNBbrb36/pyFbgIfGnq2eR7dbh8dtTSefKaKio+22+XFeXBnp1AkQ
         ktN/9AzkABEw4dFFvUbnW2O+7nkAmBJU7zJXa7iXGa3WYKtNI3YbV8rnQU+mFLng1Io3
         jVSg==
X-Gm-Message-State: AOAM5311dMCbXJxMKZPhqXffiAMr7lhMDlVQ4Kf0VMRssLI1N0NYG45y
	l99PmPOnf4pK+oDwrBJBFXMy08YIIgO40Q==
X-Google-Smtp-Source: ABdhPJzGnJcSd08SIORGi9GoFIQMgjZPP8yBWHRlqCIvA7AFxxuCWmtogIFn/RV6Zk09UAouXXDuyQ==
X-Received: by 2002:a05:6830:18c8:: with SMTP id v8mr17075476ote.119.1592879883969;
        Mon, 22 Jun 2020 19:38:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id l11sm3702653oic.15.2020.06.22.19.37.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 19:38:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/21] Pull request (cover letter only)
Date: Mon, 22 Jun 2020 16:37:42 -1000
Message-Id: <cover.1592879762.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit d9de155f6452f916edd3131addd0c2eebaf4d639:

  vim: _FORTIFY_SOURCE=2 be gone (2020-06-16 10:14:02 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

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

