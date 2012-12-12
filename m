Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TieTw-0006E4-3O
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 06:03:46 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Dec 2012 20:49:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,264,1355126400"; d="scan'208";a="262793776"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.105])
	by fmsmga002.fm.intel.com with ESMTP; 11 Dec 2012 20:49:09 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2012 20:49:08 -0800
Message-Id: <cover.1355287689.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.1
Subject: [CONSOLIDATED PULL 00/13] Various Fixes
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
X-List-Received-Date: Wed, 12 Dec 2012 05:03:46 -0000

Richard,

I mostly did a build test of this patch set, there were
a couple of failures in other patches that I did not include
notably the consoletools in mips and the libmatchbox from
Ross seems to have broken matchbox_keyboard.

There are a couple of changes also pending for meta-yocto, check the
MUT branch.

Sau!

The following changes since commit b8b1b39961332c99d62ee466f7859bd62a0f806f:

  bitbake.conf/utils: Drop some OVERRIDES from FILESPATH (2012-12-11 15:58:27 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Constantin Musca (3):
  pixman: upgrade to 0.28.0
  qemu: upgrade to 1.3.0
  libpng: enable nativesdk variant

Fahad Usman (2):
  libpcre: upgrade to 8.32
  libpcre: Improve the recipe

Kang Kai (1):
  libuser: enable python support

Laurentiu Palcu (2):
  populate_sdk_(deb|ipk|rpm): export NATIVE_ROOT and INTERCEPT_DIR
    variables
  gdk-pixbuf: handle postinstall errors differently

Marcin Juszkiewicz (1):
  eglibc: add AArch64 support

Marko Lindqvist (1):
  libpng: update to upstream version 1.5.13

Nitin A Kamble (1):
  create-pull-request: detect trailing white space

Robert P. J. Day (1):
  documentation-audit.sh: Add/fix checks for skipped lines.

Ross Burton (1):
  telepathy-glib: remove pkgconfig dependency in pkgconfig

 meta/classes/populate_sdk_deb.bbclass              |   2 +
 meta/classes/populate_sdk_ipk.bbclass              |   2 +
 meta/classes/populate_sdk_rpm.bbclass              |   2 +
 .../telepathy/telepathy-glib/pkgconfig.patch       |  41 +++++++
 .../telepathy/telepathy-glib_0.19.8.bb             |   5 +-
 meta/recipes-core/eglibc/eglibc_2.16.bb            |   7 +-
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
 meta/recipes-extended/libuser/libuser_0.57.1.bb    |  14 ++-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |  20 +++-
 ...plementation-of-pixman_blt-with-overlapp.patch} | 131 ++++++++++-----------
 .../{pixman_0.27.2.bb => pixman_0.28.0.bb}         |  10 +-
 meta/recipes-multimedia/libpng/libpng_1.2.50.bb    |  23 ----
 meta/recipes-multimedia/libpng/libpng_1.5.13.bb    |  24 ++++
 .../recipes-support/libpcre/files/pcre-cross.patch |  53 ++++++---
 meta/recipes-support/libpcre/libpcre_8.31.bb       |  53 ---------
 meta/recipes-support/libpcre/libpcre_8.32.bb       |  58 +++++++++
 scripts/contrib/documentation-audit.sh             |   3 +-
 scripts/create-pull-request                        |   8 ++
 40 files changed, 458 insertions(+), 652 deletions(-)
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-glib/pkgconfig.patch
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
 delete mode 100644 meta/recipes-multimedia/libpng/libpng_1.2.50.bb
 create mode 100644 meta/recipes-multimedia/libpng/libpng_1.5.13.bb
 delete mode 100644 meta/recipes-support/libpcre/libpcre_8.31.bb
 create mode 100644 meta/recipes-support/libpcre/libpcre_8.32.bb

-- 
1.8.0.1



