Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R8SqT-0006pJ-32
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 10:16:55 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Sep 2011 01:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,448,1312182000"; d="scan'208";a="56076849"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 27 Sep 2011 01:11:17 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2011 16:19:19 +0800
Message-Id: <cover.1317109075.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][PULL] multilib: map RDEPENDS for image type recipe
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
X-List-Received-Date: Tue, 27 Sep 2011 08:16:55 -0000

Hi Richard,

This pull request is to fix the bug 1496 and 1527, which maps RDEPENDS for image type recipes.

Please help to review and pull.

Thanks,
Dongxiao

The following changes since commit 684a4b517d13884c315688967fadd5e6a4845b71:

  libffi: really populate -dev package (2011-09-26 20:50:27 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml

Dongxiao Xu (1):
  multilib.bbclass: map RDEPENDS for image recipes

 meta/classes/multilib.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)



