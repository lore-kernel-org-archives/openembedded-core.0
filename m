Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qo6Vl-0003W9-OL
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 06:23:21 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Aug 2011 21:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,305,1309762800"; 
   d="scan'208";a="3261088"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Aug 2011 21:18:46 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2011 12:20:49 +0800
Message-Id: <cover.1312258679.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Set version related variables in environment files.
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
X-List-Received-Date: Tue, 02 Aug 2011 04:23:22 -0000

Fixed bug #1306. Have all the environment files created by meta-toolchain, 
meta-ide-support and meta-envrionment-xxx contain the same version related 
variables.

The following changes since commit 2a41a311ddda11713296391050f3c2c1b2c1d3d3:
  Koen Kooi (1):
        arch-armv7a.inc: fix armv7a-vfp-neon -> armv7a compat case

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug1306
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1306

Lianhao Lu (1):
  environment files: Added and unified version related variables.

 meta/classes/toolchain-scripts.bbclass     |    3 +++
 meta/recipes-core/meta/meta-environment.bb |    2 +-
 meta/recipes-core/meta/meta-ide-support.bb |    2 +-
 meta/recipes-core/meta/meta-toolchain.bb   |    2 +-
 4 files changed, 6 insertions(+), 3 deletions(-)



