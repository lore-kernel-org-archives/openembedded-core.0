Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QreQx-0005VE-NO
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 01:13:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2011 16:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="36969604"
Received: from unknown (HELO localhost) ([10.7.199.156])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2011 16:08:30 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: bruce.ashfield@windriver.com, tom.zanussi@intel.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 16:08:13 -0700
Message-Id: <cover.1313092152.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 00/10] Refresh meta-rt and move the recipes under meta
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
X-List-Received-Date: Thu, 11 Aug 2011 23:13:04 -0000

This series brings the existing linux-yocto-rt recipe inline with the
main linux-yocto recipe. It cleans up the meta-rt directory structure
in preparation to move its contents under meta. It adds a 3.0.1-rt8
linux-yocto recipe. Finally, it moves it all under meta and adds a
basic README.

The following changes since commit 0350be945877b61eb8125663887fd7ed1c3923ab:

  scripts/runqemu: Make it run on ubuntu 11.10 (2011-08-11 19:22:06 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/rt-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/rt-oe

Darren Hart (10):
  meta-rt: refresh linux-yocto-rt recipe
  meta-rt: rt-tests v0.73 instead of AUTOREV
  meta-rt: canonicalize directory structure
  meta-rt: add linux-yocto-rt_3.0 recipe
  meta-rt: remove atom-pc support from the main layer
  meta-rt: rename minimal-rt images to -rt, drop live image
  meta-rt: add an -rt-sdk image
  meta-rt: default KMACHINE and SRCREV_machine to avoid parsing errors
  Move meta-rt recipes to oe-core (meta)
  recipes-rt: add a README documenting the contents of recipes-rt

 meta-rt/conf/layer.conf                            |   23 --------
 .../recipes-kernel/linux/linux-yocto-rt_2.6.34.bb  |   14 ++++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |   55 ++++++++++++++++++++
 meta/recipes-rt/README                             |   13 +++++
 meta/recipes-rt/images/core-image-rt-sdk.bb        |   15 +++++
 .../recipes-rt/images/core-image-rt.bb             |    2 +-
 .../recipes-rt/rt-tests/rt-tests_0.73.bb           |    2 +-
 7 files changed, 95 insertions(+), 29 deletions(-)
 delete mode 100644 meta-rt/conf/layer.conf
 rename meta-rt/recipes-kernel/linux-yocto-rt_stablegit.bb => meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb (64%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
 create mode 100644 meta/recipes-rt/README
 create mode 100644 meta/recipes-rt/images/core-image-rt-sdk.bb
 rename meta-rt/images/core-image-minimal-rt.bb => meta/recipes-rt/images/core-image-rt.bb (78%)
 rename meta-rt/recipes-tests/rt-tests_git.bb => meta/recipes-rt/rt-tests/rt-tests_0.73.bb (97%)

-- 
1.7.6



