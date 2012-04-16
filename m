Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SJg9G-0002L1-KF
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 09:14:54 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Apr 2012 00:05:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="132903233"
Received: from gzhai-xps.sh.intel.com ([10.239.36.76])
	by orsmga002.jf.intel.com with ESMTP; 16 Apr 2012 00:05:28 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 14:49:59 +0800
Message-Id: <cover.1334558917.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Multilib fix, Apr16, 2012
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
X-List-Received-Date: Mon, 16 Apr 2012 07:14:54 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

RP,
This is multilib fix to add missing MLPREFIX. Pls. review and pull
Thanks,
Edwin

The following changes since commit 27aa5489fb40d99c58bb2a4bbf2311e2c502a091:

  distro.conf: Flipping for denzil (2012-04-04 22:48:02 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/fix2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix2

Zhai Edwin (1):
  Multilib: Fix RDEPENDS in libc-package.bbclass, useradd.bbclass...

 meta/classes/gconf.bbclass        |    2 +-
 meta/classes/libc-package.bbclass |    2 +-
 meta/classes/useradd.bbclass      |    3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
1.7.5.4



