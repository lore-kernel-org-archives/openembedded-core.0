Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QTze5-0006jY-Dd
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 19:00:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Jun 2011 09:57:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,333,1304319600"; 
   d="scan'208";a="8615033"
Received: from unknown (HELO localhost) ([10.255.13.104])
	by azsmga001.ch.intel.com with ESMTP; 07 Jun 2011 09:57:22 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2011 09:57:20 -0700
Message-Id: <cover.1307464747.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH v2 0/1][meta-ti] linux-omap: cleanup and wl1271 build fix
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
X-List-Received-Date: Tue, 07 Jun 2011 17:00:49 -0000

This adds two patches cleaning up whitespace and fixing a build issue with
the iwl12xx expansionboard initialization. These do not apply to the linux-omap
tree directly, and need to be pushed along with the rest of the patches
currently residing in the linux-omap directory.

v2: sync with relocated kernel recipes.

The following changes since commit 675b2a2a54f1bb4b805f61dfc3eba3b5683fee93:

  beagleboard: add comment about rev C5 NAND size (2011-06-07 10:34:57 +0200)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib dvhart/beagleboard
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dvhart/beagleboard

Darren Hart (1):
  beagleboard: cleanup board-omap3beagle.c and allow for building
    without wl1271

 ...0001-board-omap3beagle-whitespace-cleanup.patch |   91 ++++++++++++++++++++
 ...3beagle-allow-for-building-without-wl1271.patch |   42 +++++++++
 recipes-kernel/linux/linux-omap_2.6.37.bb          |    2 +
 3 files changed, 135 insertions(+), 0 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-omap/0001-board-omap3beagle-whitespace-cleanup.patch
 create mode 100644 recipes-kernel/linux/linux-omap/0002-board-omap3beagle-allow-for-building-without-wl1271.patch



