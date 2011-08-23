Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qvs4g-0004w5-Ds
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 16:35:34 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Aug 2011 07:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,269,1312182000"; d="scan'208";a="43275769"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga002.fm.intel.com with ESMTP; 23 Aug 2011 07:30:28 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2011 22:32:07 +0800
Message-Id: <cover.1314109766.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1 v2][PULL] procps: fix hardcoded libdir
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
X-List-Received-Date: Tue, 23 Aug 2011 14:35:34 -0000

Hi Richard and Saul,

This is the second pull request that fixes the hardcoded libdir in procps to support multilib.
Please help to review and pull.

Thanks,
Dongxiao


The following changes since commit 9134800548a03bfe3a7e351a15f2129bcb3cc680:

  xcb/libpthreads: Add BBCLASSEXTEND to resolve missing providers in world builds (2011-08-19 16:27:29 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/multilib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/multilib

Dongxiao Xu (1):
  procps: Fix lib path to support multilib

 .../procps/procps-3.2.8/install.patch              |   30 +++++++++++++------
 meta/recipes-extended/procps/procps_3.2.8.bb       |    8 ++--
 2 files changed, 24 insertions(+), 14 deletions(-)



