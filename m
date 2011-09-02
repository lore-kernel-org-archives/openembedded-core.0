Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QzPgT-0003UB-4V
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 11:05:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Sep 2011 02:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,317,1312182000"; d="scan'208";a="47551316"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga001.fm.intel.com with ESMTP; 02 Sep 2011 02:00:10 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2011 17:03:33 +0800
Message-Id: <cover.1314953755.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/5][PULL] multilib: bug fixes related with kernel, sysroot, rpm, etc.
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
X-List-Received-Date: Fri, 02 Sep 2011 09:05:09 -0000

Hi Richard,

This pull request fixes several multilib bugs.
Please help to review and pull.

Thanks,
Dongxiao


The following changes since commit 06625096f897235ed85f0d9a1355497f92938454:

  scripts: Don't show errors from which ifconfig failing (2011-09-01 20:49:44 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml

Dongxiao Xu (5):
  hal: Remove build time dependency of virtual/kernel
  rootfs_rpm: setting DEFAULTTUNE for multilib archs
  multilib: set NO_MULTILIB for kernel recipes
  multilib: Using different sysroot for multilib recipes
  multilib: extend multilib prefix for libsdl

 meta/classes/kernel.bbclass      |    1 +
 meta/classes/multilib.bbclass    |   11 +++++++++++
 meta/classes/rootfs_rpm.bbclass  |    3 +++
 meta/conf/multilib.conf          |    5 ++++-
 meta/recipes-support/hal/hal.inc |    7 +++----
 5 files changed, 22 insertions(+), 5 deletions(-)



