Return-Path: <wei.tee.ng@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3BAE47198E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 01:39:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 18:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,320,1496127600"; d="scan'208";a="989880827"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga003.jf.intel.com with ESMTP; 06 Jul 2017 18:39:06 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 11:28:33 -0700
Message-Id: <cover.1499294682.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: wei.tee.ng@intel.com, saul.wold@intel.com
Subject: [poky][master] [PATCH v3 0/2] initramfs-framework: configuration to boot up live image
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
X-List-Received-Date: Fri, 07 Jul 2017 01:39:06 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

Hi, 

This patch is to get initramfs-framework able to boot up live image. A new scriplet
named setup-live module has been created to handle the removeable media detection
and assign the rootfs.img. This is because the current rootfs module has no support
for rootfs images, only rootfs partitions. 

This version 3 included the changes for creation of initramfs-module-setup-live in the
recipe and added udev-extraconf rdepends on this module because it is needed for
automounting process. 

This changes has been verified with build test and boot up test on Minnowboard Max platform.

Please review and provide feedback if you have any.
The patches are targeted for merging into poky master branch.

Thanks and regards,
Wei Tee

The following changes since commit 4b1d270602a0542eef1b497eaf15bad2b747686f:

  bitbake: bitbake-user-manual: Removed and replaced broken link (2017-07-04 16:05:22 +0100)

are available in the git repository at:

  ssh://git.yoctoproject.org/poky-contrib weiteeng/initramfs-v3
  http://git.yoctoproject.org/cgit.cgi//log/?h=weiteeng/initramfs-v3

Ng, Wei Tee (2):
  initramfs-framework: setup-live: detect media and assign rootfs image
  initramfs-framwork: module to support boot live image

 .../initrdscripts/initramfs-framework/setup-live   | 67 ++++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       | 13 ++++-
 2 files changed, 78 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/setup-live

-- 
2.7.4


