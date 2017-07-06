Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id E5CB1719E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 11:50:47 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id 77so25712753wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 04:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7GaArtax7X0ngX2JAwzoyFnwH29f1jNIzjamVCE5H7A=;
	b=Kdzm/Pmu2vXUxi7dtDbRF7xbCA8qDCrCWI2AeE/2dBq4UHkMcBP4IZwc4bpU4E2RdW
	4CZRQIoq38Cf3M1mot5aOZUoaSlmvsey0ndlgZ/8exzr5x0kinLTP4t87fuib+oBYEEC
	ZxkqUQX2ChAlvIKkcX1fbpdQwN0bBXSYrZbpy9Nkw5ObBO1yuRqA8dA1tT2GghM396o/
	ldNckOnXEoMai+IpR6le5FzERVBfs5RFl4vPqzTHPgxgvAnrjE36KT1C3d2yRla+l1vu
	YSq7XCeSpc9X+fNRP6xT8JDFeWsrnhSQkldeu3z8iYiIDihoLjHQMdtqkKDxSKCKJY3k
	gX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7GaArtax7X0ngX2JAwzoyFnwH29f1jNIzjamVCE5H7A=;
	b=QVX+rYvBGLV+zPFVDO6bom6T8BMk8Zqhny17WQdVWlxABxHq8lYRFqoeeIYQvoXwby
	67c3Ty+y8YS0Mw206LVCXkzNLDaFYSoxRquZO0cxYn9uSZp76s2Oxbc4D4/S14iFeb8j
	2qZiFNOq8cEUa/BexY5caUWggMhpXNAqVAwm2BxdYkA8t12w+GivzgGuO40m9PynKS2T
	NtRHICN0B8dXv8L6Wr2DxzAciZ1GE6aa48/enUUiefwXDNwZK4T7gwgxza68hYsz5iLx
	McVbedLZGNyV2pkthgHlV0QFzBl1FBGhWIbs1wnnWHzFg8jQKoeAqbBMR/IK/vwnuqRo
	X37w==
X-Gm-Message-State: AIVw1136eImtCvofmGpR6bt3crPSi/HlNgvU2yGrG3Ssq3QAqFYUaUy/
	qQYnfYxeCM6R+RFR2is=
X-Received: by 10.28.94.201 with SMTP id s192mr6741870wmb.100.1499341848087;
	Thu, 06 Jul 2017 04:50:48 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id e31sm113711wre.54.2017.07.06.04.50.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 04:50:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 12:50:45 +0100
Message-Id: <cover.1499341789.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 00/42] Consolidated pull
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Jul 2017 11:50:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Consolidated pull from the list, went green on the autobuilder apart from two
failures due to speex download server being down, so this series includes a
SRC_URI fix for that too.

Ross

The following changes since commit e7549662164b1aee346acaf434c38a3416e07e68:

  image.bbclass: create root symlinks in nativesdk target sysroot (2017-06-30 09:02:13 +0100)

are available in the git repository at:

  ssh://git@git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 15c1a1c7fb7fe46230b78db10d0b79dc5e350961:

  speex: update SRC_URI (2017-07-06 12:43:23 +0100)

----------------------------------------------------------------
Aníbal Limón (1):
      classes/populate_sdk_base: Fix SDK manifest generation

Changhyeok Bae (1):
      openssl: Upgrade 1.0.2k -> 1.0.2l

Choong YinThong (1):
      linux-yocto-custom: include a user feature description file

Dengke Du (4):
      grep: upgrade to 3.1
      expat: upgrade to 2.2.1
      ltp: Reduce local Pending patches
      avahi-ui: reduce local pending patches

Fathi Boudra (2):
      ltp: syscalls/add_key02: fix for nonempty NULL payload
      ltp: add acl, attr, curl and util-linux runtime dependencies

Jose Perez Carranza (1):
      oeqa/sdk: Replace buildiptables for buildlzip tests

Jun Zhu (1):
      bluez: Correct the timer count for bcm43xx firmware download

Jussi Kukkonen (3):
      gtk+3: Update UPSTREAM_CHECK_REGEX
      gtk+3: Upgrade 3.22.15 -> 3.22.16
      libepoxy: Upgrade 1.4.2 -> 1.4.3

Khem Raj (7):
      valgrind: Fix build with glibc 2.26
      strace: upgrade to 4.17
      qemu: Replace use of struct ucontext with ucontext_t
      epiphany: Fix build errors when compiling with security flags
      icu: Fix build with glibc 2.26
      valgrind: Remove -no-pie from cflags
      systemd: Do not use xlocale.h

Maxime Roussin-Bélanger (1):
      cmake: Use find_program if find_host_program is not available

Mikko Ylinen (1):
      sanity.bbclass: fix AttributeError in mirror format checks

Ming Liu (1):
      local.conf.sample: drop image-swab reference

Otavio Salvador (2):
      mesa: Avoid platform probing when building without EGL
      mesa: Upgrade to 17.1.4 release

Patrick Ohly (6):
      yocto-compat-layer.py: avoid adding layers more than once
      yocto-compat-layer.py: tolerate broken world builds during signature diff
      yocto-compat-layer.py: apply test_signatures to all layers
      yocto-compat-layer.py: add test_world
      yocto-compat-layer.py: allow README with suffix
      yocto-compat-layer.py: make signature check code reusable

Peter Kjellerstedt (2):
      gtk+3: Update the patches to work with old versions of patch
      oe-pkgdata-util: package-info: Allow extra variables to be displayed

Randy MacLeod (1):
      binutils: update SRCREV to fix powerpc gold link bug

Ricardo Ribalda Delgado (2):
      libgfortran: Add missing dependency gcc-cross
      libgfortran: Add missing fincludes

Ross Burton (3):
      sanity.bbclass: remove ASSUME_PROVIDED checks that can't succeed
      insane: remove obsolete gcc 4.5 check
      speex: update SRC_URI

Soren Brinkmann (1):
      mirrors: Add HTTP mirrors for ftp://sourceware.org

susanbian (1):
      sysstat:11.5.5 -> 11.5.6

 meta-poky/conf/local.conf.sample                   |   1 -
 meta/classes/mirrors.bbclass                       |   3 +
 meta/classes/populate_sdk_base.bbclass             |  36 ++-
 meta/classes/sanity.bbclass                        |  60 +----
 .../sdk/cases/{buildiptables.py => buildlzip.py}   |   8 +-
 ...c-install-GtkBuilder-interface-files-for-.patch |   9 +-
 meta/recipes-connectivity/bluez5/bluez5.inc        |   1 +
 ...cm43xx-fix-the-delay-timer-for-firmware-d.patch |  36 +++
 meta/recipes-connectivity/openssl/openssl.inc      |   5 +
 .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch |  21 --
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch |  23 --
 .../{openssl_1.0.2k.bb => openssl_1.0.2l.bb}       |   8 +-
 meta/recipes-core/expat/expat_2.2.0.bb             |   5 -
 meta/recipes-core/expat/expat_2.2.1.bb             |   5 +
 ...se-util-Do-not-include-unneeded-xlocale.h.patch |  27 ++
 meta/recipes-core/systemd/systemd_232.bb           |   3 +-
 meta/recipes-devtools/binutils/binutils-2.28.inc   |   2 +-
 meta/recipes-devtools/cmake/cmake.inc              |   1 +
 ...e-find_program-if-find_host_program-is-no.patch |  40 +++
 meta/recipes-devtools/gcc/libgfortran.inc          |   3 +-
 ...lace-struct-ucontext-with-ucontext_t-type.patch | 265 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.8.1.1.bb         |  46 ++--
 ...8-replace-struct-ucontext-with-ucontext_t.patch |  31 +++
 .../strace/strace/Makefile-ptest.patch             |  19 +-
 .../strace/{strace_4.16.bb => strace_4.17.bb}      |   5 +-
 ...sts-Use-ucontext_t-instead-of-struct-ucon.patch |  30 +++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   3 +-
 .../grep/{grep_3.0.bb => grep_3.1.bb}              |   4 +-
 ...TH_MAX-undeclared-when-building-with-musl.patch |  15 +-
 ...RDSIZE-undeclared-when-building-with-musl.patch |  23 +-
 ...ition-of-struct-msgbuf-error-building-wit.patch |   9 +-
 ...d_key02-update-to-test-fix-for-nonempty-N.patch | 136 +++++++++++
 meta/recipes-extended/ltp/ltp_20170516.bb          |  25 +-
 .../{sysstat_11.5.5.bb => sysstat_11.5.6.bb}       |   4 +-
 meta/recipes-gnome/epiphany/epiphany_3.24.2.bb     |   6 +-
 ...bookmarks-Check-for-return-value-of-fread.patch |  32 +++
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   6 +-
 .../gtk+/gtk+3/0001-Hardcoded-libtool.patch        |  12 +-
 ...Do-not-try-to-initialize-GL-without-libGL.patch |   8 +-
 .../0003-Add-disable-opengl-configure-option.patch | 272 +++++++++++++++------
 ...4-configure.ac-Fix-wayland-protocols-path.patch |   8 +-
 .../gtk+/{gtk+3_3.22.15.bb => gtk+3_3.22.16.bb}    |   4 +-
 ...3.22.15.bb => gtk-icon-utils-native_3.22.16.bb} |   9 +-
 .../{libepoxy_1.4.2.bb => libepoxy_1.4.3.bb}       |   9 +-
 .../mesa/{mesa-gl_17.1.3.bb => mesa-gl_17.1.4.bb}  |   0
 meta/recipes-graphics/mesa/mesa.inc                |   2 +-
 .../mesa/{mesa_17.1.3.bb => mesa_17.1.4.bb}        |   4 +-
 meta/recipes-multimedia/speex/speex_1.2.0.bb       |   2 +-
 .../icu/icu/0001-i18n-Drop-include-xlocale.h.patch |  31 +++
 meta/recipes-support/icu/icu_58.2.bb               |   3 +-
 .../recipes-kernel/linux/linux-yocto-custom.bb     |   1 +
 .../linux-yocto-custom/machine-user-features.scc   |   1 +
 scripts/lib/compatlayer/__init__.py                |  90 ++++++-
 scripts/lib/compatlayer/cases/common.py            |  92 ++-----
 scripts/lib/compatlayer/context.py                 |   3 +-
 scripts/oe-pkgdata-util                            |  12 +-
 scripts/yocto-compat-layer.py                      |  12 +-
 57 files changed, 1143 insertions(+), 388 deletions(-)
 rename meta/lib/oeqa/sdk/cases/{buildiptables.py => buildlzip.py} (84%)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2k.bb => openssl_1.0.2l.bb} (86%)
 delete mode 100644 meta/recipes-core/expat/expat_2.2.0.bb
 create mode 100644 meta/recipes-core/expat/expat_2.2.1.bb
 create mode 100644 meta/recipes-core/systemd/systemd/0022-parse-util-Do-not-include-unneeded-xlocale.h.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-replace-struct-ucontext-with-ucontext_t-type.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0008-replace-struct-ucontext-with-ucontext_t.patch
 rename meta/recipes-devtools/strace/{strace_4.16.bb => strace_4.17.bb} (87%)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch
 rename meta/recipes-extended/grep/{grep_3.0.bb => grep_3.1.bb} (89%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch
 rename meta/recipes-extended/sysstat/{sysstat_11.5.5.bb => sysstat_11.5.6.bb} (53%)
 create mode 100644 meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.15.bb => gtk+3_3.22.16.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.15.bb => gtk-icon-utils-native_3.22.16.bb} (86%)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.2.bb => libepoxy_1.4.3.bb} (70%)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.1.3.bb => mesa-gl_17.1.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.1.3.bb => mesa_17.1.4.bb} (84%)
 create mode 100644 meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch
 create mode 100644 scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/linux-yocto-custom/machine-user-features.scc

Aníbal Limón (1):
  classes/populate_sdk_base: Fix SDK manifest generation

Changhyeok Bae (1):
  openssl: Upgrade 1.0.2k -> 1.0.2l

Choong YinThong (1):
  linux-yocto-custom: include a user feature description file

Dengke Du (4):
  grep: upgrade to 3.1
  expat: upgrade to 2.2.1
  ltp: Reduce local Pending patches
  avahi-ui: reduce local pending patches

Fathi Boudra (2):
  ltp: syscalls/add_key02: fix for nonempty NULL payload
  ltp: add acl, attr, curl and util-linux runtime dependencies

Jose Perez Carranza (1):
  oeqa/sdk: Replace buildiptables for buildlzip tests

Jun Zhu (1):
  bluez: Correct the timer count for bcm43xx firmware download

Jussi Kukkonen (3):
  gtk+3: Update UPSTREAM_CHECK_REGEX
  gtk+3: Upgrade 3.22.15 -> 3.22.16
  libepoxy: Upgrade 1.4.2 -> 1.4.3

Khem Raj (7):
  valgrind: Fix build with glibc 2.26
  strace: upgrade to 4.17
  qemu: Replace use of struct ucontext with ucontext_t
  epiphany: Fix build errors when compiling with security flags
  icu: Fix build with glibc 2.26
  valgrind: Remove -no-pie from cflags
  systemd: Do not use xlocale.h

Maxime Roussin-Bélanger (1):
  cmake: Use find_program if find_host_program is not available

Mikko Ylinen (1):
  sanity.bbclass: fix AttributeError in mirror format checks

Ming Liu (1):
  local.conf.sample: drop image-swab reference

Otavio Salvador (2):
  mesa: Avoid platform probing when building without EGL
  mesa: Upgrade to 17.1.4 release

Patrick Ohly (6):
  yocto-compat-layer.py: avoid adding layers more than once
  yocto-compat-layer.py: tolerate broken world builds during signature
    diff
  yocto-compat-layer.py: apply test_signatures to all layers
  yocto-compat-layer.py: add test_world
  yocto-compat-layer.py: allow README with suffix
  yocto-compat-layer.py: make signature check code reusable

Peter Kjellerstedt (2):
  gtk+3: Update the patches to work with old versions of patch
  oe-pkgdata-util: package-info: Allow extra variables to be displayed

Randy MacLeod (1):
  binutils: update SRCREV to fix powerpc gold link bug

Ricardo Ribalda Delgado (2):
  libgfortran: Add missing dependency gcc-cross
  libgfortran: Add missing fincludes

Ross Burton (3):
  sanity.bbclass: remove ASSUME_PROVIDED checks that can't succeed
  insane: remove obsolete gcc 4.5 check
  speex: update SRC_URI

Soren Brinkmann (1):
  mirrors: Add HTTP mirrors for ftp://sourceware.org

susanbian (1):
  sysstat:11.5.5 -> 11.5.6

 meta-poky/conf/local.conf.sample                   |   1 -
 meta/classes/mirrors.bbclass                       |   3 +
 meta/classes/populate_sdk_base.bbclass             |  36 ++-
 meta/classes/sanity.bbclass                        |  60 +----
 .../sdk/cases/{buildiptables.py => buildlzip.py}   |   8 +-
 ...c-install-GtkBuilder-interface-files-for-.patch |   9 +-
 meta/recipes-connectivity/bluez5/bluez5.inc        |   1 +
 ...cm43xx-fix-the-delay-timer-for-firmware-d.patch |  36 +++
 meta/recipes-connectivity/openssl/openssl.inc      |   5 +
 .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch |  21 --
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch |  23 --
 .../{openssl_1.0.2k.bb => openssl_1.0.2l.bb}       |   8 +-
 meta/recipes-core/expat/expat_2.2.0.bb             |   5 -
 meta/recipes-core/expat/expat_2.2.1.bb             |   5 +
 ...se-util-Do-not-include-unneeded-xlocale.h.patch |  27 ++
 meta/recipes-core/systemd/systemd_232.bb           |   3 +-
 meta/recipes-devtools/binutils/binutils-2.28.inc   |   2 +-
 meta/recipes-devtools/cmake/cmake.inc              |   1 +
 ...e-find_program-if-find_host_program-is-no.patch |  40 +++
 meta/recipes-devtools/gcc/libgfortran.inc          |   3 +-
 ...lace-struct-ucontext-with-ucontext_t-type.patch | 265 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.8.1.1.bb         |  46 ++--
 ...8-replace-struct-ucontext-with-ucontext_t.patch |  31 +++
 .../strace/strace/Makefile-ptest.patch             |  19 +-
 .../strace/{strace_4.16.bb => strace_4.17.bb}      |   5 +-
 ...sts-Use-ucontext_t-instead-of-struct-ucon.patch |  30 +++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   3 +-
 .../grep/{grep_3.0.bb => grep_3.1.bb}              |   4 +-
 ...TH_MAX-undeclared-when-building-with-musl.patch |  15 +-
 ...RDSIZE-undeclared-when-building-with-musl.patch |  23 +-
 ...ition-of-struct-msgbuf-error-building-wit.patch |   9 +-
 ...d_key02-update-to-test-fix-for-nonempty-N.patch | 136 +++++++++++
 meta/recipes-extended/ltp/ltp_20170516.bb          |  25 +-
 .../{sysstat_11.5.5.bb => sysstat_11.5.6.bb}       |   4 +-
 meta/recipes-gnome/epiphany/epiphany_3.24.2.bb     |   6 +-
 ...bookmarks-Check-for-return-value-of-fread.patch |  32 +++
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   6 +-
 .../gtk+/gtk+3/0001-Hardcoded-libtool.patch        |  12 +-
 ...Do-not-try-to-initialize-GL-without-libGL.patch |   8 +-
 .../0003-Add-disable-opengl-configure-option.patch | 272 +++++++++++++++------
 ...4-configure.ac-Fix-wayland-protocols-path.patch |   8 +-
 .../gtk+/{gtk+3_3.22.15.bb => gtk+3_3.22.16.bb}    |   4 +-
 ...3.22.15.bb => gtk-icon-utils-native_3.22.16.bb} |   9 +-
 .../{libepoxy_1.4.2.bb => libepoxy_1.4.3.bb}       |   9 +-
 .../mesa/{mesa-gl_17.1.3.bb => mesa-gl_17.1.4.bb}  |   0
 meta/recipes-graphics/mesa/mesa.inc                |   2 +-
 .../mesa/{mesa_17.1.3.bb => mesa_17.1.4.bb}        |   4 +-
 meta/recipes-multimedia/speex/speex_1.2.0.bb       |   2 +-
 .../icu/icu/0001-i18n-Drop-include-xlocale.h.patch |  31 +++
 meta/recipes-support/icu/icu_58.2.bb               |   3 +-
 .../recipes-kernel/linux/linux-yocto-custom.bb     |   1 +
 .../linux-yocto-custom/machine-user-features.scc   |   1 +
 scripts/lib/compatlayer/__init__.py                |  90 ++++++-
 scripts/lib/compatlayer/cases/common.py            |  92 ++-----
 scripts/lib/compatlayer/context.py                 |   3 +-
 scripts/oe-pkgdata-util                            |  12 +-
 scripts/yocto-compat-layer.py                      |  12 +-
 57 files changed, 1143 insertions(+), 388 deletions(-)
 rename meta/lib/oeqa/sdk/cases/{buildiptables.py => buildlzip.py} (84%)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2k.bb => openssl_1.0.2l.bb} (86%)
 delete mode 100644 meta/recipes-core/expat/expat_2.2.0.bb
 create mode 100644 meta/recipes-core/expat/expat_2.2.1.bb
 create mode 100644 meta/recipes-core/systemd/systemd/0022-parse-util-Do-not-include-unneeded-xlocale.h.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-replace-struct-ucontext-with-ucontext_t-type.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0008-replace-struct-ucontext-with-ucontext_t.patch
 rename meta/recipes-devtools/strace/{strace_4.16.bb => strace_4.17.bb} (87%)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch
 rename meta/recipes-extended/grep/{grep_3.0.bb => grep_3.1.bb} (89%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch
 rename meta/recipes-extended/sysstat/{sysstat_11.5.5.bb => sysstat_11.5.6.bb} (53%)
 create mode 100644 meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.15.bb => gtk+3_3.22.16.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.15.bb => gtk-icon-utils-native_3.22.16.bb} (86%)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.2.bb => libepoxy_1.4.3.bb} (70%)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.1.3.bb => mesa-gl_17.1.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.1.3.bb => mesa_17.1.4.bb} (84%)
 create mode 100644 meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch
 create mode 100644 scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/linux-yocto-custom/machine-user-features.scc

-- 
2.11.0


