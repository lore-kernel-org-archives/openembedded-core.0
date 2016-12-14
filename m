Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7A2719F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 21:13:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 14 Dec 2016 13:13:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,348,1477983600"; d="scan'208";a="18188578"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.22.2])
	by orsmga002.jf.intel.com with ESMTP; 14 Dec 2016 13:13:19 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2016 21:13:03 +0000
Message-Id: <cover.1481749746.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/4] Remove True option to getVar[Flag] calls
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
X-List-Received-Date: Wed, 14 Dec 2016 21:13:21 -0000

getVar() and getVarFlag() now default to expanding by default, thus remove the
True option from calls to both with a regex search and replace.

(Note: this series is relative to ross/mut3)

The following changes since commit d17879fdbc46e2cf10f724d3fbcf1b09d4e1bc7b:

  uninative: rebuild uninative for gcc 4.8 and 4.9 (2016-12-14 09:44:15 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib joshuagl/deprecations
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=joshuagl/deprecations

Joshua Lock (4):
  meta: remove True option to getVar calls
  scripts: remove True option to getVar calls
  meta: remove True option to getVarFlag calls
  scripts: remove True option to getVarFlag calls

 meta/classes/allarch.bbclass                       |   4 +-
 meta/classes/archiver.bbclass                      | 102 ++++----
 meta/classes/autotools.bbclass                     |  12 +-
 meta/classes/base.bbclass                          | 126 ++++-----
 meta/classes/binconfig.bbclass                     |   2 +-
 meta/classes/blacklist.bbclass                     |   6 +-
 meta/classes/bugzilla.bbclass                      |  24 +-
 meta/classes/buildhistory.bbclass                  |  62 ++---
 meta/classes/buildstats-summary.bbclass            |   2 +-
 meta/classes/buildstats.bbclass                    |  14 +-
 meta/classes/ccache.bbclass                        |   2 +-
 meta/classes/chrpath.bbclass                       |   4 +-
 meta/classes/cmake.bbclass                         |  16 +-
 meta/classes/cml1.bbclass                          |   4 +-
 meta/classes/compress_doc.bbclass                  |  40 +--
 meta/classes/copyleft_compliance.bbclass           |  10 +-
 meta/classes/copyleft_filter.bbclass               |  10 +-
 meta/classes/cross-canadian.bbclass                |  34 +--
 meta/classes/crosssdk.bbclass                      |   2 +-
 meta/classes/cve-check.bbclass                     |  46 ++--
 meta/classes/debian.bbclass                        |  24 +-
 meta/classes/devshell.bbclass                      |  10 +-
 meta/classes/distro_features_check.bbclass         |   8 +-
 meta/classes/distrodata.bbclass                    | 132 +++++-----
 meta/classes/distutils-base.bbclass                |   2 +-
 meta/classes/distutils3-base.bbclass               |   2 +-
 meta/classes/externalsrc.bbclass                   |  40 +--
 meta/classes/extrausers.bbclass                    |   2 +-
 meta/classes/fontcache.bbclass                     |  14 +-
 meta/classes/fs-uuid.bbclass                       |   2 +-
 meta/classes/gconf.bbclass                         |  12 +-
 meta/classes/gettext.bbclass                       |   8 +-
 meta/classes/gio-module-cache.bbclass              |  10 +-
 meta/classes/grub-efi.bbclass                      |  22 +-
 meta/classes/gsettings.bbclass                     |  10 +-
 meta/classes/gtk-icon-cache.bbclass                |  14 +-
 meta/classes/gtk-immodules-cache.bbclass           |  10 +-
 meta/classes/icecc.bbclass                         |   4 +-
 meta/classes/image-buildinfo.bbclass               |  12 +-
 meta/classes/image-live.bbclass                    |   8 +-
 meta/classes/image-vm.bbclass                      |  12 +-
 meta/classes/image.bbclass                         | 100 +++----
 meta/classes/image_types.bbclass                   |  24 +-
 meta/classes/insane.bbclass                        | 194 +++++++-------
 meta/classes/kernel-arch.bbclass                   |   6 +-
 meta/classes/kernel-fitimage.bbclass               |  14 +-
 meta/classes/kernel-grub.bbclass                   |   2 +-
 meta/classes/kernel-module-split.bbclass           |  38 +--
 meta/classes/kernel-uimage.bbclass                 |   8 +-
 meta/classes/kernel-yocto.bbclass                  |   2 +-
 meta/classes/kernel.bbclass                        |  40 +--
 meta/classes/libc-common.bbclass                   |  10 +-
 meta/classes/libc-package.bbclass                  |  60 ++---
 meta/classes/license.bbclass                       | 112 ++++----
 meta/classes/live-vm-common.bbclass                |   8 +-
 meta/classes/metadata_scm.bbclass                  |   2 +-
 meta/classes/migrate_localcount.bbclass            |  12 +-
 meta/classes/mime.bbclass                          |  12 +-
 meta/classes/module.bbclass                        |   2 +-
 meta/classes/multilib.bbclass                      |  32 +--
 meta/classes/multilib_global.bbclass               |  22 +-
 meta/classes/native.bbclass                        |  10 +-
 meta/classes/nativesdk.bbclass                     |   8 +-
 meta/classes/npm.bbclass                           |   4 +-
 meta/classes/oelint.bbclass                        |   4 +-
 meta/classes/package.bbclass                       | 286 ++++++++++-----------
 meta/classes/package_deb.bbclass                   |  54 ++--
 meta/classes/package_ipk.bbclass                   |  60 ++---
 meta/classes/package_rpm.bbclass                   | 142 +++++-----
 meta/classes/package_tar.bbclass                   |  16 +-
 meta/classes/packagedata.bbclass                   |  10 +-
 meta/classes/packagefeed-stability.bbclass         |  16 +-
 meta/classes/packagegroup.bbclass                  |   8 +-
 meta/classes/patch.bbclass                         |  22 +-
 meta/classes/pixbufcache.bbclass                   |  10 +-
 meta/classes/populate_sdk_base.bbclass             |  36 +--
 meta/classes/populate_sdk_ext.bbclass              | 112 ++++----
 meta/classes/prexport.bbclass                      |   4 +-
 meta/classes/ptest.bbclass                         |   2 +-
 meta/classes/qemu.bbclass                          |  10 +-
 meta/classes/qemuboot.bbclass                      |   8 +-
 meta/classes/recipe_sanity.bbclass                 |  26 +-
 meta/classes/report-error.bbclass                  |  22 +-
 meta/classes/rm_work.bbclass                       |   6 +-
 meta/classes/rootfs-postcommands.bbclass           |   6 +-
 meta/classes/rootfs_deb.bbclass                    |   4 +-
 meta/classes/rootfs_ipk.bbclass                    |   4 +-
 meta/classes/rootfs_rpm.bbclass                    |   4 +-
 meta/classes/sanity.bbclass                        | 108 ++++----
 meta/classes/sign_ipk.bbclass                      |  12 +-
 meta/classes/sign_package_feed.bbclass             |   4 +-
 meta/classes/sign_rpm.bbclass                      |  12 +-
 meta/classes/siteconfig.bbclass                    |   2 +-
 meta/classes/siteinfo.bbclass                      |  14 +-
 meta/classes/spdx.bbclass                          |  26 +-
 meta/classes/sstate.bbclass                        | 128 ++++-----
 meta/classes/staging.bbclass                       |  22 +-
 meta/classes/syslinux.bbclass                      |  34 +--
 meta/classes/systemd-boot.bbclass                  |  14 +-
 meta/classes/systemd.bbclass                       |  38 +--
 meta/classes/terminal.bbclass                      |   8 +-
 meta/classes/testexport.bbclass                    |  42 +--
 meta/classes/testimage.bbclass                     |  12 +-
 meta/classes/testsdk.bbclass                       |  12 +-
 meta/classes/tinderclient.bbclass                  |  54 ++--
 meta/classes/toaster.bbclass                       |  14 +-
 meta/classes/toolchain-scripts.bbclass             |   4 +-
 meta/classes/typecheck.bbclass                     |   2 +-
 meta/classes/uboot-config.bbclass                  |  14 +-
 meta/classes/uboot-extlinux-config.bbclass         |  24 +-
 meta/classes/uboot-sign.bbclass                    |   6 +-
 meta/classes/uninative.bbclass                     |  18 +-
 meta/classes/update-alternatives.bbclass           |  66 ++---
 meta/classes/update-rc.d.bbclass                   |  28 +-
 meta/classes/useradd-staticids.bbclass             |  48 ++--
 meta/classes/useradd.bbclass                       |  22 +-
 meta/classes/utility-tasks.bbclass                 |  10 +-
 meta/classes/utils.bbclass                         |  30 +--
 meta/classes/waf.bbclass                           |   2 +-
 meta/conf/bitbake.conf                             |  30 +--
 meta/conf/distro/defaultsetup.conf                 |   2 +-
 meta/conf/distro/include/tclibc-glibc.inc          |   6 +-
 meta/conf/machine/include/arm/arch-arm.inc         |   2 +-
 meta/conf/machine/include/arm/arch-arm64.inc       |   2 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc |  10 +-
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |  10 +-
 .../machine/include/mips/feature-mips-mips16e.inc  |   6 +-
 meta/conf/multilib.conf                            |   2 +-
 meta/lib/buildstats.py                             |   4 +-
 meta/lib/oe/classextend.py                         |  12 +-
 meta/lib/oe/copy_buildsystem.py                    |  12 +-
 meta/lib/oe/data.py                                |   4 +-
 meta/lib/oe/distro_check.py                        |  20 +-
 meta/lib/oe/gpg_sign.py                            |   4 +-
 meta/lib/oe/manifest.py                            |  26 +-
 meta/lib/oe/package.py                             |   2 +-
 meta/lib/oe/package_manager.py                     | 174 ++++++-------
 meta/lib/oe/packagedata.py                         |   2 +-
 meta/lib/oe/packagegroup.py                        |  10 +-
 meta/lib/oe/patch.py                               |  30 +--
 meta/lib/oe/path.py                                |   2 +-
 meta/lib/oe/prservice.py                           |  26 +-
 meta/lib/oe/qa.py                                  |   4 +-
 meta/lib/oe/recipeutils.py                         |  38 +--
 meta/lib/oe/rootfs.py                              | 114 ++++----
 meta/lib/oe/sdk.py                                 |  76 +++---
 meta/lib/oe/sstatesig.py                           |  32 +--
 meta/lib/oe/terminal.py                            |   2 +-
 meta/lib/oe/utils.py                               |  30 +--
 meta/lib/oeqa/controllers/masterimage.py           |  16 +-
 meta/lib/oeqa/oetest.py                            |  60 ++---
 meta/lib/oeqa/runexported.py                       |   8 +-
 meta/lib/oeqa/runtime/_ptest.py                    |  16 +-
 meta/lib/oeqa/runtime/date.py                      |   4 +-
 meta/lib/oeqa/runtime/multilib.py                  |   2 +-
 meta/lib/oeqa/runtime/parselogs.py                 |   4 +-
 meta/lib/oeqa/runtime/rpm.py                       |   6 +-
 meta/lib/oeqa/runtime/scp.py                       |   2 +-
 meta/lib/oeqa/runtime/smart.py                     |  18 +-
 meta/lib/oeqa/runtime/systemd.py                   |   2 +-
 meta/lib/oeqa/runtime/x32lib.py                    |   2 +-
 meta/lib/oeqa/sdk/gcc.py                           |   2 +-
 meta/lib/oeqa/selftest/tinfoil.py                  |  16 +-
 meta/lib/oeqa/targetcontrol.py                     |  52 ++--
 meta/lib/oeqa/utils/commands.py                    |   2 +-
 meta/lib/oeqa/utils/dump.py                        |   4 +-
 meta/lib/oeqa/utils/package_manager.py             |  12 +-
 meta/lib/oeqa/utils/targetbuild.py                 |   8 +-
 meta/lib/oeqa/utils/testexport.py                  |  14 +-
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb          |   2 +-
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |   2 +-
 meta/recipes-bsp/u-boot/u-boot.inc                 |   2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc        |   4 +-
 meta/recipes-connectivity/connman/connman.inc      |   4 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   2 +-
 meta/recipes-core/busybox/busybox.inc              |  14 +-
 meta/recipes-core/busybox/busybox_1.24.1.bb        |   4 +-
 meta/recipes-core/busybox/busybox_git.bb           |   4 +-
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   8 +-
 meta/recipes-core/coreutils/coreutils_8.25.bb      |   8 +-
 meta/recipes-core/glibc/glibc-ld.inc               |   6 +-
 meta/recipes-core/glibc/glibc-locale.inc           |   8 +-
 meta/recipes-core/glibc/glibc-package.inc          |   4 +-
 meta/recipes-core/glibc/glibc.inc                  |   6 +-
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |   2 +-
 meta/recipes-core/meta/meta-environment-extsdk.bb  |   4 +-
 meta/recipes-core/meta/meta-environment.bb         |   6 +-
 meta/recipes-core/meta/meta-extsdk-toolchain.bb    |   2 +-
 meta/recipes-core/meta/meta-world-pkgdata.bb       |   2 +-
 meta/recipes-core/meta/signing-keys.bb             |  18 +-
 meta/recipes-core/os-release/os-release.bb         |   4 +-
 .../packagegroups/packagegroup-base.bb             |   4 +-
 .../packagegroups/packagegroup-core-sdk.bb         |   2 +-
 meta/recipes-core/psplash/psplash_git.bb           |  20 +-
 meta/recipes-core/systemd/systemd_232.bb           |   4 +-
 meta/recipes-core/util-linux/util-linux.inc        |   2 +-
 meta/recipes-core/volatile-binds/volatile-binds.bb |   2 +-
 meta/recipes-devtools/apt/apt-native.inc           |   4 +-
 meta/recipes-devtools/apt/apt-package.inc          |   4 +-
 meta/recipes-devtools/automake/automake.inc        |   2 +-
 meta/recipes-devtools/binutils/binutils-2.27.inc   |   2 +-
 meta/recipes-devtools/binutils/binutils.inc        |   6 +-
 meta/recipes-devtools/cmake/cmake.inc              |   2 +-
 meta/recipes-devtools/cmake/cmake_3.7.0.bb         |   4 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |   2 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |  32 +--
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc            |   2 +-
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  |  20 +-
 meta/recipes-devtools/gcc/libgcc-common.inc        |  38 +--
 meta/recipes-devtools/gcc/libgfortran.inc          |   2 +-
 meta/recipes-devtools/git/git.inc                  |   2 +-
 .../kconfig-frontends_3.12.0.0.bb                  |   2 +-
 meta/recipes-devtools/perl/perl_5.24.0.bb          |   2 +-
 meta/recipes-devtools/prelink/prelink_git.bb       |   2 +-
 meta/recipes-devtools/python/python-smartpm_git.bb |   6 +-
 meta/recipes-devtools/qemu/qemu-targets.inc        |   4 +-
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  60 ++---
 meta/recipes-devtools/swig/swig.inc                |   4 +-
 meta/recipes-devtools/vala/vala.inc                |   2 +-
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   2 +-
 meta/recipes-extended/cups/cups.inc                |   2 +-
 meta/recipes-extended/man/man_1.6g.bb              |   4 +-
 .../net-tools/net-tools_1.60-26.bb                 |   8 +-
 .../packagegroup-core-full-cmdline.bb              |   2 +-
 .../packagegroups/packagegroup-core-lsb.bb         |   4 +-
 meta/recipes-extended/pam/libpam_1.3.0.bb          |  14 +-
 meta/recipes-extended/procps/procps_3.3.12.bb      |   8 +-
 meta/recipes-extended/texinfo/texinfo_6.3.bb       |   2 +-
 meta/recipes-extended/tzdata/tzdata_2016i.bb       |   2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb |   2 +-
 .../gobject-introspection_1.50.0.bb                |   2 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   2 +-
 meta/recipes-gnome/gtk+/gtk+_2.24.31.bb            |   2 +-
 meta/recipes-graphics/cairo/cairo-fpu.inc          |   2 +-
 meta/recipes-graphics/mesa/mesa.inc                |   6 +-
 .../xorg-driver/xorg-driver-common.inc             |   4 +-
 meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb     |   2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    |   2 +-
 meta/recipes-kernel/linux/linux-yocto.inc          |   4 +-
 meta/recipes-kernel/lttng/lttng-modules_git.bb     |   4 +-
 meta/recipes-kernel/perf/perf-features.inc         |   2 +-
 meta/recipes-kernel/perf/perf.bb                   |   2 +-
 meta/recipes-multimedia/alsa/alsa-fpu.inc          |   2 +-
 .../gstreamer/gst-plugins-package.inc              |  10 +-
 .../gstreamer/gstreamer1.0-omx.inc                 |   4 +-
 meta/recipes-rt/images/core-image-rt-sdk.bb        |   2 +-
 meta/recipes-rt/images/core-image-rt.bb            |   2 +-
 meta/recipes-support/attr/ea-acl.inc               |   8 +-
 meta/recipes-support/boost/boost-1.62.0.inc        |   4 +-
 meta/recipes-support/boost/boost.inc               |   8 +-
 meta/recipes-support/gnutls/gnutls.inc             |   2 +-
 meta/recipes-support/icu/icu_58.1.bb               |   2 +-
 meta/recipes-support/libiconv/libiconv_1.11.1.bb   |   2 +-
 meta/recipes-support/libiconv/libiconv_1.14.bb     |   4 +-
 meta/recipes-support/libnl/libnl_3.2.28.bb         |   2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb |   2 +-
 meta/recipes-support/sqlite/sqlite3.inc            |   2 +-
 meta/recipes-support/taglib/taglib_1.11.1.bb       |   2 +-
 scripts/contrib/list-packageconfig-flags.py        |   6 +-
 scripts/contrib/verify-homepage.py                 |   2 +-
 scripts/devtool                                    |   2 +-
 scripts/lib/devtool/__init__.py                    |   8 +-
 scripts/lib/devtool/build_image.py                 |  10 +-
 scripts/lib/devtool/deploy.py                      |   2 +-
 scripts/lib/devtool/package.py                     |   2 +-
 scripts/lib/devtool/runqemu.py                     |   4 +-
 scripts/lib/devtool/sdk.py                         |   8 +-
 scripts/lib/devtool/search.py                      |   4 +-
 scripts/lib/devtool/standard.py                    |  58 ++---
 scripts/lib/devtool/upgrade.py                     |  20 +-
 scripts/lib/devtool/utilcmds.py                    |  18 +-
 scripts/lib/recipetool/append.py                   |  28 +-
 scripts/lib/recipetool/create.py                   |  24 +-
 scripts/lib/recipetool/create_buildsys_python.py   |   4 +-
 scripts/lib/recipetool/create_kernel.py            |   4 +-
 scripts/lib/recipetool/create_npm.py               |   6 +-
 scripts/lib/recipetool/newappend.py                |   2 +-
 scripts/lib/scriptutils.py                         |   2 +-
 scripts/oe-pkgdata-util                            |   2 +-
 scripts/recipetool                                 |   2 +-
 scripts/verify-bashisms                            |   2 +-
 285 files changed, 2487 insertions(+), 2487 deletions(-)

-- 
2.9.3

