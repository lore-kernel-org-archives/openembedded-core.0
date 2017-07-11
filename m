Return-Path: <wei.tee.ng@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7302960765
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 04:57:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 21:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="991937276"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga003.jf.intel.com with ESMTP; 11 Jul 2017 21:57:46 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 14:47:15 -0700
Message-Id: <cover.1499801966.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: wei.tee.ng@intel.com, saul.wold@intel.com
Subject: [poky][master] [PATCH v5 0/1] initramfs-framework:configuration to boot up live image
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
X-List-Received-Date: Wed, 12 Jul 2017 04:57:45 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

Hi, 

This patch is to get initramfs-framework able to boot up live image.
A new scriplet named setup-live module has been created to handle
the removeable media detection and assign the rootfs.img. This is
because the current rootfs module has no support for rootfs images,
only rootfs partitions. 

This version 5 included the changes for re-correct the indenting issues
and squashing 2 commits into single commit. It involve the creation of
initramfs-module-setup-live in the recipe and added udev-extraconf
rdepends on this module because it is needed for automounting process. 

This changes has been verified with build test and boot up test on
Minnowboard Max platform.

Please review and provide feedback if you have any.
The patches are targeted for merging into poky master branch.

Thanks and regards,
Wei Tee

The following changes since commit 81498aac9560fbeaeb58eaada32ce80e0ea51628:

  yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100)

are available in the git repository at:

  ssh://git.yoctoproject.org/poky-contrib weiteeng/initramfs-indent
  http://git.yoctoproject.org/cgit.cgi//log/?h=weiteeng/initramfs-indent

Ng, Wei Tee (1):
  initramfs-framwork: module to support boot live image

 .../initrdscripts/initramfs-framework/setup-live   | 66 ++++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       | 13 ++++-
 2 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/setup-live

-- 
2.7.4


