Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SBGw0-0003bT-7V
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 03:42:28 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Mar 2012 19:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="121121567"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by orsmga001.jf.intel.com with ESMTP; 23 Mar 2012 19:33:29 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Mar 2012 10:31:13 +0800
Message-Id: <cover.1332555951.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1 v2][PULL] Hob: Define patterns to implement runqemu/deploy functionality filter
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
X-List-Received-Date: Sat, 24 Mar 2012 02:42:29 -0000

Hi Richard,

This pull request is for defining patterns in bitbake server side to implement the runqemu/deploy functionality filter for Hob.
Please help to review and pull.

Changes from v1:
Move the pattern definition from bitbake.conf to image_types.bbclass

Thanks,
Dongxiao

The following changes since commit 1642f519bb30b3ebcfb6170cdbbc0e327d057012:

  iptables: fix build error against 3.2+ kernel headers (2012-03-24 00:11:52 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/hob-bugfix-oecore
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob-bugfix-oecore

Dongxiao Xu (1):
  image_types.bbclass: Define runnable and deployable pattern

 meta/classes/image_types.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

-- 
1.7.4.1



