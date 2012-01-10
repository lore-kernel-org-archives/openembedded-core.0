Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RkZCm-0003TG-SB
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 11:45:25 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Jan 2012 02:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110605095"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jan 2012 02:37:55 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 18:53:59 +0800
Message-Id: <cover.1326192666.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] hdparm: upgrade to 9.37
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
X-List-Received-Date: Tue, 10 Jan 2012 10:45:25 -0000

This patch is to upgrade hdparm to 9.37 and bring its new dependency stat.
Please review.

The following changes since commit 468998cddbe1a803096c9b357e1b5daa3b7e8c2e:

  command.py: add parseConfigurationFiles API (2012-01-06 16:01:44 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib shane/upgrade3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/upgrade3

Shane Wang (1):
  hdparm: upgrade to 9.37

 .../recipes-extended/hdparm/hdparm-6.3/bswap.patch |   37 --------------------
 .../hdparm/hdparm-6.3/uclibc.patch                 |   34 ------------------
 meta/recipes-extended/hdparm/hdparm_6.3.bb         |   18 ---------
 meta/recipes-extended/hdparm/hdparm_9.37.bb        |   36 +++++++++++++++++++
 meta/recipes-extended/stat/stat_3.3.bb             |   27 ++++++++++++++
 5 files changed, 63 insertions(+), 89 deletions(-)
 delete mode 100644 meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch
 delete mode 100644 meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch
 delete mode 100644 meta/recipes-extended/hdparm/hdparm_6.3.bb
 create mode 100644 meta/recipes-extended/hdparm/hdparm_9.37.bb
 create mode 100644 meta/recipes-extended/stat/stat_3.3.bb

-- 
1.7.6



