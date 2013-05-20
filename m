Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UeSlW-00036E-NR
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 18:16:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 May 2013 08:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,707,1363158000"; d="scan'208";a="340576251"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.168])
	by fmsmga002.fm.intel.com with ESMTP; 20 May 2013 08:58:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2013 16:58:20 +0100
Message-Id: <cover.1369063930.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [dylan][PATCH 00/41] Stable branch cherry-picks (cover letter only)
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
X-List-Received-Date: Mon, 20 May 2013 16:16:59 -0000

These are cherry-picks from master to be applied to the dylan branch for
inclusion in the next 1.4 stable release (1.4.1). They have been tested
on the Yocto Project autobuilder on top of the existing danny branch.

Please review this series for suitability for inclusion into the stable
branch.


The following changes since commit 8ca272168e3cf9abcab13096a3c4eaadb7e35841:

  powertop: inherit gettext (2013-05-09 17:57:45 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-next

Bogdan Marinescu (1):
  rpm: change arch scoring items

Bruce Ashfield (4):
  linux-yocto/3.4: iwlwifi, ext4, brtfs warning and -rt fixes
  kern-tools: anchor and delimit regexs
  linux-yocto/3.4: update to v3.4.43, ltsi-65311d8 and v3.4.42-rt56
  linux-yocto/3.8: udpate to v3.8.11

Chen Qi (1):
  udev: create /var/volatile/tmp to avoid dead link

Enrico Scholz (1):
  systemd-systemctl: parse unit files more correctly

George Kiagiadakis (1):
  pulseaudio: install alsa mixer data files

Josh Cartwright (1):
  gcc-4.7: fix gcc ICE when building with gcc-4.8

Khem Raj (1):
  gcc-configure-cross.inc: Remove info generation

Koen Kooi (1):
  grub-efi-native: fix build on modern distributions without gets()

Laurentiu Palcu (11):
  fontcache.bbclass: do not exit with 1 after installing intercept hook
  gtk-icon-cache.bbclass: do not exit 1 after installing intercept hook
  pixbufcache.bbclass: do not exit 1 after installing intercept hook
  image.bbclass: change the logic when intercepts fail
  qemuwrapper: use fallback in case the ELF binary is wrong
  pango: fix postinstall when using multilib
  Revert "qemu.bbclass: Use the correct qemu binary in multilib cases"
  scripts/postinst-intercepts: create separete hooks for multilib
  Pass the mlprefix to postinst_intercept script
  adt-installer: do not dereference symlinks when relocating
  archive-*-source.bbclass: have do_dumpdata_create_diff_gz task run
    before do_rootfs

Marcin Juszkiewicz (1):
  cpan.bbclass: use '|' as sed separator for entry with paths

Martin Jansa (2):
  tune-thumb.inc: Remove, replaced by arm/feature-arm-thumb.inc
  conf/machine: use .= instead of += in TUNE_CCARGS

Otavio Salvador (1):
  udev-extraconf: Avoid mounting unknown filesystems

Peter Seebach (1):
  sanity.bbclass: Attach the missing value to a format string.

Phil Blundell (4):
  libxslt: Avoid regenerating manpage during "make install"
  glib: Add --disable-man to configure arguments
  gcc-runtime: Avoid error when trying to remove nonexistent directories
  fs-perms.txt: Don't tinker with file modes in /usr/src/debug

Richard Purdie (2):
  dpkg: Ensure target packages don't reference perlnative
  package.bbclass: Fix sources contents

Robert Yang (1):
  bootimg.bbclass: add comment for NOHDD

Ross Burton (1):
  glib-2.0: disable tests for native builds, and respect ptest for LSB

Saul Wold (2):
  qemu: Ensure kernel nfsd module is enabled
  rpm: ensure __mkdir_p matches __mkdir

Stefan Stanacar (2):
  xserver-xorg: Add xkbcomp to RRECOMMENDS
  connman: replace hardcoded path in init script and systemd service

Tom Zanussi (1):
  kernel.bbclass: make FILES package-specific

Tomas Frydrych (1):
  image_types: fix default location of kernel when generating elf images

 meta/classes/archive-configured-source.bbclass     |  2 +-
 meta/classes/archive-original-source.bbclass       |  2 +-
 meta/classes/archive-patched-source.bbclass        |  2 +-
 meta/classes/bootimg.bbclass                       |  1 +
 meta/classes/cpan.bbclass                          |  2 +-
 meta/classes/fontcache.bbclass                     | 12 ++----
 meta/classes/gtk-icon-cache.bbclass                | 47 +++++++++-------------
 meta/classes/image.bbclass                         | 32 ++++++++++-----
 meta/classes/image_types.bbclass                   |  2 +-
 meta/classes/kernel.bbclass                        |  2 +-
 meta/classes/package.bbclass                       | 10 ++---
 meta/classes/pixbufcache.bbclass                   | 31 ++++++--------
 meta/classes/qemu.bbclass                          |  4 +-
 meta/classes/sanity.bbclass                        |  2 +-
 meta/conf/machine/include/arm/arch-armv4.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv5.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv6.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      |  2 +-
 meta/conf/machine/include/arm/feature-arm-neon.inc |  2 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc |  4 +-
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |  2 +-
 meta/conf/machine/include/ia32/arch-ia32.inc       |  6 +--
 meta/conf/machine/include/mips/arch-mips.inc       | 10 ++---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |  6 +--
 .../machine/include/powerpc/arch-powerpc64.inc     |  2 +-
 meta/conf/machine/include/qemu.inc                 |  3 ++
 meta/conf/machine/include/sh/arch-sh.inc           |  2 +-
 meta/conf/machine/include/tune-arm1136jf-s.inc     |  2 +-
 meta/conf/machine/include/tune-arm920t.inc         |  2 +-
 meta/conf/machine/include/tune-arm926ejs.inc       |  2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc        |  2 +-
 meta/conf/machine/include/tune-c3.inc              |  2 +-
 meta/conf/machine/include/tune-core2.inc           |  2 +-
 meta/conf/machine/include/tune-cortexa15.inc       |  2 +-
 meta/conf/machine/include/tune-cortexa7.inc        |  2 +-
 meta/conf/machine/include/tune-cortexa8.inc        |  2 +-
 meta/conf/machine/include/tune-cortexa9.inc        |  2 +-
 meta/conf/machine/include/tune-cortexm1.inc        |  2 +-
 meta/conf/machine/include/tune-cortexm3.inc        |  4 +-
 meta/conf/machine/include/tune-cortexr4.inc        |  4 +-
 meta/conf/machine/include/tune-ep9312.inc          |  2 +-
 meta/conf/machine/include/tune-i586.inc            |  2 +-
 meta/conf/machine/include/tune-iwmmxt.inc          |  2 +-
 meta/conf/machine/include/tune-mips32.inc          |  2 +-
 meta/conf/machine/include/tune-ppc476.inc          |  2 +-
 meta/conf/machine/include/tune-ppc603e.inc         |  2 +-
 meta/conf/machine/include/tune-ppce300c2.inc       |  2 +-
 meta/conf/machine/include/tune-ppce300c3.inc       |  2 +-
 meta/conf/machine/include/tune-ppce500.inc         |  4 +-
 meta/conf/machine/include/tune-ppce500mc.inc       |  2 +-
 meta/conf/machine/include/tune-ppce500v2.inc       |  4 +-
 meta/conf/machine/include/tune-ppce5500.inc        |  2 +-
 meta/conf/machine/include/tune-ppce6500.inc        |  2 +-
 meta/conf/machine/include/tune-sh3.inc             |  2 +-
 meta/conf/machine/include/tune-sh4.inc             |  4 +-
 meta/conf/machine/include/tune-strongarm1100.inc   |  2 +-
 meta/conf/machine/include/tune-thumb.inc           | 32 ---------------
 meta/conf/machine/include/tune-xscale.inc          |  2 +-
 meta/files/fs-perms.txt                            |  2 +-
 .../grub-2.00-ignore-gnulib-gets-stupidity.patch   | 28 +++++++++++++
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb      |  3 +-
 meta/recipes-connectivity/connman/connman.inc      |  4 +-
 meta/recipes-connectivity/connman/connman/connman  |  4 +-
 meta/recipes-core/glib-2.0/glib.inc                |  7 ++--
 .../systemd/systemd-systemctl/systemctl            |  9 ++---
 meta/recipes-core/udev/udev-extraconf/mount.sh     |  2 +-
 meta/recipes-core/udev/udev/init                   |  1 +
 meta/recipes-devtools/dpkg/dpkg.inc                |  1 +
 meta/recipes-devtools/gcc/gcc-4.7.inc              |  3 +-
 .../gcc/gcc-4.7/avoid-oob-array-access.patch       | 45 +++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-configure-cross.inc  |  3 ++
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |  8 +++-
 .../adt-installer/scripts/adt_installer_internal   |  2 +-
 .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb | 28 ++++++++++++-
 .../rpm/rpm/rpm-platform-file-fix.patch            | 28 +++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |  4 +-
 meta/recipes-graphics/pango/pango.inc              |  2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  2 +-
 .../kern-tools/kern-tools-native_git.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |  8 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    |  8 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |  6 +--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  |  6 +--
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       | 16 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       | 16 ++++----
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  1 +
 meta/recipes-support/libxslt/libxslt_1.1.28.bb     |  4 ++
 scripts/postinst-intercepts/postinst_intercept     | 23 ++++++++++-
 88 files changed, 350 insertions(+), 224 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-thumb.inc
 create mode 100644 meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch

-- 
1.8.1.2



