Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQ17B-0007uK-He
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 20:50:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 11:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138571385"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 03 May 2012 11:41:10 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 11:41:09 -0700
Message-Id: <cover.1336070422.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/1] fix for avahi breakage
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
X-List-Received-Date: Thu, 03 May 2012 18:50:57 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit b36664cca05ac4538859c6dca00fbf84b0fee050:

  xf86-video-vmware: fix build issue (2012-05-03 11:12:34 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/upgrades2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades2

Nitin A Kamble (1):
  avahi: fix install issue

 meta/recipes-connectivity/avahi/avahi.inc          |    6 ++-
 .../avahi/files/avahi_fix_install_issue.patch      |   32 ++++++++++++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch

-- 
1.7.7



