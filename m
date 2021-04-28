Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.5392.1619571161504154038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 17:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: rSw9EZw5so+Rc/ldpapzJ2TnL+oSNaBCReC2SwWjEnygqNJqx1d6kEZtdhm2V2vupHuKYCDW3J
 Z3FRzY1/p2Xw==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="257927429"
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; 
   d="scan'208";a="257927429"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2021 17:52:40 -0700
IronPort-SDR: JH8XGhg57b0boxV+sCcGWB/5p+iHeQoyD1K+MuVgGwTsp0/tdTwJN8fvC1urJcXfYBtVkldTQ4
 2v3+CgW2R64w==
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; 
   d="scan'208";a="386329233"
Received: from keanlait-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.213])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2021 17:52:39 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/64] pull request (cover letter only)
Date: Wed, 28 Apr 2021 08:52:35 +0800
Message-Id: <cover.1619571049.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please merge these changes in hardknott.

Thanks,

Anuj

The following changes since commit 08b2c9a23ce43ed65a16f5f0714b19a571e1b54a:

  oeqa/selftest: Hardcode test assumptions about heartbeat event timings (2021-04-16 13:35:54 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Alejandro Enedino Hernandez Samaniego (2):
  python3: Upgrade 3.9.2 -> 3.9.4
  python3: Improve logging, syntax and update deprecated modules to
    create_manifest

Alexander Kanavin (1):
  scripts/oe-debuginfod: correct several issues

Anders Wallin (2):
  lttng-tools: Fix missing legacy test files
  lttng-tools: Fix path for test_python_looging

Anthony Bagwell (1):
  systemd: upgrade 247.4 -> 247.6

Bruce Ashfield (10):
  linux-yocto/5.4: update to v5.4.109
  linux-yocto/5.10: update to v5.10.27
  linux-yocto/5.10: BSP configuration fixes
  linux-yocto/5.10: update to v5.10.29
  linux-yocto/5.4: update to v5.4.111
  linux-yocto/5.10: update to v5.10.30
  linux-yocto-rt/5.10: update to -rt34
  linux-yocto/5.4: update to v5.4.112
  linux-yocto/5.4: fix arm defconfig warnings
  linux-yocto/5.10: fix arm defconfig warnings

Changqing Li (2):
  cairo: fix CVE-2020-35492
  gdk-pixbuf: fix CVE-2021-20240

Chen Qi (1):
  busybox: fix CVE-2021-28831

Daniel Ammann (1):
  archiver: Fix typos

Douglas Royds (2):
  Revert "externalsrc: Detect code changes in submodules"
  externalsrc: Detect code changes in submodules

Gavin Li (1):
  kmod: do not symlink config.guess/config.sub during autoreconf

He Zhe (1):
  linux-yocto-dev: add features/scsi/scsi-debug.scc
    features/gpio/mockup.scc to KERNEL_FEATURES

Jon Mason (1):
  oeqa/runtime: space needed

Jonas Höppner (1):
  ltp: fix empty ltp-dev package

Kevin Hao (3):
  modutils-initscripts: Bail out when no module is installed
  sysvinit-inittab/start_getty: Check /sys for the tty device existence
  Revert "inittab: Add getty launch on hvc0 for qemuppc64"

Khairul Rohaizzat Jamaluddin (1):
  qemu: Fix CVE-2020-35517

Khem Raj (3):
  ca-certificates: Fix openssl runtime cert dependencies
  systemd: Fix build on mips/musl
  go: Use dl.google.com for SRC_URI

Konrad Weihmann (1):
  cve-update-db-native: skip on empty cpe23Uri

Mingli Yu (6):
  groff: not ship /usr/bin/grap2graph
  libtool: make sure autoheader run before automake
  packagegroup-core-tools-profile: Remove valgrind for riscv32
  packagegroup-core-tools-testapps.bb: Remove kexec for riscv32
  libxshmfence: Build fixes for riscv32
  rpm: Upgrade to 4.16.1.3

Peter Budny (1):
  lib/oe/terminal: Fix tmux new-session on older tmux versions (<1.9)

Randy MacLeod (1):
  oe-time-dd-test.sh: increase timeout to 15 sec

Richard Purdie (4):
  pseudo: Upgrade to add trailing slashes ignore path fix
  oeqa/selftest: Ensure packages classes are set correctly for
    maintainers test
  sanity: Add error check for '%' in build path
  runqemu: Ensure we cleanup snapshot files after image run

Ross Burton (2):
  insane: clean up some more warning messages
  glslang: strip whitespace in pkgconfig file

Sakib Sajal (6):
  qemu: fix CVE-2021-20181
  qemu: fix CVE-2020-29443
  qemu: fix CVE-2021-20221
  qemu: fix CVE-2021-3409
  qemu: fix CVE-2021-3416
  qemu: fix CVE-2021-20257

Saul Wold (1):
  pango: re-enable ptest

Stefan Ghinea (1):
  wpa-supplicant: fix CVE-2021-30004

Trevor Gamblin (1):
  nettle: upgrade 3.7.1 -> 3.7.2

Ulrich Ölmann (1):
  arch-armv6m.inc: fix access rights

Wes Lindauer (1):
  oeqa/runtime/cases: Only disable/enable for current boot

Yanfei Xu (1):
  parselogs: ignore floppy error on qemu-system-x86 at boot stage

hongxu (1):
  deb: apply postinstall on sdk

wangmy (3):
  mesa: upgrade 21.0.1 -> 21.0.2
  go: update SRC_URI to use https protocol
  go: upgrade 1.16.2 -> 1.16.3

 meta/classes/archiver.bbclass                 |   8 +-
 meta/classes/externalsrc.bbclass              |   7 +-
 meta/classes/insane.bbclass                   |  12 +-
 meta/classes/sanity.bbclass                   |   2 +
 meta/conf/machine/include/arm/arch-armv6m.inc |   0
 meta/lib/oe/package_manager/deb/sdk.py        |   4 +
 meta/lib/oe/terminal.py                       |  16 +-
 meta/lib/oeqa/runtime/cases/date.py           |   4 +-
 meta/lib/oeqa/runtime/cases/parselogs.py      |   2 +
 meta/lib/oeqa/runtime/cases/rtc.py            |   4 +-
 meta/lib/oeqa/runtime/decorator/package.py    |   4 +-
 meta/lib/oeqa/selftest/cases/distrodata.py    |   2 +-
 .../wpa-supplicant/CVE-2021-30004.patch       | 123 +++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |   1 +
 .../busybox/busybox-inittab_1.33.0.bb         |   3 -
 ...ss_gunzip-Fix-DoS-if-gzip-is-corrupt.patch |  58 ++++
 meta/recipes-core/busybox/busybox_1.33.0.bb   |   3 +-
 .../recipes-core/meta/cve-update-db-native.bb |   7 +-
 .../packagegroup-core-tools-profile.bb        |   1 +
 .../packagegroup-core-tools-testapps.bb       |   1 +
 ...md-boot_247.4.bb => systemd-boot_247.6.bb} |   0
 ...md-conf_247.3.bb => systemd-conf_247.6.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |  36 +++
 .../{systemd_247.4.bb => systemd_247.6.bb}    |   1 +
 .../sysvinit/sysvinit-inittab/start_getty     |  44 +--
 .../sysvinit/sysvinit-inittab_2.88dsf.bb      |   4 -
 .../go/{go-1.16.2.inc => go-1.16.3.inc}       |   4 +-
 ...e_1.16.2.bb => go-binary-native_1.16.3.bb} |   4 +-
 meta/recipes-devtools/go/go-common.inc        |   2 +-
 ..._1.16.2.bb => go-cross-canadian_1.16.3.bb} |   0
 ...{go-cross_1.16.2.bb => go-cross_1.16.3.bb} |   0
 ...osssdk_1.16.2.bb => go-crosssdk_1.16.3.bb} |   0
 ...o-native_1.16.2.bb => go-native_1.16.3.bb} |   0
 ...runtime_1.16.2.bb => go-runtime_1.16.3.bb} |   0
 .../go/{go_1.16.2.bb => go_1.16.3.bb}         |   0
 .../libtool/libtool-2.4.6.inc                 |   1 +
 ...-sure-autoheader-run-before-automake.patch |  35 ++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 ...le.py-correct-the-test-output-format.patch |  22 +-
 .../python/python3/create_manifest3.py        |  47 +--
 .../python/python3/get_module_deps3.py        |  72 +++--
 .../{python3_3.9.2.bb => python3_3.9.4.bb}    |   4 +-
 meta/recipes-devtools/qemu/qemu.inc           |  23 ++
 .../qemu/qemu/CVE-2020-29443.patch            | 107 +++++++
 .../qemu/qemu/CVE-2020-35517_1.patch          | 153 +++++++++
 .../qemu/qemu/CVE-2020-35517_2.patch          | 117 +++++++
 .../qemu/qemu/CVE-2020-35517_3.patch          | 303 ++++++++++++++++++
 .../qemu/qemu/CVE-2021-20181.patch            |  81 +++++
 .../qemu/qemu/CVE-2021-20221.patch            |  70 ++++
 .../qemu/qemu/CVE-2021-20257.patch            |  55 ++++
 .../qemu/qemu/CVE-2021-3409_1.patch           |  56 ++++
 .../qemu/qemu/CVE-2021-3409_2.patch           |  92 ++++++
 .../qemu/qemu/CVE-2021-3409_3.patch           | 109 +++++++
 .../qemu/qemu/CVE-2021-3409_4.patch           |  75 +++++
 .../qemu/qemu/CVE-2021-3409_5.patch           |  56 ++++
 .../qemu/qemu/CVE-2021-3409_6.patch           |  99 ++++++
 .../qemu/qemu/CVE-2021-3416_1.patch           | 177 ++++++++++
 .../qemu/qemu/CVE-2021-3416_10.patch          |  44 +++
 .../qemu/qemu/CVE-2021-3416_2.patch           |  42 +++
 .../qemu/qemu/CVE-2021-3416_3.patch           |  43 +++
 .../qemu/qemu/CVE-2021-3416_4.patch           |  43 +++
 .../qemu/qemu/CVE-2021-3416_5.patch           |  45 +++
 .../qemu/qemu/CVE-2021-3416_6.patch           |  43 +++
 .../qemu/qemu/CVE-2021-3416_7.patch           |  45 +++
 .../qemu/qemu/CVE-2021-3416_8.patch           |  44 +++
 .../qemu/qemu/CVE-2021-3416_9.patch           |  46 +++
 ...lib-rpm-as-the-installation-path-for.patch |   8 +-
 .../rpm/{rpm_4.16.1.2.bb => rpm_4.16.1.3.bb}  |   2 +-
 meta/recipes-extended/groff/groff_1.22.4.bb   |   4 +
 meta/recipes-extended/ltp/ltp_20210121.bb     |   2 +-
 .../gdk-pixbuf/CVE-2021-20240.patch           |  40 +++
 .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |   1 +
 .../cairo/cairo/CVE-2020-35492.patch          | 121 +++++++
 .../cairo/cairo/bug-image-compositor.ref.png  | Bin 0 -> 185 bytes
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   |  11 +
 .../0001-generate-glslang-pkg-config.patch    |  22 +-
 .../{mesa-gl_21.0.1.bb => mesa-gl_21.0.2.bb}  |   0
 meta/recipes-graphics/mesa/mesa.inc           |   2 +-
 .../mesa/{mesa_21.0.1.bb => mesa_21.0.2.bb}   |   0
 meta/recipes-graphics/pango/pango_1.48.2.bb   |   2 +
 ...h-Define-SYS_futex-if-it-does-not-ex.patch |  39 +++
 .../xorg-lib/libxshmfence_1.3.bb              |   4 +-
 meta/recipes-kernel/kmod/kmod.inc             |   1 -
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   2 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../lttng/lttng-tools_2.12.3.bb               |   4 +-
 .../modutils-initscripts/files/modutils.sh    |   1 +
 .../ca-certificates_20210119.bb               |   6 +-
 .../{nettle_3.7.1.bb => nettle_3.7.2.bb}      |   2 +-
 scripts/oe-debuginfod                         |  13 +-
 scripts/oe-time-dd-test.sh                    |   2 +-
 scripts/runqemu                               |  18 +-
 98 files changed, 2670 insertions(+), 221 deletions(-)
 mode change 100755 => 100644 meta/conf/machine/include/arm/arch-armv6m.inc
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
 rename meta/recipes-core/systemd/{systemd-boot_247.4.bb => systemd-boot_247.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_247.3.bb => systemd-conf_247.6.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
 rename meta/recipes-core/systemd/{systemd_247.4.bb => systemd_247.6.bb} (99%)
 rename meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc} (88%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.2.bb => go-binary-native_1.16.3.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.2.bb => go-cross-canadian_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.2.bb => go-cross_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.2.bb => go-crosssdk_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.2.bb => go-native_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.2.bb => go-runtime_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb} (100%)
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-automake.patch
 rename meta/recipes-devtools/python/{python3_3.9.2.bb => python3_3.9.4.bb} (99%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35517_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35517_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35517_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20181.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_6.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_10.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_6.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_7.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_8.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_9.patch
 rename meta/recipes-devtools/rpm/{rpm_4.16.1.2.bb => rpm_4.16.1.3.bb} (99%)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-20240.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/bug-image-compositor.ref.png
 rename meta/recipes-graphics/mesa/{mesa-gl_21.0.1.bb => mesa-gl_21.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.0.1.bb => mesa_21.0.2.bb} (100%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch
 rename meta/recipes-support/nettle/{nettle_3.7.1.bb => nettle_3.7.2.bb} (96%)

-- 
2.30.2

