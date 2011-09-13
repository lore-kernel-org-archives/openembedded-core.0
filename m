Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1R3T9M-00068t-5R
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 15:35:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Sep 2011 06:30:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,374,1312182000"; d="scan'208";a="48241519"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by azsmga001.ch.intel.com with ESMTP; 13 Sep 2011 06:30:33 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2011 21:30:36 +0800
Message-Id: <cover.1315920580.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] fix to bug 1070
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
X-List-Received-Date: Tue, 13 Sep 2011 13:35:44 -0000

The following changes since commit 8fce8180c802ad187c4df44c17207bfb026ce6c7:

  shadow: add patch for useradd lossage (2011-09-09 18:42:47 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/deb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/deb

Dexuan Cui (1):
  dpkg: fix pkg_postinst_dpkg, don't supply
    {bindir}/update-alternatives

 meta/recipes-devtools/dpkg/dpkg.inc         |   19 ++++++++-----------
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb |    2 +-
 2 files changed, 9 insertions(+), 12 deletions(-)

-- 
1.7.6



