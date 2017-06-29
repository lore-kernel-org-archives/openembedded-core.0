Return-Path: <wei.tee.ng@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D96AE78209
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 02:46:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jun 2017 19:46:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,284,1496127600"; d="scan'208";a="1146328180"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2017 19:46:54 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2017 12:22:33 -0700
Message-Id: <cover.1498763563.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: wei.tee.ng@intel.com, saul.wold@intel.com
Subject: [poky][master][PATCH 0/3] initramfs-framework: configuration to boot up live image
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
X-List-Received-Date: Fri, 30 Jun 2017 02:46:54 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

This patch is to get initramfs-framework able to boot up live image.
In order to implement this framework, there is a need to add runtime                                                                                                                                                                     dependency on udev-extraconf due to the automounting process.

Secondly, a new scriptlet named setup-live module has been created
to handle the removeable media detection and assign the rootfs.img.
This is because the current rootfs module has no support for rootfs
images, only rootfs partitions.

This change has been verified with build test and boot up test on
Minnowboard Max platform.

Please review and provide feedback if you have any.
The patches are targeted for merging into poky master branch.

Thanks and regards,
Wei Tee

The following changes since commit 98099349e358a9caaec8ec81f0d4abe588909cfe:

  bitbake: npm fetcher: fix unknown variable name. (2017-06-29 14:33:42 +0100)

are available in the git repository at:

  ssh://git.yoctoproject.org/poky-contrib weiteeng/initramfs-v2
  http://git.yoctoproject.org/cgit.cgi//log/?h=weiteeng/initramfs-v2

Ng, Wei Tee (3):
  initramfs-framework: udev: Add a runtime dependency on udev-extraconf
  initramfs-framework: setup-live: detect media and assign rootfs image
  initramfs-framwork: module to support boot live image

 .../initrdscripts/initramfs-framework/setup-live   | 67 ++++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       |  8 ++-
 2 files changed, 72 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/setup-live

-- 
2.7.4


