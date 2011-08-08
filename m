Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QqGj1-0001Zc-Q8
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 05:42:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Aug 2011 20:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,335,1309762800"; d="scan'208";a="35481495"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2011 20:37:30 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2011 11:39:22 +0800
Message-Id: <cover.1312774699.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] More recipes in multilib.conf
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
X-List-Received-Date: Mon, 08 Aug 2011 03:42:00 -0000

Added more recipes supporting multilib extend.

The following changes since commit 7a278238d9b08e0315e92d386282cb488cc0c7b4:
  Kumar Gala (1):
        bitbake.conf/powerpc64: Set baselib to 'lib64' for ppc64

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/multilib.conf
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/multilib.conf

Lianhao Lu (1):
  multilib.conf: Supported multilib extend in more recipes.

 meta/conf/multilib.conf |  449 +++++++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 436 insertions(+), 13 deletions(-)



