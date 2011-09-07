Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R1DaT-00066L-K2
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 10:34:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Sep 2011 01:29:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,344,1312182000"; d="scan'208";a="49889885"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga002.fm.intel.com with ESMTP; 07 Sep 2011 01:29:18 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 16:33:40 +0800
Message-Id: <cover.1315384269.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2][PULL] multilib: Fix kernel-module dependency
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
X-List-Received-Date: Wed, 07 Sep 2011 08:34:28 -0000

Hi Richard,

This pull request is to fix the dependency/recommends of kernel-module-* in
other recipes. Besides, there is another patch to remove the linux-yocto
extension in multilib.conf. Please help to review and pull.

Thanks,
Dongxiao


The following changes since commit 41b7c955cfdc7b4d5c667c8a8742237d5edaca4f:

  icu-3.6: fix building with big make -j (2011-09-05 20:38:50 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml

Dongxiao Xu (2):
  multilib_global.bbclass: handle kernel-module-* for multilib
  multilib: Remove the multilib extension for linux-yocto

 meta/classes/multilib_global.bbclass |    2 ++
 meta/conf/multilib.conf              |    1 -
 2 files changed, 2 insertions(+), 1 deletions(-)



