Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Sod5G-0006pL-0e
	for Openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 18:14:42 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Jul 2012 09:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120803345"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jul 2012 09:03:28 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 08:58:17 -0700
Message-Id: <cover.1341935782.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 00/19] automake update related commits on master
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
X-List-Received-Date: Tue, 10 Jul 2012 16:14:42 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

These are same commits which I made for M1 branch, now rebased to the current master.

Thanks,
Nitin

The following changes since commit 029e3cea52f86438a1d6868020b8888b5c93d623:

  bitbake: fetch2/wget: Use FETCHCMD_wget to provide the commandline and options (2012-07-10 14:25:38 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/automake_update_on_master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/automake_update_on_master

Nitin A Kamble (19):
  automake: upgrade from 1.11.3 to 1.12.1
  jpeg: fix configure with automake 1.12.1
  gnutls: Fix build with automake 1.12.1
  pcmanfm: fix build with automake 1.12.x
  avahi: fix build with automake 1.12.1
  dates: fix build with automake 1.12.x
  librsvg: fix build with automake 1.12.x
  evolution-data-server: fix build with automake 1.12.x
  tar: fix build with automake 1.12.x
  libgcrypt: fix build with automake 1.12.x
  telepathy-glib: fix build with automake 1.12.x
  xf86-video-vmware: fix build with automake 1.12.x
  libfm: fix build with automake 1.12.x
  pango: fix dependencies to avoid build issue
  libunistring: fix build with automake 1.12
  telepathy-python: fix build with automake 1.12
  libidn: fix build with automake 1.12
  webgit-gtk: fix build with automake 1.12.1
  gpgme: fix build with automake 1.12.x

 meta/recipes-connectivity/avahi/avahi.inc          |    3 +-
 .../avahi/files/fix_for_automake_1.12.x.patch      |   34 ++++++++
 .../telepathy/telepathy-glib_0.19.2.bb             |    6 --
 .../telepathy-python_fix_for_automake_1.12.patch   |   26 ++++++
 .../telepathy/telepathy-python_0.15.19.bb          |    5 +-
 .../jpeg/jpeg-8d/fix_for_automake_1.12.1.patch     |   44 ++++++++++
 meta/recipes-core/jpeg/jpeg_8d.bb                  |    5 +-
 .../automake/automake/path_prog_fixes.patch        |   40 ++--------
 .../{automake_1.11.3.bb => automake_1.12.1.bb}     |    5 +-
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |   25 ++++++
 meta/recipes-extended/libidn/libidn_1.25.bb        |    5 +-
 meta/recipes-extended/tar/tar.inc                  |    2 -
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    8 +--
 meta/recipes-graphics/pango/pango.inc              |    2 +-
 .../xorg-driver/xf86-video-vmware_12.0.2.bb        |    5 -
 .../avoid_automake_errors.patch                    |   83 ++++++++++++++++++++
 .../fix_for_automake-1.12.x.patch                  |   28 +++++++
 meta/recipes-sato/eds/evolution-data-server_git.bb |    4 +-
 .../files/pcmanfm_fix_for_automake_1.12.patch      |   35 ++++++++
 meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb        |    5 +-
 meta/recipes-sato/pimlico/dates_git.bb             |    6 +-
 .../webgit-gtk_fix_build_with_automake_1.12.patch  |   62 +++++++++++++++
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    1 +
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |   51 ++++++++++++
 .../gnutls/gnutls_fix_for_automake_1.12.1.patch    |   43 ++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.20.bb      |    4 +-
 meta/recipes-support/gpgme/gpgme_1.3.2.bb          |    6 +-
 meta/recipes-support/libfm/libfm_0.1.17.bb         |    5 -
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    3 -
 .../libunistring_fix_for_automake_1.12.patch       |   81 +++++++++++++++++++
 .../libunistring/libunistring_0.9.3.bb             |    5 +-
 31 files changed, 549 insertions(+), 88 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/fix_for_automake_1.12.x.patch
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
 create mode 100644 meta/recipes-core/jpeg/jpeg-8d/fix_for_automake_1.12.1.patch
 rename meta/recipes-devtools/automake/{automake_1.11.3.bb => automake_1.12.1.bb} (93%)
 create mode 100644 meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
 create mode 100644 meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch
 create mode 100644 meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch
 create mode 100644 meta/recipes-sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch
 create mode 100644 meta/recipes-sato/webkit/files/webgit-gtk_fix_build_with_automake_1.12.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/gnutls_fix_for_automake_1.12.1.patch
 create mode 100644 meta/recipes-support/libunistring/libunistring/libunistring_fix_for_automake_1.12.patch

-- 
1.7.3.4



