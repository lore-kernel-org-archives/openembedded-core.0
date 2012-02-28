Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1S2E8q-00037t-GV
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 04:54:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Feb 2012 19:45:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="112470940"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.62])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2012 19:44:52 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 11:42:52 +0800
Message-Id: <cover.1330400450.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] bitbake-prserv-tool adepted to new bitbake cache
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
X-List-Received-Date: Tue, 28 Feb 2012 03:54:20 -0000

Modified the bitbake-prserv-tool scripts to trigger reparse according to the 
new content-based bitbake cache mechanism.

The following changes since commit 8d4db8e6dcd2d25637cb77515fe776552f2fdd6d:
  Dongxiao Xu (1):
        bitbake.conf: Create a new filter variable BB_HASHCONFIG_WHITELIST

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/prserv-tool
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/prserv-tool

Lianhao Lu (1):
  scripts/prserv-tool: Adepted to new bitbake cache.

 scripts/bitbake-prserv-tool |   28 +++++++++++++++++-----------
 1 files changed, 17 insertions(+), 11 deletions(-)



