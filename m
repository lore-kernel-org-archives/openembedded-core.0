Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Thycy-00007W-09
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 09:22:16 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Dec 2012 00:07:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,250,1355126400"; d="scan'208";a="178804516"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Dec 2012 00:07:43 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2012 10:08:10 +0200
Message-Id: <cover.1355126594.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 0/3] Package upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2012 08:22:16 -0000

This represents another set of package upgrades (pixman, qemu) tested using
core-image-sato on all architectures. We need to update the DEPENDS variable
and enable the missing nativesdk packages because now QEMU uses pixman.
The following changes since commit c607095894cab60493ddfc4b967b0325e1c313b4:

  bitbake: Revert "BBHandler: Ensure parser state engine is correctly reset for new parsing" (2012-12-07 18:09:01 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib cmuscax/pus2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=cmuscax/pus2

Constantin Musca (3):
  libpng: enable nativesdk variant
  pixman: upgrade to 0.28.0
  qemu: upgrade to 1.3.0

 ...re_vga-Add-back-some-info-in-local-state-.patch | 114 ++++++++++++++++++
 .../qemu/{qemu-1.2.0 => files}/arm-bgr.patch       |   0
 .../enable-i386-linux-user.patch                   |   0
 .../fallback-to-safe-mmap_min_addr.patch           |   0
 .../fix-configure-checks.patch                     |   0
 .../qemu/{qemu-1.2.0 => files}/init-info.patch     |   0
 .../larger_default_ram_size.patch                  |   0
 .../qemu/{qemu-1.2.0 => files}/linker-flags.patch  |   0
 .../qemu/{qemu-1.2.0 => files}/no-strip.patch      |   0
 .../qemu/{qemu-1.2.0 => files}/powerpc_rom.bin     | Bin
 .../{qemu-1.2.0 => files}/relocatable_sdk.patch    |   0
 .../qemu/qemu-1.2.0/qemu-vmware-vga-depth.patch    | 106 -----------------
 .../qemu/qemu-1.2.0/remove-hardcoded-libexec.patch |  41 -------
 .../qemu/qemu-git/enable-i386-linux-user.patch     |  55 ---------
 .../qemu/qemu-git/linker-flags.patch               |  25 ----
 meta/recipes-devtools/qemu/qemu-git/no-strip.patch |  15 ---
 .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin | Bin 4096 -> 0 bytes
 .../qemu/qemu-git/qemu-vmware-vga-depth.patch      | 118 -------------------
 .../qemu/qemu-git/remove-hardcoded-libexec.patch   |  41 -------
 meta/recipes-devtools/qemu/qemu.inc                |  66 ++++++++---
 meta/recipes-devtools/qemu/qemu_1.2.0.bb           |  52 --------
 meta/recipes-devtools/qemu/qemu_1.3.0.bb           |  10 ++
 meta/recipes-devtools/qemu/qemu_git.bb             |  11 +-
 ...plementation-of-pixman_blt-with-overlapp.patch} | 131 ++++++++++-----------
 .../{pixman_0.27.2.bb => pixman_0.28.0.bb}         |  10 +-
 meta/recipes-multimedia/libpng/libpng_1.2.50.bb    |   4 +-
 26 files changed, 249 insertions(+), 550 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/arm-bgr.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/enable-i386-linux-user.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/fallback-to-safe-mmap_min_addr.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/fix-configure-checks.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/init-info.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/larger_default_ram_size.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/linker-flags.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/no-strip.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/powerpc_rom.bin (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/relocatable_sdk.patch (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu-1.2.0/qemu-vmware-vga-depth.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-1.2.0/remove-hardcoded-libexec.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-git/enable-i386-linux-user.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-git/linker-flags.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-git/no-strip.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
 delete mode 100644 meta/recipes-devtools/qemu/qemu-git/qemu-vmware-vga-depth.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-git/remove-hardcoded-libexec.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu_1.2.0.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu_1.3.0.bb
 rename meta/recipes-graphics/xorg-lib/pixman/{0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch => Generic-C-implementation-of-pixman_blt-with-overlapp.patch} (45%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.27.2.bb => pixman_0.28.0.bb} (80%)

-- 
1.7.11.7



