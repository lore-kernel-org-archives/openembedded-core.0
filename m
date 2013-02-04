Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U2ISV-0004wh-Bw
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:35:27 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Feb 2013 01:19:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="252243098"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 04 Feb 2013 01:19:36 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:20:14 +0200
Message-Id: <cover.1359967266.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 00/10] Multilib fixes
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
X-List-Received-Date: Mon, 04 Feb 2013 09:35:28 -0000

This represents a set of patches that address multilib issues and other
problems discovered building lib32 world
The following changes since commit 75f470cd18d693a9a96d9849291c2c8de4dcbeb8:

  qt4: Add space for _appends (2013-02-01 22:49:47 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib cmuscax/ml_patches
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=cmuscax/ml_patches

Constantin Musca (10):
  enchant: use BPN instead of PN
  sgml-common: use ${PN} instead of sgml-common
  syslinux: use BPN instead of PN
  console-tools: fix linking when using the multilib compiler
  foomatic-filters: fix CUPS directory config
  taglib: use LIB_SUFFIX in order to determine the correct baselib
  run-postinsts: use BPN instead of PN
  consolekit: add arch independent unpackaged files
  gcc: target: fix libiberty removal
  blktool: fix SRC_URI typo

 .../fix-libconsole-linking.patch                   | 56 ++++++++++++++++++++++
 .../console-tools/console-tools_0.3.2.bb           |  3 +-
 meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |  6 +--
 meta/recipes-devtools/gcc/gcc-4.7.inc              |  2 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc   |  4 +-
 .../sgml-common/sgml-common_0.6.3.bb               |  4 +-
 meta/recipes-devtools/syslinux/syslinux_4.03.bb    | 16 +++----
 meta/recipes-extended/blktool/blktool_4-6.1.bb     |  4 +-
 .../foomatic/foomatic-filters_4.0.17.bb            |  7 +--
 .../recipes-support/consolekit/consolekit_0.4.5.bb |  6 ++-
 meta/recipes-support/enchant/enchant_1.6.0.bb      |  8 ++--
 meta/recipes-support/taglib/taglib_1.8.bb          |  4 +-
 12 files changed, 89 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/fix-libconsole-linking.patch

-- 
1.7.11.7



