Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9B7D973040
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 17:30:12 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id r141so5627814wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 09:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NuSd39P2Ho6Sph/SRNXDL05ZNttK+l/bQCCs/Kc/ZcI=;
	b=USK5tIrTVCeShydMqVIPx2xBPmQ+XIuRJ6Ig4QdKJTH0ea2PmyxvBTIFicyiqSnd9d
	CP7DX4nAmDStKr21oyE9YT9+HfIlzJKyIOQha6oL+2rpZfgCFjEP7gzwgD5GsX0iFH5L
	PslxFx32cyXS8Y4zfqzRfhlbI/z5uEgb8SqfxRtUmYlivFFqPiKaXjEaxKdWWbNfpj1O
	ykY4WrESJqIATgeR1uO7CoKjeSvsduGDjQ5UNnoQojyx2no7GjpUNrlosrR7EMD2e/95
	iKY+E3VqYXv7TNlPPYvBShCWyCCR4NLfd6Ei8gnwf5JNmLtFn370Dl6EkqAHMz08ZBab
	QA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NuSd39P2Ho6Sph/SRNXDL05ZNttK+l/bQCCs/Kc/ZcI=;
	b=N59+MZM/eiGkig3wkZqZYMrE6Z+5Ch8tCQo/DrrIGeG2h8WG8tGBkP9i39tR3zt+1a
	xa5ubw9pKSUGepruyXWwx1MvQEJZnKtSziSDPku71XgYFKXEWLAvb1VpuXri9/v32ZTI
	cMPoNfL539HyNDCVHgM7kcHEG8wIcjoF2b12xWfXpVaNaV390d+gm4k8c7KUt0Y3R98N
	15Oh0lAUnoMyXk76ho670fb24nSKEpXocdFH8pZEGA6NV1AoIYk228wrYnyihgoUGO1l
	mPNvKCs92MYhG9mQ2EC3K0p3BY06DueAEpdSALuJNNQLPuPJLszKl/zbGLHXSEDXIKnL
	bgDw==
X-Gm-Message-State: AMke39nPq3v32JsIUEWajGyKOHYl0Mm1UMFu7KeSAegTjVPVOdD30/0Rs32JQTRdR2GXkcCn
X-Received: by 10.28.62.144 with SMTP id l138mr3617872wma.50.1487871012599;
	Thu, 23 Feb 2017 09:30:12 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q12sm7686119wmd.8.2017.02.23.09.30.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 09:30:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 17:30:09 +0000
Message-Id: <cover.1487870887.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 00/68] Consolidated Pull
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
X-List-Received-Date: Thu, 23 Feb 2017 17:30:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Long consolidated pull, 100% green on the AB (excluding distrodata).

Note that this contains large amounts of master-next but master-next does
include some patches that are superceded by this series, so I recommend
reviewing this and then rebasing master-next.

Ross

The following changes since commit e436a6398684d2872cb541f1cfb0f67b3618d15a:

  layer.conf: bump version for change in eSDK selftest behaviour (2017-02-19 09:39:03 -0800)

are available in the git repository at:

  ssh://git@git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to ccfb9d7b44be942180e4294ef1031e501b5f1187:

  libva: Find the correct wayland-scanner (2017-02-23 15:03:21 +0000)

----------------------------------------------------------------
Alejandro Hernandez (1):
      eudev: Upgrade to 3.2.1

Amarnath Valluri (1):
      libarchive: Backport upstream fixes.

Andre McCurdy (2):
      arch-arm*.inc: squash whitespace within TUNE_FEATURES strings
      weston: fix LIC_FILES_CHKSUM endline and md5sum for src/compositor.c

Andreas Oberritter (1):
      ffmpeg: Fix the license description

Andy Kling (1):
      dbus: do not use systemctl from host for configure

Athanasios Oikonomou (1):
      lsb: lsb_release script incompatible with busybox head and find

Chen Qi (3):
      cups: upgrade to 2.2.2
      sysstat: upgrade to 11.5.4
      util-linux: upgrade to 2.29.1

Dominic Sacré (2):
      bitbake.conf: Point KERNELORG_MIRROR to cdn.kernel.org
      lib/oe/patch: Support xz-compressed patches

Ed Bartosh (1):
      image_types_wic: fix expansion error

Edwin Plauchu (1):
      swig: upgrade to 3.0.12

Hongxu Jia (1):
      ncurses: 6.0+20160625 -> 6.0+20161126

Humberto Ibarra (1):
      oeqa: fix typo

Jussi Kukkonen (9):
      vte: Upgrade 0.44.2 -> 0.46.1
      util-macros: Upgrade 1.19.0 -> 1.19.1
      presentproto: Upgrade 1.0 -> 1.1
      xauth: Upgrade 1.0.9 -> 1.0.10
      xf86-input-libinput: Upgrade 0.23.0 -> 0.24.0
      xkeyboard-config: Upgrade 2.19 -> 2.20
      libinput: Upgrade 1.6.0 -> 1.6.1
      piglit: Upgrade to current master
      libva: Find the correct wayland-scanner

Khem Raj (4):
      musl: Update to latest
      gdb: Upgrade to 7.12.1
      gmp: Update to 6.1.2
      qemu-native: Point python to python2 on build host

Luck Hoang (1):
      devtool: upgrade: fix error of import recipeutils

Mariano Lopez (2):
      oeqa/runtime/context.py: Fix use of getTarget() with testexport
      selftest/eSDK.py: Cleanup when there is an error in setUpClass

Markus Lehtonen (1):
      scripts/buildstats-diff: fix epoch numbers in --ver-diff

Maxin B. John (1):
      iptables: upgrade to 1.6.1

Mike Crowe (2):
      ccache: Upgrade to v3.3.4
      ccache: Switch to downloading xz tarball

Patrick Ohly (1):
      libarchive: fix bzip2 dependency for native build

Peter Bergin (1):
      useradd-staticids: fix typo for '--expiredate'

Philip Balister (1):
      cmake: Update to 3.7.2.

Richard Purdie (2):
      gcc-cross: Avoid races with gcc_stash_builddir
      depmodwrapper-cross/qemuwrapper-cross: Drop unneeded binutils dependency

Robert P. J. Day (2):
      docbook-xml: correct typo "do_configre"
      kexec-tools/kdump: Correct typo in comment "crashkenrel="

Robert Yang (13):
      terminal.bbclass: export configure vars
      kernel.bbclass: do_deploy requires depmodwrapper
      binconfig.bbclass: fix get_binconfig_mangle()
      libpcre2: add it for newer vte
      python-native: PROVIDES python-io-native
      tcl: extend to nativesdk
      gawk/json-glib/libcheck: extend to nativesdk
      tcl: fix sed in do_install()
      btrfs-tools: only target requires udev
      pigz: set downloadfilename
      eudev: set downloadfilename
      gettext: fix formatting issues
      security_flags.inc: let gettext be secure

Ross Burton (5):
      slang: rewrite recipe to run autoconf
      tremor: remove
      btrfs-tools: don't run autogen.sh
      gstreamer1.0-vaapi: inherit upstream-version-is-even
      unifdef: add UPSTREAM_CHECK_REGEX to filter out development snapshots

Saul Wold (1):
      native.bbclass: populate native recipe with it's files

Stefan Agner (1):
      linux-firmware: Add Marvell sd88xx WiFi firmwares

Stephen Arnold (1):
      gcc-6: Add fix for missing no-PIE flags

Tanu Kaskinen (3):
      alsa-lib: 1.1.2 -> 1.1.3
      alsa-lib: fix softfloat enabling
      alsa-lib: merge alsa-conf-base into alsa-conf

Yuanjie Huang (1):
      gcc: Fix CVE-2016-6131 in libiberty

 meta-selftest/lib/oeqa/runtime/cases/selftest.py   |   6 +-
 meta/classes/binconfig.bbclass                     |   4 +-
 meta/classes/image_types_wic.bbclass               |   2 +-
 meta/classes/kernel.bbclass                        |   2 +
 meta/classes/native.bbclass                        |   5 +
 meta/classes/terminal.bbclass                      |   2 +-
 meta/classes/testimage.bbclass                     |   6 +-
 meta/classes/useradd-staticids.bbclass             |   2 +-
 meta/conf/bitbake.conf                             |   2 +-
 meta/conf/distro/include/security_flags.inc        |   1 -
 meta/conf/machine/include/arm/arch-armv5-dsp.inc   |  30 +-
 meta/conf/machine/include/arm/arch-armv5.inc       |  22 +-
 meta/conf/machine/include/arm/arch-armv6.inc       |  30 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      | 102 +++----
 meta/conf/machine/include/arm/arch-armv7ve.inc     | 102 +++----
 meta/lib/oe/patch.py                               |   2 +-
 meta/lib/oeqa/core/target/qemu.py                  |   2 +-
 meta/lib/oeqa/oetest.py                            |  12 +-
 meta/lib/oeqa/runtime/context.py                   |  11 +-
 meta/lib/oeqa/selftest/eSDK.py                     |  46 +--
 meta/lib/oeqa/selftest/runtime-test.py             |   2 +-
 meta/lib/oeqa/utils/package_manager.py             |   4 +-
 meta/recipes-core/dbus/dbus_1.10.14.bb             |   1 +
 ...atement.c-timsort.h-fix-formatting-issues.patch |  87 ++++++
 meta/recipes-core/gettext/gettext_0.19.8.1.bb      |   1 +
 meta/recipes-core/musl/musl_git.bb                 |   2 +-
 .../ncurses/files/fix-cflags-mangle.patch          |  18 ++
 ...ses_6.0+20160625.bb => ncurses_6.0+20161126.bb} |   3 +-
 .../udev/{eudev_3.2.bb => eudev_3.2.1.bb}          |   6 +-
 .../{util-linux_2.29.bb => util-linux_2.29.1.bb}   |   4 +-
 .../btrfs-tools/btrfs-tools_4.8.5.bb               |  11 +-
 meta/recipes-devtools/ccache/ccache.inc            |   2 +-
 meta/recipes-devtools/ccache/ccache_3.3.3.bb       |  12 -
 meta/recipes-devtools/ccache/ccache_3.3.4.bb       |  12 +
 ...cmake-native_3.7.1.bb => cmake-native_3.7.2.bb} |   0
 meta/recipes-devtools/cmake/cmake.inc              |   4 +-
 .../cmake/{cmake_3.7.1.bb => cmake_3.7.2.bb}       |   0
 .../docbook-xml/docbook-xml-dtd4_4.5.bb            |   2 +-
 meta/recipes-devtools/gcc/gcc-5.4.inc              |   1 +
 .../gcc/gcc-5.4/CVE-2016-6131.patch                | 251 +++++++++++++++
 meta/recipes-devtools/gcc/gcc-6.3.inc              |   5 +-
 .../gcc/gcc-6.3/0054_all_nopie-all-flags.patch     |  22 ++
 .../gcc/gcc-6.3/CVE-2016-6131.patch                | 251 +++++++++++++++
 meta/recipes-devtools/gcc/gcc-cross.inc            |   2 +-
 .../gdb/{gdb-7.12.inc => gdb-7.12.1.inc}           |   5 +-
 ...nadian_7.12.bb => gdb-cross-canadian_7.12.1.bb} |   0
 .../gdb/{gdb-cross_7.12.bb => gdb-cross_7.12.1.bb} |   0
 .../cb93dc7f262978bafe36397a41a56e409a302042.patch |  43 ---
 .../gdb/{gdb_7.12.bb => gdb_7.12.1.bb}             |   0
 .../python/python-native_2.7.12.bb                 |   9 +-
 meta/recipes-devtools/qemu/qemu.inc                |   1 +
 .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb |   2 +
 .../swig/{swig_3.0.11.bb => swig_3.0.12.bb}        |   4 +-
 meta/recipes-devtools/tcltk/tcl_8.6.6.bb           |   6 +-
 meta/recipes-devtools/unifdef/unifdef_2.11.bb      |   2 +
 meta/recipes-extended/cups/cups_2.2.1.bb           |   6 -
 meta/recipes-extended/cups/cups_2.2.2.bb           |   6 +
 meta/recipes-extended/gawk/gawk_4.1.4.bb           |   2 +
 ...Add-option-to-enable-disable-libnfnetlink.patch |  28 +-
 ...check-conntrack-when-libnfnetlink-enabled.patch |  53 ++--
 .../{iptables_1.6.0.bb => iptables_1.6.1.bb}       |   4 +-
 ...te_disk_posix.c-make-_fsobj-functions-mor.patch | 245 +++++++++++++++
 ...02-Fix-extracting-hardlinks-over-symlinks.patch | 120 ++++++++
 .../libarchive/libarchive_3.2.2.bb                 |   7 +-
 ...elease-to-work-with-busybox-head-and-find.patch |  38 +++
 meta/recipes-extended/lsb/lsb_4.1.bb               |   1 +
 meta/recipes-extended/pigz/pigz_2.3.4.bb           |   2 +-
 .../slang/slang/dont-link-to-host.patch            |  16 +
 .../slang/slang/fix-check-pcre.patch               | 116 -------
 meta/recipes-extended/slang/slang/no-x.patch       |   4 +
 meta/recipes-extended/slang/slang/rpathfix.patch   |  82 -----
 .../slang-fix-the-iconv-existence-checking.patch   | 125 --------
 meta/recipes-extended/slang/slang_2.3.1.bb         |  23 +-
 .../{sysstat_11.5.3.bb => sysstat_11.5.4.bb}       |   4 +-
 meta/recipes-gnome/json-glib/json-glib_1.2.2.bb    |   2 +-
 ...-configure.ac-Use-wayland-scanner-in-PATH.patch |  37 +++
 ...and-Don-t-commit-and-ship-generated-files.patch | 339 +++++++++++++++++++++
 meta/recipes-graphics/libva/libva_1.7.3.bb         |   6 +-
 .../0001-cmake-Link-test-utils-with-ldl.patch      |  41 ---
 ...0001-cmake-Link-utils-with-xcb-explicitly.patch |  54 ----
 meta/recipes-graphics/piglit/piglit_git.bb         |  10 +-
 .../{libinput_1.6.0.bb => libinput_1.6.1.bb}       |   4 +-
 meta/recipes-graphics/wayland/weston_1.11.1.bb     |   2 +-
 .../xorg-app/{xauth_1.0.9.bb => xauth_1.0.10.bb}   |   4 +-
 ...put_0.23.0.bb => xf86-input-libinput_0.24.0.bb} |   4 +-
 ...ard-config_2.19.bb => xkeyboard-config_2.20.bb} |   4 +-
 .../xorg-proto/presentproto_git.bb                 |   6 +-
 ...util-macros_1.19.0.bb => util-macros_1.19.1.bb} |   4 +-
 meta/recipes-kernel/kexec/kexec-tools/kdump        |   2 +-
 .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb |   2 +
 .../linux-firmware/linux-firmware_git.bb           |  17 +-
 meta/recipes-multimedia/alsa/alsa-fpu.inc          |   8 +-
 .../alsa-lib/0001-ucm-parser-needs-limits.h.patch  |  33 ++
 .../alsa/{alsa-lib_1.1.2.bb => alsa-lib_1.1.3.bb}  |  30 +-
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb     |  12 +-
 .../gstreamer/gstreamer1.0-vaapi.inc               |   2 +-
 .../tremor/tremor/obsolete_automake_macros.patch   |  15 -
 .../tremor/tremor/tremor-arm-thumb2.patch          | 104 -------
 meta/recipes-multimedia/tremor/tremor_20150107.bb  |  32 --
 ...user-provided-flags-to-the-auto-detected-.patch |   0
 ...re.ac-Believe-the-cflags-from-environment.patch |   0
 .../gmp/{gmp-6.1.1 => gmp-6.1.2}/amd64.patch       |   0
 .../{gmp-6.1.1 => gmp-6.1.2}/use-includedir.patch  |   0
 .../gmp/{gmp_6.1.1.bb => gmp_6.1.2.bb}             |   5 +-
 meta/recipes-support/libcheck/libcheck_0.10.0.bb   |   2 +-
 .../libpcre/libpcre2/pcre-cross.patch              |  65 ++++
 meta/recipes-support/libpcre/libpcre2_10.22.bb     |  56 ++++
 .../vte/{vte_0.44.2.bb => vte_0.46.1.bb}           |   8 +-
 scripts/buildstats-diff                            |   2 +-
 scripts/lib/devtool/upgrade.py                     |   4 +
 110 files changed, 2019 insertions(+), 945 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
 create mode 100644 meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
 rename meta/recipes-core/ncurses/{ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb} (73%)
 rename meta/recipes-core/udev/{eudev_3.2.bb => eudev_3.2.1.bb} (94%)
 rename meta/recipes-core/util-linux/{util-linux_2.29.bb => util-linux_2.29.1.bb} (86%)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.3.3.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.3.4.bb
 rename meta/recipes-devtools/cmake/{cmake-native_3.7.1.bb => cmake-native_3.7.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.7.1.bb => cmake_3.7.2.bb} (100%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.4/CVE-2016-6131.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0054_all_nopie-all-flags.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch
 rename meta/recipes-devtools/gdb/{gdb-7.12.inc => gdb-7.12.1.inc} (83%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.12.bb => gdb-cross-canadian_7.12.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.12.bb => gdb-cross_7.12.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/cb93dc7f262978bafe36397a41a56e409a302042.patch
 rename meta/recipes-devtools/gdb/{gdb_7.12.bb => gdb_7.12.1.bb} (100%)
 rename meta/recipes-devtools/swig/{swig_3.0.11.bb => swig_3.0.12.bb} (58%)
 delete mode 100644 meta/recipes-extended/cups/cups_2.2.1.bb
 create mode 100644 meta/recipes-extended/cups/cups_2.2.2.bb
 rename meta/recipes-extended/iptables/{iptables_1.6.0.bb => iptables_1.6.1.bb} (93%)
 create mode 100644 meta/recipes-extended/libarchive/files/0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch
 create mode 100644 meta/recipes-extended/libarchive/files/0002-Fix-extracting-hardlinks-over-symlinks.patch
 create mode 100644 meta/recipes-extended/lsb/lsb/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch
 create mode 100644 meta/recipes-extended/slang/slang/dont-link-to-host.patch
 delete mode 100644 meta/recipes-extended/slang/slang/fix-check-pcre.patch
 delete mode 100644 meta/recipes-extended/slang/slang/rpathfix.patch
 delete mode 100644 meta/recipes-extended/slang/slang/slang-fix-the-iconv-existence-checking.patch
 rename meta/recipes-extended/sysstat/{sysstat_11.5.3.bb => sysstat_11.5.4.bb} (53%)
 create mode 100644 meta/recipes-graphics/libva/files/0001-configure.ac-Use-wayland-scanner-in-PATH.patch
 create mode 100644 meta/recipes-graphics/libva/files/0001-wayland-Don-t-commit-and-ship-generated-files.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-test-utils-with-ldl.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch
 rename meta/recipes-graphics/wayland/{libinput_1.6.0.bb => libinput_1.6.1.bb} (85%)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.9.bb => xauth_1.0.10.bb} (75%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.23.0.bb => xf86-input-libinput_0.24.0.bb} (63%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.19.bb => xkeyboard-config_2.20.bb} (88%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.19.0.bb => util-macros_1.19.1.bb} (75%)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.2.bb => alsa-lib_1.1.3.bb} (61%)
 delete mode 100644 meta/recipes-multimedia/tremor/tremor/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-multimedia/tremor/tremor/tremor-arm-thumb2.patch
 delete mode 100644 meta/recipes-multimedia/tremor/tremor_20150107.bb
 rename meta/recipes-support/gmp/{gmp-6.1.1 => gmp-6.1.2}/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.1 => gmp-6.1.2}/0001-confiure.ac-Believe-the-cflags-from-environment.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.1 => gmp-6.1.2}/amd64.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.1 => gmp-6.1.2}/use-includedir.patch (100%)
 rename meta/recipes-support/gmp/{gmp_6.1.1.bb => gmp_6.1.2.bb} (88%)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/pcre-cross.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre2_10.22.bb
 rename meta/recipes-support/vte/{vte_0.44.2.bb => vte_0.46.1.bb} (86%)

Alejandro Hernandez (1):
  eudev: Upgrade to 3.2.1

Amarnath Valluri (1):
  libarchive: Backport upstream fixes.

Andre McCurdy (2):
  arch-arm*.inc: squash whitespace within TUNE_FEATURES strings
  weston: fix LIC_FILES_CHKSUM endline and md5sum for src/compositor.c

Andreas Oberritter (1):
  ffmpeg: Fix the license description

Andy Kling (1):
  dbus: do not use systemctl from host for configure

Athanasios Oikonomou (1):
  lsb: lsb_release script incompatible with busybox head and find

Chen Qi (3):
  cups: upgrade to 2.2.2
  sysstat: upgrade to 11.5.4
  util-linux: upgrade to 2.29.1

Dominic Sacré (2):
  bitbake.conf: Point KERNELORG_MIRROR to cdn.kernel.org
  lib/oe/patch: Support xz-compressed patches

Ed Bartosh (1):
  image_types_wic: fix expansion error

Edwin Plauchu (1):
  swig: upgrade to 3.0.12

Hongxu Jia (1):
  ncurses: 6.0+20160625 -> 6.0+20161126

Humberto Ibarra (1):
  oeqa: fix typo

Jussi Kukkonen (9):
  vte: Upgrade 0.44.2 -> 0.46.1
  util-macros: Upgrade 1.19.0 -> 1.19.1
  presentproto: Upgrade 1.0 -> 1.1
  xauth: Upgrade 1.0.9 -> 1.0.10
  xf86-input-libinput: Upgrade 0.23.0 -> 0.24.0
  xkeyboard-config: Upgrade 2.19 -> 2.20
  libinput: Upgrade 1.6.0 -> 1.6.1
  piglit: Upgrade to current master
  libva: Find the correct wayland-scanner

Khem Raj (4):
  musl: Update to latest
  gdb: Upgrade to 7.12.1
  gmp: Update to 6.1.2
  qemu-native: Point python to python2 on build host

Luck Hoang (1):
  devtool: upgrade: fix error of import recipeutils

Mariano Lopez (2):
  oeqa/runtime/context.py: Fix use of getTarget() with testexport
  selftest/eSDK.py: Cleanup when there is an error in setUpClass

Markus Lehtonen (1):
  scripts/buildstats-diff: fix epoch numbers in --ver-diff

Maxin B. John (1):
  iptables: upgrade to 1.6.1

Mike Crowe (2):
  ccache: Upgrade to v3.3.4
  ccache: Switch to downloading xz tarball

Patrick Ohly (1):
  libarchive: fix bzip2 dependency for native build

Peter Bergin (1):
  useradd-staticids: fix typo for '--expiredate'

Philip Balister (1):
  cmake: Update to 3.7.2.

Richard Purdie (2):
  gcc-cross: Avoid races with gcc_stash_builddir
  depmodwrapper-cross/qemuwrapper-cross: Drop unneeded binutils
    dependency

Robert P. J. Day (2):
  docbook-xml: correct typo "do_configre"
  kexec-tools/kdump: Correct typo in comment "crashkenrel="

Robert Yang (13):
  terminal.bbclass: export configure vars
  kernel.bbclass: do_deploy requires depmodwrapper
  binconfig.bbclass: fix get_binconfig_mangle()
  libpcre2: add it for newer vte
  python-native: PROVIDES python-io-native
  tcl: extend to nativesdk
  gawk/json-glib/libcheck: extend to nativesdk
  tcl: fix sed in do_install()
  btrfs-tools: only target requires udev
  pigz: set downloadfilename
  eudev: set downloadfilename
  gettext: fix formatting issues
  security_flags.inc: let gettext be secure

Ross Burton (5):
  slang: rewrite recipe to run autoconf
  tremor: remove
  btrfs-tools: don't run autogen.sh
  gstreamer1.0-vaapi: inherit upstream-version-is-even
  unifdef: add UPSTREAM_CHECK_REGEX to filter out development snapshots

Saul Wold (1):
  native.bbclass: populate native recipe with it's files

Stefan Agner (1):
  linux-firmware: Add Marvell sd88xx WiFi firmwares

Stephen Arnold (1):
  gcc-6: Add fix for missing no-PIE flags

Tanu Kaskinen (3):
  alsa-lib: 1.1.2 -> 1.1.3
  alsa-lib: fix softfloat enabling
  alsa-lib: merge alsa-conf-base into alsa-conf

Yuanjie Huang (1):
  gcc: Fix CVE-2016-6131 in libiberty

 meta-selftest/lib/oeqa/runtime/cases/selftest.py   |   6 +-
 meta/classes/binconfig.bbclass                     |   4 +-
 meta/classes/image_types_wic.bbclass               |   2 +-
 meta/classes/kernel.bbclass                        |   2 +
 meta/classes/native.bbclass                        |   5 +
 meta/classes/terminal.bbclass                      |   2 +-
 meta/classes/testimage.bbclass                     |   6 +-
 meta/classes/useradd-staticids.bbclass             |   2 +-
 meta/conf/bitbake.conf                             |   2 +-
 meta/conf/distro/include/security_flags.inc        |   1 -
 meta/conf/machine/include/arm/arch-armv5-dsp.inc   |  30 +-
 meta/conf/machine/include/arm/arch-armv5.inc       |  22 +-
 meta/conf/machine/include/arm/arch-armv6.inc       |  30 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      | 102 +++----
 meta/conf/machine/include/arm/arch-armv7ve.inc     | 102 +++----
 meta/lib/oe/patch.py                               |   2 +-
 meta/lib/oeqa/core/target/qemu.py                  |   2 +-
 meta/lib/oeqa/oetest.py                            |  12 +-
 meta/lib/oeqa/runtime/context.py                   |  11 +-
 meta/lib/oeqa/selftest/eSDK.py                     |  46 +--
 meta/lib/oeqa/selftest/runtime-test.py             |   2 +-
 meta/lib/oeqa/utils/package_manager.py             |   4 +-
 meta/recipes-core/dbus/dbus_1.10.14.bb             |   1 +
 ...atement.c-timsort.h-fix-formatting-issues.patch |  87 ++++++
 meta/recipes-core/gettext/gettext_0.19.8.1.bb      |   1 +
 meta/recipes-core/musl/musl_git.bb                 |   2 +-
 .../ncurses/files/fix-cflags-mangle.patch          |  18 ++
 ...ses_6.0+20160625.bb => ncurses_6.0+20161126.bb} |   3 +-
 .../udev/{eudev_3.2.bb => eudev_3.2.1.bb}          |   6 +-
 .../{util-linux_2.29.bb => util-linux_2.29.1.bb}   |   4 +-
 .../btrfs-tools/btrfs-tools_4.8.5.bb               |  11 +-
 meta/recipes-devtools/ccache/ccache.inc            |   2 +-
 .../ccache/{ccache_3.3.3.bb => ccache_3.3.4.bb}    |   6 +-
 ...cmake-native_3.7.1.bb => cmake-native_3.7.2.bb} |   0
 meta/recipes-devtools/cmake/cmake.inc              |   4 +-
 .../cmake/{cmake_3.7.1.bb => cmake_3.7.2.bb}       |   0
 .../docbook-xml/docbook-xml-dtd4_4.5.bb            |   2 +-
 meta/recipes-devtools/gcc/gcc-5.4.inc              |   1 +
 .../gcc/gcc-5.4/CVE-2016-6131.patch                | 251 +++++++++++++++
 meta/recipes-devtools/gcc/gcc-6.3.inc              |   5 +-
 .../gcc/gcc-6.3/0054_all_nopie-all-flags.patch     |  22 ++
 .../gcc/gcc-6.3/CVE-2016-6131.patch                | 251 +++++++++++++++
 meta/recipes-devtools/gcc/gcc-cross.inc            |   2 +-
 .../gdb/{gdb-7.12.inc => gdb-7.12.1.inc}           |   5 +-
 ...nadian_7.12.bb => gdb-cross-canadian_7.12.1.bb} |   0
 .../gdb/{gdb-cross_7.12.bb => gdb-cross_7.12.1.bb} |   0
 .../cb93dc7f262978bafe36397a41a56e409a302042.patch |  43 ---
 .../gdb/{gdb_7.12.bb => gdb_7.12.1.bb}             |   0
 .../python/python-native_2.7.12.bb                 |   9 +-
 meta/recipes-devtools/qemu/qemu.inc                |   1 +
 .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb |   2 +
 .../swig/{swig_3.0.11.bb => swig_3.0.12.bb}        |   4 +-
 meta/recipes-devtools/tcltk/tcl_8.6.6.bb           |   6 +-
 meta/recipes-devtools/unifdef/unifdef_2.11.bb      |   2 +
 .../cups/{cups_2.2.1.bb => cups_2.2.2.bb}          |   4 +-
 meta/recipes-extended/gawk/gawk_4.1.4.bb           |   2 +
 ...Add-option-to-enable-disable-libnfnetlink.patch |  28 +-
 ...check-conntrack-when-libnfnetlink-enabled.patch |  53 ++--
 .../{iptables_1.6.0.bb => iptables_1.6.1.bb}       |   4 +-
 ...te_disk_posix.c-make-_fsobj-functions-mor.patch | 245 +++++++++++++++
 ...02-Fix-extracting-hardlinks-over-symlinks.patch | 120 ++++++++
 .../libarchive/libarchive_3.2.2.bb                 |   7 +-
 ...elease-to-work-with-busybox-head-and-find.patch |  38 +++
 meta/recipes-extended/lsb/lsb_4.1.bb               |   1 +
 meta/recipes-extended/pigz/pigz_2.3.4.bb           |   2 +-
 .../slang/slang/dont-link-to-host.patch            |  16 +
 .../slang/slang/fix-check-pcre.patch               | 116 -------
 meta/recipes-extended/slang/slang/no-x.patch       |   4 +
 meta/recipes-extended/slang/slang/rpathfix.patch   |  82 -----
 .../slang-fix-the-iconv-existence-checking.patch   | 125 --------
 meta/recipes-extended/slang/slang_2.3.1.bb         |  23 +-
 .../{sysstat_11.5.3.bb => sysstat_11.5.4.bb}       |   4 +-
 meta/recipes-gnome/json-glib/json-glib_1.2.2.bb    |   2 +-
 ...-configure.ac-Use-wayland-scanner-in-PATH.patch |  37 +++
 ...and-Don-t-commit-and-ship-generated-files.patch | 339 +++++++++++++++++++++
 meta/recipes-graphics/libva/libva_1.7.3.bb         |   6 +-
 .../0001-cmake-Link-test-utils-with-ldl.patch      |  41 ---
 ...0001-cmake-Link-utils-with-xcb-explicitly.patch |  54 ----
 meta/recipes-graphics/piglit/piglit_git.bb         |  10 +-
 .../{libinput_1.6.0.bb => libinput_1.6.1.bb}       |   4 +-
 meta/recipes-graphics/wayland/weston_1.11.1.bb     |   2 +-
 .../xorg-app/{xauth_1.0.9.bb => xauth_1.0.10.bb}   |   4 +-
 ...put_0.23.0.bb => xf86-input-libinput_0.24.0.bb} |   4 +-
 ...ard-config_2.19.bb => xkeyboard-config_2.20.bb} |   4 +-
 .../xorg-proto/presentproto_git.bb                 |   6 +-
 ...util-macros_1.19.0.bb => util-macros_1.19.1.bb} |   4 +-
 meta/recipes-kernel/kexec/kexec-tools/kdump        |   2 +-
 .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb |   2 +
 .../linux-firmware/linux-firmware_git.bb           |  17 +-
 meta/recipes-multimedia/alsa/alsa-fpu.inc          |   8 +-
 .../alsa-lib/0001-ucm-parser-needs-limits.h.patch  |  33 ++
 .../alsa/{alsa-lib_1.1.2.bb => alsa-lib_1.1.3.bb}  |  30 +-
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb     |  12 +-
 .../gstreamer/gstreamer1.0-vaapi.inc               |   2 +-
 .../tremor/tremor/obsolete_automake_macros.patch   |  15 -
 .../tremor/tremor/tremor-arm-thumb2.patch          | 104 -------
 meta/recipes-multimedia/tremor/tremor_20150107.bb  |  32 --
 ...user-provided-flags-to-the-auto-detected-.patch |   0
 ...re.ac-Believe-the-cflags-from-environment.patch |   0
 .../gmp/{gmp-6.1.1 => gmp-6.1.2}/amd64.patch       |   0
 .../{gmp-6.1.1 => gmp-6.1.2}/use-includedir.patch  |   0
 .../gmp/{gmp_6.1.1.bb => gmp_6.1.2.bb}             |   5 +-
 meta/recipes-support/libcheck/libcheck_0.10.0.bb   |   2 +-
 .../libpcre/libpcre2/pcre-cross.patch              |  65 ++++
 meta/recipes-support/libpcre/libpcre2_10.22.bb     |  56 ++++
 .../vte/{vte_0.44.2.bb => vte_0.46.1.bb}           |   8 +-
 scripts/buildstats-diff                            |   2 +-
 scripts/lib/devtool/upgrade.py                     |   4 +
 108 files changed, 2006 insertions(+), 932 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
 create mode 100644 meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
 rename meta/recipes-core/ncurses/{ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb} (73%)
 rename meta/recipes-core/udev/{eudev_3.2.bb => eudev_3.2.1.bb} (94%)
 rename meta/recipes-core/util-linux/{util-linux_2.29.bb => util-linux_2.29.1.bb} (86%)
 rename meta/recipes-devtools/ccache/{ccache_3.3.3.bb => ccache_3.3.4.bb} (48%)
 rename meta/recipes-devtools/cmake/{cmake-native_3.7.1.bb => cmake-native_3.7.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.7.1.bb => cmake_3.7.2.bb} (100%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.4/CVE-2016-6131.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0054_all_nopie-all-flags.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch
 rename meta/recipes-devtools/gdb/{gdb-7.12.inc => gdb-7.12.1.inc} (83%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.12.bb => gdb-cross-canadian_7.12.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.12.bb => gdb-cross_7.12.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/cb93dc7f262978bafe36397a41a56e409a302042.patch
 rename meta/recipes-devtools/gdb/{gdb_7.12.bb => gdb_7.12.1.bb} (100%)
 rename meta/recipes-devtools/swig/{swig_3.0.11.bb => swig_3.0.12.bb} (58%)
 rename meta/recipes-extended/cups/{cups_2.2.1.bb => cups_2.2.2.bb} (40%)
 rename meta/recipes-extended/iptables/{iptables_1.6.0.bb => iptables_1.6.1.bb} (93%)
 create mode 100644 meta/recipes-extended/libarchive/files/0001-archive_write_disk_posix.c-make-_fsobj-functions-mor.patch
 create mode 100644 meta/recipes-extended/libarchive/files/0002-Fix-extracting-hardlinks-over-symlinks.patch
 create mode 100644 meta/recipes-extended/lsb/lsb/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch
 create mode 100644 meta/recipes-extended/slang/slang/dont-link-to-host.patch
 delete mode 100644 meta/recipes-extended/slang/slang/fix-check-pcre.patch
 delete mode 100644 meta/recipes-extended/slang/slang/rpathfix.patch
 delete mode 100644 meta/recipes-extended/slang/slang/slang-fix-the-iconv-existence-checking.patch
 rename meta/recipes-extended/sysstat/{sysstat_11.5.3.bb => sysstat_11.5.4.bb} (53%)
 create mode 100644 meta/recipes-graphics/libva/files/0001-configure.ac-Use-wayland-scanner-in-PATH.patch
 create mode 100644 meta/recipes-graphics/libva/files/0001-wayland-Don-t-commit-and-ship-generated-files.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-test-utils-with-ldl.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch
 rename meta/recipes-graphics/wayland/{libinput_1.6.0.bb => libinput_1.6.1.bb} (85%)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.9.bb => xauth_1.0.10.bb} (75%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.23.0.bb => xf86-input-libinput_0.24.0.bb} (63%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.19.bb => xkeyboard-config_2.20.bb} (88%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.19.0.bb => util-macros_1.19.1.bb} (75%)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.2.bb => alsa-lib_1.1.3.bb} (61%)
 delete mode 100644 meta/recipes-multimedia/tremor/tremor/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-multimedia/tremor/tremor/tremor-arm-thumb2.patch
 delete mode 100644 meta/recipes-multimedia/tremor/tremor_20150107.bb
 rename meta/recipes-support/gmp/{gmp-6.1.1 => gmp-6.1.2}/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.1 => gmp-6.1.2}/0001-confiure.ac-Believe-the-cflags-from-environment.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.1 => gmp-6.1.2}/amd64.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.1 => gmp-6.1.2}/use-includedir.patch (100%)
 rename meta/recipes-support/gmp/{gmp_6.1.1.bb => gmp_6.1.2.bb} (88%)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/pcre-cross.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre2_10.22.bb
 rename meta/recipes-support/vte/{vte_0.44.2.bb => vte_0.46.1.bb} (86%)

-- 
2.8.1


