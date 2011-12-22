Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddbs-0005N8-UT
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:41 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233720"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:06 -0800
Message-Id: <cover.1324540322.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [CONSOLIDATED PULL 00/26] Some Package Updates and Fixes
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:41 -0000

Richard & Community:

Here are some package updates along with fixes from various folks
that have been pending for a couple of days. BTW, this does build
world and gpl, although I have heard about some gettext issue I am
still working.

FYI: things might slow down a little over the next week as various
people (like RP & Saul) take some needed down time during the holiday
season.

Happy Holidays to everyone.

Sau!


The following changes since commit db446421933d640528328e46a29f828a36d6649b:

  multilib.conf: Enable shadow-sysroot and libffi (2011-12-21 17:24:37 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Dexuan Cui (2):
  socat: add the latest stable version 1.7.2.0
  wget: fix a host intrusion issue introduced by adding
    --with-ssl=openssl.

H.J. Lu (1):
  gmp: Don't check "$CC $CFLAGS" for x32 in gmp configure

Ilya Yanok (1):
  arch-powerpc: set PACKAGE_EXTRA_ARCHS

Nitin A Kamble (3):
  bitbake.conf multilib.conf: move the definition of baselib
  binutils: fix building on distros with matching binutils version
  image-types: add btrfs as a supported fstype

Paul Eggleton (1):
  libsync: move to git.yoctoproject.org

Saul Wold (10):
  distro tracking: update man-pages, gts-plugin-bluetooth, usbutils,
  python-pycairo: Upgrade to 1.10.0
  augeas: Upgrade to 0.10.0
  libidn: Upgrade to 1.23
  mc: Add version 4.8.1 now GPLv3
  texi2html: Upgrade to 5.0
  libdrm: Upgrade to 2.4.29
  distro_tracking: Mark Upgrade Info
  zypper: add patch from libxml2
  bash: Add SRC_URI Checksums for GPLv2

Scott Garman (8):
  ncurses: move libraries to base_libdir
  libcap: move library to base_libdir
  util-linux: move libraries to base_libdir
  e2fsprogs: move libraries to base_libdir
  libusb1: move libraries to base_libdir
  libusb-compat: move libraries to base_libdir
  prelink: update to latest git version
  insane.bbclass: add QA tests for unsafe references to exec_prefix

 .../opensync/{libsync_svn.bb => libsync_git.bb}    |    9 +-
 meta/classes/image_types.bbclass                   |    2 +-
 meta/classes/insane.bbclass                        |  111 +++-
 meta/conf/bitbake.conf                             |    2 +-
 .../conf/distro/include/distro_tracking_fields.inc |   77 +-
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    6 +-
 meta/conf/machine/include/tune-ppc603e.inc         |    2 +-
 meta/conf/machine/include/tune-ppce300c2.inc       |    2 +-
 meta/conf/machine/include/tune-ppce500mc.inc       |    2 +-
 meta/conf/multilib.conf                            |    2 -
 .../recipes-connectivity/socat/files/compile.patch |  946 ++++++++++++++++++++
 meta/recipes-connectivity/socat/socat_1.7.2.0.bb   |   28 +
 meta/recipes-core/ncurses/ncurses.inc              |   26 +-
 meta/recipes-core/util-linux/util-linux.inc        |   20 +-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 .../binutils/binutils-cross-canadian_2.22.bb       |    2 +-
 .../binutils/binutils-crosssdk_2.22.bb             |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    2 +-
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    2 +-
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |   29 +-
 meta/recipes-devtools/prelink/prelink_git.bb       |    2 +-
 .../python/python-pycairo_1.10.0.bb                |   39 +
 .../python/python-pycairo_1.8.10.bb                |   31 -
 meta/recipes-extended/augeas/augeas_0.10.0.bb      |    6 +
 meta/recipes-extended/augeas/augeas_0.9.0.bb       |    7 -
 meta/recipes-extended/bash/bash_3.2.48.bb          |    3 +
 .../libidn/{libidn_1.22.bb => libidn_1.23.bb}      |    5 +-
 meta/recipes-extended/mc/mc_4.8.1.bb               |   25 +
 .../texi2html-5.0/fix_gettext_version.patch        |   44 +
 .../{texi2html_1.82.bb => texi2html_5.0.bb}        |   19 +-
 meta/recipes-extended/wget/wget.inc                |    4 +-
 .../zypper/zypper/cmake_libxml2.patch              |   28 +
 meta/recipes-extended/zypper/zypper_git.bb         |    3 +-
 .../drm/{libdrm_2.4.27.bb => libdrm_2.4.29.bb}     |    8 +-
 meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch |   24 +-
 meta/recipes-support/libcap/libcap.inc             |   15 +-
 meta/recipes-support/libcap/libcap_2.22.bb         |    2 +-
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |   12 +-
 meta/recipes-support/libusb/libusb1_1.0.8.bb       |   16 +-
 39 files changed, 1417 insertions(+), 150 deletions(-)
 rename meta-demoapps/recipes-connectivity/opensync/{libsync_svn.bb => libsync_git.bb} (72%)
 create mode 100644 meta/recipes-connectivity/socat/files/compile.patch
 create mode 100644 meta/recipes-connectivity/socat/socat_1.7.2.0.bb
 create mode 100644 meta/recipes-devtools/python/python-pycairo_1.10.0.bb
 delete mode 100644 meta/recipes-devtools/python/python-pycairo_1.8.10.bb
 create mode 100644 meta/recipes-extended/augeas/augeas_0.10.0.bb
 delete mode 100644 meta/recipes-extended/augeas/augeas_0.9.0.bb
 rename meta/recipes-extended/libidn/{libidn_1.22.bb => libidn_1.23.bb} (86%)
 create mode 100644 meta/recipes-extended/mc/mc_4.8.1.bb
 create mode 100644 meta/recipes-extended/texi2html/texi2html-5.0/fix_gettext_version.patch
 rename meta/recipes-extended/texi2html/{texi2html_1.82.bb => texi2html_5.0.bb} (43%)
 create mode 100644 meta/recipes-extended/zypper/zypper/cmake_libxml2.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.27.bb => libdrm_2.4.29.bb} (54%)

-- 
1.7.6.4



