Return-Path: <wei.tee.ng@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0E81471A70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 06:11:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 23:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,352,1496127600"; d="scan'208";a="878292743"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jul 2017 23:11:41 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 16:01:11 -0700
Message-Id: <cover.1499890236.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: wei.tee.ng@intel.com, saul.wold@intel.com
Subject: [poky][master][PATCH 0/1] initramfs-framework: include install module in recipe for installation
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
X-List-Received-Date: Thu, 13 Jul 2017 06:11:42 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

This patch is to enable the installation mechanism in initramfs-framework.
It used the existing init-install-efi.sh script in the initrdscript and
install a new module named initramfs-module-install in the recipe.

I put all the changes as a single commit.

This changes has been verified with build test, boot up test and installation
test on Minnowboard Max platform.

Please review and provide feedback if you have any.
The patches are targeted for merging into poky master branch.

Thanks and regards,
Wei Tee

The following changes since commit 42ed3bedf773c1fee314a2e4194c9656c583cc9c:

  initramfs-framework: module to support boot live image (2017-07-12 12:19:09 -0700)

are available in the git repository at:

  ssh://git.yoctoproject.org/poky-contrib weiteeng/initramfs-install
  http://git.yoctoproject.org/cgit.cgi//log/?h=weiteeng/initramfs-install

Ng, Wei Tee (1):
  initramfs-framework: include install module in recipe for installation

 .../initramfs-framework/init-install-efi.sh        | 276 +++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       |  13 +-
 2 files changed, 287 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/init-install-efi.sh

-- 
2.7.4


