Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EC22160107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 22:13:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 17 Nov 2015 14:13:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,310,1444719600"; d="scan'208";a="853305455"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.128.105])
	by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2015 14:13:27 -0800
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 16:13:12 -0600
Message-Id: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/4] Replace busybox for variable
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
X-List-Received-Date: Tue, 17 Nov 2015 22:13:28 -0000

These recipes have a hardcoded dependency to busybox,
in order to be able to have a flexible selection,
instead of the hardcoded dependency, now it is point to  virtual reference
base-utils.

The following changes since commit 6f98c39418c60b7c0b25b30983d2e5257158a6a4:

  gcc: Drop 4.8 (2015-11-16 14:59:07 +0000)

are available in the git repository at:

  git://github.com/Ajoyacr/openembedded-core base-utils
  https://github.com/Ajoyacr/openembedded-core/tree/base-utils

Alejandro Joya (4):
  base-utils:flexible dependency for command utilities
  core-image-minimal-initramfs: replace base-utils
  initramfs-framework_1.0:replace busybox for variable.
  packagegroup-core-boot:replace busybox to variable

 meta/conf/distro/include/default-providers.inc             | 3 +++
 meta/recipes-core/images/core-image-minimal-initramfs.bb   | 2 +-
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb  | 4 ++--
 4 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.1.0


