Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B2105734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 21:10:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 24 Sep 2015 14:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,582,1437462000"; d="scan'208";a="812638112"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.128.56])
	by orsmga002.jf.intel.com with ESMTP; 24 Sep 2015 14:10:34 -0700
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 16:10:23 -0500
Message-Id: <cover.1443128706.git.alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH V3 0/3] Dynamic common utilities
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
X-List-Received-Date: Thu, 24 Sep 2015 21:10:40 -0000

It provide a virtual reference for the common utilities.
it replace of the lock to busybox, it will be simple exchange between other
common utilities like gnu core utils or toybox among others.

The following changes since commit f0189829498e30231d826c9f55aad73e622d076e:

  qemu: Update to upstream patches (2015-09-14 11:22:02 +0100)

are available in the git repository at:

  git://github.com/Ajoyacr/openembedded-core base-util
  https://github.com/Ajoyacr/openembedded-core/tree/base-util

Alejandro Joya (3):
  core-image-minimal-initramfs: replace dependency
  initramfs-framework:add virtual reference
  packagegroup-core-boot:change to virtual reference

 meta/recipes-core/images/core-image-minimal-initramfs.bb   | 2 +-
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb  | 7 +++++--
 3 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.1.0


