Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRF2F-0007mF-Q2
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 05:54:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 May 2012 20:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="137663207"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.143])
	by orsmga001.jf.intel.com with ESMTP; 06 May 2012 20:45:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 May 2012 20:45:04 -0700
Message-Id: <cover.1336361625.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/66] Summary Only
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
X-List-Received-Date: Mon, 07 May 2012 03:54:56 -0000

Richard et al:

Here is the summary of the Consolidated pull request, I
did not want to flood the list with 66 Patches as I have
done in the past!

I have included patches from Nitin to address pending updates
to automake and autoconf.

This set also contains fixes for the new glib-2.0 and the updated
site/*-common files with the correct values for Alignment.

Please review and pull.

Thanks
	Sau!

The following changes since commit bf403680d72e360c7382f540ea25cfdcbe77b4e5:

  initrdscripts: Update install.sh to work with mmc devices (2012-05-06 09:54:46 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Khem Raj (10):
  xserver-xorg: Fix build on powerpc
  libatomics-ops: Make it build for SH4
  qemu-git: Move to tip of git
  kmod: Add recipes
  image.bbclass,kernel.bbclass: Use kmod-native instead of
    module-init-tools-cross
  openssl: Fix build for mips64(el)
  classes/mirrors.bbclass: Point snapshot.debian.org mirror to working
    location
  qemumachines: Enable xserver-xorg as default xserver
  xserver-xf86-config: Add xorg.conf for arm,mips,ppc,sh qemu machines
  qemux86-64,qemux86: Include qemu.inc after XSERVER weak assignment

Martin Jansa (4):
  gobject-introspection: upgrade to 1.32.1
  libsoup-2.4: upgrade to 2.38.1
  glib-2.0: upgrade to 2.32.2
  kmod: disable man pages generation because we don't have working
    xsltproc

Nitin A Kamble (39):
  tar: fix build
  libgcrypt: fix build
  gpgme: fix build
  telepathy-glib: fix build
  xf86-video-vmware: fix build issue
  guile: upgrade from 2.0.3 to 2.0.5
  gmp: fix build with automake 1.12
  mpfr: fix build with automake 1.12
  popt: fix build with automake 1.12
  rpm: fix build with automake 1.12
  libxml2: fix build with automake 1.12
  shadow shadow-native: fix build with automake 1.12
  jpeg: fix build with automake 1.12
  libtasn1: fix build with automake 1.12
  systemtap: fix build with automake 1.12
  libmpc: fix build with automake 1.12
  libcheck: fix build with automake 1.12
  texinfo: fix build with automake 1.12
  libidn: fix build with automake 1.12
  glew: fix build with automake 1.12
  findutils: fix build with automake 1.12
  gawk: fix build with automake 1.12
  lrzsz: fix build with automake 1.12
  minicom: fix build with automake 1.12
  lighttpd: fix build with automake 1.12
  avahi: fix install issue
  pango: fix dependencies to avoid build issue
  gnutls: fix build with automake 1.12
  libfm: fix build with automake 1.12
  libfm: fix a build issue
  libcroco: fix build with automake 1.12
  gmp-4.2.1: fix build with automake 1.12
  coreutils-native-6.9: fix build with automake 1.12
  grub-0.97: fix build with automake 1.12
  diffutils-2.8.1: fix build with automake 1.12
  grep-2.5.1a: fix build with automake 1.12
  gawk-3.1.5: fix build with automake 1.12
  findutils-4.2.31: fix build with automake 1.12
  make-3.81: fix build with automake 1.12

Otavio Salvador (1):
  qt4-graphics-system: set graphic system in profile instead of X11
    session

Peter Seebach (2):
  sanity.bbclass: Implement initial toolchain sanity checks
  sanity.bbclass: Check for bogus values in BBCLASSEXTEND

Richard Purdie (2):
  sed: Explicitly disable acl for deterministic builds
  xcb-util-image: Add missing dependency on xcb-util

Saul Wold (7):
  libpcap: Move pcap-config to -dev package
  h264_qpel_mmx.patch: fix Upstream-Status tag
  libgdbus: Fix for glib-2.0 2.32.2
  libsoup: Fix for glib-2.0 2.32.2
  evolution-data-server: Fix for glib-2.0 2.32.2
  site/mips-common: alignment values for guin32, guin64 and unsigned
    long
  site/powerpc-common: alignment values for guin32, guin64 and unsigned
    long

Tomas Frydrych (1):
  site/arm-common: alignment values for guin32, guin64 and unsigned
    long

 meta/classes/image.bbclass                         |    2 +-
 meta/classes/kernel.bbclass                        |    7 +-
 meta/classes/mirrors.bbclass                       |    2 +-
 meta/classes/sanity.bbclass                        |   86 ++++++++++++++++++++
 meta/conf/documentation.conf                       |    6 ++
 meta/conf/machine/include/qemu.inc                 |    9 ++-
 meta/conf/machine/qemux86-64.conf                  |    3 +-
 meta/conf/machine/qemux86.conf                     |    2 +-
 .../grub-0.97/grub_fix_for_automake-1.12.patch     |   48 +++++++++++
 meta/recipes-bsp/grub/grub_0.97.bb                 |    6 +-
 .../lrzsz_fix_for_automake-1.12.patch              |   49 +++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |    6 +-
 meta/recipes-connectivity/avahi/avahi.inc          |    6 +-
 .../avahi/files/avahi_fix_install_issue.patch      |   32 +++++++
 meta/recipes-connectivity/libpcap/libpcap.inc      |    7 ++-
 .../openssl/openssl-1.0.0i/configure-targets.patch |   16 ++--
 .../recipes-connectivity/openssl/openssl_1.0.0i.bb |    2 +-
 .../telepathy/telepathy-glib_0.18.1.bb             |   12 ++-
 .../coreutils_fix_for_automake-1.12.patch          |   32 +++++++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |    6 +-
 .../glib-2.0/glib-2.0/configure-libtool.patch      |   54 +++++++++----
 .../glib-2.0/glib-2.0/g_once_init_enter.patch      |   24 ------
 .../{glib-2.0_2.30.3.bb => glib-2.0_2.32.2.bb}     |    6 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 .../jpeg/jpeg-8c/jpeg_fix_for_automake-1.12.patch  |   41 +++++++++
 meta/recipes-core/jpeg/jpeg_8c.bb                  |    6 +-
 .../libxml2/libxml2_fix_for_automake_1.12.patch    |   23 +++++
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    5 +-
 ...01-Fix-the-SRFI-60-copy-bit-documentation.patch |   33 --------
 ..._GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch |   25 ------
 ...-modules-are-removed-gc-test-as-unresolve.patch |   38 +++++++++
 ...h-rather-than-gc-gc_version.h-in-pthread-.patch |   26 ------
 ...with-owner-not-retained-threads-test-as-u.patch |   33 ++++++++
 .../guile/files/guile_2.0.5_fix_sed_error.patch    |   24 ++++++
 .../guile/files/opensuse/guile-64bit.patch         |    3 +-
 .../files/opensuse/guile-turn-off-gc-test.patch    |    3 +-
 .../guile/{guile_2.0.3.bb => guile_2.0.5.bb}       |   16 ++--
 .../make-3.81/make_fix_for_automake-1.12.patch     |   43 ++++++++++
 meta/recipes-devtools/make/make_3.81.bb            |    4 +-
 .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin |  Bin 0 -> 4096 bytes
 meta/recipes-devtools/qemu/qemu_git.bb             |   18 +---
 .../rpm/rpm/rpm_fix_for_automake-1.12.patch        |   21 +++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 .../diffutils_fix_for_automake-1.12.patch          |   27 ++++++
 meta/recipes-extended/diffutils/diffutils_2.8.1.bb |    6 +-
 .../findutils_fix_for_automake-1.12.patch          |   23 +++++
 .../findutils_fix_for_automake-1.12.patch          |   22 +++++
 .../recipes-extended/findutils/findutils_4.2.31.bb |    6 +-
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    6 +-
 .../gawk-3.1.5/gawk_fix_for_automake-1.12.patch    |   41 +++++++++
 .../gawk/gawk/gawk_fix_for_automake-1.12.patch     |   23 +++++
 meta/recipes-extended/gawk/gawk_3.1.5.bb           |    2 +
 meta/recipes-extended/gawk/gawk_4.0.0.bb           |    5 +-
 .../grep-2.5.1a/grep_fix_for_automake-1.12.patch   |   52 ++++++++++++
 meta/recipes-extended/grep/grep_2.5.1a.bb          |    7 +-
 .../libidn/libidn_fix_for_automake-1.12.patch      |   26 ++++++
 meta/recipes-extended/libidn/libidn_1.24.bb        |    5 +-
 .../files/lighttpd_fix_for_automake-1.12.patch     |   37 +++++++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb  |    5 +-
 .../minicom_fix_for_automake-1.12.patch            |   21 +++++
 meta/recipes-extended/minicom/minicom_2.6.1.bb     |    3 +
 meta/recipes-extended/sed/sed_4.2.1.bb             |    2 +
 .../files/shadow_fix_for_automake-1.12.patch       |   23 +++++
 .../shadow/shadow-native_4.1.4.3.bb                |    6 +-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    6 +-
 meta/recipes-extended/tar/tar.inc                  |    8 ++-
 .../texinfo_fix_for_automake-1.12.patch            |   24 ++++++
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |    3 +-
 ..._1.31.20.bb => gobject-introspection_1.32.1.bb} |   13 ++-
 .../glew/files/glew_fix_for_automake-1.12.patch    |   25 ++++++
 meta/recipes-graphics/glew/glew_1.7.0.bb           |    3 +-
 meta/recipes-graphics/pango/pango.inc              |    2 +-
 meta/recipes-graphics/pango/pango_1.28.4.bb        |    2 +-
 meta/recipes-graphics/xcb/xcb-util-image_0.3.8.bb  |    2 +
 .../xorg-driver/xf86-video-vmware_12.0.1.bb        |    4 +-
 .../xserver-xf86-config/qemuarm/xorg.conf          |   69 ++++++++++++++++
 .../xserver-xf86-config/qemumips/xorg.conf         |   69 ++++++++++++++++
 .../xserver-xf86-config/qemumips64/xorg.conf       |   69 ++++++++++++++++
 .../xserver-xf86-config/qemuppc/xorg.conf          |   69 ++++++++++++++++
 .../xserver-xf86-config/qemush4/xorg.conf          |   69 ++++++++++++++++
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |    2 +-
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    9 +-
 .../xserver-xorg-1.11.2/gcc-47-warning.patch       |   33 ++++++++
 meta/recipes-kernel/kmod/kmod-native_git.bb        |   14 +++
 meta/recipes-kernel/kmod/kmod.inc                  |   32 +++++++
 ...-man-page-generation-because-we-don-t-hav.patch |   26 ++++++
 meta/recipes-kernel/kmod/kmod/depmod-search.conf   |    6 ++
 meta/recipes-kernel/kmod/kmod_git.bb               |   58 +++++++++++++
 .../systemtap_fix_for_automake_1.12.patch          |   23 +++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
 .../gst-ffmpeg-0.10.13/h264_qpel_mmx.patch         |    2 +-
 .../libatomics-ops/gentoo/sh4-atomic-ops.patch     |   70 ++++++++++++++++
 .../pulseaudio/libatomics-ops_1.2.bb               |    6 +-
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   12 +--
 .../use-deprecated-g_atexit.patch                  |   27 ++++++
 meta/recipes-sato/eds/evolution-data-server_git.bb |    3 +-
 .../gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch  |   48 +++++++++++
 .../gmp/gmp/gmp_fix_for_automake-1.12.patch        |   48 +++++++++++
 meta/recipes-support/gmp/gmp_4.2.1.bb              |    6 +-
 meta/recipes-support/gmp/gmp_5.0.4.bb              |    6 +-
 .../gnutls_fix_for_automake-1.12.patch             |   53 ++++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.18.bb      |    3 +-
 .../libtasn1/libtasn1_fix_for_automake_1.12.patch  |   28 +++++++
 meta/recipes-support/gnutls/libtasn1_2.12.bb       |    6 +-
 meta/recipes-support/gpgme/gpgme_1.3.1.bb          |    4 +-
 .../libcheck/libcheck_fix_for_automake-1.12.patch  |   26 ++++++
 meta/recipes-support/libcheck/libcheck_0.9.8.bb    |    6 +-
 .../files/libcroco_fix_for_automake-1.12.patch     |   22 +++++
 meta/recipes-support/libcroco/libcroco_0.6.3.bb    |    5 +-
 .../libfm-0.1.17/libfm_fix_for_automake-1.12.patch |   48 +++++++++++
 meta/recipes-support/libfm/libfm_0.1.17.bb         |   14 +++-
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    4 +-
 .../libgdbus/libgdbus/fix-for-new-glib.patch       |   20 +++++
 meta/recipes-support/libgdbus/libgdbus_git.bb      |    5 +-
 .../libmpc/libmpc_fix_for_automake-1.12.patch      |   26 ++++++
 meta/recipes-support/libmpc/libmpc_0.8.2.bb        |    5 +-
 .../libsoup/libsoup-2.2.105/fix-for-new-glib.patch |   85 +++++++++++++++++++
 ...libsoup-2.4_2.36.1.bb => libsoup-2.4_2.38.1.bb} |    8 +-
 meta/recipes-support/libsoup/libsoup_2.2.105.bb    |    5 +-
 .../mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch    |   35 ++++++++
 meta/recipes-support/mpfr/mpfr_3.1.0.bb            |    7 +-
 .../popt/popt/popt_fix_for_automake-1.12.patch     |   21 +++++
 meta/recipes-support/popt/popt_1.16.bb             |    3 +-
 meta/site/arm-common                               |    3 +
 meta/site/mips-common                              |    4 +
 meta/site/powerpc-common                           |    5 +
 127 files changed, 2195 insertions(+), 265 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub-0.97/grub_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/coreutils_fix_for_automake-1.12.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.3.bb => glib-2.0_2.32.2.bb} (90%)
 create mode 100644 meta/recipes-core/jpeg/jpeg-8c/jpeg_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch
 create mode 100644 meta/recipes-devtools/guile/files/guile_2.0.5_fix_sed_error.patch
 rename meta/recipes-devtools/guile/{guile_2.0.3.bb => guile_2.0.5.bb} (84%)
 create mode 100644 meta/recipes-devtools/make/make-3.81/make_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/diffutils/diffutils-2.8.1/diffutils_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/gawk/gawk-3.1.5/gawk_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/gawk_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/minicom/minicom-2.6.1/minicom_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/texinfo_fix_for_automake-1.12.patch
 rename meta/recipes-gnome/gnome/{gobject-introspection_1.31.20.bb => gobject-introspection_1.32.1.bb} (52%)
 create mode 100644 meta/recipes-graphics/glew/files/glew_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
 create mode 100644 meta/recipes-kernel/kmod/kmod-native_git.bb
 create mode 100644 meta/recipes-kernel/kmod/kmod.inc
 create mode 100644 meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch
 create mode 100644 meta/recipes-kernel/kmod/kmod/depmod-search.conf
 create mode 100644 meta/recipes-kernel/kmod/kmod_git.bb
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/sh4-atomic-ops.patch
 create mode 100644 meta/recipes-sato/eds/evolution-data-server/use-deprecated-g_atexit.patch
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/gmp/gmp/gmp_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.18/gnutls_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch
 create mode 100644 meta/recipes-support/libcheck/libcheck/libcheck_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/libcroco/files/libcroco_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/libgdbus/libgdbus/fix-for-new-glib.patch
 create mode 100644 meta/recipes-support/libmpc/libmpc/libmpc_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.2.105/fix-for-new-glib.patch
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.36.1.bb => libsoup-2.4_2.38.1.bb} (55%)
 create mode 100644 meta/recipes-support/mpfr/mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch

-- 
1.7.7.6



