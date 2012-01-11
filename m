Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rkwf7-0005bT-5C
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 12:48:13 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Jan 2012 03:40:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="96958890"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 11 Jan 2012 03:40:29 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 19:53:23 +0800
Message-Id: <cover.1326282692.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/2][V2] upgrade hdparm to 9.37 and add its dependency stat 3.3
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
X-List-Received-Date: Wed, 11 Jan 2012 11:48:13 -0000

This patch is to upgrade hdparm to 9.37 and bring its new dependency stat 3.3.
Please review.

The following changes since commit 468998cddbe1a803096c9b357e1b5daa3b7e8c2e:

  command.py: add parseConfigurationFiles API (2012-01-06 16:01:44 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib shane/upgrade3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/upgrade3

Shane Wang (2):
  stat: add recipe stat with version 3.3
  hdparm: upgrade to 9.37

 .../recipes-extended/hdparm/hdparm-6.3/bswap.patch |   37 --------------------
 .../hdparm/hdparm-6.3/uclibc.patch                 |   34 ------------------
 meta/recipes-extended/hdparm/hdparm_6.3.bb         |   18 ---------
 meta/recipes-extended/hdparm/hdparm_9.37.bb        |   36 +++++++++++++++++++
 meta/recipes-extended/stat/stat_3.3.bb             |   26 ++++++++++++++
 5 files changed, 62 insertions(+), 89 deletions(-)
 delete mode 100644 meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch
 delete mode 100644 meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch
 delete mode 100644 meta/recipes-extended/hdparm/hdparm_6.3.bb
 create mode 100644 meta/recipes-extended/hdparm/hdparm_9.37.bb
 create mode 100644 meta/recipes-extended/stat/stat_3.3.bb

-- 
1.7.6



