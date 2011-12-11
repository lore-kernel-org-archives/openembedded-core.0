Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZsIE-0003rc-QK
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 23:54:51 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2011 14:47:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86045435"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.46])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2011 14:47:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2011 14:47:27 -0800
Message-Id: <cover.1323643433.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [CONSOLIDATED PULL 00/26] Round up of patches and pull
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
X-List-Received-Date: Sun, 11 Dec 2011 22:54:51 -0000

Richard,

This is a round of of patches and pulls from last week, built
locally and on AB.

Includes Nitin's X32 changes along with fixes noticed while doing
self-hosted work (address comments from Paul earlier).

Sau!


The following changes since commit 07f94fa1d661d38b775ce2d99b84e5610c369392:

  license/copyleft: exception for ast parse (2011-12-10 00:17:25 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Christopher Larson (1):
  lzop-1.03: add recipe

Elizabeth Flanagan (1):
  license: PR bump failure

Frans Meulenbroeks (1):
  u-boot: renamed dir from uboot to the more appropriate u-boot

H.J. Lu (3):
  mesa: Properly create share library for x32
  siteinfo: create a new siteinfo for x32-linux
  openssl-1.0.0e: Update x32 Configure

Khem Raj (3):
  qemu-0.15.1: Bump recipes from 0.15.0 to 0.15.1
  task-core-nfs: Add nfs-utils-client to RDEPENDS
  eglibc: Generate cross testing script during install

Nitin A Kamble (8):
  gst-fluendo.inc: remove unneccessary hack
  mdadm: Make custom CC definition conditional
  pulseaudio: fix compilation with x32 toolchain
  libacpi: Fix libdir for x32
  findutils: Fix compilation for x32 toolchain
  pax: fix compilation with x32 toolchain
  libacpi: Use the cross strip instead of host strip
  x86 tune: fix TUNE_PKGARCH definition for proper PACKAGE_ARCH

Otavio Salvador (2):
  dosfstools: update native to 2.11
  scripts/send-pull-request: fix typo

Saul Wold (7):
  ncurses: libcurses.so should link to libncurses.so
  bitbake.conf: remove texinfo-native from ASSUME_PROVIDED
  texinfo: fix compile failure due target makedoc binary being used
  task-self-hosted: Reorder by Alpha
  task-self-hosted: Added perl-pod (slight reorder)
  task-self-hosted: Add host-tools task
  task-self-hosted: Move tools to host-tools task

 meta/classes/license.bbclass                       |    2 +-
 meta/classes/siteinfo.bbclass                      |    2 +-
 meta/conf/bitbake.conf                             |    1 -
 meta/conf/machine/include/ia32/arch-ia32.inc       |    4 +-
 meta/conf/machine/include/tune-core2.inc           |    6 +-
 .../libacpi/files/libacpi_fix_for_x32.patch        |   47 +++
 .../use_correct_strip_in_cross_environment.patch   |   23 ++
 meta/recipes-bsp/libacpi/libacpi_0.2.bb            |    6 +-
 .../{uboot => u-boot}/files/fix-arm920t-eabi.patch |    0
 ...Drop-config.h-include-in-tools-imximage.h.patch |    0
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |    0
 ...Drop-config.h-include-in-tools-imximage.h.patch |    0
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |    0
 .../{uboot => u-boot}/u-boot-mkimage_2011.03.bb    |    0
 .../{uboot => u-boot}/u-boot-mkimage_2011.06.bb    |    0
 meta/recipes-bsp/{uboot => u-boot}/u-boot.inc      |    0
 .../{uboot => u-boot}/u-boot_2011.03.bb            |    0
 .../{uboot => u-boot}/u-boot_2011.06.bb            |    0
 .../openssl-1.0.0e/openssl_fix_for_x32.patch       |    2 +-
 meta/recipes-core/eglibc/eglibc-common.inc         |    1 -
 meta/recipes-core/eglibc/eglibc-testing.inc        |   47 +++
 meta/recipes-core/eglibc/eglibc.inc                |    1 +
 meta/recipes-core/eglibc/eglibc_2.13.bb            |   11 +-
 meta/recipes-core/eglibc/eglibc_2.14.bb            |   10 +-
 meta/recipes-core/ncurses/ncurses.inc              |    5 +-
 meta/recipes-core/tasks/task-core-nfs.bb           |    6 +-
 meta/recipes-core/tasks/task-self-hosted.bb        |   61 ++--
 .../dosfstools/dosfstools-native_2.10.bb           |   19 -
 .../dosfstools/dosfstools/2.6.20-syscall.patch     |   72 ----
 .../dosfstools/dosfstools-2.10-kernel-2.6.patch    |   74 ----
 .../dosfstools/dosfstools/mkdosfs-bootcode.patch   |   68 ++--
 .../dosfstools/dosfstools/mkdosfs-dir.patch        |   62 ++--
 .../recipes-devtools/dosfstools/dosfstools_2.10.bb |   24 --
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |   11 +-
 .../{qemu-0.15.0 => qemu-0.15.1}/arm-bgr.patch     |    0
 .../enable-i386-linux-user.patch                   |    0
 .../fallback-to-safe-mmap_min_addr.patch           |    0
 .../fix-configure-checks.patch                     |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/fix-nogl.patch    |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/glflags.patch     |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/init-info.patch   |    0
 .../larger_default_ram_size.patch                  |    0
 .../linker-flags.patch                             |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/no-strip.patch    |    0
 .../opengl-sdl-fix.patch                           |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/powerpc_rom.bin   |  Bin 4096 -> 4096 bytes
 .../qemu-git-qemugl-host.patch                     |    0
 .../qemu-vmware-vga-depth.patch                    |    0
 .../qemugl-allow-glxcontext-release.patch          |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/qemugl-fix.patch  |    0
 .../qemu/{qemu_0.15.0.bb => qemu_0.15.1.bb}        |    6 +-
 .../findutils-4.4.2/findutils_fix_for_x32.patch    |   40 ++
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    5 +-
 .../mdadm/files/mdadm-3.2.2_fix_for_x32.patch      |   24 ++
 meta/recipes-extended/mdadm/mdadm_3.2.2.bb         |    4 +-
 .../pax/pax/pax-3.4_fix_for_x32.patch              |  185 +++++++++
 meta/recipes-extended/pax/pax_3.4.bb               |    5 +-
 .../texinfo/texinfo-4.13a/use_host_makedoc.patch   |   37 ++
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |   11 +-
 .../mesa/mesa/mesa_fix_for_x32.patch               |   20 +-
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc  |    4 -
 .../pulseaudio/pulseaudo_fix_for_x32.patch         |  238 ++++++++++++
 .../pulseaudio/pulseaudio_1.1.bb                   |    3 +-
 meta/recipes-support/lzop/lzop/acinclude.m4        |  390 ++++++++++++++++++++
 meta/recipes-support/lzop/lzop_1.03.bb             |   27 ++
 meta/site/x32-linux                                |    9 +
 scripts/send-pull-request                          |    2 +-
 67 files changed, 1245 insertions(+), 330 deletions(-)
 create mode 100644 meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
 create mode 100644 meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
 rename meta/recipes-bsp/{uboot => u-boot}/files/fix-arm920t-eabi.patch (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot-mkimage_2011.03.bb (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot-mkimage_2011.06.bb (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot.inc (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot_2011.03.bb (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot_2011.06.bb (100%)
 create mode 100644 meta/recipes-core/eglibc/eglibc-testing.inc
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools-native_2.10.bb
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools_2.10.bb
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/arm-bgr.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/enable-i386-linux-user.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/fallback-to-safe-mmap_min_addr.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/fix-configure-checks.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/fix-nogl.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/glflags.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/init-info.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/larger_default_ram_size.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/linker-flags.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/no-strip.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/opengl-sdl-fix.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/powerpc_rom.bin (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/qemu-git-qemugl-host.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/qemu-vmware-vga-depth.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/qemugl-allow-glxcontext-release.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/qemugl-fix.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu_0.15.0.bb => qemu_0.15.1.bb} (88%)
 create mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_x32.patch
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
 create mode 100644 meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/use_host_makedoc.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch
 create mode 100644 meta/recipes-support/lzop/lzop/acinclude.m4
 create mode 100644 meta/recipes-support/lzop/lzop_1.03.bb
 create mode 100644 meta/site/x32-linux

-- 
1.7.6.4



