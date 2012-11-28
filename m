Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TdmVx-0000MK-D1
	for Openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 19:37:41 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2012 10:21:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,180,1355126400"; d="scan'208";a="225937954"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by orsmga001.jf.intel.com with ESMTP; 28 Nov 2012 10:22:20 -0800
From: nitin.a.kamble@intel.com
To: meta-intel@yoctoproject.org, Openembedded-core@lists.openembedded.org,
	tom.zanussi@intel.com, darren.hart@intel.com, ross.burton@intel.com
Date: Wed, 28 Nov 2012 10:21:22 -0800
Message-Id: <cover.1354126748.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-intel patch 0/3] Fixes for rescent X breakages in meta-intel layer
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
X-List-Received-Date: Wed, 28 Nov 2012 18:37:41 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This commits are for meta-intel layer. And Ross'es patch tries to achieve the same 
from the oecore layer.

Thanks,
Nitin


The following changes since commit 154156a4db56f7b33fb1765cf6b87e683d027af9:

  emgd-driver-bin: add further needed soft links (2012-11-26 18:02:11 -0600)

are available in the git repository at:
  git://git.yoctoproject.org/meta-intel-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/meta-intel-contrib/log/?h=nitin/misc

Nitin A Kamble (3):
  xserver-xorg-1.9.3: fix packaging issues
  xserver-psb: fix packaging issues
  xserver-xorg-video-psb: fix packaging issues

 .../xorg-xserver/xserver-xorg-1.9.3.inc            |    2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  160 ++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.9.3.bb             |    2 +-
 conf/machine/include/meta-intel.inc                |   10 +-
 .../xorg-xserver/xserver-psb-1.7.99.2.inc          |    2 +-
 .../xorg-xserver/xserver-psb_1.7.99.2.bb           |    2 +-
 .../xserver-xorg-video-psb_0.32.1.bb               |    8 +-
 7 files changed, 180 insertions(+), 6 deletions(-)
 create mode 100644 common/recipes-graphics/xorg-xserver/xserver-xorg.inc

-- 
1.7.3.4



