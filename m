Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfuR-0002yZ-Fd
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125499"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:11 -0700
Message-Id: <cover.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/32] denzil pull request
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
X-List-Received-Date: Thu, 24 May 2012 21:49:28 -0000

Hello,

This is the first pull request for the oe-core denzil branch, based on
a set of commits I've been testing from my sgarman/denzil-next branch.

These commits have passed an array of build and runtime tests,
including the following nightly build:

http://autobuilder.yoctoproject.org:8010/builders/nightly/builds/462

a non-gplv3 build:

http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/70

and a tiny build:

http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/47

Please give this pull request a few days to receive feedback and ACKs
from the community.

Thanks,

Scott

The following changes since commit 5433da972f2994f7176597d89499ccb65f876f88:

  self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-24 10:20:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgarman/denzil-next-testing
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/denzil-next-pull1

Andreas Oberritter (2):
  python: use PKGSUFFIX for libpython2
  {kernel, module}.bbclass: don't run depmod for module packages during
    do_rootfs

Andrei Gherzan (3):
  python: Add patch for 64bit platform
  python: Add patch to search for db.h in inc_dirs and remove warning
  fotowall: Add #include ui_wizard.h to ExportWizard.cpp

Darren Hart (2):
  gthumb: Disable parallel make for gthumb install
  initrdscripts: Update install.sh to work with mmc devices

Dongxiao Xu (1):
  qt4: move functions from python to shell style

Ken Werner (1):
  bdwgc: Set ARM_INSTRUCTION_SET to "arm"

Khem Raj (4):
  connman: Fix linking with gold linker
  openssl: Fix build for mips64(el)
  uclibc.inc: uclibc rtld does support GNU_HASH
  classes/mirrors.bbclass: Point snapshot.debian.org mirror to working
    location

Mark Norman (1):
  uclibc SDK not including libpthread_nonshared.a

Nitin A Kamble (2):
  libproxy: fix compilation with gcc 4.7
  quilt: fix perl path in target perl scripts

Otavio Salvador (1):
  connman: backport test script fixes

Paul Eggleton (2):
  dpkg-native: fix deb-based rootfs construction failure on Fedora 16
  buildhistory: fix multiple commit of images and packages at the same
    time

Richard Purdie (2):
  utils.bbclass: Testing via env in create_wrapper is a nice idea but
    breaks things
  sed: Explicitly disable acl for deterministic builds

Saul Wold (7):
  binutils: add embedspu for ppc builds
  libgcc: Package additional *crt*.o files for PPC
  xserver-kdrive: Add xkb to existing docs list
  gcc: Add plugins package for ARM, fix /usr/incude packaging
  quilt: move empty quiltrc to native sysconfdir
  boost: Ensure we use our user-config.jam file
  builder: Add Please Wait Dialog Box

Scott Garman (3):
  libpng: upgrade to 1.2.49
  openssl: upgrade to 1.0.0i
  runqemu-ifup: enable ip masquerading for QEMU NAT addresses

Zhai Edwin (1):
  pango: Fix modules load failure in multilib environment

 meta/classes/buildhistory.bbclass                  |    2 +-
 meta/classes/kernel.bbclass                        |    4 +-
 meta/classes/mirrors.bbclass                       |    2 +-
 meta/classes/module.bbclass                        |    7 +-
 meta/classes/patch.bbclass                         |    2 +-
 meta/classes/utils.bbclass                         |    4 +-
 ...ange-visibility-to-default-for-debug-symb.patch |   35 ++++
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 +++++
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 ++++++
 meta/recipes-connectivity/connman/connman_0.79.bb  |    5 +-
 .../configure-targets.patch                        |   16 +-
 .../debian/c_rehash-compat.patch                   |    0
 .../debian/ca.patch                                |    0
 .../debian/debian-targets.patch                    |    0
 .../debian/make-targets.patch                      |    0
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../debian/pic.patch                               |    0
 .../debian/version-script.patch                    |    0
 .../engines-install-in-libdir-ssl.patch            |    0
 .../oe-ldflags.patch                               |    0
 .../openssl-fix-link.patch                         |    0
 .../openssl_fix_for_x32.patch                      |    0
 .../shared-libs.patch                              |    0
 meta/recipes-connectivity/openssl/openssl.inc      |    3 +-
 .../{openssl_1.0.0h.bb => openssl_1.0.0i.bb}       |    6 +-
 .../initrdscripts/files/init-install.sh            |   45 ++---
 .../initrdscripts/initramfs-live-install_1.0.bb    |    2 +-
 meta/recipes-core/uclibc/uclibc.inc                |   11 +-
 meta/recipes-devtools/binutils/binutils.inc        |    1 +
 .../dpkg/dpkg/dpkg-deb-avoid-fflush.patch          |  198 ++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb        |    5 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc   |    8 +-
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |    2 +-
 .../python/check-if-target-is-64b-not-host.patch   |   57 ++++++
 ...search_db_h_in_inc_dirs_and_avoid_warning.patch |   40 ++++
 meta/recipes-devtools/python/python_2.7.2.bb       |   11 +-
 meta/recipes-devtools/quilt/quilt-0.51.inc         |    5 -
 meta/recipes-devtools/quilt/quilt-native.inc       |    6 +
 meta/recipes-devtools/quilt/quilt-native_0.51.bb   |    2 +-
 meta/recipes-devtools/quilt/quilt_0.51.bb          |   15 +-
 meta/recipes-extended/sed/sed_4.2.1.bb             |    4 +-
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |    2 +
 meta/recipes-graphics/builder/builder_0.1.bb       |    7 +-
 .../builder/files/builder_hob_start.sh             |    2 +
 .../builder/files/please_wait_dialog.py            |   28 +++
 .../pango/pango-1.28.4/multilib-fix-clean.patch    |   40 ++++
 meta/recipes-graphics/pango/pango.inc              |   12 +-
 meta/recipes-graphics/pango/pango_1.28.4.bb        |    7 +-
 .../xorg-xserver/xserver-kdrive.inc                |    2 +-
 .../libpng/{libpng_1.2.46.bb => libpng_1.2.49.bb}  |   10 +-
 .../ExportWizard-depends-on-ui_wizard.patch        |   18 ++
 meta/recipes-qt/qt-apps/fotowall_0.9.bb            |    6 +-
 meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |    5 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |    5 +-
 meta/recipes-qt/qt4/qt4_arch.inc                   |   36 ++--
 meta/recipes-support/bdwgc/bdwgc_20110107.bb       |    2 +
 meta/recipes-support/boost/boost.inc               |    3 +-
 .../libproxy/libproxy_fix_for_gcc4.7.patch         |   30 +++
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    3 +-
 scripts/runqemu-ifup                               |    3 +-
 65 files changed, 715 insertions(+), 113 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/configure-targets.patch (81%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.0h.bb => openssl_1.0.0i.bb} (88%)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch
 create mode 100644 meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch
 create mode 100644 meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch
 create mode 100644 meta/recipes-graphics/builder/files/please_wait_dialog.py
 create mode 100644 meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.2.46.bb => libpng_1.2.49.bb} (60%)
 create mode 100644 meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch
 create mode 100644 meta/recipes-support/libproxy/libproxy/libproxy_fix_for_gcc4.7.patch

-- 
1.7.9.5



