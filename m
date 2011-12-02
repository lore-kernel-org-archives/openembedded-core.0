Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RWJsa-0007AH-K0
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 04:33:40 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Dec 2011 19:26:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="82375142"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga002.jf.intel.com with ESMTP; 01 Dec 2011 19:26:57 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 11:26:59 +0800
Message-Id: <cover.1322796369.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/3] 3 patches: lzo, libxfont, distro_tracking_fields.inc
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
X-List-Received-Date: Fri, 02 Dec 2011 03:33:40 -0000

The following changes since commit 9d6790c4409dee4d08fe6a47450125c406d0ba32:

  cooker.py: Allow the -e option to work with virtual classes and -b (2011-12-01 23:14:05 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/distro
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/distro

Dexuan Cui (3):
  libxfont: remove the unused no-scalable-crash.patch
  lzo: remove the uncessary autoconf.patch
  distro_tracking_fields.inc: update the info

 .../conf/distro/include/distro_tracking_fields.inc |   65 ++++++++++---------
 .../xorg-lib/libxfont/no-scalable-crash.patch      |   24 -------
 meta/recipes-support/lzo/lzo-2.06/autoconf.patch   |   28 ---------
 meta/recipes-support/lzo/lzo_2.06.bb               |    3 +-
 4 files changed, 35 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxfont/no-scalable-crash.patch
 delete mode 100644 meta/recipes-support/lzo/lzo-2.06/autoconf.patch

-- 
1.7.6



