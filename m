Return-Path: <ross.burton@intel.com>
Received: from mail-wj0-f176.google.com (mail-wj0-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id DDA9371AE4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 11:05:32 +0000 (UTC)
Received: by mail-wj0-f176.google.com with SMTP id i20so63220551wjn.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 03:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T/q6TvPXZ+zuXhNWCwflr2Ah25D8iN2VN4KABiOf3KM=;
	b=WJyovzKWqx4VSCEFLbIQKzfxJoC7yFifVPTeLwEj4aBU2Nr0QHIGTTYq4aKrW3/NS/
	Lm9EYkVEUKpHzlI0RQvf5OvLQP76IqL7CRFzc70MMBuKvhXOorgtZ/Wq8UkENFmwHYWY
	1adejPTajEVLmA4pJ5l+q07wKkDl8t/46rjeQR310XfsrtsYf6UvT5x6lv8pGfDVaqIA
	6CfYtEBrv+m229INALHGxV+CpdIRjVqp4grsVvXjhH4vlJCil918znxWsifRgibwbLRO
	0M5j9J7ziY/MW/SrbV3K7T+Ae8vAkiH2Rbxj5oup2ZgyZAiVQNcU0JpCeL9CJW4YNz04
	V4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T/q6TvPXZ+zuXhNWCwflr2Ah25D8iN2VN4KABiOf3KM=;
	b=SaL14W7cpto9B/meP4SMnFJ0siCE3Fw8suGPZG9UFghLKJA6s/PTmZB/xeBJtMmEKt
	QwtdBS3EEeRif9kKm2793/CPCBAUDwIC6nrZH5EIVl3pRIbxM5+4rAQK/SnnX1zkfgtM
	VF3S0TzF1FMROoDLU9lS6+CqhpbszVEsJ9qm8Guq6G0wczmfxLtNC1HS9lwYB4S7IAxH
	ZROOlFd/xJLtAfsW1mRnlmd9Kj2fVEimSJu1ePxULx6UDHTG38N143O+KwGwPWo/Bemi
	wxskjxrsdw+wYfdsz1FNQjHM+KtoU3SRSFWsaoijyVNdz8NIXnFaK6dV+lKPkKA1oMie
	DrFA==
X-Gm-Message-State: AIkVDXI82tRzM4mxJop/tFiPTGCNG7ZGIHZVqkg7pNZkxWhQxvXMwPAzflXZx4H2qTI+JdfC
X-Received: by 10.194.85.165 with SMTP id i5mr66195314wjz.147.1483959931363;
	Mon, 09 Jan 2017 03:05:31 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	j6sm123289297wjk.25.2017.01.09.03.05.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jan 2017 03:05:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 11:05:24 +0000
Message-Id: <cover.1483959805.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 00/74] Consolidated pull
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
X-List-Received-Date: Mon, 09 Jan 2017 11:05:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Consolidated pull for merging.  Mostly green on the AB (on SHA 5525aca0fae9),
the nightly-musl failure was caused by the new kernel headers interacting badly
with musl and connman so these have both been removed and will be fixed shortly.

Ross

The following changes since commit dbb247cac5fbf7b037e4955f9793828451723924:

  bitbake: cookerdata: Convert multiconfig to use BB_CURRENT_MC (2016-12-22 12:36:40 +0000)

are available in the git repository at:

  ssh://git@git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to a00c4aba8c6ce880889dcbb7540fc94010a4ed2f:

  selftest/devtool: update test to work with new mtd-utils (2017-01-09 10:54:46 +0000)

----------------------------------------------------------------
Alejandro Hernandez (4):
      gummiboot: Remove/change gummiboot references with systemd-boot
      gummiboot: Remove old gummiboot recipe, related class and wks file
      gummiboot: Remove gummiboot tests
      wic: Remove gummiboot test

André Draszik (1):
      module.bbclass: allow to override location of Module.symvers

Aníbal Limón (1):
      bitbake: bb/cooker: BBCooker stops notifier at shutdown

Chen Qi (1):
      opkg-utils: warn if update-alternatives finds priority conflict

Christopher Larson (22):
      waffle: add opengl to REQUIRED_DISTRO_FEATURES
      piglit: add opengl to REQUIRED_DISTRO_FEATURES
      libglu: add opengl to REQUIRED_DISTRO_FEATURES
      eglinfo-x11: add opengl to REQUIRED_DISTRO_FEATURES
      packagegroup-self-hosted: add opengl to REQUIRED_DISTRO_FEATURES
      packagegroup-core-lsb: add opengl to REQUIRED_DISTRO_FEATURES
      valgrind: skip for linux-gnux32
      packagegroup-core-tools-profile: exclude valgrind for x32
      grub-efi: ignore arch mismatch for x32
      lttng-tools: fix for x32
      gnu-efi: build 64-bit for x32
      gnu-efi: ignore arch mismatch for x32
      ltp: fix build for x32
      boost: drop flags bits, fix for x32
      gstreamer1.0-libav: disable asm for x32
      ffmpeg: disable asm for x32
      x264: for x32, disable asm and pass -mx32
      nss: fix for x32
      libunwind: apply a patch to fix x32
      gnome-desktop3: fix for x32
      webkitgtk: patch & disable JIT for x32
      webkitgtk: add missing python-native dep

David Vincent (2):
      classes: Fix alternatives and rc.d ordering
      nss: Fix postinstall script

Denys Dmytriyenko (2):
      linux-dtb: strip DTB extension properly in postinst/postrm
      attr/ea-acl: pass --disable-gettext when USE_NLS=no

Ed Bartosh (3):
      populate_sdk_ext: fix working with uninative sstate
      populate_sdk_ext: whitelist do_package tasks
      mpc8315e-rdb.conf: produce wic images for MPC8315

Haiqing Bai (1):
      nettle: Modify configure script to get consistent build.

He Zhe (2):
      qemu: Fix pci-assign
      kexec-tools: Update to 2.0.14

Huang Qiyu (1):
      file: 5.28 -> 5.29

Jianxun Zhang (1):
      lib/oe.sstatesig: make locked sig file consistent

Jochen Jaegers (1):
      toaster: prevent use of unset variable BUILDSTATS_BASE

Joshua Lock (1):
      zlib: update SRC_URI to fix fetching

Jussi Kukkonen (2):
      ppp: Partly remove patch that doesn't make sense any more
      ppp: Add patch to fix build with musl and 4.9 headers

Kai Kang (1):
      useradd-example: exclude from world

Khem Raj (3):
      gstreamer: Upgrade to 1.10.2
      opkg-utils: Do not use --ignore-fail-on-non-empty with rmdir
      gcc6: Upgrade to 6.3.0

Maxin B. John (2):
      sqlite3: upgrade to 3.15.2
      ifupdown: upgrade to 0.8.16

Mike Crowe (1):
      mtd-utils: Upgrade to 2.0.0

Ola x Nilsson (3):
      externalsrc: Set STAMPCLEAN to match STAMP
      externalsrc: Add optional srcdir arg to srctree_hash_files
      oe-selftest: devtool: Reverting a change should trigger rebuild

Oleksandr Kravchuk (1):
      curl: upgrade to 7.52.1

Patrick Ohly (2):
      runqemu: let command line parameters override defaults
      rootfs-postcommands.bbclass: sort passwd entries

Paul Eggleton (7):
      lib/oe/path: add warning comment about oe.path.remove() with wildcarded filenames
      classes/package_rpm: handle square brackets in filenames
      classes/sstate: handle filenames containing square brackets
      classes/sstate: fix file conflict message
      classes/buildstats: don't expand variable pointing to SystemStats
      oe-selftest: fix behaviour if oe-selftest.log is a dangling symlink
      meta: use require instead of include when file should exist

Richard Purdie (2):
      oe-selftest: Improve BUILDDIR environment handling
      bitbake: prserv/serv: Tweak stdout manipulation to be stream safe

Robert Yang (4):
      debianutils: 4.8 -> 4.8.1
      quilt: 0.64 -> 0.65
      guile: 2.0.12 -> 2.0.13
      hdparm: 9.48 -> 9.50

Ross Burton (3):
      populate_sdk: don't force target debug packages into SDK
      cairo: set license for cairo-doc
      selftest/devtool: update test to work with new mtd-utils

 bitbake/lib/bb/cooker.py                           |   2 +
 bitbake/lib/prserv/serv.py                         |  21 +-
 .../recipes-skeleton/useradd/useradd-example.bb    |   2 +
 meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |   4 +
 meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py      |  83 -----
 meta/classes/buildstats.bbclass                    |   2 +-
 meta/classes/externalsrc.bbclass                   |   7 +-
 meta/classes/fs-uuid.bbclass                       |   2 +-
 meta/classes/gummiboot.bbclass                     | 121 -------
 meta/classes/module.bbclass                        |  16 +-
 meta/classes/package_rpm.bbclass                   |   6 +
 meta/classes/populate_sdk_base.bbclass             |   5 +-
 meta/classes/populate_sdk_ext.bbclass              |   7 +-
 meta/classes/rootfs-postcommands.bbclass           |  20 ++
 meta/classes/sstate.bbclass                        |  24 +-
 meta/classes/systemd-boot.bbclass                  |   4 +-
 meta/classes/toaster.bbclass                       |   6 +-
 meta/classes/update-alternatives.bbclass           |  29 +-
 meta/classes/update-rc.d.bbclass                   |  20 +-
 meta/conf/distro/include/distro_alias.inc          |   2 +-
 meta/conf/distro/include/tcmode-default.inc        |   2 +-
 meta/lib/oe/path.py                                |   9 +-
 meta/lib/oe/sstatesig.py                           |   5 +-
 meta/lib/oeqa/controllers/masterimage.py           |   4 +-
 meta/lib/oeqa/selftest/devtool.py                  |  58 ++-
 meta/lib/oeqa/selftest/wic.py                      |   7 -
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb          |  12 +
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |   5 +-
 ...-C-syntax-errors-for-function-declaration.patch |  74 ----
 .../gummiboot/gummiboot/fix-objcopy.patch          |  45 ---
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |  39 --
 meta/recipes-bsp/systemd-boot/systemd-boot_232.bb  |   2 +-
 ...01-ppp-Fix-compilation-errors-in-Makefile.patch |  51 +--
 .../ppp/ppp/0001-ppp-Remove-unneeded-include.patch |  43 +++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |   1 +
 meta/recipes-core/glibc/glibc-locale.inc           |   2 +-
 meta/recipes-core/glibc/glibc-mtrace.inc           |   2 +-
 meta/recipes-core/glibc/glibc-scripts.inc          |   2 +-
 ...-6-.defn-fix-inverted-checks-for-loopback.patch | 395 +++++++++++++++++++--
 .../{ifupdown_0.8.2.bb => ifupdown_0.8.16.bb}      |   4 +-
 .../initrdscripts/files/init-install-efi-testfs.sh |  12 +-
 .../initrdscripts/files/init-install-efi.sh        |  12 +-
 .../packagegroup-core-tools-profile.bb             |   1 +
 .../packagegroups/packagegroup-self-hosted.bb      |   3 +
 meta/recipes-core/zlib/zlib_1.2.8.bb               |   2 +-
 .../file/{file_5.28.bb => file_5.29.bb}            |   2 +-
 .../gcc/{gcc-6.2.inc => gcc-6.3.inc}               |  11 +-
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   0
 .../{gcc-6.2 => gcc-6.3}/0002-uclibc-conf.patch    |   0
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   0
 .../{gcc-6.2 => gcc-6.3}/0004-uclibc-locale.patch  |   0
 .../0005-uclibc-locale-no__x.patch                 |   0
 .../0006-uclibc-locale-wchar_fix.patch             |   0
 .../0007-uclibc-locale-update.patch                |   0
 .../0008-missing-execinfo_h.patch                  |   0
 .../{gcc-6.2 => gcc-6.3}/0009-c99-snprintf.patch   |   0
 .../0010-gcc-poison-system-directories.patch       |   0
 .../0011-gcc-poison-dir-extend.patch               |   0
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   0
 .../0013-64-bit-multilib-hack.patch                |   0
 .../0014-optional-libstdc.patch                    |   0
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   0
 .../0016-COLLECT_GCC_OPTIONS.patch                 |   0
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   0
 .../0018-fortran-cross-compile-hack.patch          |   0
 .../0019-cpp-honor-sysroot.patch                   |   0
 .../0020-MIPS64-Default-to-N64-ABI.patch           |   0
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   0
 ...0022-gcc-Fix-argument-list-too-long-error.patch |   0
 .../{gcc-6.2 => gcc-6.3}/0023-Disable-sdt.patch    |   0
 .../gcc/{gcc-6.2 => gcc-6.3}/0024-libtool.patch    |   0
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   0
 ...tilib-config-files-from-B-instead-of-usin.patch |   0
 ...-libdir-from-.la-which-usually-points-to-.patch |   0
 .../gcc/{gcc-6.2 => gcc-6.3}/0028-export-CPP.patch |   0
 ...AltiVec-generation-on-powepc-linux-target.patch |   0
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   0
 ...Ensure-target-gcc-headers-can-be-included.patch |   0
 ...-t-build-with-disable-dependency-tracking.patch |   0
 ...h-host-directory-during-relink-if-inst_pr.patch |   0
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |   0
 .../0035-aarch64-Add-support-for-musl-ldso.patch   |   0
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |   0
 ...-handle-sysroot-support-for-nativesdk-gcc.patch |   0
 ...et-sysroot-gcc-version-specific-dirs-with.patch |   0
 ...-various-_FOR_BUILD-and-related-variables.patch |   0
 .../0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |   0
 .../{gcc-6.2 => gcc-6.3}/0041-ssp_nonshared.patch  |   0
 ...c-libcpp-support-ffile-prefix-map-old-new.patch |   0
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch |   0
 ...-fdebug-prefix-map-support-to-remap-sourc.patch |   0
 ...45-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |   0
 ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   0
 ...e-alias-for-__cpu_indicator_init-instead-.patch |   0
 ...et-71056-Don-t-use-vectorized-builtins-wh.patch |   0
 .../gcc/{gcc-6.2 => gcc-6.3}/CVE-2016-4490.patch   |   0
 ...s-canadian_6.2.bb => gcc-cross-canadian_6.3.bb} |   0
 ...oss-initial_6.2.bb => gcc-cross-initial_6.3.bb} |   0
 .../gcc/{gcc-cross_6.2.bb => gcc-cross_6.3.bb}     |   0
 ...-initial_6.2.bb => gcc-crosssdk-initial_6.3.bb} |   0
 .../{gcc-crosssdk_6.2.bb => gcc-crosssdk_6.3.bb}   |   0
 .../gcc/{gcc-runtime_6.2.bb => gcc-runtime_6.3.bb} |   0
 ...gcc-sanitizers_6.2.bb => gcc-sanitizers_6.3.bb} |   0
 .../gcc/{gcc-source_6.2.bb => gcc-source_6.3.bb}   |   0
 .../gcc/{gcc_6.2.bb => gcc_6.3.bb}                 |   0
 ...libgcc-initial_6.2.bb => libgcc-initial_6.3.bb} |   0
 .../gcc/{libgcc_6.2.bb => libgcc_6.3.bb}           |   0
 .../gcc/{libgfortran_6.2.bb => libgfortran_6.3.bb} |   0
 ...002-Recognize-nios2-as-compilation-target.patch |  32 --
 .../guile/{guile_2.0.12.bb => guile_2.0.13.bb}     |   5 +-
 .../mtd/mtd-utils/0001-Fix-build-with-musl.patch   |   4 +-
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |   2 +-
 .../mtd/mtd-utils/fix-armv7-neon-alignment.patch   |   4 +-
 ...t-cleanmarker-with-flash_erase--j-command.patch |   4 +-
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |   6 +-
 ...rnatives-warn-when-multiple-providers-hav.patch |  26 ++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |   5 +-
 ...sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch |  71 ++++
 meta/recipes-devtools/qemu/qemu_2.7.0.bb           |   1 +
 .../{quilt-native_0.64.bb => quilt-native_0.65.bb} |   0
 meta/recipes-devtools/quilt/quilt.inc              |   7 +-
 meta/recipes-devtools/quilt/quilt/install.patch    |  13 -
 .../quilt/{quilt_0.64.bb => quilt_0.65.bb}         |   0
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   3 +
 meta/recipes-extended/cpio/cpio_2.12.bb            |   2 +-
 .../hdparm/{hdparm_9.48.bb => hdparm_9.50.bb}      |   8 +-
 .../ltp/fcntl-fix-the-time-def-to-use-time_t.patch |  28 ++
 meta/recipes-extended/ltp/ltp_20160126.bb          |   1 +
 .../packagegroups/packagegroup-core-lsb.bb         |   3 +
 ...op-thumbnail-don-t-convert-time_t-to-long.patch |  72 ++++
 .../gnome-desktop/gnome-desktop3_3.22.2.bb         |   2 +
 meta/recipes-graphics/cairo/cairo.inc              |   1 +
 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb  |   2 +-
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb |   5 +-
 meta/recipes-graphics/mesa/libglu_9.0.0.bb         |   2 +-
 meta/recipes-graphics/piglit/piglit_git.bb         |   3 +
 meta/recipes-graphics/waffle/waffle_1.5.2.bb       |   3 +
 .../xorg-driver/xorg-driver-input.inc              |   2 +-
 .../xorg-driver/xorg-driver-video.inc              |   2 +-
 ...nd-the-semantics-of-kexec_iomem_for_each_.patch |  78 ++++
 ...eneralize-and-rename-get_kernel_stext_sym.patch | 194 ++++++++++
 ...0003-arm64-identify-PHYS_OFFSET-correctly.patch |  76 ++++
 .../0004-arm64-kdump-identify-memory-regions.patch | 202 +++++++++++
 ...5-arm64-kdump-add-elf-core-header-segment.patch | 191 ++++++++++
 ...6-arm64-kdump-set-up-kernel-image-segment.patch | 137 +++++++
 .../0007-arm64-kdump-set-up-other-segments.patch   |  35 ++
 ...-add-DT-properties-to-crash-dump-kernel-s.patch | 150 ++++++++
 ...-kdump-Add-support-for-binary-image-files.patch |  52 +++
 ...kexec-tools_2.0.12.bb => kexec-tools_2.0.14.bb} |  17 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |   4 +-
 meta/recipes-kernel/lttng/lttng-tools/x32.patch    |  16 +
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |   1 +
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb     |   2 +
 .../gstreamer/gstreamer1.0-libav.inc               |   4 +
 ...ibav_1.10.1.bb => gstreamer1.0-libav_1.10.2.bb} |   6 +-
 .../gstreamer/gstreamer1.0-libav_git.bb            |   2 +-
 .../gstreamer/gstreamer1.0-omx_1.10.2.bb           |  10 +
 .../gstreamer/gstreamer1.0-omx_1.2.0.bb            |   2 +-
 .../gstreamer/gstreamer1.0-omx_git.bb              |   2 +-
 ...valid-sentinels-for-gst_structure_get-etc.patch |  34 +-
 ....10.1.bb => gstreamer1.0-plugins-bad_1.10.2.bb} |   6 +-
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |   2 +-
 ...10.1.bb => gstreamer1.0-plugins-base_1.10.2.bb} |   6 +-
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     |   2 +-
 ...10.1.bb => gstreamer1.0-plugins-good_1.10.2.bb} |   6 +-
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |   2 +-
 ...10.1.bb => gstreamer1.0-plugins-ugly_1.10.2.bb} |   6 +-
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb     |   2 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb   |   6 -
 .../gstreamer/gstreamer1.0-rtsp-server_1.10.2.bb   |   6 +
 .../gstreamer/gstreamer1.0-vaapi_1.10.1.bb         |   6 -
 .../gstreamer/gstreamer1.0-vaapi_1.10.2.bb         |   5 +
 ...treamer1.0_1.10.1.bb => gstreamer1.0_1.10.2.bb} |   6 +-
 .../gstreamer/gstreamer1.0_git.bb                  |   2 +-
 .../x264/x264/Fix-X32-build-by-disabling-asm.patch |  53 +++
 meta/recipes-multimedia/x264/x264_git.bb           |   1 +
 .../webkit/webkitgtk/x32_support.patch             |  22 ++
 meta/recipes-sato/webkit/webkitgtk_2.14.2.bb       |   8 +
 meta/recipes-support/attr/ea-acl.inc               |   1 +
 meta/recipes-support/boost/bjam-native_1.62.0.bb   |   2 +-
 meta/recipes-support/boost/boost.inc               |   3 +
 ...-Apply-boost-1.62.0-no-forced-flags.patch.patch | 100 ++++++
 ...Don-t-set-up-m32-m64-we-do-that-ourselves.patch |  97 +++++
 ...p-arch-instruction-set-flags-we-do-that-o.patch | 143 ++++++++
 meta/recipes-support/boost/boost_1.62.0.bb         |   7 +-
 .../curl/{curl_7.51.0.bb => curl_7.52.1.bb}        |   4 +-
 .../{debianutils_4.8.bb => debianutils_4.8.1.bb}   |   7 +-
 .../libunwind/libunwind/libunwind-1.1-x32.patch    |  31 ++
 meta/recipes-support/libunwind/libunwind_git.bb    |   1 +
 ...k-header-files-of-openssl-only-if-enable_.patch |  38 ++
 ...k-header-files-of-openssl-only-if-enable_.patch |  38 ++
 meta/recipes-support/nettle/nettle_2.7.1.bb        |   1 +
 meta/recipes-support/nettle/nettle_3.3.bb          |   4 +
 .../nss/nss/Fix-compilation-for-X32.patch          |  31 ++
 meta/recipes-support/nss/nss_3.27.1.bb             |  13 +-
 .../{sqlite3_3.15.1.bb => sqlite3_3.15.2.bb}       |   4 +-
 scripts/contrib/mkefidisk.sh                       |  26 +-
 scripts/lib/wic/canned-wks/mkgummidisk.wks         |  11 -
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  22 +-
 scripts/oe-selftest                                |  22 +-
 scripts/runqemu                                    |   2 +-
 201 files changed, 2730 insertions(+), 747 deletions(-)
 delete mode 100644 meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py
 delete mode 100644 meta/classes/gummiboot.bbclass
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot_git.bb
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-ppp-Remove-unneeded-include.patch
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.2.bb => ifupdown_0.8.16.bb} (95%)
 rename meta/recipes-devtools/file/{file_5.28.bb => file_5.29.bb} (96%)
 rename meta/recipes-devtools/gcc/{gcc-6.2.inc => gcc-6.3.inc} (95%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0002-uclibc-conf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0003-gcc-uclibc-locale-ctype_touplow_t.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0004-uclibc-locale.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0005-uclibc-locale-no__x.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0006-uclibc-locale-wchar_fix.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0007-uclibc-locale-update.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0008-missing-execinfo_h.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0009-c99-snprintf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0010-gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0011-gcc-poison-dir-extend.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0013-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0014-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0016-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0018-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0019-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0020-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0022-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0023-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0024-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0028-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0031-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0035-aarch64-Add-support-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0037-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0039-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0041-ssp_nonshared.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/CVE-2016-4490.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_6.2.bb => gcc-cross-canadian_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_6.2.bb => gcc-cross-initial_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_6.2.bb => gcc-cross_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_6.2.bb => gcc-crosssdk-initial_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_6.2.bb => gcc-crosssdk_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_6.2.bb => gcc-runtime_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_6.2.bb => gcc-sanitizers_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_6.2.bb => gcc-source_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_6.2.bb => gcc_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_6.2.bb => libgcc-initial_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_6.2.bb => libgcc_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_6.2.bb => libgfortran_6.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch
 rename meta/recipes-devtools/guile/{guile_2.0.12.bb => guile_2.0.13.bb} (95%)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
 rename meta/recipes-devtools/quilt/{quilt-native_0.64.bb => quilt-native_0.65.bb} (100%)
 delete mode 100644 meta/recipes-devtools/quilt/quilt/install.patch
 rename meta/recipes-devtools/quilt/{quilt_0.64.bb => quilt_0.65.bb} (100%)
 rename meta/recipes-extended/hdparm/{hdparm_9.48.bb => hdparm_9.50.bb} (81%)
 create mode 100644 meta/recipes-extended/ltp/ltp/fcntl-fix-the-time-def-to-use-time_t.patch
 create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-exntend-the-semantics-of-kexec_iomem_for_each_.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0003-arm64-identify-PHYS_OFFSET-correctly.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0004-arm64-kdump-identify-memory-regions.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0005-arm64-kdump-add-elf-core-header-segment.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0006-arm64-kdump-set-up-kernel-image-segment.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0007-arm64-kdump-set-up-other-segments.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0009-arm64-kdump-Add-support-for-binary-image-files.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.12.bb => kexec-tools_2.0.14.bb} (53%)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/x32.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.10.1.bb => gstreamer1.0-libav_1.10.2.bb} (84%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.2.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.10.1.bb => gstreamer1.0-plugins-bad_1.10.2.bb} (86%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.10.1.bb => gstreamer1.0-plugins-base_1.10.2.bb} (82%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.10.1.bb => gstreamer1.0-plugins-good_1.10.2.bb} (80%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.10.1.bb => gstreamer1.0-plugins-ugly_1.10.2.bb} (70%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.2.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.1.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.2.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.10.1.bb => gstreamer1.0_1.10.2.bb} (64%)
 create mode 100644 meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/x32_support.patch
 create mode 100644 meta/recipes-support/boost/boost/0001-Apply-boost-1.62.0-no-forced-flags.patch.patch
 create mode 100644 meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch
 create mode 100644 meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
 rename meta/recipes-support/curl/{curl_7.51.0.bb => curl_7.52.1.bb} (94%)
 rename meta/recipes-support/debianutils/{debianutils_4.8.bb => debianutils_4.8.1.bb} (86%)
 create mode 100644 meta/recipes-support/libunwind/libunwind/libunwind-1.1-x32.patch
 create mode 100644 meta/recipes-support/nettle/nettle-2.7.1/check-header-files-of-openssl-only-if-enable_.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.3/check-header-files-of-openssl-only-if-enable_.patch
 create mode 100644 meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.15.1.bb => sqlite3_3.15.2.bb} (66%)
 delete mode 100644 scripts/lib/wic/canned-wks/mkgummidisk.wks

Alejandro Hernandez (4):
  gummiboot: Remove/change gummiboot references with systemd-boot
  gummiboot: Remove old gummiboot recipe, related class and wks file
  gummiboot: Remove gummiboot tests
  wic: Remove gummiboot test

André Draszik (1):
  module.bbclass: allow to override location of Module.symvers

Aníbal Limón (1):
  bitbake: bb/cooker: BBCooker stops notifier at shutdown

Chen Qi (1):
  opkg-utils: warn if update-alternatives finds priority conflict

Christopher Larson (22):
  waffle: add opengl to REQUIRED_DISTRO_FEATURES
  piglit: add opengl to REQUIRED_DISTRO_FEATURES
  libglu: add opengl to REQUIRED_DISTRO_FEATURES
  eglinfo-x11: add opengl to REQUIRED_DISTRO_FEATURES
  packagegroup-self-hosted: add opengl to REQUIRED_DISTRO_FEATURES
  packagegroup-core-lsb: add opengl to REQUIRED_DISTRO_FEATURES
  valgrind: skip for linux-gnux32
  packagegroup-core-tools-profile: exclude valgrind for x32
  grub-efi: ignore arch mismatch for x32
  lttng-tools: fix for x32
  gnu-efi: build 64-bit for x32
  gnu-efi: ignore arch mismatch for x32
  ltp: fix build for x32
  boost: drop flags bits, fix for x32
  gstreamer1.0-libav: disable asm for x32
  ffmpeg: disable asm for x32
  x264: for x32, disable asm and pass -mx32
  nss: fix for x32
  libunwind: apply a patch to fix x32
  gnome-desktop3: fix for x32
  webkitgtk: patch & disable JIT for x32
  webkitgtk: add missing python-native dep

David Vincent (2):
  classes: Fix alternatives and rc.d ordering
  nss: Fix postinstall script

Denys Dmytriyenko (2):
  linux-dtb: strip DTB extension properly in postinst/postrm
  attr/ea-acl: pass --disable-gettext when USE_NLS=no

Ed Bartosh (3):
  populate_sdk_ext: fix working with uninative sstate
  populate_sdk_ext: whitelist do_package tasks
  mpc8315e-rdb.conf: produce wic images for MPC8315

Haiqing Bai (1):
  nettle: Modify configure script to get consistent build.

He Zhe (2):
  qemu: Fix pci-assign
  kexec-tools: Update to 2.0.14

Huang Qiyu (1):
  file: 5.28 -> 5.29

Jianxun Zhang (1):
  lib/oe.sstatesig: make locked sig file consistent

Jochen Jaegers (1):
  toaster: prevent use of unset variable BUILDSTATS_BASE

Joshua Lock (1):
  zlib: update SRC_URI to fix fetching

Jussi Kukkonen (2):
  ppp: Partly remove patch that doesn't make sense any more
  ppp: Add patch to fix build with musl and 4.9 headers

Kai Kang (1):
  useradd-example: exclude from world

Khem Raj (3):
  gstreamer: Upgrade to 1.10.2
  opkg-utils: Do not use --ignore-fail-on-non-empty with rmdir
  gcc6: Upgrade to 6.3.0

Maxin B. John (2):
  sqlite3: upgrade to 3.15.2
  ifupdown: upgrade to 0.8.16

Mike Crowe (1):
  mtd-utils: Upgrade to 2.0.0

Ola x Nilsson (3):
  externalsrc: Set STAMPCLEAN to match STAMP
  externalsrc: Add optional srcdir arg to srctree_hash_files
  oe-selftest: devtool: Reverting a change should trigger rebuild

Oleksandr Kravchuk (1):
  curl: upgrade to 7.52.1

Patrick Ohly (2):
  runqemu: let command line parameters override defaults
  rootfs-postcommands.bbclass: sort passwd entries

Paul Eggleton (7):
  lib/oe/path: add warning comment about oe.path.remove() with
    wildcarded filenames
  classes/package_rpm: handle square brackets in filenames
  classes/sstate: handle filenames containing square brackets
  classes/sstate: fix file conflict message
  classes/buildstats: don't expand variable pointing to SystemStats
  oe-selftest: fix behaviour if oe-selftest.log is a dangling symlink
  meta: use require instead of include when file should exist

Richard Purdie (2):
  oe-selftest: Improve BUILDDIR environment handling
  bitbake: prserv/serv: Tweak stdout manipulation to be stream safe

Robert Yang (4):
  debianutils: 4.8 -> 4.8.1
  quilt: 0.64 -> 0.65
  guile: 2.0.12 -> 2.0.13
  hdparm: 9.48 -> 9.50

Ross Burton (3):
  populate_sdk: don't force target debug packages into SDK
  cairo: set license for cairo-doc
  selftest/devtool: update test to work with new mtd-utils

 bitbake/lib/bb/cooker.py                           |   2 +
 bitbake/lib/prserv/serv.py                         |  21 +-
 .../recipes-skeleton/useradd/useradd-example.bb    |   2 +
 meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |   4 +
 meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py      |  83 -----
 meta/classes/buildstats.bbclass                    |   2 +-
 meta/classes/externalsrc.bbclass                   |   7 +-
 meta/classes/fs-uuid.bbclass                       |   2 +-
 meta/classes/gummiboot.bbclass                     | 121 -------
 meta/classes/module.bbclass                        |  16 +-
 meta/classes/package_rpm.bbclass                   |   6 +
 meta/classes/populate_sdk_base.bbclass             |   5 +-
 meta/classes/populate_sdk_ext.bbclass              |   7 +-
 meta/classes/rootfs-postcommands.bbclass           |  20 ++
 meta/classes/sstate.bbclass                        |  24 +-
 meta/classes/systemd-boot.bbclass                  |   4 +-
 meta/classes/toaster.bbclass                       |   6 +-
 meta/classes/update-alternatives.bbclass           |  29 +-
 meta/classes/update-rc.d.bbclass                   |  20 +-
 meta/conf/distro/include/distro_alias.inc          |   2 +-
 meta/conf/distro/include/tcmode-default.inc        |   2 +-
 meta/lib/oe/path.py                                |   9 +-
 meta/lib/oe/sstatesig.py                           |   5 +-
 meta/lib/oeqa/controllers/masterimage.py           |   4 +-
 meta/lib/oeqa/selftest/devtool.py                  |  58 ++-
 meta/lib/oeqa/selftest/wic.py                      |   7 -
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb          |  12 +
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |   5 +-
 ...-C-syntax-errors-for-function-declaration.patch |  74 ----
 .../gummiboot/gummiboot/fix-objcopy.patch          |  45 ---
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |  39 --
 meta/recipes-bsp/systemd-boot/systemd-boot_232.bb  |   2 +-
 ...01-ppp-Fix-compilation-errors-in-Makefile.patch |  51 +--
 .../ppp/ppp/0001-ppp-Remove-unneeded-include.patch |  43 +++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |   1 +
 meta/recipes-core/glibc/glibc-locale.inc           |   2 +-
 meta/recipes-core/glibc/glibc-mtrace.inc           |   2 +-
 meta/recipes-core/glibc/glibc-scripts.inc          |   2 +-
 ...-6-.defn-fix-inverted-checks-for-loopback.patch | 395 +++++++++++++++++++--
 .../{ifupdown_0.8.2.bb => ifupdown_0.8.16.bb}      |   4 +-
 .../initrdscripts/files/init-install-efi-testfs.sh |  12 +-
 .../initrdscripts/files/init-install-efi.sh        |  12 +-
 .../packagegroup-core-tools-profile.bb             |   1 +
 .../packagegroups/packagegroup-self-hosted.bb      |   3 +
 meta/recipes-core/zlib/zlib_1.2.8.bb               |   2 +-
 .../file/{file_5.28.bb => file_5.29.bb}            |   2 +-
 .../gcc/{gcc-6.2.inc => gcc-6.3.inc}               |  11 +-
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   0
 .../{gcc-6.2 => gcc-6.3}/0002-uclibc-conf.patch    |   0
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   0
 .../{gcc-6.2 => gcc-6.3}/0004-uclibc-locale.patch  |   0
 .../0005-uclibc-locale-no__x.patch                 |   0
 .../0006-uclibc-locale-wchar_fix.patch             |   0
 .../0007-uclibc-locale-update.patch                |   0
 .../0008-missing-execinfo_h.patch                  |   0
 .../{gcc-6.2 => gcc-6.3}/0009-c99-snprintf.patch   |   0
 .../0010-gcc-poison-system-directories.patch       |   0
 .../0011-gcc-poison-dir-extend.patch               |   0
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   0
 .../0013-64-bit-multilib-hack.patch                |   0
 .../0014-optional-libstdc.patch                    |   0
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   0
 .../0016-COLLECT_GCC_OPTIONS.patch                 |   0
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   0
 .../0018-fortran-cross-compile-hack.patch          |   0
 .../0019-cpp-honor-sysroot.patch                   |   0
 .../0020-MIPS64-Default-to-N64-ABI.patch           |   0
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   0
 ...0022-gcc-Fix-argument-list-too-long-error.patch |   0
 .../{gcc-6.2 => gcc-6.3}/0023-Disable-sdt.patch    |   0
 .../gcc/{gcc-6.2 => gcc-6.3}/0024-libtool.patch    |   0
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   0
 ...tilib-config-files-from-B-instead-of-usin.patch |   0
 ...-libdir-from-.la-which-usually-points-to-.patch |   0
 .../gcc/{gcc-6.2 => gcc-6.3}/0028-export-CPP.patch |   0
 ...AltiVec-generation-on-powepc-linux-target.patch |   0
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   0
 ...Ensure-target-gcc-headers-can-be-included.patch |   0
 ...-t-build-with-disable-dependency-tracking.patch |   0
 ...h-host-directory-during-relink-if-inst_pr.patch |   0
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |   0
 .../0035-aarch64-Add-support-for-musl-ldso.patch   |   0
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |   0
 ...-handle-sysroot-support-for-nativesdk-gcc.patch |   0
 ...et-sysroot-gcc-version-specific-dirs-with.patch |   0
 ...-various-_FOR_BUILD-and-related-variables.patch |   0
 .../0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |   0
 .../{gcc-6.2 => gcc-6.3}/0041-ssp_nonshared.patch  |   0
 ...c-libcpp-support-ffile-prefix-map-old-new.patch |   0
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch |   0
 ...-fdebug-prefix-map-support-to-remap-sourc.patch |   0
 ...45-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |   0
 ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   0
 ...e-alias-for-__cpu_indicator_init-instead-.patch |   0
 ...et-71056-Don-t-use-vectorized-builtins-wh.patch |   0
 .../gcc/{gcc-6.2 => gcc-6.3}/CVE-2016-4490.patch   |   0
 ...s-canadian_6.2.bb => gcc-cross-canadian_6.3.bb} |   0
 ...oss-initial_6.2.bb => gcc-cross-initial_6.3.bb} |   0
 .../gcc/{gcc-cross_6.2.bb => gcc-cross_6.3.bb}     |   0
 ...-initial_6.2.bb => gcc-crosssdk-initial_6.3.bb} |   0
 .../{gcc-crosssdk_6.2.bb => gcc-crosssdk_6.3.bb}   |   0
 .../gcc/{gcc-runtime_6.2.bb => gcc-runtime_6.3.bb} |   0
 ...gcc-sanitizers_6.2.bb => gcc-sanitizers_6.3.bb} |   0
 .../gcc/{gcc-source_6.2.bb => gcc-source_6.3.bb}   |   0
 .../gcc/{gcc_6.2.bb => gcc_6.3.bb}                 |   0
 ...libgcc-initial_6.2.bb => libgcc-initial_6.3.bb} |   0
 .../gcc/{libgcc_6.2.bb => libgcc_6.3.bb}           |   0
 .../gcc/{libgfortran_6.2.bb => libgfortran_6.3.bb} |   0
 ...002-Recognize-nios2-as-compilation-target.patch |  32 --
 .../guile/{guile_2.0.12.bb => guile_2.0.13.bb}     |   5 +-
 .../mtd/mtd-utils/0001-Fix-build-with-musl.patch   |   4 +-
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |   2 +-
 .../mtd/mtd-utils/fix-armv7-neon-alignment.patch   |   4 +-
 ...t-cleanmarker-with-flash_erase--j-command.patch |   4 +-
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |   6 +-
 ...rnatives-warn-when-multiple-providers-hav.patch |  26 ++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |   5 +-
 ...sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch |  71 ++++
 meta/recipes-devtools/qemu/qemu_2.7.0.bb           |   1 +
 .../{quilt-native_0.64.bb => quilt-native_0.65.bb} |   0
 meta/recipes-devtools/quilt/quilt.inc              |   7 +-
 meta/recipes-devtools/quilt/quilt/install.patch    |  13 -
 .../quilt/{quilt_0.64.bb => quilt_0.65.bb}         |   0
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   3 +
 meta/recipes-extended/cpio/cpio_2.12.bb            |   2 +-
 .../hdparm/{hdparm_9.48.bb => hdparm_9.50.bb}      |   8 +-
 .../ltp/fcntl-fix-the-time-def-to-use-time_t.patch |  28 ++
 meta/recipes-extended/ltp/ltp_20160126.bb          |   1 +
 .../packagegroups/packagegroup-core-lsb.bb         |   3 +
 ...op-thumbnail-don-t-convert-time_t-to-long.patch |  72 ++++
 .../gnome-desktop/gnome-desktop3_3.22.2.bb         |   2 +
 meta/recipes-graphics/cairo/cairo.inc              |   1 +
 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb  |   2 +-
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb |   5 +-
 meta/recipes-graphics/mesa/libglu_9.0.0.bb         |   2 +-
 meta/recipes-graphics/piglit/piglit_git.bb         |   3 +
 meta/recipes-graphics/waffle/waffle_1.5.2.bb       |   3 +
 .../xorg-driver/xorg-driver-input.inc              |   2 +-
 .../xorg-driver/xorg-driver-video.inc              |   2 +-
 ...nd-the-semantics-of-kexec_iomem_for_each_.patch |  78 ++++
 ...eneralize-and-rename-get_kernel_stext_sym.patch | 194 ++++++++++
 ...0003-arm64-identify-PHYS_OFFSET-correctly.patch |  76 ++++
 .../0004-arm64-kdump-identify-memory-regions.patch | 202 +++++++++++
 ...5-arm64-kdump-add-elf-core-header-segment.patch | 191 ++++++++++
 ...6-arm64-kdump-set-up-kernel-image-segment.patch | 137 +++++++
 .../0007-arm64-kdump-set-up-other-segments.patch   |  35 ++
 ...-add-DT-properties-to-crash-dump-kernel-s.patch | 150 ++++++++
 ...-kdump-Add-support-for-binary-image-files.patch |  52 +++
 ...kexec-tools_2.0.12.bb => kexec-tools_2.0.14.bb} |  17 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |   4 +-
 meta/recipes-kernel/lttng/lttng-tools/x32.patch    |  16 +
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |   1 +
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb     |   2 +
 .../gstreamer/gstreamer1.0-libav.inc               |   4 +
 ...ibav_1.10.1.bb => gstreamer1.0-libav_1.10.2.bb} |   6 +-
 .../gstreamer/gstreamer1.0-libav_git.bb            |   2 +-
 .../gstreamer/gstreamer1.0-omx_1.10.2.bb           |  10 +
 .../gstreamer/gstreamer1.0-omx_1.2.0.bb            |   2 +-
 .../gstreamer/gstreamer1.0-omx_git.bb              |   2 +-
 ...valid-sentinels-for-gst_structure_get-etc.patch |  34 +-
 ....10.1.bb => gstreamer1.0-plugins-bad_1.10.2.bb} |   6 +-
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |   2 +-
 ...10.1.bb => gstreamer1.0-plugins-base_1.10.2.bb} |   6 +-
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     |   2 +-
 ...10.1.bb => gstreamer1.0-plugins-good_1.10.2.bb} |   6 +-
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |   2 +-
 ...10.1.bb => gstreamer1.0-plugins-ugly_1.10.2.bb} |   6 +-
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb     |   2 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb   |   6 -
 .../gstreamer/gstreamer1.0-rtsp-server_1.10.2.bb   |   6 +
 ...aapi_1.10.1.bb => gstreamer1.0-vaapi_1.10.2.bb} |   5 +-
 ...treamer1.0_1.10.1.bb => gstreamer1.0_1.10.2.bb} |   6 +-
 .../gstreamer/gstreamer1.0_git.bb                  |   2 +-
 .../x264/x264/Fix-X32-build-by-disabling-asm.patch |  53 +++
 meta/recipes-multimedia/x264/x264_git.bb           |   1 +
 .../webkit/webkitgtk/x32_support.patch             |  22 ++
 meta/recipes-sato/webkit/webkitgtk_2.14.2.bb       |   8 +
 meta/recipes-support/attr/ea-acl.inc               |   1 +
 meta/recipes-support/boost/bjam-native_1.62.0.bb   |   2 +-
 meta/recipes-support/boost/boost.inc               |   3 +
 ...-Apply-boost-1.62.0-no-forced-flags.patch.patch | 100 ++++++
 ...Don-t-set-up-m32-m64-we-do-that-ourselves.patch |  97 +++++
 ...p-arch-instruction-set-flags-we-do-that-o.patch | 143 ++++++++
 meta/recipes-support/boost/boost_1.62.0.bb         |   7 +-
 .../curl/{curl_7.51.0.bb => curl_7.52.1.bb}        |   4 +-
 .../{debianutils_4.8.bb => debianutils_4.8.1.bb}   |   7 +-
 .../libunwind/libunwind/libunwind-1.1-x32.patch    |  31 ++
 meta/recipes-support/libunwind/libunwind_git.bb    |   1 +
 ...k-header-files-of-openssl-only-if-enable_.patch |  38 ++
 ...k-header-files-of-openssl-only-if-enable_.patch |  38 ++
 meta/recipes-support/nettle/nettle_2.7.1.bb        |   1 +
 meta/recipes-support/nettle/nettle_3.3.bb          |   4 +
 .../nss/nss/Fix-compilation-for-X32.patch          |  31 ++
 meta/recipes-support/nss/nss_3.27.1.bb             |  13 +-
 .../{sqlite3_3.15.1.bb => sqlite3_3.15.2.bb}       |   4 +-
 scripts/contrib/mkefidisk.sh                       |  26 +-
 scripts/lib/wic/canned-wks/mkgummidisk.wks         |  11 -
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  22 +-
 scripts/oe-selftest                                |  22 +-
 scripts/runqemu                                    |   2 +-
 200 files changed, 2727 insertions(+), 744 deletions(-)
 delete mode 100644 meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py
 delete mode 100644 meta/classes/gummiboot.bbclass
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot_git.bb
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-ppp-Remove-unneeded-include.patch
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.2.bb => ifupdown_0.8.16.bb} (95%)
 rename meta/recipes-devtools/file/{file_5.28.bb => file_5.29.bb} (96%)
 rename meta/recipes-devtools/gcc/{gcc-6.2.inc => gcc-6.3.inc} (95%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0002-uclibc-conf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0003-gcc-uclibc-locale-ctype_touplow_t.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0004-uclibc-locale.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0005-uclibc-locale-no__x.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0006-uclibc-locale-wchar_fix.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0007-uclibc-locale-update.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0008-missing-execinfo_h.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0009-c99-snprintf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0010-gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0011-gcc-poison-dir-extend.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0013-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0014-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0016-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0018-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0019-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0020-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0022-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0023-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0024-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0028-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0031-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0035-aarch64-Add-support-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0037-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0039-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0041-ssp_nonshared.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/CVE-2016-4490.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_6.2.bb => gcc-cross-canadian_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_6.2.bb => gcc-cross-initial_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_6.2.bb => gcc-cross_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_6.2.bb => gcc-crosssdk-initial_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_6.2.bb => gcc-crosssdk_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_6.2.bb => gcc-runtime_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_6.2.bb => gcc-sanitizers_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_6.2.bb => gcc-source_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_6.2.bb => gcc_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_6.2.bb => libgcc-initial_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_6.2.bb => libgcc_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_6.2.bb => libgfortran_6.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch
 rename meta/recipes-devtools/guile/{guile_2.0.12.bb => guile_2.0.13.bb} (95%)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
 rename meta/recipes-devtools/quilt/{quilt-native_0.64.bb => quilt-native_0.65.bb} (100%)
 delete mode 100644 meta/recipes-devtools/quilt/quilt/install.patch
 rename meta/recipes-devtools/quilt/{quilt_0.64.bb => quilt_0.65.bb} (100%)
 rename meta/recipes-extended/hdparm/{hdparm_9.48.bb => hdparm_9.50.bb} (81%)
 create mode 100644 meta/recipes-extended/ltp/ltp/fcntl-fix-the-time-def-to-use-time_t.patch
 create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-exntend-the-semantics-of-kexec_iomem_for_each_.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0003-arm64-identify-PHYS_OFFSET-correctly.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0004-arm64-kdump-identify-memory-regions.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0005-arm64-kdump-add-elf-core-header-segment.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0006-arm64-kdump-set-up-kernel-image-segment.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0007-arm64-kdump-set-up-other-segments.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0009-arm64-kdump-Add-support-for-binary-image-files.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.12.bb => kexec-tools_2.0.14.bb} (53%)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/x32.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.10.1.bb => gstreamer1.0-libav_1.10.2.bb} (84%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.2.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.10.1.bb => gstreamer1.0-plugins-bad_1.10.2.bb} (86%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.10.1.bb => gstreamer1.0-plugins-base_1.10.2.bb} (82%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.10.1.bb => gstreamer1.0-plugins-good_1.10.2.bb} (80%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.10.1.bb => gstreamer1.0-plugins-ugly_1.10.2.bb} (70%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.2.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.10.1.bb => gstreamer1.0-vaapi_1.10.2.bb} (43%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.10.1.bb => gstreamer1.0_1.10.2.bb} (64%)
 create mode 100644 meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/x32_support.patch
 create mode 100644 meta/recipes-support/boost/boost/0001-Apply-boost-1.62.0-no-forced-flags.patch.patch
 create mode 100644 meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch
 create mode 100644 meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
 rename meta/recipes-support/curl/{curl_7.51.0.bb => curl_7.52.1.bb} (94%)
 rename meta/recipes-support/debianutils/{debianutils_4.8.bb => debianutils_4.8.1.bb} (86%)
 create mode 100644 meta/recipes-support/libunwind/libunwind/libunwind-1.1-x32.patch
 create mode 100644 meta/recipes-support/nettle/nettle-2.7.1/check-header-files-of-openssl-only-if-enable_.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.3/check-header-files-of-openssl-only-if-enable_.patch
 create mode 100644 meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.15.1.bb => sqlite3_3.15.2.bb} (66%)
 delete mode 100644 scripts/lib/wic/canned-wks/mkgummidisk.wks

-- 
2.8.1


