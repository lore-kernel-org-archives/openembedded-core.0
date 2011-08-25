Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QwR1W-0005vP-TV
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 05:54:35 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Aug 2011 20:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,279,1312182000"; d="scan'208";a="42205004"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2011 20:49:46 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Aug 2011 11:51:43 +0800
Message-Id: <cover.1314244112.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][PULL] Fix bug 1370: IPK will not be built out if package_ipk is not first in PACKAGE_CLASSES
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
X-List-Received-Date: Thu, 25 Aug 2011 03:54:35 -0000

Hi Richard and Saul,

This pull request is to fix bug 1370, please help to review and pull.

Thanks,
Dongxiao

The following changes since commit 445d6426197579a9c0317498cc6919bb63e7f726:

  meta-toolchain/environment: Collected site config files in runtime. (2011-08-24 19:26:01 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/bugfix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/bugfix

Dongxiao Xu (1):
  package.bbclass: Fix recrdeptask of image type recipes

 meta/classes/package.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



