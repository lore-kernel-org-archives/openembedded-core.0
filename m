Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RlfY7-0002uK-S4
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 12:44:00 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Jan 2012 03:36:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="56108694"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Jan 2012 03:36:25 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2012 19:38:46 +0800
Message-Id: <cover.1326454446.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/3 v4][PULL] Hob: oe-core related changes
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
X-List-Received-Date: Fri, 13 Jan 2012 11:44:00 -0000

Hi Richard,

This is the fourth pull request for Hob oe-core related changes.
There are some mistakes happen in the dxu4/hob-bitbake-changes-v3,
so please ignore that one and use this v4.

After some discussion, we found meta-hob should go to oe-core.

Please help to review and pull.

Note that this pull request has dependency on branch dxu4/hob-bitbake-changes-v3.

Changes from v2:
1. Remove the 'layers' from poky repo. We will have some indications in Hob GUI showing where to put new added layers.
2. Move dummy-image.bb and dummy-toolchain.bb to meta-hob layer.
3. Listen the specific event 'RequestPackageInfo' and then pass package information to GUI client.

Thanks,
Dongxiao


The following changes since commit 1d2697e6f00cc3771f39f5a7d4384a22d9696b16:
  Richard Purdie (1):
        multilib.conf: Clean up file and add missing entries for various dependencies

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib dxu4/hob-oecore-changes-v4
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob-oecore-changes-v4

Dongxiao Xu (2):
  packageinfo.bbclass: add a new bbclass to pass package information
  meta-hob: Add a new meta-hob layer

Shane Wang (1):
  package.bbclass: set package size into pkgdata for hob2's use

 meta-hob/COPYING.MIT                          |   17 ++++++++++++++
 meta-hob/conf/layer.conf                      |    9 +++++++
 meta-hob/recipes-core/images/dummy-image.bb   |    1 +
 meta-hob/recipes-core/meta/dummy-toolchain.bb |   10 ++++++++
 meta/classes/package.bbclass                  |    8 ++++++
 meta/classes/packageinfo.bbclass              |   30 +++++++++++++++++++++++++
 6 files changed, 75 insertions(+), 0 deletions(-)
 create mode 100644 meta-hob/COPYING.MIT
 create mode 100644 meta-hob/conf/layer.conf
 create mode 100644 meta-hob/recipes-core/images/dummy-image.bb
 create mode 100644 meta-hob/recipes-core/meta/dummy-toolchain.bb
 create mode 100644 meta/classes/packageinfo.bbclass



