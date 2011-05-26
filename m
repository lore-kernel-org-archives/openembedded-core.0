Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPSkt-0007tC-Rh
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 07:05:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 May 2011 22:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,271,1304319600"; 
   d="scan'208";a="1991780"
Received: from unknown (HELO localhost) ([10.255.12.181])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 22:01:50 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 22:01:51 -0700
Message-Id: <cover.1306385875.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/2] u-boot updates to make it more bbappend friendly
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
X-List-Received-Date: Thu, 26 May 2011 05:05:08 -0000

Tested via build/install/boot of core-image-minimal with the meta-yocto
beagleboard machine config.

The following changes since commit 1607d7b6809eb3f0aa8d09713a4e467a1f4585a2:

  IMAGE_ROOTFS_SIZE: Cleanup machine conf files (2011-05-25 14:07:37 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/oe/u-boot
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/oe/u-boot

Darren Hart (2):
  u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
  u-boot: rename u-boot_git.bb to u-boot_${PV}.bb

 meta/recipes-bsp/uboot/u-boot.inc                  |    8 +++++++-
 .../uboot/{u-boot_git.bb => u-boot_2011.03.bb}     |   11 ++++++-----
 2 files changed, 13 insertions(+), 6 deletions(-)
 rename meta/recipes-bsp/uboot/{u-boot_git.bb => u-boot_2011.03.bb} (64%)



