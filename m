Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QUTdT-0004n3-Uh
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 03:02:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jun 2011 17:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,340,1304319600"; d="scan'208";a="10986405"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by orsmga002.jf.intel.com with ESMTP; 08 Jun 2011 17:57:42 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 09:08:31 +0800
Message-Id: <cover.1307581528.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][PULL] Fix udevd launch issue
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
X-List-Received-Date: Thu, 09 Jun 2011 01:02:16 -0000

Hi Saul,

This commit fixes the udevd launch issue after system second boot. [YOCTO #1146].
Without udevd daemon, device nodes will not be created if dynamically insert a kernel module.

Please help to review and pull.

The following changes since commit 5af197b55a4b779f1ec93186f0723026949ba2b5:

  cache: Implement multiple extra cache fields request support (2011-06-07 22:40:01 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/bugfix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/bugfix

Dongxiao Xu (1):
  udev: Fix udevd launch issue after system second boot

 meta/recipes-core/udev/udev-164/init |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



