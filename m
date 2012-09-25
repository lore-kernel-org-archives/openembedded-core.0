Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TGJ9i-000550-Q5
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 02:37:43 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 30B0E30473
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 20:24:49 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 17:24:44 -0700
Message-Id: <cover.1348532322.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 30B0E30473.BFFAA
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 00/58] denzil pull request 2
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
X-List-Received-Date: Tue, 25 Sep 2012 00:37:43 -0000

Hello,

If this works I'll hopefully be submitting the cover letter only,
this patchset is pretty big. 

I've got a lot of patches for denzil now that I'd like to get merged
before they get too out of hand, so here is my pull request for it,
along with autobuilder output and explanation.

Note, the autobuilder run was done with my poky-based branch.

nightly-x86:
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/729

All builds green except for atom-pc, which fails during build_hddimg of
do_bootimg due to the kernel image file not being found in the target
sysroot.

nightly-x86-lsb:
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-lsb/builds/61

Same status as nightly-x86.

nightly-x86-64:
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64/builds/658

100% Green

nightly-x86-64-lsb:
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64-lsb/builds/59

100% Green

nightly-arm:
http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/658

100% Green

nightly-arm-lsb:
http://autobuilder.yoctoproject.org:8010/builders/nightly-arm-lsb/builds/57

100% Green

nightly-mips:
http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/631

100% Green

nightly-mips-lsb:
http://autobuilder.yoctoproject.org:8010/builders/nightly-mips-lsb/builds/56

100% Green

nightly-ppc:
http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/612

100% Green

nightly-ppc-lsb:
http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc-lsb/builds/58

100% Green

nightly-non-gpl3:
http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/285

100% Green

nightly-multilib:
http://autobuilder.yoctoproject.org:8010/builders/nightly-multilib/builds/286

100% Green

nightly-tiny:
http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/265

100% Green

The following changes since commit 95756cfbb7a9348b23cb46a49a5509e57e973faf:

  valgrind: fix default.supp missing issue (2012-08-21 11:19:26 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgarman/denzil-next-pull2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/denzil-next-pull2

Bruce Ashfield (4):
  linux-yocto: allow do_validate_branches to handle all branches
  kernel-yocto: set master branch to a defined SRCREV
  kernel: save $kerndir/tools and $kerndir/lib from pruning
  kernel.bbclass: add non-santized kernel provides

Constantin Musca (1):
  pulseaudio: upgrade to 2.1

Cristian Iorga (4):
  gst-plugin-bluetooth: update to ver. 4.101
  bluez4: update to ver. 4.101
  pulseaudio: upgrade to 2.0
  libcanberra: upgrade to 0.29

Darren Hart (1):
  kernel: Add kernel headers to kernel-dev package

Denys Dmytriyenko (1):
  pulseaudio: fix typo in the patch name, pulseaudo -> pulseaudio

Dongxiao Xu (1):
  bluez-hcidump: upgrade to version 2.4

Franklin S Cooper Jr (1):
  psplash: LIC_CHKSUM Tweak

Franklin S. Cooper Jr (1):
  u-boot: Use fw_env.config if avaliable

Jeff Polk (1):
  recipes-core/eglibc-2.13: Patch for locale-base-tt-ru packaging

Jonas Danielsson (1):
  bluez4: make alsa support conditional upon DISTRO_FEATURES

Kang Kai (1):
  ltp_20120104: add rdepends

Khem Raj (3):
  kernel.bbclass: Dont package kxgettext.o
  libatomics-ops: Make it build for SH4
  pulseaudio: Always enable NLS

Koen Kooi (2):
  man: fix RDEPENDS and reformat recipe
  man: make man actually work by installing custom man.config

Marcin Juszkiewicz (1):
  libpam: disable NIS to not link with libtirpc when it is available

Martin Jansa (5):
  package.bbclass: fix TypeError in runstrip
  opkg-utils: bump SRCREV for Packages cache fix and other fixes
  opkg-utils: bump SRCREV
  kernel.bbclass: pass KERNEL_VERSION to depmod calls in postinst
  pulseaudio: fix pulseaudio-server RDEPENDS

Matthew McClintock (8):
  dbus.inc: disable selinux for native builds
  glib.inc: disable selinux for native builds
  eglibc/gcc: add patches to fix eglibc 2.15 build
  distutils.bbclass: fix libdir for 64-bit python modules built with
    distutils
  distutils.bblass: change order of args to install step
  eglibc_2.15: make patch only for Freescale machines
  valgrind_3.7.0.bb: fix missing leading space on _append
  sysvinit-inittab_2.88dsf.bb: only run serial checks at boot if we
    have items to check

Paul Eggleton (2):
  classes/mirrors: remove bogus gnutls mirror
  dhcp: remove dependency of dev/staticdev packages on main package

Radu Moisan (1):
  dbus: include dbus-launch in the main dbus package

Richard Purdie (5):
  distutils/steuptools: Fix files layout and unbreak builds
  opkg-utils: UPdate to version with python 2.6 fix
  autotools.bbclass: Add functionality to force a clean of ${B} when
    reconfiguring (and ${S} != ${B})
  dbus: Ensure dbus-nativesdk doesn't RPROVIDE dbus-x11
  texi2html: Fix perl location on recent distros

Ross Burton (1):
  pulseaudio: remove ConsoleKit dependency

Saul Wold (7):
  build-appliance-image: Update SRCREV to Denzil 1.2.1
  build-appliance-image: Add vmx* files and build zip file
  build-appliance: add zip-native, which is needed to build the final
    zip bundle
  python-pygtk: Upgrade to 2.24
  kernel: Fix packaging issue
  bluez4: fix packaging issue after update
  pulseaudio: disable tcpwrap by default

Scott Garman (2):
  relocatable.bbclass: Account for case when ORIGIN is in RPATH
  kernel.bbclass: put perf .debug dir in -dbg package

Valentin Popa (2):
  build-appliance-image: rename from self-hosted-image
  xz: updated to version 5.1.1alpha

Xin Ouyang (1):
  libatomics-ops: update to the latest version 7.2

Zhenhua Luo (1):
  valgrind: fix debug info reading error when do memcheck on ppc
    targets

 meta/classes/autotools.bbclass                     |   21 +
 meta/classes/distutils.bbclass                     |    2 +-
 meta/classes/kernel-yocto.bbclass                  |  121 +-
 meta/classes/kernel.bbclass                        |   37 +-
 meta/classes/mirrors.bbclass                       |    1 -
 meta/classes/package.bbclass                       |   16 +-
 meta/classes/relocatable.bbclass                   |    3 +-
 meta/classes/setuptools.bbclass                    |    1 +
 meta/conf/bitbake.conf                             |    2 +-
 meta/conf/multilib.conf                            |    2 +-
 meta/recipes-bsp/u-boot/u-boot.inc                 |   16 +-
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb          |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb          |    2 +-
 .../{bluez-hcidump_2.3.bb => bluez-hcidump_2.4.bb} |    4 +-
 .../{bluez4-4.99 => bluez4-4.101}/bluetooth.conf   |    0
 .../{bluez4-4.99 => bluez4-4.101}/sbc_mmx.patch    |    0
 meta/recipes-connectivity/bluez/bluez4.inc         |    6 +-
 .../bluez/{bluez4_4.99.bb => bluez4_4.101.bb}      |   10 +-
 ...tooth_4.99.bb => gst-plugin-bluetooth_4.101.bb} |    7 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            |    2 +
 meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb    |    2 +-
 meta/recipes-core/dbus/dbus-glib_0.98.bb           |    2 +-
 meta/recipes-core/dbus/dbus.inc                    |   17 +-
 .../eglibc/eglibc-2.13/supported-tt-ru.patch       |   13 +
 .../eglibc/eglibc-2.15/glibc.no_sqrt.patch         |   15 +
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    4 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb      |    2 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 ...lf-hosted-image.bb => build-appliance-image.bb} |   28 +-
 .../Yocto_Build_Appliance.vmx                      |   52 +
 .../Yocto_Build_Appliance.vmxf                     |    8 +
 meta/recipes-core/psplash/psplash_git.bb           |    4 +-
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   10 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    5 +-
 .../gcc/gcc-4.6/gcc.e6500-FSF46.patch              | 4015 ++++++++++++++++++++
 .../gcc/gcc-4.6/gcc.no_power_builtins.patch        |   30 +
 .../gcc/gcc-4.6/powerpc-e5500.patch                |  465 ---
 .../opkg-utils/opkg-utils/add-license-field.patch  |   39 -
 .../opkg-utils/arfile_header_split.patch           |   27 -
 .../opkg-utils/index-ignore-filenotfound.patch     |   73 -
 .../opkg-utils/opkg-utils/mtime-int.patch          |   30 -
 .../opkg-utils/opkg-utils/shebang.patch            |   46 -
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    9 +-
 .../python/python-pygtk/fix-gtkunixprint.patch     |   14 +-
 ...thon-pygtk_2.17.0.bb => python-pygtk_2.24.0.bb} |    8 +-
 ...ind-3.7.0-fix-error-of-reading-debug-info.patch |   33 +
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    5 +-
 meta/recipes-extended/ltp/ltp_20120104.bb          |    4 +-
 meta/recipes-extended/man/man-1.6f/man.conf        |  140 +
 meta/recipes-extended/man/man_1.6f.bb              |   11 +-
 meta/recipes-extended/pam/libpam_1.1.5.bb          |    3 +-
 meta/recipes-extended/texi2html/texi2html_5.0.bb   |    6 +-
 .../xz/{xz_5.0.3.bb => xz_5.1.1alpha.bb}           |   10 +-
 .../pulseaudio/libatomics-ops/doublefix.patch      |   27 -
 .../fedora/libatomic_ops-1.2-ppclwzfix.patch       |   20 -
 .../gentoo/libatomic_ops-1.2-mips.patch            |  129 -
 .../libatomics-ops_fix_for_x32.patch               |   41 -
 ...libatomics-ops_1.2.bb => libatomics-ops_7.2.bb} |   11 +-
 .../{libcanberra_0.28.bb => libcanberra_0.29.bb}   |   14 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   11 +-
 ..._for_x32.patch => pulseaudio_fix_for_x32.patch} |    0
 .../{pulseaudio_1.1.bb => pulseaudio_2.1.bb}       |    7 +-
 63 files changed, 4591 insertions(+), 1059 deletions(-)
 rename meta/recipes-connectivity/bluez/{bluez-hcidump_2.3.bb => bluez-hcidump_2.4.bb} (83%)
 rename meta/recipes-connectivity/bluez/{bluez4-4.99 => bluez4-4.101}/bluetooth.conf (100%)
 rename meta/recipes-connectivity/bluez/{bluez4-4.99 => bluez4-4.101}/sbc_mmx.patch (100%)
 rename meta/recipes-connectivity/bluez/{bluez4_4.99.bb => bluez4_4.101.bb} (76%)
 rename meta/recipes-connectivity/bluez/{gst-plugin-bluetooth_4.99.bb => gst-plugin-bluetooth_4.101.bb} (81%)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/supported-tt-ru.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/glibc.no_sqrt.patch
 rename meta/recipes-core/images/{self-hosted-image.bb => build-appliance-image.bb} (69%)
 create mode 100644 meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx
 create mode 100644 meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmxf
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc.e6500-FSF46.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc.no_power_builtins.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/powerpc-e5500.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
 rename meta/recipes-devtools/python/{python-pygtk_2.17.0.bb => python-pygtk_2.24.0.bb} (89%)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch
 create mode 100644 meta/recipes-extended/man/man-1.6f/man.conf
 rename meta/recipes-extended/xz/{xz_5.0.3.bb => xz_5.1.1alpha.bb} (72%)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/doublefix.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/fedora/libatomic_ops-1.2-ppclwzfix.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/libatomic_ops-1.2-mips.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/libatomics-ops_fix_for_x32.patch
 rename meta/recipes-multimedia/pulseaudio/{libatomics-ops_1.2.bb => libatomics-ops_7.2.bb} (68%)
 rename meta/recipes-multimedia/pulseaudio/{libcanberra_0.28.bb => libcanberra_0.29.bb} (76%)
 rename meta/recipes-multimedia/pulseaudio/pulseaudio/{pulseaudo_fix_for_x32.patch => pulseaudio_fix_for_x32.patch} (100%)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_1.1.bb => pulseaudio_2.1.bb} (64%)

-- 
1.7.9.5



