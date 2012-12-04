Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tfosq-0007zW-Pa
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 10:33:44 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2012 01:18:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,214,1355126400"; d="scan'208";a="228661808"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2012 01:18:15 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 11:19:00 +0200
Message-Id: <cover.1354611254.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 0/5] Package upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 09:33:45 -0000

This is a set of package upgrades tested using core-image-sato.
The following changes since commit da6c266b1184eed8b1bc851f24a9ee17ab56d562:

  xserver-xorg: restore packaging for the DRI/DRI2/DBE extensions (2012-12-03 16:38:35 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib cmuscax/pus
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=cmuscax/pus

Constantin Musca (5):
  ethtool: upgrade to 3.6
  libxcb: upgrade to 1.9
  libxslt: upgrade to 1.1.28
  lighttpd: upgrade to 1.4.32
  puzzles: upgrade to r9712

 .../ethtool/{ethtool_3.5.bb => ethtool_3.6.bb}     |  4 +--
 .../files/lighttpd_fix_for_automake-1.12.patch     | 37 ----------------------
 .../{lighttpd_1.4.31.bb => lighttpd_1.4.32.bb}     |  5 ++-
 .../xcb/{libxcb_1.8.1.bb => libxcb_1.9.bb}         |  4 +--
 .../puzzles/{puzzles_r9660.bb => puzzles_r9712.bb} |  2 +-
 .../{libxslt_1.1.27.bb => libxslt_1.1.28.bb}       |  4 +--
 6 files changed, 9 insertions(+), 47 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_3.5.bb => ethtool_3.6.bb} (79%)
 delete mode 100644 meta/recipes-extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.31.bb => lighttpd_1.4.32.bb} (90%)
 rename meta/recipes-graphics/xcb/{libxcb_1.8.1.bb => libxcb_1.9.bb} (55%)
 rename meta/recipes-sato/puzzles/{puzzles_r9660.bb => puzzles_r9712.bb} (96%)
 rename meta/recipes-support/libxslt/{libxslt_1.1.27.bb => libxslt_1.1.28.bb} (87%)

-- 
1.7.11.7



