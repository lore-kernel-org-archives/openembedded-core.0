Return-Path: <wei.tee.ng@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EDB5160190
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 02:39:30 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jul 2017 19:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,372,1496127600"; d="scan'208";a="108754960"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga004.jf.intel.com with ESMTP; 16 Jul 2017 19:39:31 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Jul 2017 12:29:03 -0700
Message-Id: <cover.1500229225.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: wei.tee.ng@intel.com, saul.wold@intel.com
Subject: [poky][master][PATCH v2 0/1] initramfs-framework: include install-efi module in recipe for installation
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
X-List-Received-Date: Mon, 17 Jul 2017 02:39:32 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

This patch is to enable the installation mechanism in initramfs-framework.
It used the existing init-install-efi.sh script in the initrdscript and 
install a new module named initramfs-module-install-efi in the recipe.

I put all the changes as a single commit. This version 2 had renamed the
existing init-install-efi.sh to install-efi.sh and package name changed
to install-efi.

This patch shall encounter a patchtest failure as it is depends on a
patch which have been sent to the mailing list and waiting for
acceptance. The dependency patch can be found in here:
http://lists.openembedded.org/pipermail/openembedded-core/2017-July/139570.html

This changes has been verified with build test, boot up test and
installation test on Minnowboard Max platform.

Please review and provide feedback if you have any.
The patches are targeted for merging into poky master branch.

Thanks and regards,
Wei Tee

The following changes since commit 42ed3bedf773c1fee314a2e4194c9656c583cc9c:

  initramfs-framework: module to support boot live image (2017-07-12 12:19:09 -0700)

are available in the git repository at:

  ssh://git.yoctoproject.org/poky-contrib weiteeng/initramfs-install-efi
  http://git.yoctoproject.org/cgit.cgi//log/?h=weiteeng/initramfs-install-efi

Ng, Wei Tee (1):
  initramfs-framework: include install-efi module in recipe for
    installation

 .../initramfs-framework/install-efi.sh             | 276 +++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       |  13 +-
 2 files changed, 287 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/install-efi.sh

-- 
2.7.4


