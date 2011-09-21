Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R6Hyp-0006ak-Ik
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 10:16:31 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Sep 2011 01:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,415,1312182000"; d="scan'208";a="19118353"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Sep 2011 01:11:11 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 16:18:08 +0800
Message-Id: <cover.1316592963.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][PULL] libpng: fix rootfs error caused by dangling link in libpng package
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
X-List-Received-Date: Wed, 21 Sep 2011 08:16:31 -0000

Hi Richard and Saul,

This pull request fixes the libpng dangling link, please help to review and pull.

It should fix the problem of rootfs error that Saul met in multilib build.

Thanks,
Dongxiao

The following changes since commit 6f2ff4f804bb29202d04cf69dcc7da845cda2b2b:

  multilib_global.bbclass: Fix non-multilib package provides (2011-09-20 17:39:15 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml-testing
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml-testing

Dongxiao Xu (1):
  libpng: avoid dangling link in libpng package

 meta/recipes-multimedia/libpng/libpng_1.2.46.bb |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)



