Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvF-0004HG-OZ
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:02 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206359"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:45:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:20 -0800
Message-Id: <cover.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [CONSOLIDATED PULL 00/35] Catching up with Pulls
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2012 22:54:02 -0000

Richard et al:

Updates from various folks, this include kernel, uclibc.

One Major change to note is Khem's task-core-tools breakup and
the renaming of POKY_ -> CORE_IMAGE_.  This will require layers
to pay attention and fix.

Sau!


The following changes since commit 18d9fcfc4bc4b01f73e89f3b988c9d3d543c7705:

  libzypp: add missing runtime dependences on gzip and gnupg (2012-02-03 17:23:28 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Oberritter (1):
  tune-mips32.inc: Add mips32-nf and mips32el-nf

Bruce Ashfield (5):
  linux-yocto: locate and use out of tree features specified on the
    SRC_URI
  linux-yocto: meta updates for sys940x and cleanup
  linux-yocto: rt compiliation fix
  kern-tools: remove explicit 'yocto' references from auto-bsp handling
  linux-yocto: fri2: use emgd-1.10

Chase Maupin (1):
  u-boot inc: update inc file for newer u-boot versions

Darren Hart (1):
  bootimg: Use the same OS files for each boot method

Khem Raj (13):
  xorg-apps: Bump PR to accomodate meta-oe recipe deletion
  task-core-tools: Divide it into 3 recipes
  Enable options needed for ltp to compile
  runqemu-internal: qemuarm can handle 256M
  gconf,consolekit: Avoid polkit when compiling with uclibc
  python: Fix build failure of python-elementtree on x86_64
  libdrm: Fix build failure unearthed by uclibc
  libx11: Backport _XGetRequest API
  pseudo: Wrap renameat and opendir
  uclibc: Upgrade recipes from 0.9.32 -> 0.9.33
  classes,recipes: Replace POKY_* with CORE_IMAGE_*
  gcc-cross-testing: Fix evaluation of user and target name
  mirrors.bbclass: Add yp.org and oe.org to fallback mirrors

Mike Crowe (3):
  libusb1: Cope with ${libdir} and ${base_libdir} being the same
  libusb-compat: Cope with ${libdir} and ${base_libdir} being the same
  libcap: Cope with ${libdir} and ${base_libdir} being the same

Otavio Salvador (2):
  udev: stop providing cache support by default
  dhcp: move dhcp leases files handling to postinst/postrm

Peter Tworek (3):
  busybox: Add flock utility to default configuration.
  webkit-gtk: Fix error.html resource path.
  webkit-gtk: Make webgl support configurable via DISTRO_FEATURES.

Saul Wold (3):
  gnupg-1.4.7: Update Patch Info
  openssl-0.9.8: Remove in favor or 1.0.0
  mtools-3.9.9: Use correct URI for the mirror

Wade Farnsworth (3):
  systemtap: bump SRCREV to grab version 1.7
  systemtap: extend the recipe to build the native package
  systemtap: build and install uprobes.ko

 meta/classes/bootimg.bbclass                       |   31 +-
 meta/classes/core-image.bbclass                    |    8 +-
 meta/classes/grub-efi.bbclass                      |   28 +-
 meta/classes/kernel-yocto.bbclass                  |   21 +
 meta/classes/mirrors.bbclass                       |   21 +-
 meta/classes/syslinux.bbclass                      |   34 +-
 .../conf/distro/include/distro_tracking_fields.inc |   26 +-
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 meta/conf/machine/include/tune-mips32.inc          |    6 +-
 meta/conf/multilib.conf                            |    4 +-
 meta/recipes-bsp/u-boot/u-boot.inc                 |   35 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            |   25 +-
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    2 +-
 .../openssl/openssl-0.9.8t/configure-targets.patch |   25 -
 .../openssl/openssl-0.9.8t/debian/ca.patch         |   22 -
 .../openssl-0.9.8t/debian/config-hurd.patch        |   17 -
 .../openssl-0.9.8t/debian/debian-targets.patch     |   56 --
 .../openssl-0.9.8t/debian/engines-path.patch       |   49 --
 .../openssl-0.9.8t/debian/kfreebsd-pipe.patch      |   15 -
 .../openssl-0.9.8t/debian/make-targets.patch       |   15 -
 .../openssl/openssl-0.9.8t/debian/man-dir.patch    |   15 -
 .../openssl-0.9.8t/debian/man-section.patch        |   34 -
 .../openssl/openssl-0.9.8t/debian/no-rpath.patch   |   15 -
 .../openssl-0.9.8t/debian/no-symbolic.patch        |   15 -
 .../openssl/openssl-0.9.8t/debian/perl-path.diff   |  762 --------------------
 .../openssl/openssl-0.9.8t/debian/pic.patch        |  303 --------
 .../openssl/openssl-0.9.8t/debian/pkg-config.patch |   36 -
 .../openssl/openssl-0.9.8t/debian/rc4-amd64.patch  |   16 -
 .../openssl/openssl-0.9.8t/debian/rehash-crt.patch |   35 -
 .../openssl/openssl-0.9.8t/debian/rehash_pod.patch |   62 --
 .../openssl/openssl-0.9.8t/debian/series           |   20 -
 .../openssl-0.9.8t/debian/shared-lib-ext.patch     |   16 -
 .../openssl/openssl-0.9.8t/debian/stddef.patch     |   14 -
 .../openssl-0.9.8t/debian/version-script.patch     |   35 -
 .../openssl/openssl-0.9.8t/parallel-make-fix.patch |   20 -
 .../openssl/openssl-0.9.8t/shared-libs.patch       |   50 --
 .../recipes-connectivity/openssl/openssl_0.9.8t.bb |   31 -
 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
 meta/recipes-core/images/core-image-minimal.bb     |    2 +-
 meta/recipes-core/images/self-hosted-image.bb      |    2 +-
 meta/recipes-core/tasks/task-core-tools-debug.bb   |   26 +
 ...sk-core-tools.bb => task-core-tools-profile.bb} |   81 +--
 .../recipes-core/tasks/task-core-tools-testapps.bb |   46 ++
 ...rch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch |   29 -
 ...fd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch |   33 -
 .../uclibc-0.9.32/detect-bx-availibility.patch     |   75 --
 .../uclibc/uclibc-0.9.32/epoll-asm-fix.patch       |   25 -
 .../uclibc/uclibc-0.9.32/include-arm-asm.h.patch   |   65 --
 .../uclibc/uclibc-0.9.32/mount.h-update.patch      |   85 ---
 .../uclibc-0.9.32/remove-eabi-oabi-selection.patch |   91 ---
 .../uclibc-0.9.32/remove-sub-arch-variants.patch   |  215 ------
 .../uclibc/uclibc-0.9.32/rtld_no.patch             |  215 ------
 .../uclibc/uclibc-0.9.32/select-force-thumb.patch  |  172 -----
 .../uclibc/uclibc-0.9.32/sync_file_range2.patch    |   47 --
 .../uclibc-0.9.32/transform-eabi-oabi-choice.patch |   71 --
 .../uclibc-0.9.32/uclibc-arm-ftruncate64.patch     |   13 -
 .../uclibc-0.9.32/uclibc_scheduler_update.patch    |  455 ------------
 ...rr-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch |   32 +
 ...fstat-Use-64bit-version-of-syscall-if-ava.patch |  177 +++++
 .../argp-headers.patch                             |    2 +
 .../argp-support.patch                             |    3 +
 .../compile-arm-fork-with-O2.patch                 |    2 +-
 .../uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch    |   25 +
 meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch  |   37 +
 ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |    6 +
 .../libc_symbols_include_bits_uclibc_config.patch  |   19 +
 .../mips/uClibc.machine                            |    0
 .../orign_path.patch                               |   94 ++--
 .../powerpc_copysignl.patch                        |    6 +
 .../remove_attribute_optimize_Os.patch             |   17 +-
 .../{uclibc-0.9.32 => uclibc-0.9.33}/uClibc.distro |    8 +-
 .../uClibc.machine                                 |    0
 .../uclibc-execvpe.patch                           |    3 +
 .../uclibc_enable_log2_test.patch                  |    5 +
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    5 +
 ...-initial_0.9.32.bb => uclibc-initial_0.9.33.bb} |    0
 .../uclibc/{uclibc_0.9.32.bb => uclibc_0.9.33.bb}  |   26 +-
 meta/recipes-core/udev/udev.inc                    |    2 +-
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc            |    6 +-
 meta/recipes-devtools/mtools/mtools_3.9.9.bb       |    4 +-
 meta/recipes-devtools/pseudo/pseudo/opendir.patch  |   94 +++
 meta/recipes-devtools/pseudo/pseudo/renameat.patch |  229 ++++++
 meta/recipes-devtools/pseudo/pseudo_1.2.bb         |    6 +-
 .../python/python/host_include_contamination.patch |   27 +
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 meta/recipes-extended/images/core-image-basic.bb   |    2 +-
 meta/recipes-extended/images/core-image-lsb-dev.bb |    2 +-
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    2 +-
 meta/recipes-extended/images/core-image-lsb.bb     |    2 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    9 +-
 .../drm/libdrm/GNU_SOURCE_definition.patch         |   30 +
 meta/recipes-graphics/drm/libdrm_2.4.30.bb         |    6 +-
 meta/recipes-graphics/images/core-image-clutter.bb |    2 +-
 .../images/core-image-gtk-directfb.bb              |    2 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc |    2 +-
 ...quest-as-substitute-for-GetReq-GetReqExtr.patch |  137 ++++
 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb     |    3 +
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
 .../systemtap/systemtap-uprobes_git.bb             |   42 ++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |   22 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   16 +
 meta/recipes-qt/images/qt4e-demo-image.bb          |    2 +-
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    6 +-
 .../recipes-support/consolekit/consolekit_0.4.5.bb |   11 +-
 .../gnupg/gnupg-1.4.7/long-long-thumb.patch        |    7 +
 .../gnupg/gnupg-1.4.7/mips_gcc4.4.patch            |    8 +
 meta/recipes-support/libcap/libcap.inc             |    8 +-
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    6 +-
 meta/recipes-support/libusb/libusb1_1.0.8.bb       |    6 +-
 scripts/runqemu-internal                           |   13 +-
 113 files changed, 1333 insertions(+), 3530 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/configure-targets.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/ca.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/config-hurd.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/debian-targets.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/engines-path.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/kfreebsd-pipe.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/make-targets.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/man-dir.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/man-section.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/no-rpath.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/no-symbolic.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/perl-path.diff
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/pic.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/pkg-config.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rc4-amd64.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rehash-crt.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rehash_pod.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/series
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/shared-lib-ext.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/stddef.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/version-script.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/parallel-make-fix.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/shared-libs.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl_0.9.8t.bb
 create mode 100644 meta/recipes-core/tasks/task-core-tools-debug.bb
 rename meta/recipes-core/tasks/{task-core-tools.bb => task-core-tools-profile.bb} (48%)
 create mode 100644 meta/recipes-core/tasks/task-core-tools-testapps.bb
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/detect-bx-availibility.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm-fix.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/include-arm-asm.h.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/remove-eabi-oabi-selection.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/remove-sub-arch-variants.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/rtld_no.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/select-force-thumb.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/transform-eabi-oabi-choice.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-arm-ftruncate64.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_scheduler_update.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/0001-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/0001-lstat-stat-fstat-Use-64bit-version-of-syscall-if-ava.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/argp-headers.patch (99%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/argp-support.patch (99%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/compile-arm-fork-with-O2.patch (97%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch (86%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/libc_symbols_include_bits_uclibc_config.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/mips/uClibc.machine (100%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/orign_path.patch (64%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/powerpc_copysignl.patch (96%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/remove_attribute_optimize_Os.patch (93%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/uClibc.distro (96%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/uClibc.machine (100%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/uclibc-execvpe.patch (99%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/uclibc_enable_log2_test.patch (81%)
 rename meta/recipes-core/uclibc/{uclibc-initial_0.9.32.bb => uclibc-initial_0.9.33.bb} (100%)
 rename meta/recipes-core/uclibc/{uclibc_0.9.32.bb => uclibc_0.9.33.bb} (45%)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo/opendir.patch
 create mode 100644 meta/recipes-devtools/pseudo/pseudo/renameat.patch
 create mode 100644 meta/recipes-devtools/python/python/host_include_contamination.patch
 create mode 100644 meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
 create mode 100644 meta/recipes-kernel/systemtap/systemtap_git.inc

-- 
1.7.6.5



