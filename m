Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RfDx2-0000fT-Pf
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Dec 2011 18:03:04 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Dec 2011 08:55:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="91636064"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 26 Dec 2011 08:55:51 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Dec 2011 01:08:06 +0800
Message-Id: <cover.1324918958.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/5] [V1] Upgrade 4 more packages, Dec 27, 2011
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
X-List-Received-Date: Mon, 26 Dec 2011 17:03:05 -0000

All,

These are recipe upgrading for freetype, minicom, libical, and libsamplerate0. Please review and pull.

The following changes since commit f5aa3bbda623c8fae3a761d72fddc95631ad0706:

  coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:47 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib shane/upgrade2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/upgrade2

Shane Wang (5):
  freetype: upgrade to 2.4.8
  minicom: upgrade to 2.5
  libical: upgrade to 0.48
  libsamplerate0: upgrade to 0.1.8
  distro_tracking_fields: update the info for recipe upgrade.

 .../conf/distro/include/distro_tracking_fields.inc |   10 ++++----
 .../{minicom-2.4 => minicom-2.5}/gcc4-scope.patch  |    0
 .../rename-conflicting-functions.patch             |    0
 .../minicom/{minicom_2.4.bb => minicom_2.5.bb}     |    6 ++--
 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.6.bb => freetype_2.4.8.bb}       |    6 ++--
 .../libsamplerate-0.1.7-macro-quoting.patch        |   22 --------------------
 ...amplerate0_0.1.7.bb => libsamplerate0_0.1.8.bb} |    9 +++----
 .../libical/{libical_0.47.bb => libical_0.48.bb}   |    6 ++--
 9 files changed, 18 insertions(+), 41 deletions(-)
 rename meta/recipes-extended/minicom/{minicom-2.4 => minicom-2.5}/gcc4-scope.patch (100%)
 rename meta/recipes-extended/minicom/{minicom-2.4 => minicom-2.5}/rename-conflicting-functions.patch (100%)
 rename meta/recipes-extended/minicom/{minicom_2.4.bb => minicom_2.5.bb} (75%)
 rename meta/recipes-graphics/freetype/{freetype-2.4.6 => freetype-2.4.8}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.6.bb => freetype_2.4.8.bb} (91%)
 delete mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch
 rename meta/recipes-multimedia/libsamplerate/{libsamplerate0_0.1.7.bb => libsamplerate0_0.1.8.bb} (61%)
 rename meta/recipes-sato/libical/{libical_0.47.bb => libical_0.48.bb} (78%)

-- 
1.7.6



