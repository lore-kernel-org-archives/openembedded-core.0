Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RkoZA-0005eK-50
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 04:09:32 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Jan 2012 19:02:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="96814609"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by orsmga002.jf.intel.com with ESMTP; 10 Jan 2012 19:02:01 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 11:04:12 +0800
Message-Id: <cover.1326249734.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/5 v2][PULL] Hob: oe-core related changes
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
X-List-Received-Date: Wed, 11 Jan 2012 03:09:32 -0000

Hi Richard,

This is the second pull request for Hob oe-core related changes.

Please help to review and pull.

Note that this pull request has dependency on branch dxu4/hob-bitbake-changes-v2.

Changes from v1:
1. Change the way to pass package information to GUI.
   In v1 we defined a do_packageinfo task to pass the package information of built recipes.
   Here we use a new approach to pass all the available package information to the client GUI.
2. Change the name for hob.bb and hob-toolchain.bb to dummy-image.bb and dummy-toolchain.bb.

Thanks,
Dongxiao

The following changes since commit 9b944ae2f0e4dbac5a8f1f235f60730e56b26516:
  Richard Purdie (1):
        Revert "site/common-uclibc: Cache gl_cv_func_wcwidth_works"

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib dxu4/hob-oecore-changes-v2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob-oecore-changes-v2

Dongxiao Xu (4):
  packageinfo.bbclass: add a new bbclass to pass package information
  dummy-image.bb: add an empty image template
  dummy-toolchain: add a new recipe dummy-toolchain
  layers: add a new folder to put user added layers

Shane Wang (1):
  package.bbclass: set package size into pkgdata for hob2's use

 layers/README                             |    1 +
 meta/classes/package.bbclass              |    8 +++++++
 meta/classes/packageinfo.bbclass          |   30 +++++++++++++++++++++++++++++
 meta/recipes-core/images/dummy-image.bb   |    1 +
 meta/recipes-core/meta/dummy-toolchain.bb |   10 +++++++++
 5 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 layers/README
 create mode 100644 meta/classes/packageinfo.bbclass
 create mode 100644 meta/recipes-core/images/dummy-image.bb
 create mode 100644 meta/recipes-core/meta/dummy-toolchain.bb



