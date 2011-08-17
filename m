Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qtbzt-0007V0-Pu
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 11:01:14 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Aug 2011 01:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,238,1312182000"; 
   d="scan'208";a="8048772"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Aug 2011 01:56:33 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2011 16:57:04 +0800
Message-Id: <cover.1313571326.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2][PULL] multilib: use ${BPN} in file names
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
X-List-Received-Date: Wed, 17 Aug 2011 09:01:14 -0000

Hi Richard,

This pull request is to fix some file names in certain recipes,
please help to review and pull.

Thanks,
Dongxiao

The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:

  distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade. (2011-08-15 15:26:04 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml2

Dongxiao Xu (2):
  busybox: Change ${PN} to ${BPN} in file names
  sysvinit: Change ${PN} to ${BPN} in file names

 meta/recipes-core/busybox/busybox.inc          |   30 +++++++-------
 meta/recipes-core/busybox/busybox_1.18.4.bb    |    2 +-
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |   52 ++++++++++++------------
 3 files changed, 42 insertions(+), 42 deletions(-)



