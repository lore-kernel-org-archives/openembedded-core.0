Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZ5DY-000496-1X
	for openembedded-core@openembedded.org; Fri, 09 Dec 2011 19:30:44 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Dec 2011 10:23:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100564229"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2011 10:23:49 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Fri,  9 Dec 2011 10:23:33 -0800
Message-Id: <cover.1323454935.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [CONSOLIDATED PULL 00/15] x32 and misc fixes
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
X-List-Received-Date: Fri, 09 Dec 2011 18:30:45 -0000


The following changes since commit 4215b2fb04b3ed61e8e1cf0847639cf6fe31d337:

  connman: update to 0.78 (2011-12-09 17:46:25 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Christopher Larson (1):
  lzop-1.03: add recipe

Frans Meulenbroeks (1):
  u-boot: renamed dir from uboot to the more appropriate u-boot

H.J. Lu (3):
  mesa: Properly create share library for x32
  siteinfo: create a new siteinfo for x32-linux
  openssl-1.0.0e: Update x32 Configure

Nitin A Kamble (8):
  gst-fluendo.inc: remove unneccessary hack
  mdadm: Make custom CC definition conditional
  pulseaudio: fix compilation with x32 toolchain
  libacpi: Fix libdir for x32
  findutils: Fix compilation for x32 toolchain
  pax: fix compilation with x32 toolchain
  libacpi: Use the cross strip instead of host strip
  x86 tune: fix TUNE_PKGARCH definition for proper PACKAGE_ARCH

Saul Wold (2):
  ncurses: libcurses.so should link to libncurses.so
  self-hosted: Add ext2 utilites and perl-pod for building

 meta/classes/siteinfo.bbclass                      |    2 +-
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
 meta/recipes-core/ncurses/ncurses.inc              |    6 +-
 meta/recipes-core/tasks/task-self-hosted.bb        |   54 ++--
 .../findutils-4.4.2_fix_for_x32.patch              |   36 ++
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    5 +-
 .../mdadm/files/mdadm-3.2.2_fix_for_x32.patch      |   24 ++
 meta/recipes-extended/mdadm/mdadm_3.2.2.bb         |    4 +-
 .../pax/pax/pax-3.4_fix_for_x32.patch              |  185 +++++++++
 meta/recipes-extended/pax/pax_3.4.bb               |    5 +-
 .../mesa/mesa/mesa_fix_for_x32.patch               |   20 +-
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc  |    4 -
 .../pulseaudio/pulseaudo_fix_for_x32.patch         |  225 +++++++++++
 .../pulseaudio/pulseaudio_1.1.bb                   |    3 +-
 meta/recipes-support/lzop/lzop/acinclude.m4        |  390 ++++++++++++++++++++
 meta/recipes-support/lzop/lzop_1.03.bb             |   27 ++
 meta/site/x32-linux                                |    9 +
 32 files changed, 1040 insertions(+), 47 deletions(-)
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
 create mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils-4.4.2_fix_for_x32.patch
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
 create mode 100644 meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch
 create mode 100644 meta/recipes-support/lzop/lzop/acinclude.m4
 create mode 100644 meta/recipes-support/lzop/lzop_1.03.bb
 create mode 100644 meta/site/x32-linux

-- 
1.7.6.4



