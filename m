Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1R3qxN-0003Z5-0J
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 17:00:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Sep 2011 07:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="48343236"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by orsmga002.jf.intel.com with ESMTP; 14 Sep 2011 07:55:45 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 22:55:47 +0800
Message-Id: <cover.1316011972.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] a new patch to bug 1070
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
X-List-Received-Date: Wed, 14 Sep 2011 15:00:57 -0000

The following changes since commit 372fffc4e289f88388de55665b1c5d766b956b37:

  dpkg: fix pkg_postinst_dpkg, don't supply {bindir}/update-alternatives (2011-09-13 21:08:37 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/deb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/deb

Dexuan Cui (1):
  package_deb.bbclass, populate_sdk_deb.bbclass: fix
    meta-toolchain-gmae build

 meta/classes/package_deb.bbclass      |   10 ++++------
 meta/classes/populate_sdk_deb.bbclass |    6 +++++-
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
1.7.6



