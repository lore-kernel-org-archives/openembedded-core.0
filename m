Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1S8T0N-0005t0-7B
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 09:59:24 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Mar 2012 01:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129677101"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2012 01:50:34 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 16:48:33 +0800
Message-Id: <cover.1331887433.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1][PULL] bitbake.conf: exclude some variables when calculating cache hash
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
X-List-Received-Date: Fri, 16 Mar 2012 08:59:24 -0000

Hi Richard,

This pull request is to fix cache rebuild issue when machine is reboot.

Please help to review and pull.

Thanks,
Dongxiao

The following changes since commit d4f1ef6b8297826230a68e535098709d07de1f48:

  qt4: package static libraries correctly to fix warnings (2012-03-15 13:33:37 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/hob-bugfix-oecore
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob-bugfix-oecore

Dongxiao Xu (1):
  bitbake.conf: Exclude some variables when calculating cache hash

 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.4.1



