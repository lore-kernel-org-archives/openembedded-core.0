Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8Nu-0008Qm-Qr
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:51 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103275"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:39:44 -0700
Message-Id: <cover.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [Consolidated Pull 00/23] uClibc/RPM Updates & Other fixes
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
X-List-Received-Date: Sun, 17 Jun 2012 05:50:51 -0000

Richard,

Been tested on the ab over the weekend, reviewed.

Autobuild turned up a latent dependency issue with mdadm!

Sau!

The following changes since commit 63d1ae1c2828cda03828b4c3fdde037d7a23f1e4:

  directfb: added missing Upstream-status (2012-06-15 15:41:11 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (1):
  meta-skeleton: add linux-yocto-custom reference recipe

Kang Kai (4):
  cleanup-workdir: update the way to check obsolete dirs
  cleanup-workdir: replace commands with subprocess
  cleanup-workdir: only deal dirs related to current arch
  cleanup-workdir: update help text

Khem Raj (9):
  uclibc_0.9.33.bb: Upgrade to latest git
  site/x86_64-linux-uclibc: Cache definitions of guint32/guint64
  rpm: Fix compilation on uclibc
  rpm: Use link time check for libssp
  sat-solver: Fix build on uclibc
  libzypp: Fix build with uclibc
  rpm: pass lrt and lpthread to link step explicitly for uclibc
  zypper: Fix build on uclibc
  libzypp: Define OECMAKE_CXX_LINK_FLAGS when compiling for uclibc

Laurentiu Palcu (2):
  core-image-gtk-directfb, qt4e-demo-image: Remove module-init-tools
    from IMAGE_INSTALL list
  puzzles: upgrade to r9561

Mark Hatle (1):
  busybox: Fix syslog configuration file

Robert Yang (1):
  gcc-cross: argument list too long when do_install

Saul Wold (3):
  directfb: fix Upstream-status -> Upstream-Status
  curl: Use gnutls for target and openssl for native
  mdadm: add binutils to DEPENDS

Xiaofeng Yan (2):
  multilib.conf: Add the support of multilib for lsbinitscripts
  lsbinitscripts: Add the header for functions.patch

 .../recipes-kernel/linux/linux-yocto-custom.bb     |   46 +++++++
 .../0001-linux-version-tweak.patch                 |   26 ++++
 .../linux/linux-yocto-custom/feature.scc           |    1 +
 .../linux/linux-yocto-custom/smp.cfg               |    1 +
 meta/conf/multilib.conf                            |    1 +
 meta/recipes-core/busybox/busybox.inc              |    1 +
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    2 +-
 meta/recipes-core/uclibc/uclibc_0.9.33.bb          |    4 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    1 +
 .../gcc/gcc-4.6/gcc-argument-list-too-long.patch   |   33 +++++
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 +
 .../gcc/gcc-4.7/gcc-argument-list-too-long.patch   |   33 +++++
 .../rpm/rpm/fstack-protector-configure-check.patch |   21 +++
 meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   42 +++++++
 meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   63 ++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    7 +-
 meta/recipes-extended/libzypp/libzypp/cstdio.patch |   49 ++++++++
 meta/recipes-extended/libzypp/libzypp_git.bb       |    9 +-
 .../lsb/lsbinitscripts/functions.patch             |    3 +
 meta/recipes-extended/mdadm/mdadm_3.2.5.bb         |    1 +
 .../sat-solver/sat-solver/futimes.patch            |   32 +++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    3 +
 meta/recipes-extended/zypper/zypper/rpmatch.patch  |   23 ++++
 meta/recipes-extended/zypper/zypper_git.bb         |    2 +
 ...ibdirect-remove-include-of-linux-config.h.patch |    2 +-
 .../images/core-image-gtk-directfb.bb              |    3 +-
 meta/recipes-qt/images/qt4e-demo-image.bb          |    3 +-
 .../puzzles/{puzzles_r9375.bb => puzzles_r9561.bb} |    6 +-
 meta/recipes-support/curl/curl_7.24.0.bb           |   13 +-
 meta/site/x86_64-linux-uclibc                      |    3 +
 scripts/cleanup-workdir                            |  128 +++++++++++++-------
 31 files changed, 496 insertions(+), 67 deletions(-)
 create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
 create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
 create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom/feature.scc
 create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom/smp.cfg
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-argument-list-too-long.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpmatch.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/uclibc-support.patch
 create mode 100644 meta/recipes-extended/libzypp/libzypp/cstdio.patch
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/futimes.patch
 create mode 100644 meta/recipes-extended/zypper/zypper/rpmatch.patch
 rename meta/recipes-sato/puzzles/{puzzles_r9375.bb => puzzles_r9561.bb} (88%)

-- 
1.7.7.6



