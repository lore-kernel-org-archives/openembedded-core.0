Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQ0iD-0001nD-CF
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 20:25:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 May 2012 11:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149026898"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2012 11:15:22 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 11:15:21 -0700
Message-Id: <cover.1336068854.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 00/28] various recipe upgrades & fixes
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
X-List-Received-Date: Thu, 03 May 2012 18:25:10 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 2e9bb9d103def3ce7499e1a09e47b9297f85c488:

  gcc-package-target: add libexec for plugin (2012-05-03 15:48:10 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/upgrades2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades2

Nitin A Kamble (28):
  guile: upgrade from 2.0.3 to 2.0.5
  autoconf: upgrade from 2.68 to 2.69
  automake: upgrade from 1.11.3 to 1.12
  distro-tracking: update for guile automake & autoconf
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
  tar: fix build
  libgcrypt: fix build
  gpgme: fix build
  telepathy-glib: fix build
  xf86-video-vmware: fix build issue

 .../conf/distro/include/distro_tracking_fields.inc |   19 ++++----
 .../lrzsz_fix_for_automake-1.12.patch              |   49 ++++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |    6 ++-
 .../telepathy/telepathy-glib_0.18.1.bb             |   12 ++++-
 .../jpeg/jpeg-8c/jpeg_fix_for_automake-1.12.patch  |   41 ++++++++++++++++
 meta/recipes-core/jpeg/jpeg_8c.bb                  |    6 ++-
 .../libxml2/libxml2_fix_for_automake_1.12.patch    |   23 +++++++++
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    5 +-
 meta/recipes-devtools/autoconf/autoconf.inc        |    2 +-
 .../{autoconf_2.68.bb => autoconf_2.69.bb}         |    6 +-
 .../automake/automake/path_prog_fixes.patch        |   44 ++++--------------
 .../prefer-cpio-over-pax-for-ustar-archives.patch  |   32 +++++++------
 .../{automake_1.11.3.bb => automake_1.12.bb}       |    4 +-
 ...01-Fix-the-SRFI-60-copy-bit-documentation.patch |   33 -------------
 ..._GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch |   25 ----------
 ...-modules-are-removed-gc-test-as-unresolve.patch |   34 ++++++++++++++
 ...h-rather-than-gc-gc_version.h-in-pthread-.patch |   26 ----------
 ...with-owner-not-retained-threads-test-as-u.patch |   29 ++++++++++++
 .../guile/files/guile_2.0.5_fix_sed_error.patch    |   24 ++++++++++
 .../guile/{guile_2.0.3.bb => guile_2.0.5.bb}       |   16 ++++---
 .../rpm/rpm/rpm_fix_for_automake-1.12.patch        |   21 ++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 .../findutils_fix_for_automake-1.12.patch          |   22 +++++++++
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    6 ++-
 .../gawk/gawk/gawk_fix_for_automake-1.12.patch     |   23 +++++++++
 meta/recipes-extended/gawk/gawk_4.0.0.bb           |    5 +-
 .../libidn/libidn_fix_for_automake-1.12.patch      |   26 ++++++++++
 meta/recipes-extended/libidn/libidn_1.24.bb        |    5 +-
 .../files/lighttpd_fix_for_automake-1.12.patch     |   37 +++++++++++++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb  |    5 +-
 .../minicom_fix_for_automake-1.12.patch            |   21 ++++++++
 meta/recipes-extended/minicom/minicom_2.6.1.bb     |    3 +
 .../files/shadow_fix_for_automake-1.12.patch       |   23 +++++++++
 .../shadow/shadow-native_4.1.4.3.bb                |    6 ++-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    6 ++-
 meta/recipes-extended/tar/tar.inc                  |    8 ++-
 .../texinfo_fix_for_automake-1.12.patch            |   24 ++++++++++
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |    3 +-
 .../glew/files/glew_fix_for_automake-1.12.patch    |   25 ++++++++++
 meta/recipes-graphics/glew/glew_1.7.0.bb           |    3 +-
 .../xorg-driver/xf86-video-vmware_12.0.1.bb        |    4 +-
 .../systemtap_fix_for_automake_1.12.patch          |   23 +++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
 .../gmp/gmp/gmp_fix_for_automake-1.12.patch        |   48 +++++++++++++++++++
 meta/recipes-support/gmp/gmp_5.0.4.bb              |    6 ++-
 .../libtasn1/libtasn1_fix_for_automake_1.12.patch  |   28 +++++++++++
 meta/recipes-support/gnutls/libtasn1_2.12.bb       |    6 ++-
 meta/recipes-support/gpgme/gpgme_1.3.1.bb          |    4 +-
 .../libcheck/libcheck_fix_for_automake-1.12.patch  |   26 ++++++++++
 meta/recipes-support/libcheck/libcheck_0.9.8.bb    |    6 ++-
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    4 +-
 .../libmpc/libmpc_fix_for_automake-1.12.patch      |   26 ++++++++++
 meta/recipes-support/libmpc/libmpc_0.8.2.bb        |    5 +-
 .../mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch    |   35 ++++++++++++++
 meta/recipes-support/mpfr/mpfr_3.1.0.bb            |    7 ++-
 .../popt/popt/popt_fix_for_automake-1.12.patch     |   21 ++++++++
 meta/recipes-support/popt/popt_1.16.bb             |    3 +-
 58 files changed, 770 insertions(+), 196 deletions(-)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-core/jpeg/jpeg-8c/jpeg_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch
 rename meta/recipes-devtools/autoconf/{autoconf_2.68.bb => autoconf_2.69.bb} (84%)
 rename meta/recipes-devtools/automake/{automake_1.11.3.bb => automake_1.12.bb} (93%)
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch
 create mode 100644 meta/recipes-devtools/guile/files/guile_2.0.5_fix_sed_error.patch
 rename meta/recipes-devtools/guile/{guile_2.0.3.bb => guile_2.0.5.bb} (84%)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/gawk_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/minicom/minicom-2.6.1/minicom_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/texinfo_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-graphics/glew/files/glew_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch
 create mode 100644 meta/recipes-support/gmp/gmp/gmp_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch
 create mode 100644 meta/recipes-support/libcheck/libcheck/libcheck_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/libmpc/libmpc/libmpc_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/mpfr/mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch

-- 
1.7.7



