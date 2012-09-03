Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T8ZtD-0001A9-Aj
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 18:52:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Sep 2012 09:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,360,1344236400"; d="scan'208";a="188269321"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by azsmga001.ch.intel.com with ESMTP; 03 Sep 2012 09:40:20 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 18:45:15 +0300
Message-Id: <cover.1346686600.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/9] Package upgrades
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
X-List-Received-Date: Mon, 03 Sep 2012 16:52:43 -0000

This is another set of package upgrades compiled on all architectures and
tested using core-image-sato.
The following changes since commit 37c8597e7600385367257e8a513e003947ebef5b:

  distro-tracking: remove xserver-kdrive (2012-09-02 05:52:16 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cmuscax/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cmuscax/upgrades

Constantin Musca (9):
  automake: upgrade to 1.12.3
  gypsy: upgrade to 0.9
  libdrm: upgrade to 2.4.39
  lsof: upgrade to 4.86
  man-pages: upgrade to 3.42
  telepathy-glib: upgrade to 0.19.8
  freetype: upgrade to 2.4.10
  puzzles: upgrade to r9594
  iproute2: upgrade to 3.5.1

 .../fix-unused-but-set-variable-warning.patch      |   18 ------------------
 .../gypsy/{gypsy_0.8.bb => gypsy_0.9.bb}           |   10 ++++------
 .../configure-cross.patch                          |    0
 .../{iproute2_3.5.0.bb => iproute2_3.5.1.bb}       |    4 ++--
 ...thy-glib_0.19.6.bb => telepathy-glib_0.19.8.bb} |    4 ++--
 .../{automake_1.12.1.bb => automake_1.12.3.bb}     |    6 +++---
 .../lsof/{lsof_4.85.bb => lsof_4.86.bb}            |    8 ++++----
 .../{man-pages_3.41.bb => man-pages_3.42.bb}       |    6 +++---
 .../drm/{libdrm_2.4.37.bb => libdrm_2.4.39.bb}     |    4 ++--
 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.9.bb => freetype_2.4.10.bb}      |    6 +++---
 .../puzzles/{puzzles_r9561.bb => puzzles_r9594.bb} |    0
 12 files changed, 23 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch
 rename meta/recipes-connectivity/gypsy/{gypsy_0.8.bb => gypsy_0.9.bb} (79%)
 rename meta/recipes-connectivity/iproute2/{iproute2-3.5.0 => iproute2-3.5.1}/configure-cross.patch (100%)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.5.0.bb => iproute2_3.5.1.bb} (51%)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.6.bb => telepathy-glib_0.19.8.bb} (80%)
 rename meta/recipes-devtools/automake/{automake_1.12.1.bb => automake_1.12.3.bb} (92%)
 rename meta/recipes-extended/lsof/{lsof_4.85.bb => lsof_4.86.bb} (88%)
 rename meta/recipes-extended/man-pages/{man-pages_3.41.bb => man-pages_3.42.bb} (81%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.37.bb => libdrm_2.4.39.bb} (50%)
 rename meta/recipes-graphics/freetype/{freetype-2.4.9 => freetype-2.4.10}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.9.bb => freetype_2.4.10.bb} (90%)
 rename meta/recipes-sato/puzzles/{puzzles_r9561.bb => puzzles_r9594.bb} (100%)

-- 
1.7.9.5



