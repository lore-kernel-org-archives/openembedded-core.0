Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 29AB2606D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 14:07:10 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so200067734wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 06:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=lIRpODMeWNah9bca/QTXIKw5pWKjdBIETIh8S6Umeog=;
	b=Qa9VJNcnFQwC0aNNZLhIOf2HcxnaaM8eTeJQ5wbOfFbFCLe5Q0X9Nnig1RjKcwdOlY
	EsOGZZo481XKHFv1LAR0cPCKfdq6CrU8TyoF2pSfPuyh/fKQY8iEcZ2+qrc/EXhoIUm5
	fiHoIhLNb3pQXRXif3V+ooL8aT0EKLH349aN3XgBm4VRbBLyWKL8WMdmkq7ROgeseYNg
	H5CzTVaYH4iXPukTvPuK9eK9nDpoP5hvBh9pbP9zAamPdhVwLQrfa1a4ahu+wxZhtnFV
	08euRINEKEF8me+8FuyAzQ8wDfHsj0bV5ei5I3+SBPaB4GHlxnn+lTp2XFj0oK1t1F57
	zZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lIRpODMeWNah9bca/QTXIKw5pWKjdBIETIh8S6Umeog=;
	b=ZL3FNM9M06MYCRJ2OFY9DbV+GSjPZafJdOOoaK+TRqG/MyaKuApLsFid6BNNIDcFbW
	uyS9SgFk6caEkmQu/0IvD56Evx2hrc/0XbKii9+mi4lHj+rV98VnZ1irKtHqFWjNR8v7
	66KQ9/hnib1RgSQI0ezKA2rhAJOrLPnDVNyfT/Tgptqrp1MCmy+oWntJJMnf3IDcjEqy
	avZ8GXh2mCUMh1PVWyq8lAZALxX1uytupoDc+8gPHblcQLuktsyJE77+1dixS64X1/lj
	dgtMUmY39IG9SYW8i+Y+o5FdzrLGaZyX8evpyXTL3Vfe3+cb4jz8MsKqvoj8IGJkzXMX
	Cxaw==
X-Gm-Message-State: ALoCoQky29j39nftVQD9wJ8Qu9qeiIDftYyJOMRM++b4Ji5YRbGw1DjTOLnIjAi7VZErknOyF6qd
X-Received: by 10.194.94.100 with SMTP id db4mr2224696wjb.110.1447855631036;
	Wed, 18 Nov 2015 06:07:11 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 186sm3497443wmv.9.2015.11.18.06.07.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Nov 2015 06:07:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 13:58:41 +0000
Message-Id: <cover.1447855001.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 000/116] Consolidated Pull for master
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
X-List-Received-Date: Wed, 18 Nov 2015 14:07:14 -0000

Hi,

Next round of patches for oe-core.  Good news: nothing too invasive.  Bad
news: nothing too invasive.  Still waiting for the good stuff that breaks the
world!  I'll dust off my libexecdir patch...

Ross

The following changes since commit d9aabf9639510fdb3e2ccc21ba5ae4aa9f6e4a57:

  gcc: Drop 4.8 (2015-11-16 14:59:18 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 689cf923549ff44eef40a285bdd1daf83716c36b:

  weston: Add PACKAGECONFIG option for colord CMS (2015-11-18 13:50:01 +0000)

----------------------------------------------------------------
Alejandro Hernandez (2):
      archiver.bbclass: fix previous issue regarding work-shared for linux-yocto
      gma500_gfx: Avoid inserting gma500_gfx module for certain devices

Alejandro del Castillo (1):
      opkg: add cache filename length fixes

Andre McCurdy (1):
      boost.inc: remove unused parameter from get_boost_parallel_make()

Armin Kuster (1):
      libxml2: fix CVE-2015-7942 and CVE-2015-8035

Chen Qi (1):
      mktemp: raise the priority to avoid conflicting with coreutils

Christopher Larson (15):
      image_types: improve wks path specification
      qemu.bbclass: correct the fsl ppc QEMU_EXTRAOPTIONS
      qemu.bbclass: fix vardeps of QEMU_OPTIONS
      recipetool.append: don't choke on a trailing ; in a url
      systemd: for valgrind, define VALGRIND=1
      systemd: chown hwdb.bin to root:root for do_rootfs
      systemd: drop unneeded $D check in prerm
      sysprof: use packageconfig for the gui
      bluez5: enable sysvinit support
      blkspace: fix ldflags for iowatcher
      tcf-agent: obey LDFLAGS
      latencytop: obey LDFLAGS
      connman: depend on readline
      sysklogd: inhibit updatercd for non-sysvinit
      openjade-native: statically link local libs

Dan McGregor (2):
      systemd: ignore .so filenames in systemd-doc
      systemd: add machine-id to conffiles

Daniel Istrate (2):
      oeqa/selftest/signing: New test for Signing packages in the package feeds.
      oeqa/selftest/signing: Added new test for signing sstate.

Daniel McGregor (1):
      systemd: make coredump a PACKAGECONFIG

Enrico Scholz (1):
      waf.bbclass: filter out non -j from PARALLEL_MAKE

Hongxu Jia (3):
      perl: fix spaces in brackets while using CC version
      flex: fix test-bison-yylval and test-bison-yylloc failed
      logrotate: do not move binary logrotate to /usr/bin

Ioan-Adrian Ratiu (1):
      base-files: stage /etc/skel

Jens Rehsack (3):
      kernel: fix race condition between compile_kernelmodules and shared_workdir
      autotools: Allow recipe-individual configure scripts
      libusb1: upgrade from 1.0.19 to 1.0.20

Jian Liu (2):
      archiver.bbclass: add bbappend when do_ar_recipe kernel and gcc packages
      insane.bbclass: Avoid libdir QA check if PACKAGE_DEBUG_SPLIT_STYLE='debug-file-directory'

Joe Slater (1):
      libsecret: add dependency on intltool-native

Juro Bystricky (1):
      gcc-4.9: Fix various _FOR_BUILD and related variables

Jussi Kukkonen (28):
      qemu: Backport malloc-trace disabling
      glib-2.0: Upgrade 2.44.1 -> 2.46.1
      glib-2.0: Enable more tests while cross-compiling
      glib-networking: Upgrade 2.44.0 -> 2.46.1
      atk: Upgrade 2.16.0 -> 2.18.0
      atk-spi2-core: Upgrade 2.16.0 -> 2.18.1
      at-spi2-atk: Upgrade 2.16.0 -> 2.18.1
      libsoup-2.4: Upgrade 2.50.0 -> 2.52.1
      gdk-pixbuf: Upgrade 2.30.8 -> 2.32.1
      pango: Upgrade 1.36.8 -> 1.38.1
      librsvg: Upgrade 2.40.10 -> 2.40.11
      adwaita-icon-theme: Upgrade 3.16.2.1 -> 3.18.0
      gtk+3: Upgrade 3.16.6 -> 3.18.2
      package_regex.inc: Add gtk-icon-utils-native
      gtk-icon-utils-native: Upgrade 3.16.6 -> 3.18.2
      libxi: Upgrade 1.7.4 -> 1.7.5
      pixman: Upgrade 0.32.6 -> 0.32.8
      libxcb: Upgrade 1.11 -> 1.11.1
      libxcb: Remove unused git-version of the recipe
      xserver-xorg: Upgrade 1.17.2 -> 1.18.0
      xorg-driver-input: add xorg configuration to FILES
      xf86-input-evdev: Upgrade 2.9.2 -> 2.10.0
      xf86-input-synaptics: Upgrade 1.8.2 -> 1.8.3
      xf86-video-omap: Upgrade 0.4.3 -> 0.4.4
      xinput: Upgrade 1.6.1 -> 1.6.2
      xkbcomp: Upgrade 1.3.0 -> 1.3.1
      xkeyboard-config: Upgrade 2.15 -> 2.16
      packagegroup-core-directfb: Don't depend on pango-modules

Leonardo Sandoval (5):
      yocto-bsp: Avoid duplication of user patches ({{=machine}}-user-patches.scc)
      yocto-bsp: Typo on the file extension
      yocto-bsp: Set KTYPE to user selected base branch
      yocto-bsp: Set SRCREV meta/machine revisions to AUTOREV
      terminal: Open a new window instead of split on older tmux versions (<1.9)

Li Wang (1):
      rpcbind: don't use '-w' for starting rpcbind

Mariano Lopez (2):
      rootfs.py: Stop using installed_pkgs.txt
      package_manager.py: Delete installed_pkgs.txt file

Martin Jansa (2):
      rootfs_*.bbclass: don't add BUILDNAME to do_rootfs vardepsexclude
      libunwind: fix build for qemuarm

Maxin B. John (9):
      distro/maintainers.inc: include stress package details
      bbclass: fix spelling mistakes
      rt-tests: upgrade to version 0.96
      python-pycurl: update version to 7.19.5.2
      libsndfile: fix CVE-2014-9756
      ethtool: bump version to 4.2
      harfbuzz: update to 1.0.6
      wireless-tools: remove unused files
      mc: upgrade to 4.8.15

Mike Crowe (1):
      allarch: Force TARGET_*FLAGS variable values

Otavio Salvador (2):
      u-boot: Update to 2015.10 release
      weston: Add PACKAGECONFIG option for colord CMS

Paul Eggleton (2):
      classes/metadata_scm: fix git errors showing up on non-git repositories
      classes/license: fix intermittent license collection warning

Richard Purdie (3):
      classes: Ensure pass setVar/setVarFlag strings, not integers
      insane: Don't depend on BB_TASKDEPDATA
      lib/oe/copy_buildsystem: Don't expand BB_TASKDEPDATA

Robert Yang (3):
      bitbake-prserv-tool: check file name
      gdbm 1.8.3: install libgdbm_compat
      gcc-multilib-config: make aarch64 support multilib

Ross Burton (15):
      ptest-gnome: extend EXTRA_OECONF in all builds, not just target
      sstate: respect GPG_BIN and GPG_HOME
      oeqa/selftest/sstatetests: prettier output for allarch test
      lib/oe/distro_check: don't set empty proxy keys
      libusb1: fix make install race
      glibc: fix Upstream-Status tag
      weston: delete unused patch
      meta: add some missing Upstream-Status tags to patches
      libsdl2: require GLES when building Wayland support
      openssl: sanity check that the bignum module is present
      openssl: use subdir= instead of moving files in do_configure_prepend()
      gstreamer1.0: fix install race
      systemd: fix Upstream-Status tag
      glib-2.0: build dependency cleanup
      pango: add RPROVIDES for removed packages

Tyler Hall (1):
      classes/cpan-base: fix libdir for nativesdk

Tzu-Jung Lee (2):
      linux-firmware: package Broadcom BCM4339 firmware
      devtool: add sync command

Wenzong Fan (2):
      openssl: fix ptest issues
      mdadm: fix CFLAGS and ptest issues

 meta-selftest/files/signing/key.pub                |   30 +
 meta-selftest/files/signing/key.secret             |   59 +
 meta-selftest/files/signing/secret.txt             |    1 +
 meta-yocto-bsp/conf/machine/genericx86.conf        |    2 +
 .../gma500-gfx-check/gma500-gfx-check.conf         |    2 +
 .../gma500-gfx-check/gma500-gfx-check.sh           |   11 +
 .../gma500-gfx-check/gma500-gfx-check_1.0.bb       |   18 +
 meta-yocto/conf/distro/include/maintainers.inc     |    1 +
 meta/classes/allarch.bbclass                       |    6 +-
 meta/classes/archiver.bbclass                      |   32 +-
 meta/classes/autotools.bbclass                     |   43 +-
 meta/classes/base.bbclass                          |    8 +-
 meta/classes/buildhistory.bbclass                  |    2 +-
 meta/classes/chrpath.bbclass                       |    4 +-
 meta/classes/cpan-base.bbclass                     |   11 +-
 meta/classes/crosssdk.bbclass                      |    2 +-
 meta/classes/image_types.bbclass                   |   36 +-
 meta/classes/insane.bbclass                        |    4 +
 meta/classes/kernel.bbclass                        |    8 +
 meta/classes/license.bbclass                       |    1 +
 meta/classes/metadata_scm.bbclass                  |   20 +-
 meta/classes/module-base.bbclass                   |    4 +-
 meta/classes/package.bbclass                       |    4 +-
 meta/classes/package_deb.bbclass                   |    2 +-
 meta/classes/package_rpm.bbclass                   |    2 +-
 meta/classes/ptest-gnome.bbclass                   |    2 +-
 meta/classes/ptest.bbclass                         |    2 +-
 meta/classes/qemu.bbclass                          |   13 +-
 meta/classes/rootfs_deb.bbclass                    |    1 -
 meta/classes/rootfs_ipk.bbclass                    |    1 -
 meta/classes/rootfs_rpm.bbclass                    |    1 -
 meta/classes/siteinfo.bbclass                      |    2 +-
 meta/classes/spdx.bbclass                          |    2 +-
 meta/classes/sstate.bbclass                        |   20 +-
 meta/classes/terminal.bbclass                      |    8 +-
 meta/classes/tinderclient.bbclass                  |    2 +-
 meta/classes/update-alternatives.bbclass           |    2 +-
 meta/classes/waf.bbclass                           |   24 +-
 meta/conf/distro/include/package_regex.inc         |    1 +
 meta/lib/oe/copy_buildsystem.py                    |    2 +-
 meta/lib/oe/distro_check.py                        |   10 +-
 meta/lib/oe/image.py                               |    4 +-
 meta/lib/oe/package_manager.py                     |    1 +
 meta/lib/oe/rootfs.py                              |   24 +-
 meta/lib/oe/terminal.py                            |   20 +-
 meta/lib/oeqa/selftest/signing.py                  |  124 ++
 meta/lib/oeqa/selftest/sstatetests.py              |   12 +-
 ...utils_2015.07.bb => u-boot-fw-utils_2015.10.bb} |    6 +-
 ...kimage_2015.07.bb => u-boot-mkimage_2015.10.bb} |    6 +-
 ...u-boot-.lds-remove-_GLOBAL_OFFSET_TABLE_.patch} |   11 +-
 ...-non-Android-booting-with-ramdisk-and-or-.patch |   36 +
 ...board_f-enable-setup_board_part1-for-MIPS.patch |   59 +
 ...PS-bootm-rework-and-fix-broken-bootm-code.patch |  254 +++++
 ...PS-bootm-use-CONFIG_IS_ENABLED-everywhere.patch |   93 ++
 ...-Replace-extern-inline-with-static-inline.patch | 1184 ++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2015.07.bb          |   14 -
 meta/recipes-bsp/u-boot/u-boot_2015.10.bb          |   19 +
 meta/recipes-connectivity/bluez5/bluez5.inc        |    8 +-
 meta/recipes-connectivity/bluez5/bluez5/init       |   68 ++
 meta/recipes-connectivity/connman/connman.inc      |    2 +-
 meta/recipes-connectivity/openssl/openssl.inc      |   14 +-
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   14 +-
 .../wireless-tools/wireless-tools.if-pre-up        |  122 --
 .../wireless-tools/zzz-wireless.if-pre-up          |   34 -
 .../wireless-tools/wireless-tools_30.pre9.bb       |    6 -
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    4 +
 ...on-t-depend-on-a-data-file-that-s-not-bui.patch |   38 +
 .../Enable-more-tests-while-cross-compiling.patch  |   81 ++
 .../{glib-2.0_2.44.1.bb => glib-2.0_2.46.1.bb}     |    6 +-
 meta/recipes-core/glib-2.0/glib.inc                |    6 +-
 ...working_2.44.0.bb => glib-networking_2.46.1.bb} |    4 +-
 .../glibc/glibc/use_64bit_atomics.patch            |    2 +-
 meta/recipes-core/libxml/libxml2.inc               |    2 +
 .../libxml/libxml2/CVE-2015-7942.patch             |   55 +
 .../libxml/libxml2/CVE-2015-8035.patch             |   41 +
 ...nv-when-secure-versions-are-not-available.patch |    2 +-
 meta/recipes-core/systemd/systemd_225.bb           |   19 +-
 ...fixes-Do-not-use-obsolete-bison-construct.patch |   80 ++
 meta/recipes-devtools/flex/flex.inc                |    1 +
 meta/recipes-devtools/gcc/gcc-4.9.inc              |    1 +
 .../gcc/gcc-4.9/0066-cxxflags-for-build.patch      |  123 ++
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  |    7 +
 .../openjade/openjade-native_1.3.2.bb              |   22 +-
 ...ng_util-New-file-with-bin_to_hex-function.patch |  122 ++
 .../opkg/0002-md5-Add-md5_to_string-function.patch |  110 ++
 ...0003-sha256-Add-sha256_to_string-function.patch |  110 ++
 ...4-opkg_download-Use-short-cache-file-name.patch |   85 ++
 meta/recipes-devtools/opkg/opkg_0.3.0.bb           |    4 +
 .../perl/perl/perl-errno-generation-gcc5.patch     |   20 +-
 .../python/python-pycurl/no-static-link.patch      |   12 +-
 ...ycurl_7.19.5.1.bb => python-pycurl_7.19.5.2.bb} |    8 +-
 .../qemu/qemu/trace-remove-malloc-tracing.patch    |   97 ++
 meta/recipes-devtools/qemu/qemu_2.4.0.1.bb         |    1 +
 .../tcf-agent/tcf-agent/ldflags.patch              |   28 +
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    1 +
 .../ethtool/{ethtool_4.0.bb => ethtool_4.2.bb}     |    4 +-
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb |    2 +-
 .../mc/{mc_4.8.14.bb => mc_4.8.15.bb}              |    5 +-
 .../mdadm/files/mdadm-fix-ptest-build-errors.patch |   50 +
 meta/recipes-extended/mdadm/mdadm_3.3.4.bb         |    3 +-
 meta/recipes-extended/mktemp/mktemp_1.7.bb         |    2 +-
 .../rpcbind/rpcbind/musl-sunrpc.patch              |    1 +
 .../rpcbind/rpcbind/rpcbind.service                |    2 +-
 meta/recipes-extended/sysklogd/sysklogd.inc        |    5 +
 .../watchdog/watchdog/watchdog-conf.patch          |    3 +
 .../watchdog/watchdog/watchdog-init.patch          |    3 +
 ...ps-Be-more-careful-about-integer-overflow.patch |   89 --
 .../{gdk-pixbuf_2.30.8.bb => gdk-pixbuf_2.32.1.bb} |    5 +-
 .../Create-symlinks-when-installing-cursors.patch  |  178 ---
 ...me_3.16.2.1.bb => adwaita-icon-theme_3.18.0.bb} |    5 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |    5 +-
 .../gtk+/{gtk+3_3.16.6.bb => gtk+3_3.18.2.bb}      |    4 +-
 ...e_3.16.6.bb => gtk-icon-utils-native_3.18.2.bb} |    4 +-
 .../{librsvg_2.40.10.bb => librsvg_2.40.11.bb}     |    4 +-
 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb   |    2 +-
 .../{harfbuzz_1.0.2.bb => harfbuzz_1.0.6.bb}       |    4 +-
 meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb     |    2 +-
 ...mplement-with-AC_WITH-glut-so-that-withou.patch |    3 +
 .../packagegroups/packagegroup-core-directfb.bb    |    1 -
 meta/recipes-graphics/pango/pango.inc              |   53 +-
 .../pango/pango/multilib-fix-clean.patch           |   75 --
 meta/recipes-graphics/pango/pango_1.36.8.bb        |   10 -
 meta/recipes-graphics/pango/pango_1.38.1.bb        |    9 +
 .../weston/disable-wayland-scanner-pkg-check.patch |   17 -
 meta/recipes-graphics/wayland/weston_1.8.0.bb      |    2 +
 .../xorg-app/{xinput_1.6.1.bb => xinput_1.6.2.bb}  |    6 +-
 .../{xkbcomp_1.3.0.bb => xkbcomp_1.3.1.bb}         |    4 +-
 ...t-evdev_2.9.2.bb => xf86-input-evdev_2.10.0.bb} |    4 +-
 ...tics_1.8.2.bb => xf86-input-synaptics_1.8.3.bb} |    6 +-
 ...put_dpms-Replace-logical-with-bitwise-ope.patch |   31 -
 ...ideo-omap_0.4.3.bb => xf86-video-omap_0.4.4.bb} |    6 +-
 .../xorg-driver/xorg-driver-input.inc              |    4 +-
 .../xorg-lib/{libxcb.inc => libxcb_1.11.1.bb}      |   13 +-
 meta/recipes-graphics/xorg-lib/libxcb_1.11.bb      |   10 -
 meta/recipes-graphics/xorg-lib/libxcb_git.bb       |   10 -
 .../xorg-lib/{libxi_1.7.4.bb => libxi_1.7.5.bb}    |    4 +-
 ...0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch |    2 +-
 .../{pixman_0.32.6.bb => pixman_0.32.8.bb}         |    4 +-
 ...ard-config_2.15.bb => xkeyboard-config_2.16.bb} |    4 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    4 +-
 ...e-__GLIBC__-guard-for-glibc-specific-code.patch |   31 -
 ....ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch |   50 +
 ...erver-xorg_1.17.2.bb => xserver-xorg_1.18.0.bb} |    7 +-
 .../recipes-kernel/blktrace/blktrace/ldflags.patch |   23 +-
 .../latencytop-0.5/latencytop-makefile.patch       |    2 +-
 .../linux-firmware/linux-firmware_git.bb           |    9 +-
 .../sysprof/files/gui-argument.patch               |   35 +
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    9 +-
 .../gstreamer/gstreamer1.0/fix-install-hook.patch  |   24 +
 .../gstreamer/gstreamer1.0_1.6.1.bb                |    1 +
 .../files/libsndfile-fix-CVE-2014-9756.patch       |   24 +
 .../libsndfile/libsndfile1_1.0.25.bb               |    1 +
 .../{hwlatdetect_0.94.bb => hwlatdetect_0.96.bb}   |    2 +-
 meta/recipes-rt/rt-tests/rt-tests.inc              |    6 +-
 .../{rt-tests_0.94.bb => rt-tests_0.96.bb}         |    0
 ...at-spi2-atk_2.16.0.bb => at-spi2-atk_2.18.1.bb} |    4 +-
 ...-spi2-core_2.16.0.bb => at-spi2-core_2.18.1.bb} |    4 +-
 .../atk/{atk_2.16.0.bb => atk_2.18.0.bb}           |    4 +-
 meta/recipes-support/boost/boost.inc               |    4 +-
 meta/recipes-support/gdbm/gdbm_1.8.3.bb            |    1 +
 ...libsoup-2.4_2.50.0.bb => libsoup-2.4_2.52.1.bb} |    6 +-
 ...Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch |   62 +
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    1 +
 meta/recipes-support/libusb/libusb1/no-dll.patch   |   19 +
 .../{libusb1_1.0.19.bb => libusb1_1.0.20.bb}       |    5 +-
 scripts/bitbake-prserv-tool                        |    9 +
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 ...-yocto_4.1.bbapend => linux-yocto_4.1.bbappend} |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    5 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 scripts/lib/devtool/standard.py                    |  100 +-
 scripts/lib/devtool/upgrade.py                     |    2 +-
 scripts/lib/recipetool/append.py                   |    2 +
 246 files changed, 3962 insertions(+), 1165 deletions(-)
 create mode 100644 meta-selftest/files/signing/key.pub
 create mode 100644 meta-selftest/files/signing/key.secret
 create mode 100644 meta-selftest/files/signing/secret.txt
 create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.conf
 create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.sh
 create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check_1.0.bb
 create mode 100644 meta/lib/oeqa/selftest/signing.py
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2015.07.bb => u-boot-fw-utils_2015.10.bb} (91%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2015.07.bb => u-boot-mkimage_2015.10.bb} (84%)
 rename meta/recipes-bsp/u-boot/u-boot/{0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch => 0001-powerpc-cpu-u-boot-.lds-remove-_GLOBAL_OFFSET_TABLE_.patch} (96%)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0002-image.c-Fix-non-Android-booting-with-ramdisk-and-or-.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0003-common-board_f-enable-setup_board_part1-for-MIPS.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0004-MIPS-bootm-rework-and-fix-broken-bootm-code.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0005-MIPS-bootm-use-CONFIG_IS_ENABLED-everywhere.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0006-Replace-extern-inline-with-static-inline.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2015.07.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2015.10.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/init
 delete mode 100755 meta/recipes-connectivity/wireless-tools/wireless-tools/wireless-tools.if-pre-up
 delete mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/zzz-wireless.if-pre-up
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.44.1.bb => glib-2.0_2.46.1.bb} (73%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.44.0.bb => glib-networking_2.46.1.bb} (88%)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
 create mode 100644 meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0066-cxxflags-for-build.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch
 rename meta/recipes-devtools/python/{python-pycurl_7.19.5.1.bb => python-pycurl_7.19.5.2.bb} (72%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/trace-remove-malloc-tracing.patch
 create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
 rename meta/recipes-extended/ethtool/{ethtool_4.0.bb => ethtool_4.2.bb} (88%)
 rename meta/recipes-extended/mc/{mc_4.8.14.bb => mc_4.8.15.bb} (93%)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-pixops-Be-more-careful-about-integer-overflow.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.30.8.bb => gdk-pixbuf_2.32.1.bb} (94%)
 delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/Create-symlinks-when-installing-cursors.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.16.2.1.bb => adwaita-icon-theme_3.18.0.bb} (85%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.16.6.bb => gtk+3_3.18.2.bb} (83%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.16.6.bb => gtk-icon-utils-native_3.18.2.bb} (94%)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.10.bb => librsvg_2.40.11.bb} (92%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.0.2.bb => harfbuzz_1.0.6.bb} (88%)
 delete mode 100644 meta/recipes-graphics/pango/pango/multilib-fix-clean.patch
 delete mode 100644 meta/recipes-graphics/pango/pango_1.36.8.bb
 create mode 100644 meta/recipes-graphics/pango/pango_1.38.1.bb
 delete mode 100644 meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
 rename meta/recipes-graphics/xorg-app/{xinput_1.6.1.bb => xinput_1.6.2.bb} (66%)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.3.0.bb => xkbcomp_1.3.1.bb} (78%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.9.2.bb => xf86-input-evdev_2.10.0.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.8.2.bb => xf86-input-synaptics_1.8.3.bb} (74%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-omap_0.4.3.bb => xf86-video-omap_0.4.4.bb} (84%)
 rename meta/recipes-graphics/xorg-lib/{libxcb.inc => libxcb_1.11.1.bb} (80%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb_1.11.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb_git.bb
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.4.bb => libxi_1.7.5.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.6.bb => pixman_0.32.8.bb} (90%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.15.bb => xkeyboard-config_2.16.bb} (88%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.17.2.bb => xserver-xorg_1.18.0.bb} (78%)
 create mode 100644 meta/recipes-kernel/sysprof/files/gui-argument.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/files/libsndfile-fix-CVE-2014-9756.patch
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.94.bb => hwlatdetect_0.96.bb} (90%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.94.bb => rt-tests_0.96.bb} (100%)
 rename meta/recipes-support/atk/{at-spi2-atk_2.16.0.bb => at-spi2-atk_2.18.1.bb} (82%)
 rename meta/recipes-support/atk/{at-spi2-core_2.16.0.bb => at-spi2-core_2.18.1.bb} (84%)
 rename meta/recipes-support/atk/{atk_2.16.0.bb => atk_2.18.0.bb} (78%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.50.0.bb => libsoup-2.4_2.52.1.bb} (82%)
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
 create mode 100644 meta/recipes-support/libusb/libusb1/no-dll.patch
 rename meta/recipes-support/libusb/{libusb1_1.0.19.bb => libusb1_1.0.20.bb} (83%)
 rename scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/{linux-yocto_4.1.bbapend => linux-yocto_4.1.bbappend} (80%)

Alejandro Hernandez (2):
  archiver.bbclass: fix previous issue regarding work-shared for
    linux-yocto
  gma500_gfx: Avoid inserting gma500_gfx module for certain devices

Alejandro del Castillo (1):
  opkg: add cache filename length fixes

Andre McCurdy (1):
  boost.inc: remove unused parameter from get_boost_parallel_make()

Armin Kuster (1):
  libxml2: fix CVE-2015-7942 and CVE-2015-8035

Chen Qi (1):
  mktemp: raise the priority to avoid conflicting with coreutils

Christopher Larson (15):
  image_types: improve wks path specification
  qemu.bbclass: correct the fsl ppc QEMU_EXTRAOPTIONS
  qemu.bbclass: fix vardeps of QEMU_OPTIONS
  recipetool.append: don't choke on a trailing ; in a url
  systemd: for valgrind, define VALGRIND=1
  systemd: chown hwdb.bin to root:root for do_rootfs
  systemd: drop unneeded $D check in prerm
  sysprof: use packageconfig for the gui
  bluez5: enable sysvinit support
  blkspace: fix ldflags for iowatcher
  tcf-agent: obey LDFLAGS
  latencytop: obey LDFLAGS
  connman: depend on readline
  sysklogd: inhibit updatercd for non-sysvinit
  openjade-native: statically link local libs

Dan McGregor (2):
  systemd: ignore .so filenames in systemd-doc
  systemd: add machine-id to conffiles

Daniel Istrate (2):
  oeqa/selftest/signing: New test for Signing packages in the package
    feeds.
  oeqa/selftest/signing: Added new test for signing sstate.

Daniel McGregor (1):
  systemd: make coredump a PACKAGECONFIG

Enrico Scholz (1):
  waf.bbclass: filter out non -j from PARALLEL_MAKE

Hongxu Jia (3):
  perl: fix spaces in brackets while using CC version
  flex: fix test-bison-yylval and test-bison-yylloc failed
  logrotate: do not move binary logrotate to /usr/bin

Ioan-Adrian Ratiu (1):
  base-files: stage /etc/skel

Jens Rehsack (3):
  kernel: fix race condition between compile_kernelmodules and
    shared_workdir
  autotools: Allow recipe-individual configure scripts
  libusb1: upgrade from 1.0.19 to 1.0.20

Jian Liu (2):
  archiver.bbclass: add bbappend when do_ar_recipe kernel and gcc
    packages
  insane.bbclass: Avoid libdir QA check if
    PACKAGE_DEBUG_SPLIT_STYLE='debug-file-directory'

Joe Slater (1):
  libsecret: add dependency on intltool-native

Juro Bystricky (1):
  gcc-4.9: Fix various _FOR_BUILD and related variables

Jussi Kukkonen (28):
  qemu: Backport malloc-trace disabling
  glib-2.0: Upgrade 2.44.1 -> 2.46.1
  glib-2.0: Enable more tests while cross-compiling
  glib-networking: Upgrade 2.44.0 -> 2.46.1
  atk: Upgrade 2.16.0 -> 2.18.0
  atk-spi2-core: Upgrade 2.16.0 -> 2.18.1
  at-spi2-atk: Upgrade 2.16.0 -> 2.18.1
  libsoup-2.4: Upgrade 2.50.0 -> 2.52.1
  gdk-pixbuf: Upgrade 2.30.8 -> 2.32.1
  pango: Upgrade 1.36.8 -> 1.38.1
  librsvg: Upgrade 2.40.10 -> 2.40.11
  adwaita-icon-theme: Upgrade 3.16.2.1 -> 3.18.0
  gtk+3: Upgrade 3.16.6 -> 3.18.2
  package_regex.inc: Add gtk-icon-utils-native
  gtk-icon-utils-native: Upgrade 3.16.6 -> 3.18.2
  libxi: Upgrade 1.7.4 -> 1.7.5
  pixman: Upgrade 0.32.6 -> 0.32.8
  libxcb: Upgrade 1.11 -> 1.11.1
  libxcb: Remove unused git-version of the recipe
  xserver-xorg: Upgrade 1.17.2 -> 1.18.0
  xorg-driver-input: add xorg configuration to FILES
  xf86-input-evdev: Upgrade 2.9.2 -> 2.10.0
  xf86-input-synaptics: Upgrade 1.8.2 -> 1.8.3
  xf86-video-omap: Upgrade 0.4.3 -> 0.4.4
  xinput: Upgrade 1.6.1 -> 1.6.2
  xkbcomp: Upgrade 1.3.0 -> 1.3.1
  xkeyboard-config: Upgrade 2.15 -> 2.16
  packagegroup-core-directfb: Don't depend on pango-modules

Leonardo Sandoval (5):
  yocto-bsp: Avoid duplication of user patches
    ({{=machine}}-user-patches.scc)
  yocto-bsp: Typo on the file extension
  yocto-bsp: Set KTYPE to user selected base branch
  yocto-bsp: Set SRCREV meta/machine revisions to AUTOREV
  terminal: Open a new window instead of split on older tmux versions
    (<1.9)

Li Wang (1):
  rpcbind: don't use '-w' for starting rpcbind

Mariano Lopez (2):
  rootfs.py: Stop using installed_pkgs.txt
  package_manager.py: Delete installed_pkgs.txt file

Martin Jansa (2):
  rootfs_*.bbclass: don't add BUILDNAME to do_rootfs vardepsexclude
  libunwind: fix build for qemuarm

Maxin B. John (9):
  distro/maintainers.inc: include stress package details
  bbclass: fix spelling mistakes
  rt-tests: upgrade to version 0.96
  python-pycurl: update version to 7.19.5.2
  libsndfile: fix CVE-2014-9756
  ethtool: bump version to 4.2
  harfbuzz: update to 1.0.6
  wireless-tools: remove unused files
  mc: upgrade to 4.8.15

Mike Crowe (1):
  allarch: Force TARGET_*FLAGS variable values

Otavio Salvador (2):
  u-boot: Update to 2015.10 release
  weston: Add PACKAGECONFIG option for colord CMS

Paul Eggleton (2):
  classes/metadata_scm: fix git errors showing up on non-git
    repositories
  classes/license: fix intermittent license collection warning

Richard Purdie (3):
  classes: Ensure pass setVar/setVarFlag strings, not integers
  insane: Don't depend on BB_TASKDEPDATA
  lib/oe/copy_buildsystem: Don't expand BB_TASKDEPDATA

Robert Yang (3):
  bitbake-prserv-tool: check file name
  gdbm 1.8.3: install libgdbm_compat
  gcc-multilib-config: make aarch64 support multilib

Ross Burton (15):
  ptest-gnome: extend EXTRA_OECONF in all builds, not just target
  sstate: respect GPG_BIN and GPG_HOME
  oeqa/selftest/sstatetests: prettier output for allarch test
  lib/oe/distro_check: don't set empty proxy keys
  libusb1: fix make install race
  glibc: fix Upstream-Status tag
  weston: delete unused patch
  meta: add some missing Upstream-Status tags to patches
  libsdl2: require GLES when building Wayland support
  openssl: sanity check that the bignum module is present
  openssl: use subdir= instead of moving files in do_configure_prepend()
  gstreamer1.0: fix install race
  systemd: fix Upstream-Status tag
  glib-2.0: build dependency cleanup
  pango: add RPROVIDES for removed packages

Tyler Hall (1):
  classes/cpan-base: fix libdir for nativesdk

Tzu-Jung Lee (2):
  linux-firmware: package Broadcom BCM4339 firmware
  devtool: add sync command

Wenzong Fan (2):
  openssl: fix ptest issues
  mdadm: fix CFLAGS and ptest issues

 meta-selftest/files/signing/key.pub                |   30 +
 meta-selftest/files/signing/key.secret             |   59 +
 meta-selftest/files/signing/secret.txt             |    1 +
 meta-yocto-bsp/conf/machine/genericx86.conf        |    2 +
 .../gma500-gfx-check/gma500-gfx-check.conf         |    2 +
 .../gma500-gfx-check/gma500-gfx-check.sh           |   11 +
 .../gma500-gfx-check/gma500-gfx-check_1.0.bb       |   18 +
 meta-yocto/conf/distro/include/maintainers.inc     |    1 +
 meta/classes/allarch.bbclass                       |    6 +-
 meta/classes/archiver.bbclass                      |   32 +-
 meta/classes/autotools.bbclass                     |   43 +-
 meta/classes/base.bbclass                          |    8 +-
 meta/classes/buildhistory.bbclass                  |    2 +-
 meta/classes/chrpath.bbclass                       |    4 +-
 meta/classes/cpan-base.bbclass                     |   11 +-
 meta/classes/crosssdk.bbclass                      |    2 +-
 meta/classes/image_types.bbclass                   |   36 +-
 meta/classes/insane.bbclass                        |    4 +
 meta/classes/kernel.bbclass                        |    8 +
 meta/classes/license.bbclass                       |    1 +
 meta/classes/metadata_scm.bbclass                  |   20 +-
 meta/classes/module-base.bbclass                   |    4 +-
 meta/classes/package.bbclass                       |    4 +-
 meta/classes/package_deb.bbclass                   |    2 +-
 meta/classes/package_rpm.bbclass                   |    2 +-
 meta/classes/ptest-gnome.bbclass                   |    2 +-
 meta/classes/ptest.bbclass                         |    2 +-
 meta/classes/qemu.bbclass                          |   13 +-
 meta/classes/rootfs_deb.bbclass                    |    1 -
 meta/classes/rootfs_ipk.bbclass                    |    1 -
 meta/classes/rootfs_rpm.bbclass                    |    1 -
 meta/classes/siteinfo.bbclass                      |    2 +-
 meta/classes/spdx.bbclass                          |    2 +-
 meta/classes/sstate.bbclass                        |   20 +-
 meta/classes/terminal.bbclass                      |    8 +-
 meta/classes/tinderclient.bbclass                  |    2 +-
 meta/classes/update-alternatives.bbclass           |    2 +-
 meta/classes/waf.bbclass                           |   24 +-
 meta/conf/distro/include/package_regex.inc         |    1 +
 meta/lib/oe/copy_buildsystem.py                    |    2 +-
 meta/lib/oe/distro_check.py                        |   10 +-
 meta/lib/oe/image.py                               |    4 +-
 meta/lib/oe/package_manager.py                     |    1 +
 meta/lib/oe/rootfs.py                              |   24 +-
 meta/lib/oe/terminal.py                            |   20 +-
 meta/lib/oeqa/selftest/signing.py                  |  124 ++
 meta/lib/oeqa/selftest/sstatetests.py              |   12 +-
 ...utils_2015.07.bb => u-boot-fw-utils_2015.10.bb} |    6 +-
 ...kimage_2015.07.bb => u-boot-mkimage_2015.10.bb} |    6 +-
 ...u-boot-.lds-remove-_GLOBAL_OFFSET_TABLE_.patch} |   11 +-
 ...-non-Android-booting-with-ramdisk-and-or-.patch |   36 +
 ...board_f-enable-setup_board_part1-for-MIPS.patch |   59 +
 ...PS-bootm-rework-and-fix-broken-bootm-code.patch |  254 +++++
 ...PS-bootm-use-CONFIG_IS_ENABLED-everywhere.patch |   93 ++
 ...-Replace-extern-inline-with-static-inline.patch | 1184 ++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2015.07.bb          |   14 -
 meta/recipes-bsp/u-boot/u-boot_2015.10.bb          |   19 +
 meta/recipes-connectivity/bluez5/bluez5.inc        |    8 +-
 meta/recipes-connectivity/bluez5/bluez5/init       |   68 ++
 meta/recipes-connectivity/connman/connman.inc      |    2 +-
 meta/recipes-connectivity/openssl/openssl.inc      |   14 +-
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   14 +-
 .../wireless-tools/wireless-tools.if-pre-up        |  122 --
 .../wireless-tools/zzz-wireless.if-pre-up          |   34 -
 .../wireless-tools/wireless-tools_30.pre9.bb       |    6 -
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    4 +
 ...on-t-depend-on-a-data-file-that-s-not-bui.patch |   38 +
 .../Enable-more-tests-while-cross-compiling.patch  |   81 ++
 .../{glib-2.0_2.44.1.bb => glib-2.0_2.46.1.bb}     |    6 +-
 meta/recipes-core/glib-2.0/glib.inc                |    6 +-
 ...working_2.44.0.bb => glib-networking_2.46.1.bb} |    4 +-
 .../glibc/glibc/use_64bit_atomics.patch            |    2 +-
 meta/recipes-core/libxml/libxml2.inc               |    2 +
 .../libxml/libxml2/CVE-2015-7942.patch             |   55 +
 .../libxml/libxml2/CVE-2015-8035.patch             |   41 +
 ...nv-when-secure-versions-are-not-available.patch |    2 +-
 meta/recipes-core/systemd/systemd_225.bb           |   19 +-
 ...fixes-Do-not-use-obsolete-bison-construct.patch |   80 ++
 meta/recipes-devtools/flex/flex.inc                |    1 +
 meta/recipes-devtools/gcc/gcc-4.9.inc              |    1 +
 .../gcc/gcc-4.9/0066-cxxflags-for-build.patch      |  123 ++
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  |    7 +
 .../openjade/openjade-native_1.3.2.bb              |   22 +-
 ...ng_util-New-file-with-bin_to_hex-function.patch |  122 ++
 .../opkg/0002-md5-Add-md5_to_string-function.patch |  110 ++
 ...0003-sha256-Add-sha256_to_string-function.patch |  110 ++
 ...4-opkg_download-Use-short-cache-file-name.patch |   85 ++
 meta/recipes-devtools/opkg/opkg_0.3.0.bb           |    4 +
 .../perl/perl/perl-errno-generation-gcc5.patch     |   20 +-
 .../python/python-pycurl/no-static-link.patch      |   12 +-
 ...ycurl_7.19.5.1.bb => python-pycurl_7.19.5.2.bb} |    8 +-
 .../qemu/qemu/trace-remove-malloc-tracing.patch    |   97 ++
 meta/recipes-devtools/qemu/qemu_2.4.0.1.bb         |    1 +
 .../tcf-agent/tcf-agent/ldflags.patch              |   28 +
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    1 +
 .../ethtool/{ethtool_4.0.bb => ethtool_4.2.bb}     |    4 +-
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb |    2 +-
 .../mc/{mc_4.8.14.bb => mc_4.8.15.bb}              |    5 +-
 .../mdadm/files/mdadm-fix-ptest-build-errors.patch |   50 +
 meta/recipes-extended/mdadm/mdadm_3.3.4.bb         |    3 +-
 meta/recipes-extended/mktemp/mktemp_1.7.bb         |    2 +-
 .../rpcbind/rpcbind/musl-sunrpc.patch              |    1 +
 .../rpcbind/rpcbind/rpcbind.service                |    2 +-
 meta/recipes-extended/sysklogd/sysklogd.inc        |    5 +
 .../watchdog/watchdog/watchdog-conf.patch          |    3 +
 .../watchdog/watchdog/watchdog-init.patch          |    3 +
 ...ps-Be-more-careful-about-integer-overflow.patch |   89 --
 .../{gdk-pixbuf_2.30.8.bb => gdk-pixbuf_2.32.1.bb} |    5 +-
 .../Create-symlinks-when-installing-cursors.patch  |  178 ---
 ...me_3.16.2.1.bb => adwaita-icon-theme_3.18.0.bb} |    5 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |    5 +-
 .../gtk+/{gtk+3_3.16.6.bb => gtk+3_3.18.2.bb}      |    4 +-
 ...e_3.16.6.bb => gtk-icon-utils-native_3.18.2.bb} |    4 +-
 .../{librsvg_2.40.10.bb => librsvg_2.40.11.bb}     |    4 +-
 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb   |    2 +-
 .../{harfbuzz_1.0.2.bb => harfbuzz_1.0.6.bb}       |    4 +-
 meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb     |    2 +-
 ...mplement-with-AC_WITH-glut-so-that-withou.patch |    3 +
 .../packagegroups/packagegroup-core-directfb.bb    |    1 -
 meta/recipes-graphics/pango/pango.inc              |   53 +-
 .../pango/pango/multilib-fix-clean.patch           |   75 --
 meta/recipes-graphics/pango/pango_1.36.8.bb        |   10 -
 meta/recipes-graphics/pango/pango_1.38.1.bb        |    9 +
 .../weston/disable-wayland-scanner-pkg-check.patch |   17 -
 meta/recipes-graphics/wayland/weston_1.8.0.bb      |    2 +
 .../xorg-app/{xinput_1.6.1.bb => xinput_1.6.2.bb}  |    6 +-
 .../{xkbcomp_1.3.0.bb => xkbcomp_1.3.1.bb}         |    4 +-
 ...t-evdev_2.9.2.bb => xf86-input-evdev_2.10.0.bb} |    4 +-
 ...tics_1.8.2.bb => xf86-input-synaptics_1.8.3.bb} |    6 +-
 ...put_dpms-Replace-logical-with-bitwise-ope.patch |   31 -
 ...ideo-omap_0.4.3.bb => xf86-video-omap_0.4.4.bb} |    6 +-
 .../xorg-driver/xorg-driver-input.inc              |    4 +-
 .../xorg-lib/{libxcb.inc => libxcb_1.11.1.bb}      |   13 +-
 meta/recipes-graphics/xorg-lib/libxcb_1.11.bb      |   10 -
 meta/recipes-graphics/xorg-lib/libxcb_git.bb       |   10 -
 .../xorg-lib/{libxi_1.7.4.bb => libxi_1.7.5.bb}    |    4 +-
 ...0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch |    2 +-
 .../{pixman_0.32.6.bb => pixman_0.32.8.bb}         |    4 +-
 ...ard-config_2.15.bb => xkeyboard-config_2.16.bb} |    4 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    4 +-
 ...e-__GLIBC__-guard-for-glibc-specific-code.patch |   31 -
 ....ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch |   50 +
 ...erver-xorg_1.17.2.bb => xserver-xorg_1.18.0.bb} |    7 +-
 .../recipes-kernel/blktrace/blktrace/ldflags.patch |   23 +-
 .../latencytop-0.5/latencytop-makefile.patch       |    2 +-
 .../linux-firmware/linux-firmware_git.bb           |    9 +-
 .../sysprof/files/gui-argument.patch               |   35 +
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    9 +-
 .../gstreamer/gstreamer1.0/fix-install-hook.patch  |   24 +
 .../gstreamer/gstreamer1.0_1.6.1.bb                |    1 +
 .../files/libsndfile-fix-CVE-2014-9756.patch       |   24 +
 .../libsndfile/libsndfile1_1.0.25.bb               |    1 +
 .../{hwlatdetect_0.94.bb => hwlatdetect_0.96.bb}   |    2 +-
 meta/recipes-rt/rt-tests/rt-tests.inc              |    6 +-
 .../{rt-tests_0.94.bb => rt-tests_0.96.bb}         |    0
 ...at-spi2-atk_2.16.0.bb => at-spi2-atk_2.18.1.bb} |    4 +-
 ...-spi2-core_2.16.0.bb => at-spi2-core_2.18.1.bb} |    4 +-
 .../atk/{atk_2.16.0.bb => atk_2.18.0.bb}           |    4 +-
 meta/recipes-support/boost/boost.inc               |    4 +-
 meta/recipes-support/gdbm/gdbm_1.8.3.bb            |    1 +
 ...libsoup-2.4_2.50.0.bb => libsoup-2.4_2.52.1.bb} |    6 +-
 ...Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch |   62 +
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    1 +
 meta/recipes-support/libusb/libusb1/no-dll.patch   |   19 +
 .../{libusb1_1.0.19.bb => libusb1_1.0.20.bb}       |    5 +-
 scripts/bitbake-prserv-tool                        |    9 +
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 ...-yocto_4.1.bbapend => linux-yocto_4.1.bbappend} |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    5 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 scripts/lib/devtool/standard.py                    |  100 +-
 scripts/lib/devtool/upgrade.py                     |    2 +-
 scripts/lib/recipetool/append.py                   |    2 +
 246 files changed, 3962 insertions(+), 1165 deletions(-)
 create mode 100644 meta-selftest/files/signing/key.pub
 create mode 100644 meta-selftest/files/signing/key.secret
 create mode 100644 meta-selftest/files/signing/secret.txt
 create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.conf
 create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.sh
 create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check_1.0.bb
 create mode 100644 meta/lib/oeqa/selftest/signing.py
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2015.07.bb => u-boot-fw-utils_2015.10.bb} (91%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2015.07.bb => u-boot-mkimage_2015.10.bb} (84%)
 rename meta/recipes-bsp/u-boot/u-boot/{0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch => 0001-powerpc-cpu-u-boot-.lds-remove-_GLOBAL_OFFSET_TABLE_.patch} (96%)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0002-image.c-Fix-non-Android-booting-with-ramdisk-and-or-.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0003-common-board_f-enable-setup_board_part1-for-MIPS.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0004-MIPS-bootm-rework-and-fix-broken-bootm-code.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0005-MIPS-bootm-use-CONFIG_IS_ENABLED-everywhere.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0006-Replace-extern-inline-with-static-inline.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2015.07.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2015.10.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/init
 delete mode 100755 meta/recipes-connectivity/wireless-tools/wireless-tools/wireless-tools.if-pre-up
 delete mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/zzz-wireless.if-pre-up
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.44.1.bb => glib-2.0_2.46.1.bb} (73%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.44.0.bb => glib-networking_2.46.1.bb} (88%)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
 create mode 100644 meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0066-cxxflags-for-build.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch
 rename meta/recipes-devtools/python/{python-pycurl_7.19.5.1.bb => python-pycurl_7.19.5.2.bb} (72%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/trace-remove-malloc-tracing.patch
 create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
 rename meta/recipes-extended/ethtool/{ethtool_4.0.bb => ethtool_4.2.bb} (88%)
 rename meta/recipes-extended/mc/{mc_4.8.14.bb => mc_4.8.15.bb} (93%)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-pixops-Be-more-careful-about-integer-overflow.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.30.8.bb => gdk-pixbuf_2.32.1.bb} (94%)
 delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/Create-symlinks-when-installing-cursors.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.16.2.1.bb => adwaita-icon-theme_3.18.0.bb} (85%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.16.6.bb => gtk+3_3.18.2.bb} (83%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.16.6.bb => gtk-icon-utils-native_3.18.2.bb} (94%)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.10.bb => librsvg_2.40.11.bb} (92%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.0.2.bb => harfbuzz_1.0.6.bb} (88%)
 delete mode 100644 meta/recipes-graphics/pango/pango/multilib-fix-clean.patch
 delete mode 100644 meta/recipes-graphics/pango/pango_1.36.8.bb
 create mode 100644 meta/recipes-graphics/pango/pango_1.38.1.bb
 delete mode 100644 meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
 rename meta/recipes-graphics/xorg-app/{xinput_1.6.1.bb => xinput_1.6.2.bb} (66%)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.3.0.bb => xkbcomp_1.3.1.bb} (78%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.9.2.bb => xf86-input-evdev_2.10.0.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.8.2.bb => xf86-input-synaptics_1.8.3.bb} (74%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-omap_0.4.3.bb => xf86-video-omap_0.4.4.bb} (84%)
 rename meta/recipes-graphics/xorg-lib/{libxcb.inc => libxcb_1.11.1.bb} (80%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb_1.11.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb_git.bb
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.4.bb => libxi_1.7.5.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.6.bb => pixman_0.32.8.bb} (90%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.15.bb => xkeyboard-config_2.16.bb} (88%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.17.2.bb => xserver-xorg_1.18.0.bb} (78%)
 create mode 100644 meta/recipes-kernel/sysprof/files/gui-argument.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/files/libsndfile-fix-CVE-2014-9756.patch
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.94.bb => hwlatdetect_0.96.bb} (90%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.94.bb => rt-tests_0.96.bb} (100%)
 rename meta/recipes-support/atk/{at-spi2-atk_2.16.0.bb => at-spi2-atk_2.18.1.bb} (82%)
 rename meta/recipes-support/atk/{at-spi2-core_2.16.0.bb => at-spi2-core_2.18.1.bb} (84%)
 rename meta/recipes-support/atk/{atk_2.16.0.bb => atk_2.18.0.bb} (78%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.50.0.bb => libsoup-2.4_2.52.1.bb} (82%)
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
 create mode 100644 meta/recipes-support/libusb/libusb1/no-dll.patch
 rename meta/recipes-support/libusb/{libusb1_1.0.19.bb => libusb1_1.0.20.bb} (83%)
 rename scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/{linux-yocto_4.1.bbapend => linux-yocto_4.1.bbappend} (80%)

-- 
2.1.4


