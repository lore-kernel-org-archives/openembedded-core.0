Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8B-0005pP-3u
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:37 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:26:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419439"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:26:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:31 -0800
Message-Id: <cover.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [CONSOLIDATED PULL 00/23] Scooping up Patches
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:37 -0000

Richard,

This is a set of patches that I have built via the AB and locally.

I included the "multiarch" change, but have not directly tested
it, it did not seem to have any direct comments this time.

Please do a final review and pull as appropriate.

(Just realized I included Nitin's distro_tracking with libtool, but I
bounced the libtool change itself, pull as you see fit, probably OK since
the change will be coming when he fixes the SUMMARY and white space issues).

Sau!


The following changes since commit 2864ff6a4b3c3f9b3bbb6d2597243cc5d3715939:

  getVar/setVar cleanups (2011-11-26 22:42:00 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Dexuan Cui (1):
  coreutils: build and install hostname

Julian Pidancet (1):
  Introduce multiarch DISTRO_FEATURE

Khem Raj (3):
  default-distrovars: Define SDK_VERSION and DISTRO_VERSION
  toolchain-scripts.bbclass: Make it work when TCLIBC=uclibc
  python-native: Fix gcc compiler detecting logic

Koen Kooi (3):
  libjson: add 0.9
  pulseaudio: update to 1.1, delete 0.9.x
  opkg-utils: handle 6 digit UID fields properly

Martin Jansa (2):
  mesa: package gl/egl/osmesa to separate packages
  mesa-common: install internal GL headers to libgl-dev

Matthew McClintock (2):
  rpm_5.4.0.bb: Build rpm without xz
  eglibc-initial: Fix kernel headers symlink being wrong

Nitin A Kamble (2):
  binutils: upgrade from 2.21.1a to 2.22
  distro-tracking: update information for binutils & libtool

Otavio Salvador (1):
  xserver-xorg: only use --disable-dga in xserver-xorg-lite

Saul Wold (5):
  runqemu: look for *-image* to be more flexible for image names
  distro_tracking: Update manual check dates (readline, gcrypt)
  tzdata/tzcode: Update tzdata to 2011n
  intltool: remove XML::Parser check
  Self Hosted Image: Added Task and Images

Wenzong Fan (1):
  distro_tracking: update tracking fields for gettext and eds-tools

Xiaofeng Yan (2):
  libx11-trim: update to 1.4.4
  distro_tracking_fields: update the status

 meta/classes/toolchain-scripts.bbclass             |    8 +-
 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 meta/conf/distro/include/default-versions.inc      |    1 -
 .../conf/distro/include/distro_tracking_fields.inc |   39 +-
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../coreutils/coreutils-8.14/disable_doc_man.patch |   36 +
 meta/recipes-core/coreutils/coreutils_8.14.bb      |    9 +-
 meta/recipes-core/eglibc/eglibc-common.inc         |    2 +-
 meta/recipes-core/eglibc/eglibc-initial.inc        |    2 +-
 meta/recipes-core/images/self-hosted-image.bb      |   11 +
 meta/recipes-core/tasks/task-self-hosted.bb        |  174 +++++
 ..._2.21.1a.bb => binutils-cross-canadian_2.22.bb} |    2 +-
 meta/recipes-devtools/binutils/binutils-cross.inc  |    3 +-
 ...ils-cross_2.21.1a.bb => binutils-cross_2.22.bb} |    0
 ...osssdk_2.21.1a.bb => binutils-crosssdk_2.22.bb} |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    3 +-
 .../binutils/binutils/110-arm-eabi-conf.patch      |   24 -
 .../binutils/binutils-2.19.1-ld-sysroot.patch      |   10 +-
 .../binutils/binutils/binutils-poison.patch        |   84 ++-
 .../binutils/binutils/binutils-powerpc-e5500.patch |   52 +-
 .../binutils/binutils-uclibc-100-uclibc-conf.patch |   40 +-
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |   16 +-
 ...binutils-uclibc-300-006_better_file_error.patch |    9 +-
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |   12 +-
 .../binutils/binutils-uclibc-gas-needs-libm.patch  |   11 +-
 .../binutils/binutils-x86_64_i386_biarch.patch     |   10 +-
 .../binutils/binutils/clone-shadow.patch           |   18 +-
 .../binutils/binutils/libiberty_path_fix.patch     |    8 +-
 .../binutils/binutils/libtool-2.4-update.patch     |  803 ++++++++++----------
 .../binutils/binutils/libtool-rpath-fix.patch      |   11 +-
 .../{binutils_2.21.1a.bb => binutils_2.22.bb}      |    7 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |   10 +
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    3 +-
 .../intltool-0.40.6/remove-xml-check.patch         |   29 +
 meta/recipes-devtools/intltool/intltool_0.40.6.bb  |   11 +-
 meta/recipes-devtools/libjson/libjson_0.9.bb       |   14 +
 .../opkg-utils/arfile_header_split.patch           |   27 +
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    3 +-
 .../python/python-native/unixccompiler.patch       |   22 +-
 .../recipes-devtools/python/python-native_2.7.2.bb |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 .../recipes-extended/tzcode/tzcode-native_2011i.bb |   11 +-
 .../tzdata/{tzdata_2011l.bb => tzdata_2011n.bb}    |    6 +-
 meta/recipes-graphics/mesa/mesa-common.inc         |   18 +-
 .../libx11-trim-1.4.4/keysymdef_include.patch      |   23 +
 .../libx11-trim-1.4.4/makekeys_crosscompile.patch  |   45 ++
 .../libx11-trim-1.4.4/x11_disable_makekeys.patch   |   29 +
 .../recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb |   20 +
 .../xorg-xserver/xserver-xorg-1.11.1.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-common.inc           |    1 -
 .../xorg-xserver/xserver-xorg-lite.inc             |    1 +
 .../pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch |   61 --
 .../pulseaudio-0.9.22/autoconf_version.patch       |   17 -
 .../pulseaudio/pulseaudio-0.9.22/buildfix.patch    |   17 -
 .../pulseaudio-0.9.22/configure_silent_rules.patch |   33 -
 .../pulseaudio-0.9.22/gcc4-compile-fix.patch       |   22 -
 .../pulseaudio/pulseaudio-0.9.22/tls_m4.patch      |   34 -
 .../pulseaudio-0.9.23/autoconf_version.patch       |   17 -
 .../pulseaudio/pulseaudio-0.9.23/buildfix.patch    |   17 -
 .../pulseaudio-0.9.23/configure_silent_rules.patch |   33 -
 .../pulseaudio-0.9.23/fix_bluez_build.patch        |   26 -
 .../pulseaudio-0.9.23/gcc4-compile-fix.patch       |   22 -
 .../pulseaudio/pulseaudio-0.9.23/tls_m4.patch      |   34 -
 .../pulseaudio-0.9.23/volatiles.04_pulse           |    2 -
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 .../volatiles.04_pulse                             |    0
 .../pulseaudio/pulseaudio_0.9.22.bb                |   24 -
 .../pulseaudio/pulseaudio_0.9.23.bb                |   27 -
 .../pulseaudio/pulseaudio_1.1.bb                   |   19 +
 scripts/runqemu                                    |    4 +-
 70 files changed, 1080 insertions(+), 1023 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.14/disable_doc_man.patch
 create mode 100644 meta/recipes-core/images/self-hosted-image.bb
 create mode 100644 meta/recipes-core/tasks/task-self-hosted.bb
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.21.1a.bb => binutils-cross-canadian_2.22.bb} (86%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.21.1a.bb => binutils-cross_2.22.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.21.1a.bb => binutils-crosssdk_2.22.bb} (96%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/110-arm-eabi-conf.patch
 rename meta/recipes-devtools/binutils/{binutils_2.21.1a.bb => binutils_2.22.bb} (84%)
 create mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
 create mode 100644 meta/recipes-devtools/libjson/libjson_0.9.bb
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
 rename meta/recipes-extended/tzdata/{tzdata_2011l.bb => tzdata_2011n.bb} (96%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/keysymdef_include.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/x11_disable_makekeys.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/autoconf_version.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/buildfix.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/configure_silent_rules.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/gcc4-compile-fix.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/tls_m4.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/autoconf_version.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/buildfix.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/configure_silent_rules.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/fix_bluez_build.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/gcc4-compile-fix.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/tls_m4.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/volatiles.04_pulse
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio-0.9.22 => pulseaudio}/volatiles.04_pulse (100%)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb

-- 
1.7.6.4



