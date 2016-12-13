Return-Path: <ross.burton@intel.com>
Received: from mail-wj0-f177.google.com (mail-wj0-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA2671DDE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 12:34:23 +0000 (UTC)
Received: by mail-wj0-f177.google.com with SMTP id tg4so99303151wjb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 04:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W3ug65F7IEFaAB1K/JSQqHBbhdo/jssI6Lal+a4RS0s=;
	b=jN6clNo97K6zb3+w2tX44U38Sj02OcrkXLeg6Sixci3X+XyXcqk7h5IH2ZTarCDUOe
	Ximp7tYquD0Yw2xc9LX7+7mHN+/IYUpm0O2ZL5XD5dDKC71BdqOUITnh/4U0jzAiqSkl
	Xgch1gX0aufPVU0eHU1ZnQVhrAZMcmcgTTfpuNasSu4UDK2gAt+0Wwr242ypvd3mRG01
	VXhzP2qLgzryjvPoU7ox977QVp4p/pZ3CLO9xEgb2Eb1Kwp+qCObAlr3r/xBBczah/hI
	UaOqYNUK4XYoLf3DIAQI31FnWuep6JWsipahljJoSQ5DUHebXn3vWmxIwAoc3AyiqjDc
	c6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W3ug65F7IEFaAB1K/JSQqHBbhdo/jssI6Lal+a4RS0s=;
	b=esgUao4unSEpqiJC/q7x7PkcUjAWgABnbx+fjPDMvDZF4YdJ5ezjg5jKNqCIXc2RNF
	+Us8XW6hkYAvBPpOiQHgIecFvIe9OgRzpsv8SjYsuzjic542hveaPhkSTROcLfM/sM5K
	NdXwA8Feo5cHxu394Iiv+EfXjwJ+HwJ/Gdn5w/u9+85eSAM23i+A7hExg9fmZGiA1PBc
	E+DxtkMw9MvOKNMJ6ynTW3MFd/pwvyiRB7KV3HgJ58Etgx1mtyHnp9xjBt0tDxlBAHxh
	adTmKeITg4qiYbcW/u2ArVcd2apzwI37tr1b7wTygK3YAqdeuzuUK/l9Oexd6Tb+cSFn
	H+zg==
X-Gm-Message-State: AKaTC00YTo7oYUW0Ofcr34DW+WRnG2j2Un51/gn8opuO7FYByDpchi19Uv/AJ6WJ+YrO317J
X-Received: by 10.194.122.65 with SMTP id lq1mr86379901wjb.12.1481632463906;
	Tue, 13 Dec 2016 04:34:23 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 63sm2444544wmg.2.2016.12.13.04.34.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Dec 2016 04:34:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 12:34:19 +0000
Message-Id: <cover.1481632325.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 00/69] Consolidated Pull
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
X-List-Received-Date: Tue, 13 Dec 2016 12:34:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Part 1 of the final rush before M1.

All green on the AB with the following caveats:
- nightly-arm64 failed due to a misconfiguration on the AB
- selftest failed in same-tune-same-hash, fixed in this branch and verified
  locally
- mips-lsb failed building binutils but a rebuild worked, looks like a transient
  compile failure.

Ross

The following changes since commit 0fb96d1913603352e36c0b7a6bad71d3460e358a:

  meta-yocto-bsp: bump to the latest linux stable kernel for the non-x86 BSPs (2016-12-09 08:54:37 +0000)

are available in the git repository at:

  ssh://git@git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 1fc68e2038104a7182f36068a60642a4bb6386e8:

  libpcap: Disable exposed bits of WinPCAP remote capture support (2016-12-13 12:23:54 +0000)

----------------------------------------------------------------
Alessio Igor Bogani (1):
      wic: Create a logical partition only when it is really mandatory

Andreas Müller (1):
      mesa: update to 13.0.2

Armin Kuster (1):
      libtiff: Update to 4.0.7

Awais Belal (1):
      grub2: fix some quirks and div by zero

Bruce Ashfield (2):
      linux-yocto/4.8: update to -rt7
      kernel-yocto: explicitly trap subcommand errors

California Sullivan (1):
      parselogs.py: Don't clog QA with Joule errors

Carlos Alberto Lopez Perez (1):
      Revert "webkitgtk: drop patch 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch"

Chen Qi (2):
      libarchive: fix ALTERNATIVE_PRIORITY to avoid conflict
      Use weak assignment for SERIAL_CONSOLES in qemu configuration files

Ed Bartosh (11):
      wic: rename command line option -p -> -s
      oe-run-native: standardize usage output
      oe-trim-schemas: create usage output
      beaglebone.conf: enable generation of wic.bmap
      oe-setup-rpmrepo: standardize usage output
      oe-setup-builddir: create usage output
      oepydevshell-internal.py: standardize usage output
      oe-git-proxy: create usage output
      oe-find-native-sysroot: create usage output
      oe-buildenv-internal: show usage output
      edgerouter.conf: enable generation of wic.bmap

Fabio Berton (1):
      libpcap: Disable exposed bits of WinPCAP remote capture support

Huang Qiyu (4):
      libnotify : 0.7.6 -> 0.7.7
      mpfr: 3.1.4 -> 3.1.5
      slang: 2.3.0 -> 2.3.1
      cups: 2.1.4 -> 2.2.1

Ismo Puustinen (2):
      libva: check for "opengl" feature
      gstreamer-vaapi-1.0: check for "opengl" feature

Jackie Huang (1):
      gcr: add missing dependencies for vapi

Jason Wessel (1):
      systemd: Backport cgroup fix from 233 to 232

Juro Bystricky (2):
      edgerouter.py: avoid python3 exception
      targetloader.py: drop test for ClassType

Jussi Kukkonen (13):
      matchbox-wm: Upgrade 1.2.1 -> 1.2.2
      libxfont2: Add recipe
      xserver-xorg: Upgrade 1.18.4 -> 1.19.0
      xf86-input-evdev: Upgrade 2.10.3 -> 2.10.4
      xf86-input-keyboard: Upgrade 1.8.1 -> 1.9.0
      xf86-input-keyboard: Remove git recipe
      xf86-input-mouse: Upgrade 1.9.1 -> 1.9.2
      xf86-input-mouse: Remove git recipe
      xf86-input-synaptics: Upgrade 1.8.3 -> 1.9.0
      xf86-input-synaptics: Remove git recipe
      xf86-video-omap: Upgrade 0.4.4 -> 0.4.5
      xf86-video-vmware: Upgrade 13.1.0 -> 13.2.1
      xf86-input-libinput: Upgrade 0.22 -> 0.23

Khem Raj (6):
      gstreamer1.0: Upgrade to 1.10.1
      systemd-boot: Use PV in recipe name
      gstreamer1.0-plugins-bad: Define and use WAYLAND_PROTOCOLS_SYSROOT_DIR for output of pkg-config
      gstreamer1.0-rtsp-server: Add libcheck to deps
      gstreamer1.0-vaapi: Import from meta-intel
      puzzles: Upgrade and fix with clang

Mans Rullgard (1):
      initscripts: populate-volatile: improve config file parsing

Mariano Lopez (3):
      oeqa/utils/commands.py: Make a copy of variables in get_bb_vars
      oeqa/utils/metadata.py: Add metadata library
      oe-selftest: Add option to submit test result to a git repository.

Maxin B. John (1):
      ref-images.xml: remove core-image-directfb reference

Ola x Nilsson (4):
      devtool: selftest: add test for devtool plugin loading
      recipetool: selftest: Add test for recipetool plugin loading
      devtool: Load plugins in a well defined order
      recipetool: Load plugins in a well defined order

Patrick Ohly (1):
      buildstats.py: skip collecting unavailable /proc data

Ross Burton (5):
      tiff: set CVE_PRODUCT
      curl: set CVE_PRODUCT
      cve-check: allow recipes to override the product name
      archiver: don't change directory when generating tarball
      rm_work: add do_write_qemuboot_conf to task list

Saul Wold (1):
      genericx86 & x86-base: Update PREFERRED_VERSION for 4.8 kernel

Yuanjie Huang (1):
      glibc: Enable backtrace from abort on ARM

Zheng Ruoqin (1):
      xkeyboard-config: 2.18 -> 2.19

 documentation/ref-manual/ref-images.xml            |   3 -
 meta-selftest/lib/devtool/bbpath.py                |  44 ++
 meta-selftest/lib/recipetool/bbpath.py             |  41 ++
 meta-yocto-bsp/conf/machine/beaglebone.conf        |   2 +-
 meta-yocto-bsp/conf/machine/edgerouter.conf        |   2 +-
 .../conf/machine/include/genericx86-common.inc     |   2 +-
 .../lib/oeqa/controllers/edgeroutertarget.py       |   2 +-
 meta/classes/archiver.bbclass                      |   8 +-
 meta/classes/cve-check.bbclass                     |   6 +-
 meta/classes/kernel-yocto.bbclass                  |   7 +
 meta/classes/rm_work.bbclass                       |   2 +-
 meta/conf/machine/qemuarm.conf                     |   2 +-
 meta/conf/machine/qemuarm64.conf                   |   2 +-
 meta/conf/machine/qemumips.conf                    |   2 +-
 meta/conf/machine/qemumips64.conf                  |   2 +-
 meta/conf/machine/qemuppc.conf                     |   2 +-
 meta/conf/machine/qemux86-64.conf                  |   2 +-
 meta/conf/machine/qemux86.conf                     |   2 +-
 meta/lib/buildstats.py                             |  19 +-
 meta/lib/oeqa/controllers/testtargetloader.py      |   2 -
 meta/lib/oeqa/runtime/parselogs.py                 |  14 +-
 meta/lib/oeqa/selftest/devtool.py                  |  43 ++
 meta/lib/oeqa/selftest/recipetool.py               |  44 ++
 meta/lib/oeqa/utils/commands.py                    |   1 +
 meta/lib/oeqa/utils/metadata.py                    |  83 +++
 ...ern-efi-mm.c-grub_efi_finish_boot_service.patch |  79 +++
 ...ern-efi-mm.c-grub_efi_get_memory_map-Neve.patch |  43 ++
 meta/recipes-bsp/grub/grub2.inc                    |   2 +
 .../{systemd-boot.bb => systemd-boot_232.bb}       |   0
 .../libpcap/libpcap/disable-remote.patch           |  36 ++
 meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb |   1 +
 meta/recipes-core/glibc/glibc.inc                  |   6 +
 .../initscripts-1.0/populate-volatile.sh           |   6 +-
 .../initscripts/initscripts-1.0/volatiles          |   6 +-
 ...use-the-unified-hierarchy-for-the-systemd.patch |  51 ++
 meta/recipes-core/systemd/systemd_232.bb           |   1 +
 meta/recipes-extended/cups/cups.inc                |   2 +-
 meta/recipes-extended/cups/cups_2.1.4.bb           |   6 -
 meta/recipes-extended/cups/cups_2.2.1.bb           |   6 +
 .../libarchive/libarchive_3.2.2.bb                 |   2 +-
 ...x-error-conflicting-types-for-posix_close.patch |  39 --
 .../slang/{slang_2.3.0.bb => slang_2.3.1.bb}       |   6 +-
 .../gcr-add-missing-dependencies-for-vapi.patch    |  51 ++
 meta/recipes-gnome/gcr/gcr_3.20.0.bb               |   2 +
 .../{libnotify_0.7.6.bb => libnotify_0.7.7.bb}     |   4 +-
 meta/recipes-graphics/libva/libva_1.7.3.bb         |   4 +-
 .../{matchbox-wm_1.2.1.bb => matchbox-wm_1.2.2.bb} |   4 +-
 .../mesa/{mesa-gl_13.0.1.bb => mesa-gl_13.0.2.bb}  |   0
 .../mesa/{mesa_13.0.1.bb => mesa_13.0.2.bb}        |   4 +-
 ...-evdev_2.10.3.bb => xf86-input-evdev_2.10.4.bb} |   4 +-
 ...board_1.8.1.bb => xf86-input-keyboard_1.9.0.bb} |   4 +-
 .../xorg-driver/xf86-input-keyboard_git.bb         |  16 -
 ...put_0.22.0.bb => xf86-input-libinput_0.23.0.bb} |   4 +-
 ...ut-mouse_1.9.1.bb => xf86-input-mouse_1.9.2.bb} |   5 +-
 .../xorg-driver/xf86-input-mouse_git.bb            |  18 -
 ...tics_1.8.3.bb => xf86-input-synaptics_1.9.0.bb} |   4 +-
 .../xorg-driver/xf86-input-synaptics_git.bb        |  18 -
 ...ideo-omap_0.4.4.bb => xf86-video-omap_0.4.5.bb} |   4 +-
 .../0002-add-option-for-vmwgfx.patch               |  37 +-
 ...mware_13.1.0.bb => xf86-video-vmware_13.2.1.bb} |   4 +-
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb  |  22 +
 ...ard-config_2.18.bb => xkeyboard-config_2.19.bb} |   4 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   6 +-
 ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  61 ++
 ...c-Fix-wayland-scanner-and-protocols-locat.patch |  38 ++
 ...erver-xorg_1.18.4.bb => xserver-xorg_1.19.0.bb} |   9 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    |   4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb  |   2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb       |   2 +-
 ...libav_1.8.3.bb => gstreamer1.0-libav_1.10.1.bb} |   5 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |   3 +-
 ...-don-t-hardcode-libtool-name-when-running.patch |  35 +-
 ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch |  34 ++
 ...gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch |  15 +-
 ...lplugin-enable-gldeinterlace-on-OpenGL-ES.patch | 634 ---------------------
 ...ert-implement-multiple-render-targets-for.patch | 244 --------
 ...ert-don-t-use-the-predefined-variable-nam.patch |  32 --
 .../0005-glshader-add-glBindFragDataLocation.patch |  77 ---
 ...ert-GLES3-deprecates-texture2D-and-it-doe.patch |  51 --
 .../0008-gl-implement-GstGLMemoryEGL.patch         | 495 ----------------
 ...valid-sentinels-for-gst_structure_get-etc.patch |  59 +-
 ...1.8.3.bb => gstreamer1.0-plugins-bad_1.10.1.bb} |  14 +-
 ....8.3.bb => gstreamer1.0-plugins-base_1.10.1.bb} |   5 +-
 ....8.3.bb => gstreamer1.0-plugins-good_1.10.1.bb} |   5 +-
 ....8.3.bb => gstreamer1.0-plugins-ugly_1.10.1.bb} |   5 +-
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |   2 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb   |   6 +
 .../gstreamer/gstreamer1.0-rtsp-server_1.8.3.bb    |   6 -
 .../gstreamer/gstreamer1.0-vaapi.inc               |  38 ++
 .../gstreamer1.0-vaapi/install-tests.patch         |  43 ++
 .../gstreamer/gstreamer1.0-vaapi_1.10.1.bb         |   6 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   1 -
 ...streamer1.0_1.8.3.bb => gstreamer1.0_1.10.1.bb} |   5 +-
 .../libtiff/files/CVE-2015-8665_8683.patch         | 137 -----
 .../libtiff/files/CVE-2015-8781.patch              | 195 -------
 .../libtiff/files/CVE-2015-8784.patch              |  73 ---
 .../libtiff/files/CVE-2016-3186.patch              |  24 -
 .../libtiff/files/CVE-2016-3622.patch              | 129 -----
 .../libtiff/files/CVE-2016-3623.patch              |  52 --
 .../libtiff/files/CVE-2016-3632.patch              |  34 --
 .../libtiff/files/CVE-2016-3658.patch              | 111 ----
 .../libtiff/files/CVE-2016-3945.patch              | 118 ----
 .../libtiff/files/CVE-2016-3990.patch              |  66 ---
 .../libtiff/files/CVE-2016-3991.patch              | 147 -----
 .../libtiff/files/CVE-2016-5321.patch              |  49 --
 .../libtiff/files/CVE-2016-5323.patch              | 107 ----
 .../libtiff/files/CVE-2016-9535-1.patch            | 423 --------------
 .../libtiff/files/CVE-2016-9535-2.patch            |  67 ---
 .../libtiff/files/CVE-2016-9538.patch              |  67 ---
 .../libtiff/files/CVE-2016-9539.patch              |  60 --
 .../libtiff/files/CVE-2016-9540.patch              |  60 --
 .../libtiff/files/Fix_several_CVE_issues.patch     | 281 ---------
 .../libtiff/{tiff_4.0.6.bb => tiff_4.0.7.bb}       |  25 +-
 ...arify-conditions-to-avoid-compiler-errors.patch |  48 ++
 ...mpiler-errors-about-uninitialized-use-of-.patch |  32 --
 meta/recipes-sato/puzzles/puzzles_git.bb           |   4 +-
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 185 ++++++
 meta/recipes-sato/webkit/webkitgtk_2.14.2.bb       |   1 +
 meta/recipes-support/curl/curl_7.51.0.bb           |   1 +
 .../mpfr/{mpfr_3.1.4.bb => mpfr_3.1.5.bb}          |   4 +-
 scripts/devtool                                    |   3 +-
 scripts/lib/scriptutils.py                         |   8 +-
 scripts/lib/wic/utils/partitionedfs.py             |   7 +-
 scripts/oe-buildenv-internal                       |  12 +
 scripts/oe-find-native-sysroot                     |  14 +
 scripts/oe-git-proxy                               |  21 +
 scripts/oe-run-native                              |  11 +-
 scripts/oe-selftest                                | 102 ++++
 scripts/oe-setup-builddir                          |   8 +
 scripts/oe-setup-rpmrepo                           |  28 +-
 scripts/oe-trim-schemas                            |   9 +
 scripts/oepydevshell-internal.py                   |  15 +-
 scripts/recipetool                                 |   4 +-
 scripts/wic                                        |   2 +-
 134 files changed, 1434 insertions(+), 4096 deletions(-)
 create mode 100644 meta-selftest/lib/devtool/bbpath.py
 create mode 100644 meta-selftest/lib/recipetool/bbpath.py
 create mode 100644 meta/lib/oeqa/utils/metadata.py
 create mode 100644 meta/recipes-bsp/grub/files/0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch
 create mode 100644 meta/recipes-bsp/grub/files/0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch
 rename meta/recipes-bsp/systemd-boot/{systemd-boot.bb => systemd-boot_232.bb} (100%)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/disable-remote.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch
 delete mode 100644 meta/recipes-extended/cups/cups_2.1.4.bb
 create mode 100644 meta/recipes-extended/cups/cups_2.2.1.bb
 delete mode 100644 meta/recipes-extended/slang/slang/0001-Fix-error-conflicting-types-for-posix_close.patch
 rename meta/recipes-extended/slang/{slang_2.3.0.bb => slang_2.3.1.bb} (90%)
 create mode 100644 meta/recipes-gnome/gcr/files/gcr-add-missing-dependencies-for-vapi.patch
 rename meta/recipes-gnome/libnotify/{libnotify_0.7.6.bb => libnotify_0.7.7.bb} (79%)
 rename meta/recipes-graphics/matchbox-wm/{matchbox-wm_1.2.1.bb => matchbox-wm_1.2.2.bb} (94%)
 rename meta/recipes-graphics/mesa/{mesa-gl_13.0.1.bb => mesa-gl_13.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_13.0.1.bb => mesa_13.0.2.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.10.3.bb => xf86-input-evdev_2.10.4.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.8.1.bb => xf86-input-keyboard_1.9.0.bb} (73%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.22.0.bb => xf86-input-libinput_0.23.0.bb} (63%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.9.1.bb => xf86-input-mouse_1.9.2.bb} (76%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.8.3.bb => xf86-input-synaptics_1.9.0.bb} (79%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
 rename meta/recipes-graphics/xorg-driver/{xf86-video-omap_0.4.4.bb => xf86-video-omap_0.4.5.bb} (89%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_13.1.0.bb => xf86-video-vmware_13.2.1.bb} (78%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.18.bb => xkeyboard-config_2.19.bb} (88%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.18.4.bb => xserver-xorg_1.19.0.bb} (70%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.8.3.bb => gstreamer1.0-libav_1.10.1.bb} (86%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-glcolorconvert-implement-multiple-render-targets-for.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glshader-add-glBindFragDataLocation.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-gl-implement-GstGLMemoryEGL.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.8.3.bb => gstreamer1.0-plugins-bad_1.10.1.bb} (64%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.8.3.bb => gstreamer1.0-plugins-base_1.10.1.bb} (85%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.8.3.bb => gstreamer1.0-plugins-good_1.10.1.bb} (84%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.8.3.bb => gstreamer1.0-plugins-ugly_1.10.1.bb} (76%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.3.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/install-tests.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.1.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.8.3.bb => gstreamer1.0_1.10.1.bb} (69%)
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3632.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3658.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9535-1.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9535-2.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9538.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9539.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9540.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/Fix_several_CVE_issues.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.0.6.bb => tiff_4.0.7.bb} (64%)
 create mode 100644 meta/recipes-sato/puzzles/files/0001-Clarify-conditions-to-avoid-compiler-errors.patch
 delete mode 100644 meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch
 create mode 100644 meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
 rename meta/recipes-support/mpfr/{mpfr_3.1.4.bb => mpfr_3.1.5.bb} (75%)

Alessio Igor Bogani (1):
  wic: Create a logical partition only when it is really mandatory

Andreas Müller (1):
  mesa: update to 13.0.2

Armin Kuster (1):
  libtiff: Update to 4.0.7

Awais Belal (1):
  grub2: fix some quirks and div by zero

Bruce Ashfield (2):
  linux-yocto/4.8: update to -rt7
  kernel-yocto: explicitly trap subcommand errors

California Sullivan (1):
  parselogs.py: Don't clog QA with Joule errors

Carlos Alberto Lopez Perez (1):
  Revert "webkitgtk: drop patch
    0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch"

Chen Qi (2):
  libarchive: fix ALTERNATIVE_PRIORITY to avoid conflict
  Use weak assignment for SERIAL_CONSOLES in qemu configuration files

Ed Bartosh (11):
  wic: rename command line option -p -> -s
  oe-run-native: standardize usage output
  oe-trim-schemas: create usage output
  beaglebone.conf: enable generation of wic.bmap
  oe-setup-rpmrepo: standardize usage output
  oe-setup-builddir: create usage output
  oepydevshell-internal.py: standardize usage output
  oe-git-proxy: create usage output
  oe-find-native-sysroot: create usage output
  oe-buildenv-internal: show usage output
  edgerouter.conf: enable generation of wic.bmap

Fabio Berton (1):
  libpcap: Disable exposed bits of WinPCAP remote capture support

Huang Qiyu (4):
  libnotify : 0.7.6 -> 0.7.7
  mpfr: 3.1.4 -> 3.1.5
  slang: 2.3.0 -> 2.3.1
  cups: 2.1.4 -> 2.2.1

Ismo Puustinen (2):
  libva: check for "opengl" feature
  gstreamer-vaapi-1.0: check for "opengl" feature

Jackie Huang (1):
  gcr: add missing dependencies for vapi

Jason Wessel (1):
  systemd: Backport cgroup fix from 233 to 232

Juro Bystricky (2):
  edgerouter.py: avoid python3 exception
  targetloader.py: drop test for ClassType

Jussi Kukkonen (13):
  matchbox-wm: Upgrade 1.2.1 -> 1.2.2
  libxfont2: Add recipe
  xserver-xorg: Upgrade 1.18.4 -> 1.19.0
  xf86-input-evdev: Upgrade 2.10.3 -> 2.10.4
  xf86-input-keyboard: Upgrade 1.8.1 -> 1.9.0
  xf86-input-keyboard: Remove git recipe
  xf86-input-mouse: Upgrade 1.9.1 -> 1.9.2
  xf86-input-mouse: Remove git recipe
  xf86-input-synaptics: Upgrade 1.8.3 -> 1.9.0
  xf86-input-synaptics: Remove git recipe
  xf86-video-omap: Upgrade 0.4.4 -> 0.4.5
  xf86-video-vmware: Upgrade 13.1.0 -> 13.2.1
  xf86-input-libinput: Upgrade 0.22 -> 0.23

Khem Raj (6):
  gstreamer1.0: Upgrade to 1.10.1
  systemd-boot: Use PV in recipe name
  gstreamer1.0-plugins-bad: Define and use WAYLAND_PROTOCOLS_SYSROOT_DIR
    for output of pkg-config
  gstreamer1.0-rtsp-server: Add libcheck to deps
  gstreamer1.0-vaapi: Import from meta-intel
  puzzles: Upgrade and fix with clang

Mans Rullgard (1):
  initscripts: populate-volatile: improve config file parsing

Mariano Lopez (3):
  oeqa/utils/commands.py: Make a copy of variables in get_bb_vars
  oeqa/utils/metadata.py: Add metadata library
  oe-selftest: Add option to submit test result to a git repository.

Maxin B. John (1):
  ref-images.xml: remove core-image-directfb reference

Ola x Nilsson (4):
  devtool: selftest: add test for devtool plugin loading
  recipetool: selftest: Add test for recipetool plugin loading
  devtool: Load plugins in a well defined order
  recipetool: Load plugins in a well defined order

Patrick Ohly (1):
  buildstats.py: skip collecting unavailable /proc data

Ross Burton (5):
  tiff: set CVE_PRODUCT
  curl: set CVE_PRODUCT
  cve-check: allow recipes to override the product name
  archiver: don't change directory when generating tarball
  rm_work: add do_write_qemuboot_conf to task list

Saul Wold (1):
  genericx86 & x86-base: Update PREFERRED_VERSION for 4.8 kernel

Yuanjie Huang (1):
  glibc: Enable backtrace from abort on ARM

Zheng Ruoqin (1):
  xkeyboard-config: 2.18 -> 2.19

 documentation/ref-manual/ref-images.xml            |   3 -
 meta-selftest/lib/devtool/bbpath.py                |  44 ++
 meta-selftest/lib/recipetool/bbpath.py             |  41 ++
 meta-yocto-bsp/conf/machine/beaglebone.conf        |   2 +-
 meta-yocto-bsp/conf/machine/edgerouter.conf        |   2 +-
 .../conf/machine/include/genericx86-common.inc     |   2 +-
 .../lib/oeqa/controllers/edgeroutertarget.py       |   2 +-
 meta/classes/archiver.bbclass                      |   8 +-
 meta/classes/cve-check.bbclass                     |   6 +-
 meta/classes/kernel-yocto.bbclass                  |   7 +
 meta/classes/rm_work.bbclass                       |   2 +-
 meta/conf/machine/qemuarm.conf                     |   2 +-
 meta/conf/machine/qemuarm64.conf                   |   2 +-
 meta/conf/machine/qemumips.conf                    |   2 +-
 meta/conf/machine/qemumips64.conf                  |   2 +-
 meta/conf/machine/qemuppc.conf                     |   2 +-
 meta/conf/machine/qemux86-64.conf                  |   2 +-
 meta/conf/machine/qemux86.conf                     |   2 +-
 meta/lib/buildstats.py                             |  19 +-
 meta/lib/oeqa/controllers/testtargetloader.py      |   2 -
 meta/lib/oeqa/runtime/parselogs.py                 |  14 +-
 meta/lib/oeqa/selftest/devtool.py                  |  43 ++
 meta/lib/oeqa/selftest/recipetool.py               |  44 ++
 meta/lib/oeqa/utils/commands.py                    |   1 +
 meta/lib/oeqa/utils/metadata.py                    |  83 +++
 ...ern-efi-mm.c-grub_efi_finish_boot_service.patch |  79 +++
 ...ern-efi-mm.c-grub_efi_get_memory_map-Neve.patch |  43 ++
 meta/recipes-bsp/grub/grub2.inc                    |   2 +
 .../{systemd-boot.bb => systemd-boot_232.bb}       |   0
 .../libpcap/libpcap/disable-remote.patch           |  36 ++
 meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb |   1 +
 meta/recipes-core/glibc/glibc.inc                  |   6 +
 .../initscripts-1.0/populate-volatile.sh           |   6 +-
 .../initscripts/initscripts-1.0/volatiles          |   6 +-
 ...use-the-unified-hierarchy-for-the-systemd.patch |  51 ++
 meta/recipes-core/systemd/systemd_232.bb           |   1 +
 meta/recipes-extended/cups/cups.inc                |   2 +-
 meta/recipes-extended/cups/cups_2.1.4.bb           |   6 -
 meta/recipes-extended/cups/cups_2.2.1.bb           |   6 +
 .../libarchive/libarchive_3.2.2.bb                 |   2 +-
 ...x-error-conflicting-types-for-posix_close.patch |  39 --
 .../slang/{slang_2.3.0.bb => slang_2.3.1.bb}       |   6 +-
 .../gcr-add-missing-dependencies-for-vapi.patch    |  51 ++
 meta/recipes-gnome/gcr/gcr_3.20.0.bb               |   2 +
 .../{libnotify_0.7.6.bb => libnotify_0.7.7.bb}     |   4 +-
 meta/recipes-graphics/libva/libva_1.7.3.bb         |   4 +-
 .../{matchbox-wm_1.2.1.bb => matchbox-wm_1.2.2.bb} |   4 +-
 .../mesa/{mesa-gl_13.0.1.bb => mesa-gl_13.0.2.bb}  |   0
 .../mesa/{mesa_13.0.1.bb => mesa_13.0.2.bb}        |   4 +-
 ...-evdev_2.10.3.bb => xf86-input-evdev_2.10.4.bb} |   4 +-
 ...board_1.8.1.bb => xf86-input-keyboard_1.9.0.bb} |   4 +-
 .../xorg-driver/xf86-input-keyboard_git.bb         |  16 -
 ...put_0.22.0.bb => xf86-input-libinput_0.23.0.bb} |   4 +-
 ...ut-mouse_1.9.1.bb => xf86-input-mouse_1.9.2.bb} |   5 +-
 .../xorg-driver/xf86-input-mouse_git.bb            |  18 -
 ...tics_1.8.3.bb => xf86-input-synaptics_1.9.0.bb} |   4 +-
 .../xorg-driver/xf86-input-synaptics_git.bb        |  18 -
 ...ideo-omap_0.4.4.bb => xf86-video-omap_0.4.5.bb} |   4 +-
 .../0002-add-option-for-vmwgfx.patch               |  37 +-
 ...mware_13.1.0.bb => xf86-video-vmware_13.2.1.bb} |   4 +-
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb  |  22 +
 ...ard-config_2.18.bb => xkeyboard-config_2.19.bb} |   4 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   6 +-
 ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  61 ++
 ...c-Fix-wayland-scanner-and-protocols-locat.patch |  38 ++
 ...erver-xorg_1.18.4.bb => xserver-xorg_1.19.0.bb} |   9 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    |   4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb  |   2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb       |   2 +-
 ...libav_1.8.3.bb => gstreamer1.0-libav_1.10.1.bb} |   5 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |   3 +-
 ...-don-t-hardcode-libtool-name-when-running.patch |  35 +-
 ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch |  34 ++
 ...gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch |  15 +-
 ...lplugin-enable-gldeinterlace-on-OpenGL-ES.patch | 634 ---------------------
 ...ert-implement-multiple-render-targets-for.patch | 244 --------
 ...ert-don-t-use-the-predefined-variable-nam.patch |  32 --
 .../0005-glshader-add-glBindFragDataLocation.patch |  77 ---
 ...ert-GLES3-deprecates-texture2D-and-it-doe.patch |  51 --
 .../0008-gl-implement-GstGLMemoryEGL.patch         | 495 ----------------
 ...valid-sentinels-for-gst_structure_get-etc.patch |  59 +-
 ...1.8.3.bb => gstreamer1.0-plugins-bad_1.10.1.bb} |  14 +-
 ....8.3.bb => gstreamer1.0-plugins-base_1.10.1.bb} |   5 +-
 ....8.3.bb => gstreamer1.0-plugins-good_1.10.1.bb} |   5 +-
 ....8.3.bb => gstreamer1.0-plugins-ugly_1.10.1.bb} |   5 +-
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |   2 +-
 ...1.8.3.bb => gstreamer1.0-rtsp-server_1.10.1.bb} |   4 +-
 .../gstreamer/gstreamer1.0-vaapi.inc               |  38 ++
 .../gstreamer1.0-vaapi/install-tests.patch         |  43 ++
 .../gstreamer/gstreamer1.0-vaapi_1.10.1.bb         |   6 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   1 -
 ...streamer1.0_1.8.3.bb => gstreamer1.0_1.10.1.bb} |   5 +-
 .../libtiff/files/CVE-2015-8665_8683.patch         | 137 -----
 .../libtiff/files/CVE-2015-8781.patch              | 195 -------
 .../libtiff/files/CVE-2015-8784.patch              |  73 ---
 .../libtiff/files/CVE-2016-3186.patch              |  24 -
 .../libtiff/files/CVE-2016-3622.patch              | 129 -----
 .../libtiff/files/CVE-2016-3623.patch              |  52 --
 .../libtiff/files/CVE-2016-3632.patch              |  34 --
 .../libtiff/files/CVE-2016-3658.patch              | 111 ----
 .../libtiff/files/CVE-2016-3945.patch              | 118 ----
 .../libtiff/files/CVE-2016-3990.patch              |  66 ---
 .../libtiff/files/CVE-2016-3991.patch              | 147 -----
 .../libtiff/files/CVE-2016-5321.patch              |  49 --
 .../libtiff/files/CVE-2016-5323.patch              | 107 ----
 .../libtiff/files/CVE-2016-9535-1.patch            | 423 --------------
 .../libtiff/files/CVE-2016-9535-2.patch            |  67 ---
 .../libtiff/files/CVE-2016-9538.patch              |  67 ---
 .../libtiff/files/CVE-2016-9539.patch              |  60 --
 .../libtiff/files/CVE-2016-9540.patch              |  60 --
 .../libtiff/files/Fix_several_CVE_issues.patch     | 281 ---------
 .../libtiff/{tiff_4.0.6.bb => tiff_4.0.7.bb}       |  25 +-
 ...arify-conditions-to-avoid-compiler-errors.patch |  48 ++
 ...mpiler-errors-about-uninitialized-use-of-.patch |  32 --
 meta/recipes-sato/puzzles/puzzles_git.bb           |   4 +-
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 185 ++++++
 meta/recipes-sato/webkit/webkitgtk_2.14.2.bb       |   1 +
 meta/recipes-support/curl/curl_7.51.0.bb           |   1 +
 .../mpfr/{mpfr_3.1.4.bb => mpfr_3.1.5.bb}          |   4 +-
 scripts/devtool                                    |   3 +-
 scripts/lib/scriptutils.py                         |   8 +-
 scripts/lib/wic/utils/partitionedfs.py             |   7 +-
 scripts/oe-buildenv-internal                       |  12 +
 scripts/oe-find-native-sysroot                     |  14 +
 scripts/oe-git-proxy                               |  21 +
 scripts/oe-run-native                              |  11 +-
 scripts/oe-selftest                                | 102 ++++
 scripts/oe-setup-builddir                          |   8 +
 scripts/oe-setup-rpmrepo                           |  28 +-
 scripts/oe-trim-schemas                            |   9 +
 scripts/oepydevshell-internal.py                   |  15 +-
 scripts/recipetool                                 |   4 +-
 scripts/wic                                        |   2 +-
 133 files changed, 1430 insertions(+), 4092 deletions(-)
 create mode 100644 meta-selftest/lib/devtool/bbpath.py
 create mode 100644 meta-selftest/lib/recipetool/bbpath.py
 create mode 100644 meta/lib/oeqa/utils/metadata.py
 create mode 100644 meta/recipes-bsp/grub/files/0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch
 create mode 100644 meta/recipes-bsp/grub/files/0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch
 rename meta/recipes-bsp/systemd-boot/{systemd-boot.bb => systemd-boot_232.bb} (100%)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/disable-remote.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch
 delete mode 100644 meta/recipes-extended/cups/cups_2.1.4.bb
 create mode 100644 meta/recipes-extended/cups/cups_2.2.1.bb
 delete mode 100644 meta/recipes-extended/slang/slang/0001-Fix-error-conflicting-types-for-posix_close.patch
 rename meta/recipes-extended/slang/{slang_2.3.0.bb => slang_2.3.1.bb} (90%)
 create mode 100644 meta/recipes-gnome/gcr/files/gcr-add-missing-dependencies-for-vapi.patch
 rename meta/recipes-gnome/libnotify/{libnotify_0.7.6.bb => libnotify_0.7.7.bb} (79%)
 rename meta/recipes-graphics/matchbox-wm/{matchbox-wm_1.2.1.bb => matchbox-wm_1.2.2.bb} (94%)
 rename meta/recipes-graphics/mesa/{mesa-gl_13.0.1.bb => mesa-gl_13.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_13.0.1.bb => mesa_13.0.2.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.10.3.bb => xf86-input-evdev_2.10.4.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.8.1.bb => xf86-input-keyboard_1.9.0.bb} (73%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.22.0.bb => xf86-input-libinput_0.23.0.bb} (63%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.9.1.bb => xf86-input-mouse_1.9.2.bb} (76%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.8.3.bb => xf86-input-synaptics_1.9.0.bb} (79%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
 rename meta/recipes-graphics/xorg-driver/{xf86-video-omap_0.4.4.bb => xf86-video-omap_0.4.5.bb} (89%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_13.1.0.bb => xf86-video-vmware_13.2.1.bb} (78%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.18.bb => xkeyboard-config_2.19.bb} (88%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.18.4.bb => xserver-xorg_1.19.0.bb} (70%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.8.3.bb => gstreamer1.0-libav_1.10.1.bb} (86%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-glcolorconvert-implement-multiple-render-targets-for.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glshader-add-glBindFragDataLocation.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-gl-implement-GstGLMemoryEGL.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.8.3.bb => gstreamer1.0-plugins-bad_1.10.1.bb} (64%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.8.3.bb => gstreamer1.0-plugins-base_1.10.1.bb} (85%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.8.3.bb => gstreamer1.0-plugins-good_1.10.1.bb} (84%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.8.3.bb => gstreamer1.0-plugins-ugly_1.10.1.bb} (76%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.8.3.bb => gstreamer1.0-rtsp-server_1.10.1.bb} (44%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/install-tests.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.1.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.8.3.bb => gstreamer1.0_1.10.1.bb} (69%)
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3632.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3658.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9535-1.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9535-2.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9538.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9539.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9540.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/Fix_several_CVE_issues.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.0.6.bb => tiff_4.0.7.bb} (64%)
 create mode 100644 meta/recipes-sato/puzzles/files/0001-Clarify-conditions-to-avoid-compiler-errors.patch
 delete mode 100644 meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch
 create mode 100644 meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
 rename meta/recipes-support/mpfr/{mpfr_3.1.4.bb => mpfr_3.1.5.bb} (75%)

-- 
2.8.1


