Return-Path: <wei.tee.ng@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF9277E87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 00:20:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 10 Jul 2017 17:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,343,1496127600"; d="scan'208";a="877398880"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jul 2017 17:20:26 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jul 2017 10:09:48 -0700
Message-Id: <cover.1499705409.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: wei.tee.ng@intel.com, saul.wold@intel.com
Subject: [poky][master] [PATCH v4 0/1] initramfs-framework: configuration to boot up live image
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
X-List-Received-Date: Tue, 11 Jul 2017 00:20:26 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

Hi, 

This patch is to get initramfs-framework able to boot up live image.
A new scriplet named setup-live module has been created to handle
the removeable media detection and assign the rootfs.img. This is
because the current rootfs module has no support for rootfs images,
only rootfs partitions. 

This version 4 included the changes for squashing 2 commits into
single commit. It involve the creation of initramfs-module-setup-live
in the recipe and added udev-extraconf rdepends on this module because
it is needed for automounting process. 

This changes has been verified with build test and boot up test on Minnowboard Max platform.

Please review and provide feedback if you have any.
The patches are targeted for merging into poky master branch.

Thanks and regards,
Wei Tee

The following changes since commit 854c8c2e4c24ea3ddfec6e5b5f6477f0620510e4:

  oeqa/tinfoil: Improve test_wait_event for race issues (2017-07-08 13:34:46 +0100)

are available in the git repository at:

  ssh://git.yoctoproject.org/poky-contrib weiteeng/initramfs-final
  http://git.yoctoproject.org/cgit.cgi//log/?h=weiteeng/initramfs-final

Ng, Wei Tee (1):
  initramfs-framwork: module to support boot live image

 .../initrdscripts/initramfs-framework/setup-live   | 67 ++++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       | 13 ++++-
 2 files changed, 78 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/setup-live

-- 
2.7.4


