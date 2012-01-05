Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Ribpr-0006e0-K1
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 02:09:39 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Jan 2012 17:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="53380086"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Jan 2012 17:02:11 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 17:02:08 -0800
Message-Id: <cover.1325725256.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/4] x32 recipe fixes + misc commits
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
X-List-Received-Date: Thu, 05 Jan 2012 01:09:39 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 021848be9eeb71de8acfba6c66c11645b01523b8:

  valgrind: Fix for automake update (2012-01-04 16:04:08 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/work
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/work

Nitin A Kamble (4):
  python-pycairo: fix for x32
  libevent: fix compilation for x32
  libxxf86dga: fix compilation with x32 toolchain
  vte: update patch header

 .../python/python-pycairo_1.10.0.bb                |    6 +-
 .../libxxf86dga-1.1.2_fix_for_x32.patch            |   30 ++++++++++++
 .../recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb |    5 ++-
 .../libevent/libevent-2.0.16_fix_for_x32.patch     |   47 ++++++++++++++++++++
 meta/recipes-support/libevent/libevent_2.0.16.bb   |    5 +-
 meta/recipes-support/vte/vte/introspection.patch   |    8 +++
 6 files changed, 95 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxxf86dga/libxxf86dga-1.1.2_fix_for_x32.patch
 create mode 100644 meta/recipes-support/libevent/libevent/libevent-2.0.16_fix_for_x32.patch

-- 
1.7.6.4



