Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R3idW-0003xV-62
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 08:07:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Sep 2011 23:02:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,378,1312182000"; d="scan'208";a="16898076"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Sep 2011 23:02:37 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 14:08:14 +0800
Message-Id: <cover.1315980095.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/3][RFC v2] rpm: multilib related fixes
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
X-List-Received-Date: Wed, 14 Sep 2011 06:07:54 -0000

Hi Richard and Mark,

This is the second version of RFC to fix multilib related issue to RPM, includes:

1) Add architecture information in RPM spec file to fix bug 1457.
2) Define override for MACHINE to avoid confliction with normal recipe in deploy folder.
3) Add MULTILIB_IMAGE_INSTALL in the package installation list.

We have another patch related with local.conf.sample.extended, which will be sent to poky@yoctoproject.org.

Change from v1:
1) we define MACHINE override for multilib instead of add MLPREFIX in front of MACHINE_ARCH.


The following changes since commit 8df322abfd3fa8c460fd73c83c1ef0b5e419dc11:

  core-image-minimal: Add missing POKY_EXTRA_IMAGE variable (2011-09-14 01:27:08 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml2

Dongxiao Xu (3):
  package_rpm: add architecture info in rpm spec file
  rootfs_rpm: Use specific MACHINE_ARCH for multilib recipes
  multilib: install MULTILIB_IMAGE_INSTALL

 meta/classes/multilib.bbclass    |    1 +
 meta/classes/package_rpm.bbclass |   78 +++++++++++++++++++++++++++++++-------
 meta/classes/rootfs_rpm.bbclass  |    7 +++
 3 files changed, 72 insertions(+), 14 deletions(-)



