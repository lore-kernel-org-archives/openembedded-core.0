Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R31xj-0001dG-5x
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Sep 2011 10:33:55 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Sep 2011 01:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,367,1312182000"; d="scan'208";a="16143967"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Sep 2011 01:28:42 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2011 16:33:58 +0800
Message-Id: <cover.1315815933.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/3][RFC] rpm: multilib related fixes
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
X-List-Received-Date: Mon, 12 Sep 2011 08:33:55 -0000

Hi Richard and Mark,

This pull request is to fix several multilib related issues to rpm, includes:

1) Add architecture information in RPM spec file to fix bug 1457.
2) For recipes with MACHINE_ARCH as PACKAGE_ARCH, the deploy folder is defined as tmp/deploy/lib32(64)-${MACHINE_ARCH} to avoid confliction with normal recipe deploy folder.
3) Add MULTILIB_IMAGE_INSTALL in the package installation list.

Please help to review them.

Thanks,
Dongxiao

Dongxiao Xu (3):
  package_rpm: add architecture info in rpm spec file
  rpm: add multilib prefix for archs under deploy/rpm
  multilib: install MULTILIB_PACKAGE_INSTALL

 meta/classes/multilib.bbclass    |    6 +++
 meta/classes/package_rpm.bbclass |   78 +++++++++++++++++++++++++++++++-------
 meta/classes/rootfs_rpm.bbclass  |    8 +++-
 3 files changed, 77 insertions(+), 15 deletions(-)



