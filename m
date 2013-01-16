Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TvHSJ-0000PR-L5
	for Openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 02:06:16 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jan 2013 16:50:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,475,1355126400"; d="scan'208";a="277364583"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jan 2013 16:50:32 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 16:50:31 -0800
Message-Id: <cover.1358297126.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [Patch v2 0/2] Misc commits for xorg driver packages
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
X-List-Received-Date: Wed, 16 Jan 2013 01:06:16 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This v2 fixes the license MD5SUM in the  xf86-video-modesetting recipe.
And it also adds a commit which provides macros for specifying additional xorg drivers in
the BSP configurations.

Thanks,
Nitin



The following changes since commit 53cc748b93e8af584557d6db5309c3e955182c5c:

  linux-libc-headers: fix headers install in long path name environments (2013-01-10 23:53:51 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (2):
  xf86-video-modesetting: new recipe for gma500
  ia32-base.inc: Add more macros for xf86 drivers

 meta/conf/machine/include/ia32-base.inc            |    4 ++++
 .../xorg-driver/xf86-video-modesetting_0.6.0.bb    |    8 ++++++++
 2 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb

-- 
1.7.3.4



