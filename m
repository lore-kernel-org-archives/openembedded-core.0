Return-Path: <wei.tee.ng@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2120871AD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 02:40:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 19:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,352,1496127600"; d="scan'208";a="1171865195"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2017 19:40:08 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 12:29:34 -0700
Message-Id: <cover.1499887221.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: wei.tee.ng@intel.com
Subject: [poky][master] [PATCH v6 0/1] initramfs-framework:configuration to boot up live image
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
X-List-Received-Date: Thu, 13 Jul 2017 02:40:08 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

Hi, 

This patch is to get initramfs-framework able to boot up live image.
A new scriplet named setup-live module has been created to handle the removeable media detection and assign the rootfs.img. This is because the current rootfs module has no support for rootfs images, only rootfs partitions. 

This version included the changes for typo, re-correct the indenting issues and squashing 2 commits into single commit. It involve the creation of initramfs-module-setup-live in the recipe and added udev-extraconf rdepends on this module because it is needed for automounting process. 

This changes has been verified with build test and boot up test on Minnowboard Max platform.

Please review and provide feedback if you have any.
The patches are targeted for merging into poky master branch.

Thanks and regards,
Wei Tee

The following changes since commit 81498aac9560fbeaeb58eaada32ce80e0ea51628:

  yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100)

are available in the git repository at:

  ssh://git.yoctoproject.org/poky-contrib weiteeng/initramfs-final
  http://git.yoctoproject.org/cgit.cgi//log/?h=weiteeng/initramfs-final

Ng, Wei Tee (1):
  initramfs-framework: module to support boot live image

 .../initrdscripts/initramfs-framework/setup-live   | 66 ++++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       | 13 ++++-
 2 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/setup-live

-- 
2.7.4


