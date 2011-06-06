Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QTig2-0001We-2w
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 00:53:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Jun 2011 15:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,328,1304319600"; d="scan'208";a="10273897"
Received: from doubt.jf.intel.com (HELO localhost) ([10.7.199.162])
	by orsmga001.jf.intel.com with ESMTP; 06 Jun 2011 15:50:20 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2011 15:50:05 -0700
Message-Id: <cover.1307400276.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1][meta-ti] linux-omap: cleanup and wl1271 build fix
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
X-List-Received-Date: Mon, 06 Jun 2011 22:53:42 -0000

This adds two patches cleaning up whitespace and fixing a build issue with
the iwl12xx expansionboard initialization. These do not apply to the linux-omap
tree directly, and need to be pushed along with the rest of the patches
currently residing in the linux-omap directory.

The following changes since commit cb3d37c30fa71afeda8127e963965542f0171471:

  linux-omap4: sync with OE .dev (2011-05-09 11:57:55 +0200)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib dvhart/beagleboard
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dvhart/beagleboard

Darren Hart (1):
  beagleboard: cleanup board-omap3beagle.c and allow for building
    without wl1271

 ...0001-board-omap3beagle-whitespace-cleanup.patch |   91 ++++++++++++++++++++
 ...3beagle-allow-for-building-without-wl1271.patch |   42 +++++++++
 recipes-bsp/linux/linux-omap_2.6.37.bb             |    2 +
 3 files changed, 135 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/linux/linux-omap/0001-board-omap3beagle-whitespace-cleanup.patch
 create mode 100644 recipes-bsp/linux/linux-omap/0002-board-omap3beagle-allow-for-building-without-wl1271.patch



