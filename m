Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1T5PTy-00030h-9z
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 01:09:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Aug 2012 15:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,313,1344236400"; d="scan'208";a="191262648"
Received: from unknown (HELO localhost) ([10.255.13.23])
	by orsmga002.jf.intel.com with ESMTP; 25 Aug 2012 15:57:23 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Aug 2012 17:57:19 -0500
Message-Id: <cover.1345935181.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] add flex/bison to perf DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Aug 2012 23:09:34 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

To potentially fix a build problem seen on the yocto autobuilder.

I'm not able to reproduce the problem myself without this patch,
but it looks like these dependencies should be added regardless.

The following changes since commit b4c5725af4cd85d5644f0373e2674e903c4eab2b:

  yocto-bsp: add missing xserver-xf86-config .bbappend for qemu (2012-08-25 14:47:07 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib.git tzanussi/perf-bison-flex-depends
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/perf-bison-flex-depends

Tom Zanussi (1):
  perf: add bison and flex to DEPENDS

 meta/recipes-kernel/perf/perf_3.4.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.4.1



