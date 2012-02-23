Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1S0ZB9-0000iJ-KF
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 14:57:51 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Feb 2012 05:49:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="69497750"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Feb 2012 05:49:28 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 21:48:05 +0800
Message-Id: <cover.1330003047.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/3][PULL] Hob2: OE-Core related changes
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
X-List-Received-Date: Thu, 23 Feb 2012 13:57:51 -0000

Hi Richard,

This is the hob2 related OE-Core changes. Please help to review and pull.

Compared with previous version:
 - packageinfo.bbclass: Fix the way to construct ipk/deb package names.
 - meta-hob: rename dummy-image and dummy-toolchain to hob-image and hob-toolchain

Note that this pull request depends on the following pull requests:
 - hob2-bitbake-changes

Thanks,
Dongxiao

The following changes since commit 55f72b98f606c1554eb6edd151292ffdfddf1384:

  texi2html: Fix for multilib (2012-02-22 23:01:45 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/hob2-oecore-changes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob2-oecore-changes

Dongxiao Xu (2):
  packageinfo.bbclass: add a new bbclass to pass package information
  meta-hob: Add a new meta-hob layer

Shane Wang (1):
  package.bbclass: set package size into pkgdata for hob2's use

 meta-hob/COPYING.MIT                        |   17 +++++++++++++
 meta-hob/conf/layer.conf                    |    9 +++++++
 meta-hob/recipes-core/images/hob-image.bb   |    1 +
 meta-hob/recipes-core/meta/hob-toolchain.bb |   10 +++++++
 meta/classes/package.bbclass                |    8 ++++++
 meta/classes/packageinfo.bbclass            |   35 +++++++++++++++++++++++++++
 6 files changed, 80 insertions(+), 0 deletions(-)
 create mode 100644 meta-hob/COPYING.MIT
 create mode 100644 meta-hob/conf/layer.conf
 create mode 100644 meta-hob/recipes-core/images/hob-image.bb
 create mode 100644 meta-hob/recipes-core/meta/hob-toolchain.bb
 create mode 100644 meta/classes/packageinfo.bbclass

-- 
1.7.4.1



