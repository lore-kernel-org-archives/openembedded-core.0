Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Rj5pk-0007rQ-Nk
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 10:11:32 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2012 01:03:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104156165"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2012 01:03:03 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2012 17:04:58 +0800
Message-Id: <cover.1325840092.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/7][PULL] Hob2 related oe-core changes
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
X-List-Received-Date: Fri, 06 Jan 2012 09:11:32 -0000

Hi Richard,

This pull request is the hob2 related oe-core changes.
Please help to review and pull.

Note that this pull request has dependency on the hob related bitbake changes.

Thanks,
Dongxiao

The following changes since commit 4a85312568a6bb052cc511c15b4ae842ff7f8e59:
  Richard Purdie (1):
        image-mklibs/package_ipk: Remove bashisms

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib dxu4/hob-oecore-changes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob-oecore-changes

Dongxiao Xu (6):
  bblayers.conf.sample: Use ?= to set BBLAYERS
  image.bbclass: Use ?= to set LINGUAS_INSTALL
  packageinfo.bbclass: add a new bbclass to pass package information
  hob.bb: Add a empty image template
  hob-toolchain: add a new recipe hob-toolchain
  layers: add a new folder to put user added layers

Shane Wang (1):
  package.bbclass: set package size into pkgdata for hob2's use

 layers/README                           |    1 +
 meta/classes/image.bbclass              |    2 +-
 meta/classes/package.bbclass            |    8 ++++++++
 meta/classes/packageinfo.bbclass        |   30 ++++++++++++++++++++++++++++++
 meta/conf/bblayers.conf.sample          |    2 +-
 meta/recipes-core/images/hob.bb         |    1 +
 meta/recipes-core/meta/hob-toolchain.bb |   10 ++++++++++
 7 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 layers/README
 create mode 100644 meta/classes/packageinfo.bbclass
 create mode 100644 meta/recipes-core/images/hob.bb
 create mode 100644 meta/recipes-core/meta/hob-toolchain.bb



