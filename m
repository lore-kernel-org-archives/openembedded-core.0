Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0070D6DCFF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 14:33:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 07 Mar 2014 06:33:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,608,1389772800"; d="scan'208";a="487941796"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2014 06:33:07 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Mar 2014 16:33:04 +0200
Message-Id: <cover.1394202750.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] xf86-video-intel: add recipe for 2.99.910, remove the git one
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Mar 2014 14:33:08 -0000

The following changes since commit 2f9bf7bc97cb832f4db13df62ce09d96ce75e810:

  PR bumps to remove PRINC use in meta-fsl-arm (2014-03-07 13:39:11 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5705_q4_intel_graphics_stack
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5705_q4_intel_graphics_stack

Laurentiu Palcu (1):
  xf86-video-intel: add recipe for 2.99.910, remove the git one

 meta/conf/distro/include/default-versions.inc      |    3 ++
 .../xorg-driver/xf86-video-intel_2.99.910.bb       |   31 ++++++++++++++++++++
 .../xorg-driver/xf86-video-intel_git.bb            |   23 ---------------
 3 files changed, 34 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.910.bb
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb

-- 
1.7.9.5


