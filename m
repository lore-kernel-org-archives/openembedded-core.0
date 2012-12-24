Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn6Qq-0003sI-U1
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 12:43:37 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Dec 2012 03:28:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="184316265"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Dec 2012 03:28:04 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 13:28:37 +0200
Message-Id: <cover.1356347599.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 0/3] Multilib fixes
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
X-List-Received-Date: Mon, 24 Dec 2012 11:43:40 -0000

This represents a set of multilib fixes.
The following changes since commit 90c0eb29f0b41e4ac2d3d17ebad7295c2ebdc02a:

  rootfs_rpm.bbclass: remove debug code (2012-12-19 21:43:55 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib cmuscax/multilib3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=cmuscax/multilib3

Constantin Musca (3):
  multilib: fix allarch/kernel/module-base multilib issues
  xserver-xorg: enable multilib
  xorg-driver: enable multilib

 meta/classes/multilib.bbclass                      |  3 +++
 meta/classes/multilib_global.bbclass               |  5 +++-
 meta/classes/package.bbclass                       | 30 ++++++++++++++++++++++
 meta/classes/sanity.bbclass                        |  4 +++
 meta/conf/multilib.conf                            |  2 ++
 .../xorg-driver/xorg-driver-common.inc             |  5 ++--
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  5 ++--
 7 files changed, 49 insertions(+), 5 deletions(-)

-- 
1.7.11.7



