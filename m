Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R3RXM-0003Zp-NM
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 13:52:24 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Sep 2011 04:47:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,373,1312182000"; d="scan'208";a="16535089"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Sep 2011 04:47:13 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2011 19:52:43 +0800
Message-Id: <cover.1315914682.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2][PULL] multilib: fix multiple (r)provider issue when parsing
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
X-List-Received-Date: Tue, 13 Sep 2011 11:52:25 -0000

Hi Richard,

This pull request fixes the multiple provider issue when bitbake multilib image.

Please help to review and pull.

Thanks,
Dongxiao

The following changes since commit 8fce8180c802ad187c4df44c17207bfb026ce6c7:

  shadow: add patch for useradd lossage (2011-09-09 18:42:47 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml2

Dongxiao Xu (2):
  base.bbclass: do not expand PREFERRED_PROVIDER for kernel recipe
  multilib: Remove recipe from multilib.conf that inherits allarch

 meta/classes/base.bbclass            |    4 +++-
 meta/classes/multilib_global.bbclass |    4 ++++
 meta/conf/multilib.conf              |    2 --
 3 files changed, 7 insertions(+), 3 deletions(-)



