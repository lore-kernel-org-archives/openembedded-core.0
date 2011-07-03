Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QdMO8-0003Fz-Mm
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jul 2011 15:07:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jul 2011 06:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,467,1304319600"; d="scan'208";a="23267045"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2011 06:03:16 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Jul 2011 21:03:12 +0800
Message-Id: <cover.1309698011.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/5] upgrade recipes
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
X-List-Received-Date: Sun, 03 Jul 2011 13:07:05 -0000

upgrade the recipe libidn, libdrm, xauth, sqlite, also update the manual check
field in distro_tracking_field

The following changes since commit ad2363278f0ea86fcf3464f8f6073d3a3d06be63:
  Khem Raj (1):
        uclibc: Fix compilation in thumb mode

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kyu3/upgrade-0701
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/upgrade-0701

Yu Ke (5):
  libidn: upgrade from 1.20 to 1.22
  libdrm: upgrade to 2.4.26
  xauth: upgrade from 1.05 to 1.06
  sqlite: upgrade from 3.7.6.2 to 3.7.7.1
  distro_tracking_field: update the manually check field

 .../conf/distro/include/distro_tracking_fields.inc |    6 +++++-
 .../libidn/{libidn_1.20.bb => libidn_1.22.bb}      |    5 +----
 meta/recipes-graphics/drm/libdrm.inc               |    3 +++
 .../{libdrm-2.4.25 => libdrm}/installtests.patch   |    0
 .../drm/{libdrm_2.4.25.bb => libdrm_2.4.26.bb}     |    4 ++--
 .../xorg-app/{xauth_1.0.5.bb => xauth_1.0.6.bb}    |    4 ++--
 meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb     |   10 ----------
 meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb     |   10 ++++++++++
 8 files changed, 23 insertions(+), 19 deletions(-)
 rename meta/recipes-extended/libidn/{libidn_1.20.bb => libidn_1.22.bb} (79%)
 rename meta/recipes-graphics/drm/{libdrm-2.4.25 => libdrm}/installtests.patch (100%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.25.bb => libdrm_2.4.26.bb} (54%)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.5.bb => xauth_1.0.6.bb} (68%)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb



