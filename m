Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RSZNh-0006En-B2
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 20:18:17 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Nov 2011 11:11:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="78490943"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 21 Nov 2011 11:11:46 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2011 11:11:43 -0800
Message-Id: <cover.1321902595.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
Subject: [PATCH 0/1] fix yocto layer
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
X-List-Received-Date: Mon, 21 Nov 2011 19:18:17 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

netbase.bbappend file from meta-yocto layer was lagging behind the meta layer.

The following changes since commit 7022a8f8045bdf82b9209b8cd62fb09c4a7a24f8:

  gcc-4.6: Fix gcc ICE on qt4-x11-free/armv7-a (2011-11-21 16:55:12 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  netbase.bbappend: sync up with oecore/yocto layer

 .../beagleboard/interfaces                         |    0
 ...netbase_4.46.bbappend => netbase_4.47.bbappend} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-yocto/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/beagleboard/interfaces (100%)
 rename meta-yocto/recipes-core/netbase/{netbase_4.46.bbappend => netbase_4.47.bbappend} (100%)

-- 
1.7.4.4



