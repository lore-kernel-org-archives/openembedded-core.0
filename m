Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SAKYq-00029x-4H
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 13:22:40 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Mar 2012 05:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121485274"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.204])
	by azsmga001.ch.intel.com with ESMTP; 21 Mar 2012 05:12:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 12:12:39 +0000
Message-Id: <cover.1332331918.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] Fix stripped file warnings
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
X-List-Received-Date: Wed, 21 Mar 2012 12:22:40 -0000

The following changes since commit 5d404fdb36b0535ce758d98408b02134cdbce4ee:

  xserver-kdrive: compile xserver without dtrace support (2012-03-20 15:21:18 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/nostrip1
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/nostrip1

Paul Eggleton (3):
  hdparm: fix stripped file warning
  libacpi: fix stripped file warning
  syslinux: fix stripped file warnings

 meta/recipes-bsp/libacpi/libacpi_0.2.bb            |    3 +-
 .../recipes-devtools/syslinux/files/no-strip.patch |   31 ++++++++++++++++++++
 meta/recipes-devtools/syslinux/syslinux_4.03.bb    |    5 ++-
 meta/recipes-extended/hdparm/hdparm_9.39.bb        |    4 ++
 4 files changed, 40 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/syslinux/files/no-strip.patch

-- 
1.7.5.4



