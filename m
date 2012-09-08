Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TA8mx-00068M-II
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 02:20:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Sep 2012 17:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,388,1344236400"; d="scan'208";a="219614537"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.76])
	by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2012 17:08:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2012 17:08:15 -0700
Message-Id: <cover.1347062288.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [CONSOLIDATED REQUEST 00/32] LSB Perl, QEMU Update & Fixes (Cover Only)
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
X-List-Received-Date: Sat, 08 Sep 2012 00:20:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

This has the set of perl/LSB related changes, I found that LSB 5.0
is expected early next year, so we can pull these after it is released
before 1.4!

This also adds a few (3) more simple sanity tests for sato.

I also included Robert's binary_package.bbclass, which matches up with 
the bitbake change you have already taken.

I have done some light testing with the updated qemu, I will do more
early next week, once we get past RC1 Testing next we we can have QA 
test this more throughly.

Thanks
	Sau!

The following changes since commit 0de1827a9601143b090f751ea702fdb65a936b77:

  classes/mirrors: remove bogus gnutls mirror (2012-09-07 14:51:10 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Müller (1):
  pixman: merge meta-oe append into oe-core

Constantin Musca (1):
  autoconf: use --warning=cross only if supported

Franklin S. Cooper Jr (1):
  u-boot: Use fw_env.config if available.

Kang Kai (9):
  ltp: update
  lsb: update version
  libclass-isa-perl: add it
  perl: package modules Pod-Html and Tie-Hash-NamedCapture
  libpod-plainer-perl: add it
  libdumpvalue-perl: add it
  libenv-perl: add it
  libfile-checktree-perl: add it
  libi18n-collate-perl: add it

Khem Raj (8):
  arch-armv4.inc: On armv4 add --fix-v4bx to linker flags for kernel
  eglibc-2.16: Add kconfig infrastructure
  eglibc: Enable kconfig for option management
  kconfig-frontends: Create symlinks for conf and mconf
  qemu-git: Move to tip of git past 1.2 release
  qemu: Update from 0.15 to 1.2
  machines/x86: Drop redundant glibc configure knobs
  runqemu-internal: New qemu calls it qemu-system-i386 for x86

Martin Jansa (1):
  pixman: ignore NEON, IWMMXT, LOONGSON_MMI variables for class-native

Robert Yang (2):
  bin_package.bbclass: binary package recipe class
  package_rpm.bbclass: fix incremental rpm image generation

Ross Burton (2):
  xserver-xorg-lite: remove
  xserver-xorg: make DRI/GLX options respect opengl distro feature

Saul Wold (3):
  Add package wget and perl modules.
  quota: add inherit gettext
  core-image: allow root login when debug-tweaks is enabled

Veerabrahmam vr (4):
  qemuimagetest: basic function to check bash exists
  qemuimagetest: add basic function to check enough disk space
  qemuimagetest: add basic function to check syslogd
  qemuimagetest: modifying the scenario file as per new test cases

 meta/classes/bin_package.bbclass                   |   36 +
 meta/classes/image.bbclass                         |    1 +
 meta/classes/package_rpm.bbclass                   |    4 +-
 meta/conf/machine/include/arm/arch-armv4.inc       |    1 +
 meta/conf/machine/include/ia32-base.inc            |    5 -
 meta/conf/machine/qemux86-64.conf                  |    3 -
 meta/conf/machine/qemux86.conf                     |    4 -
 meta/recipes-bsp/u-boot/u-boot.inc                 |   16 +-
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb          |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb          |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb       |    2 +-
 .../0001-eglibc-menuconfig-support.patch           | 1007 ++++++++++++++++++++
 ...0002-eglibc-menuconfig-hex-string-options.patch |  169 ++++
 ...0003-eglibc-menuconfig-build-instructions.patch |  176 ++++
 meta/recipes-core/eglibc/eglibc-initial.inc        |    1 +
 meta/recipes-core/eglibc/eglibc-options.inc        |    4 +-
 meta/recipes-core/eglibc/eglibc.inc                |    4 +
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    8 +-
 .../autoconf/check-automake-cross-warning.patch    |   34 +
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    3 +-
 .../kconfig-frontends/kconfig-frontends_3.5.bb     |    8 +-
 meta/recipes-devtools/perl/perl-5.14.2/config.sh   |    2 +-
 .../qemu-0.15.1/0001-ppc64-Fix-linker-script.patch |   46 -
 .../a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch |   66 --
 ...-Actually-raise-interrupt-on-timer-expiry.patch |   41 -
 .../qemu-0.15.1/ppc-s500-set-invalid-mask.patch    |  610 ------------
 .../qemu/{qemu-0.15.1 => qemu-1.2.0}/arm-bgr.patch |   12 +-
 .../enable-i386-linux-user.patch                   |    0
 .../fallback-to-safe-mmap_min_addr.patch           |    0
 .../fix-configure-checks.patch                     |   18 +-
 .../{qemu-0.15.1 => qemu-1.2.0}/init-info.patch    |    0
 .../larger_default_ram_size.patch                  |    0
 .../{qemu-0.15.1 => qemu-1.2.0}/linker-flags.patch |   14 +-
 .../{qemu-0.15.1 => qemu-1.2.0}/no-strip.patch     |    0
 .../{qemu-0.15.1 => qemu-1.2.0}/powerpc_rom.bin    |  Bin 4096 -> 4096 bytes
 .../qemu-vmware-vga-depth.patch                    |   70 +-
 .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin |  Bin 0 -> 4096 bytes
 .../qemu/{qemu_0.15.1.bb => qemu_1.2.0.bb}         |   18 +-
 meta/recipes-devtools/qemu/qemu_git.bb             |   15 +-
 .../lsb/{lsb_1.4.bb => lsb_4.1.bb}                 |   34 +-
 .../ltp/{ltp_20120614.bb => ltp_20120903.bb}       |    6 +-
 .../packagegroups/packagegroup-core-lsb.bb         |    9 +
 .../perl/libclass-isa-perl_0.36.bb                 |   32 +
 .../perl/libdumpvalue-perl_1.16.bb                 |   20 +
 meta/recipes-extended/perl/libenv-perl_1.03.bb     |   22 +
 .../perl/libfile-checktree-perl_4.41.bb            |   33 +
 .../perl/libi18n-collate-perl_1.02.bb              |   22 +
 .../perl/libpod-plainer-perl_1.03.bb               |   24 +
 meta/recipes-extended/quota/quota_4.00.bb          |    4 +-
 ...lated-workarounds-in-cpu-features-detecti.patch |  144 +++
 ...mplementation-of-pixman_blt-with-overlapp.patch |  127 +++
 meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb    |   12 +-
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-common.inc           |  129 ---
 .../xorg-xserver/xserver-xorg-lite.inc             |    8 -
 .../xorg-xserver/xserver-xorg-lite_1.11.2.bb       |    4 -
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  138 +++-
 .../scenario/qemuarm/core-image-sato               |    3 +
 .../scenario/qemuarm/core-image-sato-sdk           |    3 +
 .../scenario/qemumips/core-image-sato              |    3 +
 .../scenario/qemumips/core-image-sato-sdk          |    3 +
 .../scenario/qemuppc/core-image-sato               |    3 +
 .../scenario/qemuppc/core-image-sato-sdk           |    3 +
 .../scenario/qemux86-64/core-image-sato            |    3 +
 .../scenario/qemux86-64/core-image-sato-sdk        |    3 +
 .../scenario/qemux86/core-image-sato               |    3 +
 .../scenario/qemux86/core-image-sato-sdk           |    3 +
 scripts/qemuimage-tests/systemusage/bash           |   53 +
 scripts/qemuimage-tests/systemusage/df             |   54 ++
 scripts/qemuimage-tests/systemusage/syslog         |   54 ++
 scripts/qemuimage-tests/tools/bash.sh              |   17 +
 scripts/qemuimage-tests/tools/df.sh                |   25 +
 scripts/qemuimage-tests/tools/syslog.sh            |   17 +
 scripts/runqemu-internal                           |    2 +-
 74 files changed, 2369 insertions(+), 1055 deletions(-)
 create mode 100644 meta/classes/bin_package.bbclass
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-menuconfig-support.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0002-eglibc-menuconfig-hex-string-options.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0003-eglibc-menuconfig-build-instructions.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/check-automake-cross-warning.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/ppc-s500-set-invalid-mask.patch
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/arm-bgr.patch (75%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/enable-i386-linux-user.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/fallback-to-safe-mmap_min_addr.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/fix-configure-checks.patch (59%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/init-info.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/larger_default_ram_size.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/linker-flags.patch (64%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/no-strip.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/powerpc_rom.bin (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/qemu-vmware-vga-depth.patch (61%)
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
 rename meta/recipes-devtools/qemu/{qemu_0.15.1.bb => qemu_1.2.0.bb} (57%)
 rename meta/recipes-extended/lsb/{lsb_1.4.bb => lsb_4.1.bb} (84%)
 rename meta/recipes-extended/ltp/{ltp_20120614.bb => ltp_20120903.bb} (96%)
 create mode 100644 meta/recipes-extended/perl/libclass-isa-perl_0.36.bb
 create mode 100644 meta/recipes-extended/perl/libdumpvalue-perl_1.16.bb
 create mode 100644 meta/recipes-extended/perl/libenv-perl_1.03.bb
 create mode 100644 meta/recipes-extended/perl/libfile-checktree-perl_4.41.bb
 create mode 100644 meta/recipes-extended/perl/libi18n-collate-perl_1.02.bb
 create mode 100644 meta/recipes-extended/perl/libpod-plainer-perl_1.03.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.2.bb
 create mode 100755 scripts/qemuimage-tests/systemusage/bash
 create mode 100755 scripts/qemuimage-tests/systemusage/df
 create mode 100755 scripts/qemuimage-tests/systemusage/syslog
 create mode 100644 scripts/qemuimage-tests/tools/bash.sh
 create mode 100644 scripts/qemuimage-tests/tools/df.sh
 create mode 100644 scripts/qemuimage-tests/tools/syslog.sh

-- 
1.7.7.6



