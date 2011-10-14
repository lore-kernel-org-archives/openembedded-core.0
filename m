Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUG-0002Sz-TR
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540436"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:32:58 -0700
Message-Id: <cover.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
Subject: [CONSOLIDATED PULL 00/28] Catching up & Upgrades
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:17 -0000

Richard,

This is a batch of pull requests that have been pending for a bit
and seem to be clean, I have also included some updates that have 
been built.

Thanks
	Sau!


The following changes since commit 4d5c0f9838a3e96d1cfb4ca2fb27161d6cf0de8f:

  xf86-video-intel_2.16.0: fix buildfix.patch to apply (2011-10-14 00:46:53 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (1):
  linux-yocto: config cleanup and streamlining

Christopher Larson (2):
  autoconf: no need to hardcode the full path to m4
  autotools: fix multi-word arguments for EXTRA_OECONF

Khem Raj (4):
  farsight2, ldconfig-native, gnutls: There is no GPLv2.1, correct the
    fields
  qemu-0.15: Add recipe and forward port patches from 0.14
  glib-2.0: Extend to provide nativesdk recipe
  qemu.inc: Add glib-2.0-nativesdk to qemu-nativesdk DEPENDS

Klaus Kurzmann (1):
  eglibc-2.14: add patch to fix libdl crash

Noor Ahsan (1):
  bluez4: Add ending quote of FILES_${PN}-dbg

Otavio Salvador (2):
  image-live.bbclass: allow override of initrd image
  initramfs-live-boot: make it more generic and easy to use

Saul Wold (11):
  shadow-native: Bump PR for patch update
  distro_tracking_fields: Updates
  v86d: update to 0.1.10
  libaio: Update to 0.3.109
  libtiff: Update to 3.9.5
  augeas: Update to 0.9.0
  libgcrypt: Update to 1.5.0
  rxvt-unicode: Update to 9.12
  rsync: Update to 3.0.9
  bash: update to 4.2
  qemu.inc: qemu-native also needs glib-2.0 native

Tom Rini (1):
  libnl2: Fix a race on route/pktloc_syntax.h

Wenzong Fan (1):
  qt4-x11-free: Fix broken regexes in qt4-x11-free's recipe.

Xiaofeng Yan (2):
  lsb: Change link of ${baselib} to lib64 for 64bits system
  distro_tracking_fields.inc: Add maintainer for some packages without
    maintainer

Zhai Edwin (2):
  libfm: Upgrade to 0.1.16
  pcmanfm: Upgrade to 0.9.9

 .../farsight/farsight2_0.0.9.bb                    |    4 +-
 meta/classes/autotools.bbclass                     |    6 +-
 meta/classes/image-live.bbclass                    |    5 +-
 .../conf/distro/include/distro_tracking_fields.inc |   40 +-
 .../v86d/{v86d_0.1.9.bb => v86d_0.1.10.bb}         |    4 +-
 meta/recipes-connectivity/bluez/bluez4_4.96.bb     |    2 +-
 .../eglibc-2.14/glibc-2.14-libdl-crash.patch       |  131 +
 meta/recipes-core/eglibc/eglibc_2.14.bb            |    5 +-
 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |    4 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb      |    2 +-
 meta/recipes-core/initrdscripts/files/init-live.sh |   32 +-
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    3 +-
 meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    4 +-
 .../qemu/qemu-0.15.0/arm-bgr.patch                 |   30 +
 .../qemu/qemu-0.15.0/enable-i386-linux-user.patch  |   55 +
 .../fallback-to-safe-mmap_min_addr.patch           |   39 +
 .../qemu/qemu-0.15.0/fix-configure-checks.patch    |   22 +
 .../qemu/qemu-0.15.0/fix-nogl.patch                |  127 +
 .../qemu/qemu-0.15.0/glflags.patch                 |   15 +
 .../qemu/qemu-0.15.0/init-info.patch               |   18 +
 .../qemu/qemu-0.15.0/larger_default_ram_size.patch |   22 +
 .../qemu/qemu-0.15.0/linker-flags.patch            |   25 +
 .../qemu/qemu-0.15.0/no-strip.patch                |   15 +
 .../qemu/qemu-0.15.0/opengl-sdl-fix.patch          |   43 +
 .../qemu/qemu-0.15.0/powerpc_rom.bin               |  Bin 0 -> 4096 bytes
 .../qemu/qemu-0.15.0/qemu-git-qemugl-host.patch    |34368 ++++++++++++++++++++
 .../qemu/qemu-0.15.0/qemu-vmware-vga-depth.patch   |  118 +
 .../qemugl-allow-glxcontext-release.patch          |   65 +
 .../qemu/qemu-0.15.0/qemugl-fix.patch              |   74 +
 meta/recipes-devtools/qemu/qemu.inc                |    4 +-
 meta/recipes-devtools/qemu/qemu_0.15.0.bb          |   45 +
 .../rsync/{rsync_3.0.8.bb => rsync_3.0.9.bb}       |    4 +-
 meta/recipes-extended/augeas/augeas_0.8.1.bb       |    6 -
 meta/recipes-extended/augeas/augeas_0.9.0.bb       |    7 +
 .../bash/bash-4.2/execute_cmd.patch                |   15 +
 meta/recipes-extended/bash/bash_4.1.bb             |   38 -
 meta/recipes-extended/bash/bash_4.2.bb             |   41 +
 .../recipes-extended/libaio/libaio/00_arches.patch |  103 +-
 .../{libaio_0.3.107.bb => libaio_0.3.109.bb}       |    4 +-
 meta/recipes-extended/lsb/lsb_1.4.bb               |    6 +-
 .../shadow/shadow-native_4.1.4.3.bb                |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
 .../libtiff/files/libtool2.patch                   |   18 +-
 .../libtiff/{tiff_3.8.2.bb => tiff_3.9.5.bb}       |    6 +-
 meta/recipes-qt/qt4/qt4.inc                        |   10 +-
 .../pcmanfm/files/owl-window-menu.patch            |   53 +-
 .../pcmanfm/{pcmanfm_0.9.8.bb => pcmanfm_0.9.9.bb} |    6 +-
 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.11.bb => rxvt-unicode_9.12.bb} |   10 +-
 meta/recipes-support/gnutls/gnutls.inc             |    4 +-
 .../libfm/libfm-0.1.14/use_deprecate_func.patch    |   13 -
 .../libfm/libfm-0.1.16/configure_fix.patch         |   19 +
 .../libfm/{libfm_0.1.14.bb => libfm_0.1.16.bb}     |    8 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.4.6.bb  |    6 -
 meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb  |    7 +
 .../libnl/fix-pktloc_syntax_h-race.patch           |   26 +
 meta/recipes-support/libnl/libnl_2.0.bb            |    3 +-
 60 files changed, 35527 insertions(+), 219 deletions(-)
 rename meta/recipes-bsp/v86d/{v86d_0.1.9.bb => v86d_0.1.10.bb} (86%)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/arm-bgr.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/enable-i386-linux-user.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/fallback-to-safe-mmap_min_addr.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/fix-configure-checks.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/fix-nogl.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/glflags.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/init-info.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/larger_default_ram_size.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/linker-flags.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/no-strip.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/opengl-sdl-fix.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/powerpc_rom.bin
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/qemu-vmware-vga-depth.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-allow-glxcontext-release.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-fix.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu_0.15.0.bb
 rename meta/recipes-devtools/rsync/{rsync_3.0.8.bb => rsync_3.0.9.bb} (73%)
 delete mode 100644 meta/recipes-extended/augeas/augeas_0.8.1.bb
 create mode 100644 meta/recipes-extended/augeas/augeas_0.9.0.bb
 create mode 100644 meta/recipes-extended/bash/bash-4.2/execute_cmd.patch
 delete mode 100644 meta/recipes-extended/bash/bash_4.1.bb
 create mode 100644 meta/recipes-extended/bash/bash_4.2.bb
 rename meta/recipes-extended/libaio/{libaio_0.3.107.bb => libaio_0.3.109.bb} (80%)
 rename meta/recipes-multimedia/libtiff/{tiff_3.8.2.bb => tiff_3.9.5.bb} (82%)
 rename meta/recipes-sato/pcmanfm/{pcmanfm_0.9.8.bb => pcmanfm_0.9.9.bb} (87%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.11 => rxvt-unicode-9.12}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.11 => rxvt-unicode-9.12}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.11 => rxvt-unicode-9.12}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.11.bb => rxvt-unicode_9.12.bb} (93%)
 delete mode 100644 meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch
 create mode 100644 meta/recipes-support/libfm/libfm-0.1.16/configure_fix.patch
 rename meta/recipes-support/libfm/{libfm_0.1.14.bb => libfm_0.1.16.bb} (73%)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.4.6.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb
 create mode 100644 meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch

-- 
1.7.6.2



