Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SoGyn-00041S-U4
	for Openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:38:34 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 09:27:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175108513"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 09:27:23 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 09:26:08 -0700
Message-Id: <cover.1341850982.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 00/15] commits related to automake update to 1.12.1
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
X-List-Received-Date: Mon, 09 Jul 2012 16:38:34 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This work is based on 1.3_M1 branch to get a stable base. These commits
build core-image-sato-sdk & core-image-lsb images fine.

-Nitin

The following changes since commit 7f017cab0b3e4d5a4fc356eccd8eb8429b0531d0:

  connman: bump PR and add some comments (2012-06-13 13:11:23 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/automake_update
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/automake_update

Nitin A Kamble (15):
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
  gpgme: fix build with automake 1.12.x
  telepathy-glib: fix build with automake 1.12.x
  xf86-video-vmware: fix build with automake 1.12.x
  libfm: fix build with automake 1.12.x
  pango: fix dependencies to avoid build issue

 meta/recipes-connectivity/avahi/avahi.inc          |    3 +-
 .../avahi/files/fix_for_automake_1.12.x.patch      |   34 ++++++++
 .../telepathy/telepathy-glib_0.19.0.bb             |    6 --
 .../jpeg/jpeg-8d/fix_for_automake_1.12.1.patch     |   44 ++++++++++
 meta/recipes-core/jpeg/jpeg_8d.bb                  |    5 +-
 .../automake/automake/path_prog_fixes.patch        |   40 ++--------
 .../{automake_1.11.3.bb => automake_1.12.1.bb}     |    5 +-
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
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |   51 ++++++++++++
 .../gnutls_fix_for_automake_1.12.1.patch           |   43 ++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.19.bb      |    4 +-
 meta/recipes-support/gpgme/gpgme_1.3.1.bb          |    4 -
 meta/recipes-support/libfm/libfm_0.1.17.bb         |    5 -
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    3 -
 23 files changed, 344 insertions(+), 81 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/fix_for_automake_1.12.x.patch
 create mode 100644 meta/recipes-core/jpeg/jpeg-8d/fix_for_automake_1.12.1.patch
 rename meta/recipes-devtools/automake/{automake_1.11.3.bb => automake_1.12.1.bb} (93%)
 create mode 100644 meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch
 create mode 100644 meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch
 create mode 100644 meta/recipes-sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.19/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.19/gnutls_fix_for_automake_1.12.1.patch

-- 
1.7.3.4



