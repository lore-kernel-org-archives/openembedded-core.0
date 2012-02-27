Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1S21sW-00039o-Cr
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 15:48:40 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Feb 2012 06:39:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="115271534"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by orsmga002.jf.intel.com with ESMTP; 27 Feb 2012 06:39:51 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 22:38:26 +0800
Message-Id: <cover.1330353101.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1 v2][PULL] bitbake.conf: Add DATE and TIME to BB_HASH_WHITELIST
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
X-List-Received-Date: Mon, 27 Feb 2012 14:48:40 -0000

Hi Richard,

This pull request adds DATE and TIME into BB_HASHCONFIG_WHITELIST, please help to review and pull.

Changes from v1:
Use a new variable BB_HASHCONFIG_WHITELIST as the filter instead of BB_HASHBASE_WHITELIST.

Thanks,
Dongxiao

The following changes since commit 6e1065a4988489baa762f7dc1535fe326e0ba7b5:

  arch-armv7.inc: fix quoting (2012-02-26 23:01:36 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/oecore-bugfix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/oecore-bugfix

Dongxiao Xu (1):
  bitbake.conf: Create a new filter variable BB_HASHCONFIG_WHITELIST

 meta/conf/bitbake.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

-- 
1.7.4.1



