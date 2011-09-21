Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R6S6c-0002ey-5p
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 21:05:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Sep 2011 11:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,418,1312182000"; d="scan'208";a="51849287"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 21 Sep 2011 11:59:53 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 03:06:51 +0800
Message-Id: <cover.1316631873.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][PULL] multilib: two step of rpm rootfs installation.
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
X-List-Received-Date: Wed, 21 Sep 2011 19:05:14 -0000

Hi Richard and Saul,

This pull request implement the two step of rpm rootfs installation,
please help to review and pull.

Thanks,
Dongxiao

The following changes since commit bcfff457f63f43f53bcaf04f116e09bb2bba9bd6:

  Fix mercurial fetcher in fetch2 (2011-09-21 14:07:31 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml-testing
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml-testing

Dongxiao Xu (1):
  rootfs_rpm: two step installation

 meta/classes/package_rpm.bbclass |   54 +++++++++++++++++++++++++++++++++++---
 1 files changed, 50 insertions(+), 4 deletions(-)



