Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U1C6O-00059X-Up
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 09:36:08 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Feb 2013 00:20:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,579,1355126400"; d="scan'208";a="281417290"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.100])
	by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2013 00:19:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2013 00:19:04 -0800
Message-Id: <cover.1359706204.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/69] master-next & MUT (post M3)
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
X-List-Received-Date: Fri, 01 Feb 2013 08:36:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

Here is a group of M4 patches and updates that have been
pending. I fixed a small issue I found with the package.bbclass
changes in gkt-icon-cache.bbclass

I have included the DEB Incremental image set along with
the READ-Only Rootfs changes, this way they can get broader 
views and usage by the community.

I have also include the GCC Multilib changes.

I just started the AB on MUT without some failing patches
(netbase and flex).

Please watch it's status, There was a failure in the x86 GRUB
build which may also point back to Flex.

Sau!

This include
The following changes since commit 1489a69cecb1dcc3502a4c24beaea81e6ca6dacc:

  harfbuzz: fix install of version.h (2013-01-31 12:29:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Müller (2):
  systemd: systemd-analyse has moved to base_bindir
  systemd: systemd-analyze remove python runtime dependencies

Andrei Dinu (5):
  blktool : upgrade to 4-6.1
  libevent : upgrade to 4.0.21
  Sudo : upgrade to 1.8.6p4
  icu : upgrade to 50.1.2
  e2fsprogs : upgrade to 1.42.6

Bogdan Marinescu (3):
  python-smartpm: multilib fixes
  git: updated to 1.8.1.2
  eglibc: don't list the same path twice in RTLDLIST

Bruce Ashfield (1):
  multilib: skip packages that provide virtual/kernel

Chen Qi (6):
  sysvinit: add ROOTFS_READ_ONLY variable to rcS-default
  image.bbclass: add a hook funtion to support readonly rootfs
  core-image.bbclass: support read-only rootfs
  populate-volatile.sh: improve this script
  initscripts: let populate-volatile.sh create the /tmp link
  initscripts: add read-only-rootfs-hook.sh script

Constantin Musca (3):
  autotools.bbclass: add EXTRACONFFUNCS variable
  multilib.conf: add TARGET_ARCH & TARGET_SYS to MULTILIB_SAVE_VARNAME
  gcc: enable multilib for target gcc

Darren Hart (1):
  qemux86-64: Disable paravirt guest, causes test failure on older
    kernels

David Nyström (1):
  Lets face it, adding python dependencies is really a painful manual
    process, due to setuptools/distutils, ignoring anything other than
    python dependencies.

Enrico Scholz (1):
  systemd: honor ROOT_HOME

Hongxu Jia (4):
  apt-native:fix support configuring etc dir in apt.conf
  rootfs_deb.bbclass:support incremental deb image generation
  image.bbclass:support incremental deb image generation
  package_deb.bbclass:support incremental deb image generation

Ian Reinhart Geiser (1):
  mesa-dri: add extra dri drivers

Jeremy Stashluk (1):
  gst-plugins-gl: add package recipe

Kang Kai (1):
  busybox: update test case du-k-works

Khem Raj (3):
  rpcbind: Dont use nss with uclibc
  systemd: Drop ppc build breakage patch for test-unit-file
  module-base.bbclass: Call make instead of oe_runmake in
    do_make_scripts

Marcin Juszkiewicz (1):
  Flex: use proper m4 binary on target

Mark Asselstine (1):
  kernel: avoid copying unnecessary files during do_install

Martin Jansa (6):
  systemd: bump PE to provide upgrade path from meta-systemd recipe
  license: fix LICENSE_CREATE_PACKAGE to stay disabled by default
  libfm: add dependency on libexif
  console-tools, kbd: add RREPLACES/RPROVIDES/RCONFLICTS combo between
    PN-dbg
  initrdscripts: exclude conflicting packages from world-image
  oe-core: add world-image

Peter Seebach (1):
  pseudo.inc: Fix sqlite libdir again, pseudo 1.4.3

Phil Staub (1):
  libaio: Fix MIPS system call interface

Radu Moisan (2):
  systemd: Remove -systemd postfix
  avahi: Remove -systemd postfix

Richard Purdie (12):
  multilib.conf: Use BASELIB to set baselib, not hardcode the value
  package: Rename splitfile functions to something more descriptive
  package.bbclass: Improve kernel module handling
  package.bbclass: Add a shortcut exit from the mkdir function
  package.bbclass: Check FILES once, not once per loop iteration
  package.bbclass: Avoid copying the datastore for FILES handling
  package.bbclass: Move PKG handling code to emit_pkgdata
  package.bbclass: Split out package_fixsymlinks function
  package.bbclass: Tweak PACKAGEFUNCS
  package.bbclass: Improve package_fixsymlinks
  package: Create global package file list and use throughout
    PACKAGEFUNCS
  package.bbclass: Use expanded RDEPENDS in read_shlibdeps

Ross Burton (4):
  libcanberra: remove, migrated to meta-gnome
  metacity: remove, migrated to meta-gnome
  gst-plugins-bad: remove musicbrainz build-dependency
  polkit: respect systemd DISTRO_FEATURE

Roy.Li (1):
  xinetd: enable tcp-wrappers support

Saul Wold (5):
  sqlite3: Update to 3.7.15.2
  libnl: Update to 3.2.21
  dhcp: Fix unshipped WARNINGS
  module.bbclass: Allow for modules to be packaged seperate from ${PN}
  gtk-icon-cache: Fix rdepends construction

Tom Zanussi (2):
  oprofile: add kernel dependency
  oprofile: remove AX_KERNEL_VERSION from acinclude.m4

 meta/classes/autotools.bbclass                     |   4 +-
 meta/classes/buildhistory.bbclass                  |  11 +-
 meta/classes/core-image.bbclass                    |   4 +
 meta/classes/debian.bbclass                        |  28 +-
 meta/classes/gtk-icon-cache.bbclass                |   5 +-
 meta/classes/image.bbclass                         |  39 ++-
 meta/classes/insane.bbclass                        |   4 +-
 meta/classes/kernel.bbclass                        |   7 +-
 meta/classes/license.bbclass                       |   3 +-
 meta/classes/module-base.bbclass                   |   2 +-
 meta/classes/module.bbclass                        |  19 +-
 meta/classes/multilib.bbclass                      |   4 +-
 meta/classes/package.bbclass                       | 202 +++++------
 meta/classes/package_deb.bbclass                   | 377 +++++++++++++++++++--
 meta/classes/rootfs_deb.bbclass                    |  58 +++-
 meta/conf/multilib.conf                            |   4 +-
 meta/lib/oe/classextend.py                         |   2 +-
 meta/recipes-connectivity/avahi/avahi.inc          |   8 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            |   4 +-
 meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb       |   2 +-
 ...estsuite-du-du-k-works-fix-false-positive.patch |  35 ++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |   5 +-
 .../console-tools/console-tools_0.3.2.bb           |   7 +
 meta/recipes-core/eglibc/eglibc_2.17.bb            |   9 +-
 meta/recipes-core/images/world-image.bb            |  10 +
 .../initrdscripts/initramfs-framework_1.0.bb       |   2 +
 .../initrdscripts/initramfs-live-boot_1.0.bb       |   2 +
 .../initscripts/initscripts-1.0/bootmisc.sh        |   9 +-
 .../initscripts-1.0/populate-volatile.sh           | 287 ++++++++--------
 .../initscripts-1.0/read-only-rootfs-hook.sh       |  19 ++
 .../initscripts/initscripts-1.0/volatiles          |   1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   3 +
 meta/recipes-core/kbd/kbd_1.15.2.bb                |   3 +
 ...it-file-Add-libsystemd-daemon.la-to-LDADD.patch |  32 --
 meta/recipes-core/systemd/systemd_197.bb           |  20 +-
 meta/recipes-core/sysvinit/sysvinit/rcS-default    |   4 +
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   2 +-
 meta/recipes-devtools/apt/files/apt.conf           |   2 +-
 .../e2fsprogs-1.42.1/remove.ldconfig.call.patch    |  33 --
 .../acinclude.m4                                   |   0
 .../fallocate.patch                                |   0
 .../mkdir.patch                                    |   0
 .../e2fsprogs-1.42.6/remove.ldconfig.call.patch    |  44 +++
 .../{e2fsprogs_1.42.1.bb => e2fsprogs_1.42.6.bb}   |   9 +-
 meta/recipes-devtools/flex/flex.inc                |   7 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |   3 +-
 .../gcc/gcc-4.7/use-ml-conf-files-from-B.patch     |  87 +++++
 meta/recipes-devtools/gcc/gcc-common.inc           |  24 ++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   3 +-
 meta/recipes-devtools/gcc/gcc-configure-target.inc |   1 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  | 190 +++++++++++
 meta/recipes-devtools/gcc/libgcc_4.7.bb            |  73 ++++
 .../git/{git_1.8.0.2.bb => git_1.8.1.2.bb}         |   6 +-
 meta/recipes-devtools/pseudo/pseudo.inc            |   8 +-
 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb       |   8 -
 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb       |   8 +
 meta/recipes-devtools/pseudo/pseudo_git.bb         |   4 +-
 .../python-smartpm/smart-multilib-fixes.patch      |  22 ++
 .../python/python-smartpm_1.4.1.bb                 |   3 +-
 .../blktool/{blktool_4-6.bb => blktool_4-6.1.bb}   |   6 +-
 .../libaio/libaio_fix_for_mips_syscalls.patch      |  62 ++++
 meta/recipes-extended/libaio/libaio_0.3.109.bb     |   3 +-
 meta/recipes-extended/polkit/polkit_0.104.bb       |   4 +-
 .../rpcbind/rpcbind/0001-uclibc-nss.patch          |  30 ++
 .../rpcbind/0002-uclibc-rpcsvc-defines.patch       |  60 ++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |   6 +
 meta/recipes-extended/sudo/files/libtool.patch     |  28 +-
 .../sudo/{sudo_1.8.5p2.bb => sudo_1.8.6p4.bb}      |   6 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |   5 +-
 .../metacity/remove-yelp-help-rules-var.patch      |  28 --
 meta/recipes-gnome/gnome/metacity_2.34.13.bb       |  30 --
 meta/recipes-graphics/mesa/mesa-dri.inc            |   4 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   2 +-
 meta/recipes-kernel/oprofile/oprofile.inc          |   2 +-
 meta/recipes-kernel/oprofile/oprofile/acinclude.m4 |  19 --
 meta/recipes-kernel/oprofile/oprofile_0.9.8.bb     |   2 +
 .../gstreamer/gst-plugins-bad_0.10.23.bb           |   4 +-
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |  11 +
 .../pulseaudio/libcanberra_0.29.bb                 |  32 --
 .../icu/{icu_50.1.1.bb => icu_50.1.2.bb}           |   6 +-
 .../libevent/libevent-2.0.16_fix_for_x32.patch     |  47 ---
 .../{libevent_2.0.16.bb => libevent_2.0.21.bb}     |  11 +-
 meta/recipes-support/libfm/libfm_1.1.0.bb          |   2 +-
 .../libnl/{libnl_3.2.19.bb => libnl_3.2.21.bb}     |   4 +-
 .../{sqlite3_3.7.15.1.bb => sqlite3_3.7.15.2.bb}   |   6 +-
 scripts/create-recipe                              |  64 ++--
 86 files changed, 1589 insertions(+), 667 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/testsuite-du-du-k-works-fix-false-positive.patch
 create mode 100644 meta/recipes-core/images/world-image.bb
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/remove.ldconfig.call.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.1 => e2fsprogs-1.42.6}/acinclude.m4 (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.1 => e2fsprogs-1.42.6}/fallocate.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.1 => e2fsprogs-1.42.6}/mkdir.patch (100%)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/remove.ldconfig.call.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.1.bb => e2fsprogs_1.42.6.bb} (90%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/use-ml-conf-files-from-B.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc
 rename meta/recipes-devtools/git/{git_1.8.0.2.bb => git_1.8.1.2.bb} (66%)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch
 rename meta/recipes-extended/blktool/{blktool_4-6.bb => blktool_4-6.1.bb} (77%)
 create mode 100644 meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscalls.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.5p2.bb => sudo_1.8.6p4.bb} (83%)
 delete mode 100644 meta/recipes-gnome/gnome/metacity/remove-yelp-help-rules-var.patch
 delete mode 100644 meta/recipes-gnome/gnome/metacity_2.34.13.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
 rename meta/recipes-support/icu/{icu_50.1.1.bb => icu_50.1.2.bb} (55%)
 delete mode 100644 meta/recipes-support/libevent/libevent/libevent-2.0.16_fix_for_x32.patch
 rename meta/recipes-support/libevent/{libevent_2.0.16.bb => libevent_2.0.21.bb} (61%)
 rename meta/recipes-support/libnl/{libnl_3.2.19.bb => libnl_3.2.21.bb} (90%)
 rename meta/recipes-support/sqlite/{sqlite3_3.7.15.1.bb => sqlite3_3.7.15.2.bb} (59%)

-- 
1.8.0.2



