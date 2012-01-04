Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RiNKr-0006xF-2R
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 10:40:41 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jan 2012 01:33:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92188281"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by azsmga001.ch.intel.com with ESMTP; 04 Jan 2012 01:33:17 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	nitin.a.kamble@intel.com
Date: Wed,  4 Jan 2012 17:33:17 +0800
Message-Id: <cover.1325669461.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] mc: fix configure with automake 1.11.2
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
X-List-Received-Date: Wed, 04 Jan 2012 09:40:41 -0000

The following changes since commit 0ff1d667dc23b0cc903c18f1b5e032c2b6630aae:

  distro: Add poky-tiny distro definition (2012-01-03 21:33:15 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/mc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/mc

Dexuan Cui (1):
  mc:  fix configure with automake 1.11.2

 .../mc/files/fix_for_automake_1.11.2.patch         |   69 ++++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.1.bb               |    3 +-
 2 files changed, 71 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/mc/files/fix_for_automake_1.11.2.patch

-- 
1.7.6



