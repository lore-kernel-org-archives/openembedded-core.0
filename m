Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 738EC65CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:58:11 +0000 (UTC)
Received: by wmww144 with SMTP id w144so20031310wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=MLHww5U2KeorFDsgA8UmdRUuw61TQwxMCdkzuxBiy4w=;
	b=aD5uHDmw76gT/JwN/0Fe6+sIJzZW86CNalfBLX/QXzliEGYhATGNaUW3WoZifps+4e
	ozwOITjP9dELsbRCrCYq1Kgg4/VH4H+V2pXwMJmyWBQH7Mxo7Z7rW8o+1aTfArNrSBko
	k2uz/D/kExGkWkaO7X6oC4nz6EV3fI1PpSA3DY7+YFX8H1PlKKLHx75ndBKc2BYcIB4M
	gkwdsKsGhQzpZql3n4FcfpRhECntexOa6YJD+mQuP6ANbIDzXAuEU0mk4i6xk+bedcFw
	pPpvjVXiylcTBsc2EktoYoSrzRi+Djw+Zv2R3sjMeF0yyjyXoL/xxnIPGJfgDTQiP6Zk
	3Zhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=MLHww5U2KeorFDsgA8UmdRUuw61TQwxMCdkzuxBiy4w=;
	b=LOHieSKEq94c4QDNU6ZMQlV5fiCENaJCZoxKqQ6OCmiOcOGOUvaQoMDXBEipnwq/ZY
	Lzwry/OLcEJRFkVVWFF3MfESkdzpyIOxu2O71G8BLCB6t9sNUNfaSEES5k0/eZ6mAENG
	0lObIA4i0LRqQf6V+4sKqkT/ndCK+WcI5bgo5I8XSZTgBdty9QUtboh4cWB7pEHS5+YR
	DWCDxLFCtcTI8z6IfcTIliE0CU91VgMg19Q+an5j+Csi/+A7EDW+nxZC/kCrdrsyPEOR
	ox0TM8R2e2VIX0Ph1/8xYnj2P0t6EIkiIsKAsbHvyYofz2xCg4VQI6QJfHOKrenfcUVC
	atdA==
X-Gm-Message-State: ALoCoQnzKppqX13JkoAE6ofITg3NihqiglF/ZW4gAbBx+mlvELI3S+U49BXV2MEVT1Z5Ac/Ycfkw
X-Received: by 10.28.14.140 with SMTP id 134mr6832407wmo.44.1447192691041;
	Tue, 10 Nov 2015 13:58:11 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id hk1sm5697581wjb.6.2015.11.10.13.58.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Nov 2015 13:58:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Nov 2015 21:49:50 +0000
Message-Id: <cover.1447192109.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 000/105] Master unfreeze merge request
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
X-List-Received-Date: Tue, 10 Nov 2015 21:58:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Just a short series to unfreeze master now that Jethro is releasing...

Ross

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 6aa8a1795c44bb214948ff9a63f3778012a5b916:

  maintainers: mass reassign and cleanup (2015-11-09 16:16:07 +0000)

----------------------------------------------------------------
Alexander D. Kanevskiy (1):
      combo-layer: introduce ability to exclude component from mass update

Andre McCurdy (8):
      scons.bbclass: SCons packages don't require do_configure
      python: don't append -D__SOFTFP__ to TARGET_CC_ARCH for armv6/armv7a
      cairo: fix license for cairo-script-interpreter
      cmake.bbclass: don't duplicate CMAKE_C_FLAGS in CMAKE_C_FLAGS_RELEASE
      lsof: don't export EXTRA_OEMAKE
      cmake: update 3.3.1 -> 3.3.2
      cairo.inc: drop obsolete CFLAGS += "-ffat-lto-objects" workaround
      cairo: update 1.14.2 -> 1.14.4

Aníbal Limón (1):
      acpid: Upgrade to 2.0.25

Armin Kuster (1):
      libxslt: CVE-2015-7995

Carlos Rafael Giani (7):
      gstreamer1.0: upgrade to version 1.6.1
      gstreamer1.0-plugins-base: upgrade to version 1.6.1
      gstreamer1.0-plugins-good: upgrade to version 1.6.1
      gstreamer1.0-plugins-bad: upgrade to version 1.6.1
      gstreamer1.0-plugins-ugly: upgrade to version 1.6.1
      gstreamer1.0-libav: upgrade to version 1.6.1
      gstreamer1.0-rtsp-server: upgrade to version 1.6.1

Chen Qi (2):
      nfs-utils/statd: fix a segfault
      toolchain-script: use immediate expansion for TOOLCHAIN_CONFIGSITE_NOCACHE

Craig McQueen (1):
      os-release: put double-quotes around variable contents

Hongxu Jia (1):
      default-distrovars: remove less from WHITELIST_GPL-3.0

Ioan-Adrian Ratiu (1):
      ptest-runner: Allow running of specific tests

Jackie Huang (1):
      qemu: enable user mode for mips64 and mips64el

Jate Sujjavanich (1):
      rm_work.bbclass: Exclude do_rootfs stamp removal

Jens Rehsack (1):
      gbm: Fix "configure: error: gbm requires --enable-dri"

Josh Cartwright (1):
      rt-tests: bump to v0.94

Joshua Lock (6):
      systemd: add PACKAGECONFIG to build with compatibility libraries
      weston: add PACKAGECONFIG to build with systemd-login support
      systemd: make dbus an optional build time dependency
      weston: add a PACKAGECONFIG option for xwayland support
      xserver-xorg: add Xwayland RRECOMMENDS
      xserver-xorg: drop empty ${PN}-security-policy package

Jun Zhang (2):
      cpio: Fix symlink-bad-length test for 64-bit [ LIN8-947 ] architectures.
      cpio: fix testcase symlink-bad-lengths [ LIN8-947 ]

Kai Kang (3):
      sqlite: 3.8.10.2 -> 3.9.0
      libidn: 1.30 -> 1.32
      openssh: enable X11Forwarding if distro feature x11 is set

Khem Raj (2):
      busybox: Fix mdev block device automounting
      busybox: Schedule mdev after mountall

Leonardo Sandoval (4):
      yocto-bsp: Default kernel version to 4.1 on x86_64
      qemurunner: Enable timestamps on kernel boot-up
      yocto-bsp: Avoid duplication of user patches ({{=machine}}-user-patches.scc)
      yocto-bsp: Typo on the file extension

Lucian Musat (1):
      oeqa/testimage: Add support for test folder export.

Mariano Lopez (1):
      qemurunner: Remove the timeout in run_serial

Mark Hatle (6):
      binutils: Fix octeon3 disassembly patch
      binutils: Fix XLP / Octeon 3 instruction clash
      glibc: Fix ld.so / prelink interface for ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA
      gcc: Update default Power GCC settings to use secure-plt
      prelink: Fix various prelink issues on IA32, ARM, and MIPS.
      Revert "local.conf.sample: Disable image-prelink by default"

Maxin B. John (1):
      gnome-desktop-testing: fix ptest output format

Paul Eggleton (24):
      verify-homepage: use scriptpath to find bitbake path
      verify-homepage: get expanded HOMEPAGE value
      verify-homepage: tidy up output and comments
      verify-homepage: fix recipe file selection
      gptfdisk: add SUMMARY
      libunwind: add SUMMARY
      stress: add SUMMARY
      python-nose: add SUMMARY
      linux-yocto.inc: set SUMMARY instead of DESCRIPTION
      tzcode-native: set SUMMARY instead of DESCRIPTION
      alsa-plugins: set SUMMARY instead of DESCRIPTION
      swig: set SUMMARY instead of DESCRIPTION
      mmc-utils: set SUMMARY instead of DESCRIPTION
      gstreamer1.0-meta-base: set SUMMARY instead of DESCRIPTION
      texinfo-dummy-native: set SUMMARY instead of DESCRIPTION
      meta/conf/layer.conf: fix typo
      meta: Fix typos in Upstream-Status labels
      gitignore: fix overzealous exclusion
      conf/distro/include: drop old recipes from include files
      classes/buildhistory: split package history values only once
      classes/distrodata: split SRC_URI properly before determining type
      oeqa/selftest/devtool: fix test if build directory is not inside COREBASE
      oeqa/selftest/layerappend: fix test if build directory is not inside COREBASE
      oe-selftest: add test for bitbake-layers show-recipes

Pushpal Sidhu (1):
      webkitgtk: Add upstream patch to fix build problem

Robert Yang (6):
      prexport.bbclass: avoid export for native and crosssdk
      debianutils: fix ALTERNATIVE_PRIORITY conflict with which
      console-tools: fix ALTERNATIVE_PRIORITY conflict with kbd
      util-linux: fix ALTERNATIVE_PRIORITY conflict with ncurses procps and e2fsprogs
      coreutils: fix ALTERNATIVE_PRIORITY conflict with procps and mktemp
      gtk+3: fix ALTERNATIVE_PRIORITY conflict with gtk+

Ross Burton (10):
      libarchive: rename patch to reflect CVE
      oeqa/runtime: remove dmesg test
      oeqa/runtime/multilib: run the arch tests on connmand not connman-applet
      qemu: upgrade to 2.4.0.1
      readline: rename patch to contain CVE reference
      unzip: rename patch to reflect CVE fix
      at: modify sources in do_patch
      runqemu: don't specify IP when starting a VNC server
      libaio: don't disable linking to the system libraries
      maintainers: mass reassign and cleanup

Roy Li (1):
      rpm: define EM_AARCH64 for debugedit

Ruslan Bilovol (1):
      scripts: runqemu: remove QEMUARCH from help message

Stefan Christ (5):
      linux-dtb.inc: remove unneeded 'cd'
      linux-dtb.inc: use same variable name DTB for all elements of KERNEL_DEVICETREE
      linux-dtb.inc: explicit test for empty string not needed
      linux-dtb.inc: refactor common code to function normalize_dtb
      linux-dtb.inc: refactor common code to function get_real_dtb_path_in_kernel

Wenzong Fan (3):
      recipes: add distro_features_check for some packages
      gnupg: fix find-version for beta checking
      openssl: fix mips64 configure support

yadi.hu@windriver.com (1):
      xinetd: install xinetd supported services configuration

 .gitignore                                         |   2 +-
 meta-yocto/conf/distro/include/maintainers.inc     | 701 +++++++++++----------
 meta-yocto/conf/local.conf.sample                  |   4 +-
 meta/classes/buildhistory.bbclass                  |   2 +-
 meta/classes/cmake.bbclass                         |  10 +-
 meta/classes/distrodata.bbclass                    |   4 +-
 meta/classes/prexport.bbclass                      |   5 +-
 meta/classes/rm_work.bbclass                       |   4 +
 meta/classes/scons.bbclass                         |   2 +
 meta/classes/testimage.bbclass                     |  18 +-
 meta/classes/toolchain-scripts.bbclass             |   2 +-
 meta/conf/distro/include/as-needed.inc             |   3 -
 meta/conf/distro/include/default-distrovars.inc    |   2 +-
 meta/conf/distro/include/distro_alias.inc          |  58 --
 meta/conf/layer.conf                               |   2 +-
 meta/lib/oeqa/runtime/dmesg.py                     |  12 -
 meta/lib/oeqa/runtime/multilib.py                  |   8 +-
 meta/lib/oeqa/selftest/bblayers.py                 |  25 +
 meta/lib/oeqa/selftest/devtool.py                  |   2 +-
 meta/lib/oeqa/selftest/layerappend.py              |   9 +-
 meta/lib/oeqa/utils/qemurunner.py                  |  20 +-
 .../acpid/{acpid_2.0.23.bb => acpid_2.0.25.bb}     |   4 +-
 ...tatd-fix-a-segfault-caused-by-improper-us.patch | 113 ++++
 .../nfs-utils/nfs-utils_1.3.1.bb                   |   1 +
 meta/recipes-connectivity/openssh/openssh_7.1p1.bb |   6 +-
 meta/recipes-connectivity/openssl/openssl.inc      |   2 +-
 .../openssl/crypto_use_bigint_in_x86-64_perl.patch |   2 +-
 meta/recipes-core/busybox/busybox.inc              |   4 +-
 meta/recipes-core/busybox/files/mdev-mount.sh      |   8 +-
 .../console-tools/console-tools_0.3.2.bb           |   2 +-
 meta/recipes-core/coreutils/coreutils_8.24.bb      |   2 +-
 ...TYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch |  84 +++
 meta/recipes-core/glibc/glibc_2.22.bb              |   1 +
 meta/recipes-core/os-release/os-release.bb         |   2 +-
 ...ne63-003.patch => readline-cve-2014-2524.patch} |   0
 meta/recipes-core/readline/readline_6.3.bb         |   2 +-
 meta/recipes-core/systemd/systemd_225.bb           |   4 +-
 meta/recipes-core/util-linux/util-linux.inc        |   2 +-
 .../autogen/autogen/redirect-output-dir.patch      |   2 +-
 .../0012-Add-XLP-instructions-support.patch        |   8 +-
 .../binutils/binutils/binutils-octeon3.patch       |   2 +-
 ...cmake-native_3.3.1.bb => cmake-native_3.3.2.bb} |   0
 meta/recipes-devtools/cmake/cmake.inc              |   6 +-
 .../cmake/{cmake_3.3.1.bb => cmake_3.3.2.bb}       |   0
 meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb      |   1 +
 meta/recipes-devtools/gcc/gcc-common.inc           |   5 +
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   1 +
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |   1 +
 meta/recipes-devtools/mmc/mmc-utils_git.bb         |   2 +-
 meta/recipes-devtools/prelink/prelink_git.bb       |   4 +-
 meta/recipes-devtools/python/python-nose_1.3.6.bb  |   1 +
 meta/recipes-devtools/python/python3_3.4.3.bb      |   5 +-
 meta/recipes-devtools/python/python_2.7.9.bb       |   5 -
 meta/recipes-devtools/qemu/qemu-targets.inc        |   2 +-
 .../qemu/{qemu_2.4.0.bb => qemu_2.4.0.1.bb}        |   4 +-
 .../rpm/rpm/0001-define-EM_AARCH64.patch           |  35 +
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |   1 +
 meta/recipes-devtools/swig/swig.inc                |   2 +-
 meta/recipes-extended/at/at_3.1.16.bb              |   4 +-
 ...-bad-length-test-for-64-bit-architectures.patch |  36 ++
 .../fix-testcase-symlink-bad-lengths.patch         |  33 +
 meta/recipes-extended/cpio/cpio_2.11.bb            |   2 +
 .../images/core-image-kernel-dev.bb                |   2 +-
 .../libaio/libaio/system-linkage.patch             |  37 ++
 meta/recipes-extended/libaio/libaio_0.3.110.bb     |   9 +-
 ...option.patch => libarchive-CVE-2015-2304.patch} |   0
 .../libarchive/libarchive_3.1.2.bb                 |   2 +-
 .../libidn/{libidn_1.30.bb => libidn_1.32.bb}      |   4 +-
 meta/recipes-extended/lsof/lsof_4.89.bb            |   3 +-
 meta/recipes-extended/stress/stress_1.0.4.bb       |   1 +
 .../texinfo-dummy-native/texinfo-dummy-native.bb   |   2 +-
 .../recipes-extended/tzcode/tzcode-native_2015g.bb |   2 +-
 ...nzip-6.0_overflow3.diff => cve-2014-9636.patch} |   0
 meta/recipes-extended/unzip/unzip_6.0.bb           |   2 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |   1 +
 meta/recipes-gnome/gcr/gcr_3.16.0.bb               |   4 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   1 +
 meta/recipes-gnome/libnotify/libnotify_0.7.6.bb    |   4 +-
 meta/recipes-graphics/cairo/cairo.inc              |   5 +-
 ...anspose-the-matrix-in-_cairo_gl_shader_bi.patch |  49 --
 .../cairo/{cairo_1.14.2.bb => cairo_1.14.4.bb}     |   5 +-
 meta/recipes-graphics/clutter/clutter-1.0.inc      |   4 +-
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |   4 +-
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc  |   6 +-
 meta/recipes-graphics/cogl/cogl-1.0.inc            |   4 +-
 meta/recipes-graphics/eglinfo/eglinfo.inc          |   4 +-
 meta/recipes-graphics/libepoxy/libepoxy_git.bb     |   4 +-
 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |   4 +-
 meta/recipes-graphics/mesa/mesa.inc                |   4 +-
 meta/recipes-graphics/mx/mx.inc                    |   4 +-
 .../packagegroups/packagegroup-core-clutter.bb     |   4 +-
 meta/recipes-graphics/wayland/weston-init.bb       |   4 +-
 .../weston/explicit-enable-disable-systemd.patch   |  70 ++
 .../wayland/weston/libsystemd.patch                |  53 ++
 meta/recipes-graphics/wayland/weston_1.8.0.bb      |  12 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   8 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |  91 ++-
 meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
 .../recipes-multimedia/alsa/alsa-plugins_1.0.29.bb |   2 +-
 ...oring-is-success-if-not-sound-card-device.patch |   2 +-
 .../gstreamer/gstreamer1.0-libav.inc               |   4 +-
 ...ound-to-build-gst-libav-for-i586-with-gcc.patch |   2 +-
 ...-libav_1.4.5.bb => gstreamer1.0-libav_1.6.1.bb} |   5 +-
 .../gstreamer/gstreamer1.0-meta-base.bb            |   2 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  61 +-
 ...heck-for-GL-GLU-EGL-GLES2-libs-if-disable.patch |  41 --
 .../0001-glimagesink-Downrank-to-marginal.patch    |   4 +-
 ..._1.4.5.bb => gstreamer1.0-plugins-bad_1.6.1.bb} |   8 +-
 .../gstreamer/gstreamer1.0-plugins-base.inc        |  28 +-
 ...rlay-make-memory-copy-when-video-buffer-s.patch | 129 ----
 ...rame-Don-t-ref-buffers-twice-when-mapping.patch |  26 -
 ...-don-t-set-async-of-custom-text-sink-to-f.patch |  31 -
 ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch |  87 ---
 ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch |  69 --
 .../do-not-change-eos-event-to-gap-event-if.patch  |  37 --
 .../do-not-change-eos-event-to-gap-event2.patch    |  49 --
 .../do-not-change-eos-event-to-gap-event3.patch    |  31 -
 .../fix-id3demux-utf16-to-utf8-issue.patch         |  54 --
 .../handle-audio-video-decoder-error.patch         |  64 --
 ...-send-to-down-stream-if-all-the-frame-cor.patch |  57 --
 .../videobuffer_updata_alignment_update.patch      |  53 --
 ...p-sticky-events-around-when-doing-a-soft-.patch |  46 --
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  30 -
 .../gstreamer/gstreamer1.0-plugins-base_1.6.1.bb   |  17 +
 .../gstreamer/gstreamer1.0-plugins-good.inc        |  13 +-
 .../decrease_asteriskh263_rank.patch               |  25 -
 ...1.4.5.bb => gstreamer1.0-plugins-good_1.6.1.bb} |   8 +-
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        |   6 +-
 ...1.4.5.bb => gstreamer1.0-plugins-ugly_1.6.1.bb} |   4 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb    |   6 -
 .../gstreamer/gstreamer1.0-rtsp-server_1.6.1.bb    |   6 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   8 +-
 ...gstinfo-Shorten-__FILE__-on-all-platforms.patch |  55 --
 ...x-QoS-lateness-checking-if-subclass-imple.patch |  70 --
 ...ink-Shouldn-t-drop-buffer-when-sync-false.patch |  30 -
 ...cky-events-haven-t-send-out-when-ac-1-4-1.patch | 167 -----
 .../gstreamer/gstreamer1.0_1.4.5.bb                |  18 -
 .../gstreamer/gstreamer1.0_1.6.1.bb                |  14 +
 ...1-rt-tests-Allow-for-user-specified-PYLIB.patch |  35 -
 ...02-rt-tests-Break-out-install_hwlatdetect.patch |  68 --
 .../rt-tests/files/Makefile-fix-gzip-command.patch |  30 -
 .../rt-tests/files/fix-re-install-failure.patch    |  48 --
 .../rt-tests/files/hackbench-fix-error-check.patch |  41 --
 .../{hwlatdetect_0.92.bb => hwlatdetect_0.94.bb}   |   0
 meta/recipes-rt/rt-tests/rt-tests.inc              |  14 +-
 .../{rt-tests_0.92.bb => rt-tests_0.94.bb}         |   4 +-
 ...ailure-with-ACCELERATED_2D_CANVAS-when-ca.patch |  35 +
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb        |   1 +
 .../debianutils/debianutils_4.5.1.bb               |   2 +-
 .../update-output-syntax.patch                     |  27 +
 .../gnome-desktop-testing_2014.1.bb                |   1 +
 ...gen.sh-fix-find-version-for-beta-checking.patch |  31 +
 meta/recipes-support/gnupg/gnupg_2.1.7.bb          |   1 +
 meta/recipes-support/libunwind/libunwind.inc       |   1 +
 .../libxslt/libxslt/CVE-2015-7995.patch            |  33 +
 meta/recipes-support/libxslt/libxslt_1.1.28.bb     |   3 +-
 .../ptest-runner/files/ptest-runner                |  53 +-
 .../files/0001-using-the-dynamic-library.patch     |  30 -
 .../{sqlite3_3.8.10.2.bb => sqlite3_3.9.0.bb}      |  10 +-
 scripts/combo-layer                                |   4 +-
 scripts/contrib/verify-homepage.py                 |  65 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |   3 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |   3 +-
 ...-yocto_4.1.bbapend => linux-yocto_4.1.bbappend} |   1 -
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |   3 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |   3 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |   3 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |   3 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |   3 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |   3 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |   1 -
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |   1 -
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |   1 -
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |   1 -
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   1 -
 .../recipes-kernel/linux/kernel-list.noinstall     |   2 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |   1 -
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |   1 -
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   1 -
 scripts/runqemu                                    |   3 +-
 191 files changed, 1423 insertions(+), 2243 deletions(-)
 delete mode 100644 meta/lib/oeqa/runtime/dmesg.py
 rename meta/recipes-bsp/acpid/{acpid_2.0.23.bb => acpid_2.0.25.bb} (55%)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0028-Clear-ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch
 rename meta/recipes-core/readline/readline-6.3/{readline63-003.patch => readline-cve-2014-2524.patch} (100%)
 rename meta/recipes-devtools/cmake/{cmake-native_3.3.1.bb => cmake-native_3.3.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.3.1.bb => cmake_3.3.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_2.4.0.bb => qemu_2.4.0.1.bb} (85%)
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/Fix-symlink-bad-length-test-for-64-bit-architectures.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/fix-testcase-symlink-bad-lengths.patch
 create mode 100644 meta/recipes-extended/libaio/libaio/system-linkage.patch
 rename meta/recipes-extended/libarchive/libarchive/{0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch => libarchive-CVE-2015-2304.patch} (100%)
 rename meta/recipes-extended/libidn/{libidn_1.30.bb => libidn_1.32.bb} (91%)
 rename meta/recipes-extended/unzip/unzip/{unzip-6.0_overflow3.diff => cve-2014-9636.patch} (100%)
 delete mode 100644 meta/recipes-graphics/cairo/cairo/Manually-transpose-the-matrix-in-_cairo_gl_shader_bi.patch
 rename meta/recipes-graphics/cairo/{cairo_1.14.2.bb => cairo_1.14.4.bb} (88%)
 create mode 100644 meta/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/libsystemd.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.4.5.bb => gstreamer1.0-libav_1.6.1.bb} (83%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.4.5.bb => gstreamer1.0-plugins-bad_1.6.1.bb} (59%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event2.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event3.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.1.bb
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.4.5.bb => gstreamer1.0-plugins-good_1.6.1.bb} (67%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.4.5.bb => gstreamer1.0-plugins-ugly_1.6.1.bb} (66%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.1.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-basesink-Shouldn-t-drop-buffer-when-sync-false.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb
 delete mode 100644 meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
 delete mode 100644 meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
 delete mode 100644 meta/recipes-rt/rt-tests/files/Makefile-fix-gzip-command.patch
 delete mode 100644 meta/recipes-rt/rt-tests/files/fix-re-install-failure.patch
 delete mode 100644 meta/recipes-rt/rt-tests/files/hackbench-fix-error-check.patch
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.92.bb => hwlatdetect_0.94.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.92.bb => rt-tests_0.94.bb} (89%)
 create mode 100644 meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch
 create mode 100644 meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/update-output-syntax.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/autogen.sh-fix-find-version-for-beta-checking.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
 mode change 100644 => 100755 meta/recipes-support/ptest-runner/files/ptest-runner
 delete mode 100644 meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.8.10.2.bb => sqlite3_3.9.0.bb} (72%)
 rename scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/{linux-yocto_4.1.bbapend => linux-yocto_4.1.bbappend} (95%)

Alexander D. Kanevskiy (1):
  combo-layer: introduce ability to exclude component from mass update

Andre McCurdy (8):
  scons.bbclass: SCons packages don't require do_configure
  python: don't append -D__SOFTFP__ to TARGET_CC_ARCH for armv6/armv7a
  cairo: fix license for cairo-script-interpreter
  cmake.bbclass: don't duplicate CMAKE_C_FLAGS in CMAKE_C_FLAGS_RELEASE
  lsof: don't export EXTRA_OEMAKE
  cmake: update 3.3.1 -> 3.3.2
  cairo.inc: drop obsolete CFLAGS += "-ffat-lto-objects" workaround
  cairo: update 1.14.2 -> 1.14.4

Aníbal Limón (1):
  acpid: Upgrade to 2.0.25

Armin Kuster (1):
  libxslt: CVE-2015-7995

Carlos Rafael Giani (7):
  gstreamer1.0: upgrade to version 1.6.1
  gstreamer1.0-plugins-base: upgrade to version 1.6.1
  gstreamer1.0-plugins-good: upgrade to version 1.6.1
  gstreamer1.0-plugins-bad: upgrade to version 1.6.1
  gstreamer1.0-plugins-ugly: upgrade to version 1.6.1
  gstreamer1.0-libav: upgrade to version 1.6.1
  gstreamer1.0-rtsp-server: upgrade to version 1.6.1

Chen Qi (2):
  nfs-utils/statd: fix a segfault
  toolchain-script: use immediate expansion for
    TOOLCHAIN_CONFIGSITE_NOCACHE

Craig McQueen (1):
  os-release: put double-quotes around variable contents

Hongxu Jia (1):
  default-distrovars: remove less from WHITELIST_GPL-3.0

Ioan-Adrian Ratiu (1):
  ptest-runner: Allow running of specific tests

Jackie Huang (1):
  qemu: enable user mode for mips64 and mips64el

Jate Sujjavanich (1):
  rm_work.bbclass: Exclude do_rootfs stamp removal

Jens Rehsack (1):
  gbm: Fix "configure: error: gbm requires --enable-dri"

Josh Cartwright (1):
  rt-tests: bump to v0.94

Joshua Lock (6):
  systemd: add PACKAGECONFIG to build with compatibility libraries
  weston: add PACKAGECONFIG to build with systemd-login support
  systemd: make dbus an optional build time dependency
  weston: add a PACKAGECONFIG option for xwayland support
  xserver-xorg: add Xwayland RRECOMMENDS
  xserver-xorg: drop empty ${PN}-security-policy package

Jun Zhang (2):
  cpio: Fix symlink-bad-length test for 64-bit [ LIN8-947 ]
    architectures.
  cpio: fix testcase symlink-bad-lengths [ LIN8-947 ]

Kai Kang (3):
  sqlite: 3.8.10.2 -> 3.9.0
  libidn: 1.30 -> 1.32
  openssh: enable X11Forwarding if distro feature x11 is set

Khem Raj (2):
  busybox: Fix mdev block device automounting
  busybox: Schedule mdev after mountall

Leonardo Sandoval (4):
  yocto-bsp: Default kernel version to 4.1 on x86_64
  qemurunner: Enable timestamps on kernel boot-up
  yocto-bsp: Avoid duplication of user patches
    ({{=machine}}-user-patches.scc)
  yocto-bsp: Typo on the file extension

Lucian Musat (1):
  oeqa/testimage: Add support for test folder export.

Mariano Lopez (1):
  qemurunner: Remove the timeout in run_serial

Mark Hatle (6):
  binutils: Fix octeon3 disassembly patch
  binutils: Fix XLP / Octeon 3 instruction clash
  glibc: Fix ld.so / prelink interface for
    ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA
  gcc: Update default Power GCC settings to use secure-plt
  prelink: Fix various prelink issues on IA32, ARM, and MIPS.
  Revert "local.conf.sample: Disable image-prelink by default"

Maxin B. John (1):
  gnome-desktop-testing: fix ptest output format

Paul Eggleton (24):
  verify-homepage: use scriptpath to find bitbake path
  verify-homepage: get expanded HOMEPAGE value
  verify-homepage: tidy up output and comments
  verify-homepage: fix recipe file selection
  gptfdisk: add SUMMARY
  libunwind: add SUMMARY
  stress: add SUMMARY
  python-nose: add SUMMARY
  linux-yocto.inc: set SUMMARY instead of DESCRIPTION
  tzcode-native: set SUMMARY instead of DESCRIPTION
  alsa-plugins: set SUMMARY instead of DESCRIPTION
  swig: set SUMMARY instead of DESCRIPTION
  mmc-utils: set SUMMARY instead of DESCRIPTION
  gstreamer1.0-meta-base: set SUMMARY instead of DESCRIPTION
  texinfo-dummy-native: set SUMMARY instead of DESCRIPTION
  meta/conf/layer.conf: fix typo
  meta: Fix typos in Upstream-Status labels
  gitignore: fix overzealous exclusion
  conf/distro/include: drop old recipes from include files
  classes/buildhistory: split package history values only once
  classes/distrodata: split SRC_URI properly before determining type
  oeqa/selftest/devtool: fix test if build directory is not inside
    COREBASE
  oeqa/selftest/layerappend: fix test if build directory is not inside
    COREBASE
  oe-selftest: add test for bitbake-layers show-recipes

Pushpal Sidhu (1):
  webkitgtk: Add upstream patch to fix build problem

Robert Yang (6):
  prexport.bbclass: avoid export for native and crosssdk
  debianutils: fix ALTERNATIVE_PRIORITY conflict with which
  console-tools: fix ALTERNATIVE_PRIORITY conflict with kbd
  util-linux: fix ALTERNATIVE_PRIORITY conflict with ncurses procps and
    e2fsprogs
  coreutils: fix ALTERNATIVE_PRIORITY conflict with procps and mktemp
  gtk+3: fix ALTERNATIVE_PRIORITY conflict with gtk+

Ross Burton (10):
  libarchive: rename patch to reflect CVE
  oeqa/runtime: remove dmesg test
  oeqa/runtime/multilib: run the arch tests on connmand not
    connman-applet
  qemu: upgrade to 2.4.0.1
  readline: rename patch to contain CVE reference
  unzip: rename patch to reflect CVE fix
  at: modify sources in do_patch
  runqemu: don't specify IP when starting a VNC server
  libaio: don't disable linking to the system libraries
  maintainers: mass reassign and cleanup

Roy Li (1):
  rpm: define EM_AARCH64 for debugedit

Ruslan Bilovol (1):
  scripts: runqemu: remove QEMUARCH from help message

Stefan Christ (5):
  linux-dtb.inc: remove unneeded 'cd'
  linux-dtb.inc: use same variable name DTB for all elements of
    KERNEL_DEVICETREE
  linux-dtb.inc: explicit test for empty string not needed
  linux-dtb.inc: refactor common code to function normalize_dtb
  linux-dtb.inc: refactor common code to function
    get_real_dtb_path_in_kernel

Wenzong Fan (3):
  recipes: add distro_features_check for some packages
  gnupg: fix find-version for beta checking
  openssl: fix mips64 configure support

yadi.hu@windriver.com (1):
  xinetd: install xinetd supported services configuration

 .gitignore                                         |   2 +-
 meta-yocto/conf/distro/include/maintainers.inc     | 701 +++++++++++----------
 meta-yocto/conf/local.conf.sample                  |   4 +-
 meta/classes/buildhistory.bbclass                  |   2 +-
 meta/classes/cmake.bbclass                         |  10 +-
 meta/classes/distrodata.bbclass                    |   4 +-
 meta/classes/prexport.bbclass                      |   5 +-
 meta/classes/rm_work.bbclass                       |   4 +
 meta/classes/scons.bbclass                         |   2 +
 meta/classes/testimage.bbclass                     |  18 +-
 meta/classes/toolchain-scripts.bbclass             |   2 +-
 meta/conf/distro/include/as-needed.inc             |   3 -
 meta/conf/distro/include/default-distrovars.inc    |   2 +-
 meta/conf/distro/include/distro_alias.inc          |  58 --
 meta/conf/layer.conf                               |   2 +-
 meta/lib/oeqa/runtime/dmesg.py                     |  12 -
 meta/lib/oeqa/runtime/multilib.py                  |   8 +-
 meta/lib/oeqa/selftest/bblayers.py                 |  25 +
 meta/lib/oeqa/selftest/devtool.py                  |   2 +-
 meta/lib/oeqa/selftest/layerappend.py              |   9 +-
 meta/lib/oeqa/utils/qemurunner.py                  |  20 +-
 .../acpid/{acpid_2.0.23.bb => acpid_2.0.25.bb}     |   4 +-
 ...tatd-fix-a-segfault-caused-by-improper-us.patch | 113 ++++
 .../nfs-utils/nfs-utils_1.3.1.bb                   |   1 +
 meta/recipes-connectivity/openssh/openssh_7.1p1.bb |   6 +-
 meta/recipes-connectivity/openssl/openssl.inc      |   2 +-
 .../openssl/crypto_use_bigint_in_x86-64_perl.patch |   2 +-
 meta/recipes-core/busybox/busybox.inc              |   4 +-
 meta/recipes-core/busybox/files/mdev-mount.sh      |   8 +-
 .../console-tools/console-tools_0.3.2.bb           |   2 +-
 meta/recipes-core/coreutils/coreutils_8.24.bb      |   2 +-
 ...TYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch |  84 +++
 meta/recipes-core/glibc/glibc_2.22.bb              |   1 +
 meta/recipes-core/os-release/os-release.bb         |   2 +-
 ...ne63-003.patch => readline-cve-2014-2524.patch} |   0
 meta/recipes-core/readline/readline_6.3.bb         |   2 +-
 meta/recipes-core/systemd/systemd_225.bb           |   4 +-
 meta/recipes-core/util-linux/util-linux.inc        |   2 +-
 .../autogen/autogen/redirect-output-dir.patch      |   2 +-
 .../0012-Add-XLP-instructions-support.patch        |   8 +-
 .../binutils/binutils/binutils-octeon3.patch       |   2 +-
 ...cmake-native_3.3.1.bb => cmake-native_3.3.2.bb} |   0
 meta/recipes-devtools/cmake/cmake.inc              |   6 +-
 .../cmake/{cmake_3.3.1.bb => cmake_3.3.2.bb}       |   0
 meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb      |   1 +
 meta/recipes-devtools/gcc/gcc-common.inc           |   5 +
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   1 +
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |   1 +
 meta/recipes-devtools/mmc/mmc-utils_git.bb         |   2 +-
 meta/recipes-devtools/prelink/prelink_git.bb       |   4 +-
 meta/recipes-devtools/python/python-nose_1.3.6.bb  |   1 +
 meta/recipes-devtools/python/python3_3.4.3.bb      |   5 +-
 meta/recipes-devtools/python/python_2.7.9.bb       |   5 -
 meta/recipes-devtools/qemu/qemu-targets.inc        |   2 +-
 .../qemu/{qemu_2.4.0.bb => qemu_2.4.0.1.bb}        |   4 +-
 .../rpm/rpm/0001-define-EM_AARCH64.patch           |  35 +
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |   1 +
 meta/recipes-devtools/swig/swig.inc                |   2 +-
 meta/recipes-extended/at/at_3.1.16.bb              |   4 +-
 ...-bad-length-test-for-64-bit-architectures.patch |  36 ++
 .../fix-testcase-symlink-bad-lengths.patch         |  33 +
 meta/recipes-extended/cpio/cpio_2.11.bb            |   2 +
 .../images/core-image-kernel-dev.bb                |   2 +-
 .../libaio/libaio/system-linkage.patch             |  37 ++
 meta/recipes-extended/libaio/libaio_0.3.110.bb     |   9 +-
 ...option.patch => libarchive-CVE-2015-2304.patch} |   0
 .../libarchive/libarchive_3.1.2.bb                 |   2 +-
 .../libidn/{libidn_1.30.bb => libidn_1.32.bb}      |   4 +-
 meta/recipes-extended/lsof/lsof_4.89.bb            |   3 +-
 meta/recipes-extended/stress/stress_1.0.4.bb       |   1 +
 .../texinfo-dummy-native/texinfo-dummy-native.bb   |   2 +-
 .../recipes-extended/tzcode/tzcode-native_2015g.bb |   2 +-
 ...nzip-6.0_overflow3.diff => cve-2014-9636.patch} |   0
 meta/recipes-extended/unzip/unzip_6.0.bb           |   2 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |   1 +
 meta/recipes-gnome/gcr/gcr_3.16.0.bb               |   4 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   1 +
 meta/recipes-gnome/libnotify/libnotify_0.7.6.bb    |   4 +-
 meta/recipes-graphics/cairo/cairo.inc              |   5 +-
 ...anspose-the-matrix-in-_cairo_gl_shader_bi.patch |  49 --
 .../cairo/{cairo_1.14.2.bb => cairo_1.14.4.bb}     |   5 +-
 meta/recipes-graphics/clutter/clutter-1.0.inc      |   4 +-
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |   4 +-
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc  |   6 +-
 meta/recipes-graphics/cogl/cogl-1.0.inc            |   4 +-
 meta/recipes-graphics/eglinfo/eglinfo.inc          |   4 +-
 meta/recipes-graphics/libepoxy/libepoxy_git.bb     |   4 +-
 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |   4 +-
 meta/recipes-graphics/mesa/mesa.inc                |   4 +-
 meta/recipes-graphics/mx/mx.inc                    |   4 +-
 .../packagegroups/packagegroup-core-clutter.bb     |   4 +-
 meta/recipes-graphics/wayland/weston-init.bb       |   4 +-
 .../weston/explicit-enable-disable-systemd.patch   |  70 ++
 .../wayland/weston/libsystemd.patch                |  53 ++
 meta/recipes-graphics/wayland/weston_1.8.0.bb      |  12 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   8 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |  91 ++-
 meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
 .../recipes-multimedia/alsa/alsa-plugins_1.0.29.bb |   2 +-
 ...oring-is-success-if-not-sound-card-device.patch |   2 +-
 .../gstreamer/gstreamer1.0-libav.inc               |   4 +-
 ...ound-to-build-gst-libav-for-i586-with-gcc.patch |   2 +-
 ...-libav_1.4.5.bb => gstreamer1.0-libav_1.6.1.bb} |   5 +-
 .../gstreamer/gstreamer1.0-meta-base.bb            |   2 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  61 +-
 ...heck-for-GL-GLU-EGL-GLES2-libs-if-disable.patch |  41 --
 .../0001-glimagesink-Downrank-to-marginal.patch    |   4 +-
 ..._1.4.5.bb => gstreamer1.0-plugins-bad_1.6.1.bb} |   8 +-
 .../gstreamer/gstreamer1.0-plugins-base.inc        |  28 +-
 ...rlay-make-memory-copy-when-video-buffer-s.patch | 129 ----
 ...rame-Don-t-ref-buffers-twice-when-mapping.patch |  26 -
 ...-don-t-set-async-of-custom-text-sink-to-f.patch |  31 -
 ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch |  87 ---
 ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch |  69 --
 .../do-not-change-eos-event-to-gap-event-if.patch  |  37 --
 .../do-not-change-eos-event-to-gap-event2.patch    |  49 --
 .../do-not-change-eos-event-to-gap-event3.patch    |  31 -
 .../fix-id3demux-utf16-to-utf8-issue.patch         |  54 --
 .../handle-audio-video-decoder-error.patch         |  64 --
 ...-send-to-down-stream-if-all-the-frame-cor.patch |  57 --
 .../videobuffer_updata_alignment_update.patch      |  53 --
 ...p-sticky-events-around-when-doing-a-soft-.patch |  46 --
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  30 -
 .../gstreamer/gstreamer1.0-plugins-base_1.6.1.bb   |  17 +
 .../gstreamer/gstreamer1.0-plugins-good.inc        |  13 +-
 .../decrease_asteriskh263_rank.patch               |  25 -
 ...1.4.5.bb => gstreamer1.0-plugins-good_1.6.1.bb} |   8 +-
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        |   6 +-
 ...1.4.5.bb => gstreamer1.0-plugins-ugly_1.6.1.bb} |   4 +-
 ..._1.4.5.bb => gstreamer1.0-rtsp-server_1.6.1.bb} |   4 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   8 +-
 ...gstinfo-Shorten-__FILE__-on-all-platforms.patch |  55 --
 ...x-QoS-lateness-checking-if-subclass-imple.patch |  70 --
 ...ink-Shouldn-t-drop-buffer-when-sync-false.patch |  30 -
 ...cky-events-haven-t-send-out-when-ac-1-4-1.patch | 167 -----
 ...gstreamer1.0_1.4.5.bb => gstreamer1.0_1.6.1.bb} |   8 +-
 ...1-rt-tests-Allow-for-user-specified-PYLIB.patch |  35 -
 ...02-rt-tests-Break-out-install_hwlatdetect.patch |  68 --
 .../rt-tests/files/Makefile-fix-gzip-command.patch |  30 -
 .../rt-tests/files/fix-re-install-failure.patch    |  48 --
 .../rt-tests/files/hackbench-fix-error-check.patch |  41 --
 .../{hwlatdetect_0.92.bb => hwlatdetect_0.94.bb}   |   0
 meta/recipes-rt/rt-tests/rt-tests.inc              |  14 +-
 .../{rt-tests_0.92.bb => rt-tests_0.94.bb}         |   4 +-
 ...ailure-with-ACCELERATED_2D_CANVAS-when-ca.patch |  35 +
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb        |   1 +
 .../debianutils/debianutils_4.5.1.bb               |   2 +-
 .../update-output-syntax.patch                     |  27 +
 .../gnome-desktop-testing_2014.1.bb                |   1 +
 ...gen.sh-fix-find-version-for-beta-checking.patch |  31 +
 meta/recipes-support/gnupg/gnupg_2.1.7.bb          |   1 +
 meta/recipes-support/libunwind/libunwind.inc       |   1 +
 .../libxslt/libxslt/CVE-2015-7995.patch            |  33 +
 meta/recipes-support/libxslt/libxslt_1.1.28.bb     |   3 +-
 .../ptest-runner/files/ptest-runner                |  53 +-
 .../files/0001-using-the-dynamic-library.patch     |  30 -
 .../{sqlite3_3.8.10.2.bb => sqlite3_3.9.0.bb}      |  10 +-
 scripts/combo-layer                                |   4 +-
 scripts/contrib/verify-homepage.py                 |  65 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |   3 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |   3 +-
 ...-yocto_4.1.bbapend => linux-yocto_4.1.bbappend} |   1 -
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |   3 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |   3 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |   3 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |   3 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |   3 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |   3 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |   1 -
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |   1 -
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |   1 -
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |   1 -
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   1 -
 .../recipes-kernel/linux/kernel-list.noinstall     |   2 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |   1 -
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |   1 -
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |   1 -
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   1 -
 scripts/runqemu                                    |   3 +-
 189 files changed, 1407 insertions(+), 2227 deletions(-)
 delete mode 100644 meta/lib/oeqa/runtime/dmesg.py
 rename meta/recipes-bsp/acpid/{acpid_2.0.23.bb => acpid_2.0.25.bb} (55%)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0028-Clear-ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch
 rename meta/recipes-core/readline/readline-6.3/{readline63-003.patch => readline-cve-2014-2524.patch} (100%)
 rename meta/recipes-devtools/cmake/{cmake-native_3.3.1.bb => cmake-native_3.3.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.3.1.bb => cmake_3.3.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_2.4.0.bb => qemu_2.4.0.1.bb} (85%)
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/Fix-symlink-bad-length-test-for-64-bit-architectures.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/fix-testcase-symlink-bad-lengths.patch
 create mode 100644 meta/recipes-extended/libaio/libaio/system-linkage.patch
 rename meta/recipes-extended/libarchive/libarchive/{0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch => libarchive-CVE-2015-2304.patch} (100%)
 rename meta/recipes-extended/libidn/{libidn_1.30.bb => libidn_1.32.bb} (91%)
 rename meta/recipes-extended/unzip/unzip/{unzip-6.0_overflow3.diff => cve-2014-9636.patch} (100%)
 delete mode 100644 meta/recipes-graphics/cairo/cairo/Manually-transpose-the-matrix-in-_cairo_gl_shader_bi.patch
 rename meta/recipes-graphics/cairo/{cairo_1.14.2.bb => cairo_1.14.4.bb} (88%)
 create mode 100644 meta/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/libsystemd.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.4.5.bb => gstreamer1.0-libav_1.6.1.bb} (83%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.4.5.bb => gstreamer1.0-plugins-bad_1.6.1.bb} (59%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event2.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event3.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.1.bb
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.4.5.bb => gstreamer1.0-plugins-good_1.6.1.bb} (67%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.4.5.bb => gstreamer1.0-plugins-ugly_1.6.1.bb} (66%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.4.5.bb => gstreamer1.0-rtsp-server_1.6.1.bb} (44%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-basesink-Shouldn-t-drop-buffer-when-sync-false.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.4.5.bb => gstreamer1.0_1.6.1.bb} (46%)
 delete mode 100644 meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
 delete mode 100644 meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
 delete mode 100644 meta/recipes-rt/rt-tests/files/Makefile-fix-gzip-command.patch
 delete mode 100644 meta/recipes-rt/rt-tests/files/fix-re-install-failure.patch
 delete mode 100644 meta/recipes-rt/rt-tests/files/hackbench-fix-error-check.patch
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.92.bb => hwlatdetect_0.94.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.92.bb => rt-tests_0.94.bb} (89%)
 create mode 100644 meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch
 create mode 100644 meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/update-output-syntax.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/autogen.sh-fix-find-version-for-beta-checking.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
 mode change 100644 => 100755 meta/recipes-support/ptest-runner/files/ptest-runner
 delete mode 100644 meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.8.10.2.bb => sqlite3_3.9.0.bb} (72%)
 rename scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/{linux-yocto_4.1.bbapend => linux-yocto_4.1.bbappend} (95%)

-- 
2.1.4


