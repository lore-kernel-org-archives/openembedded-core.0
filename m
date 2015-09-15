Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D2CC76E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 22:40:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Sep 2015 15:40:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,536,1437462000"; d="scan'208";a="805200196"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.128.56])
	by orsmga002.jf.intel.com with ESMTP; 15 Sep 2015 15:40:05 -0700
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 17:39:56 -0500
Message-Id: <cover.1442355130.git.alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/3] flexible common utils
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
X-List-Received-Date: Tue, 15 Sep 2015 22:40:10 -0000

this patch it will try to provide a virtual reference for the common utils.
instead of looking to hardcoded busybox, it wil be simple exchange between other
common utils like gnu core utils or toybox among others.

In order to enable its required to fill at the distro conf or local.conf

VIRTUAL-RUNTIME_login_manager ?= "busybox"
PREFERRED_PROVIDER_virtual/anybox ?= "busybox"
PREFERRED_RPROVIDER_virtual/anybox ?= "busybox"
VIRTUAL-RUNTIME_anybox ?= "busybox"
VIRTUAL-RUNTIME_anybox-hwclock ?= "busybox-hwclock"

The following changes since commit f0189829498e30231d826c9f55aad73e622d076e:

  qemu: Update to upstream patches (2015-09-14 11:22:02 +0100)

are available in the git repository at:

  git://github.com/Ajoyacr/openembedded-core anybox
  https://github.com/Ajoyacr/openembedded-core/tree/anybox

Alejandro Joya (3):
  core-mage-minimal-initramfs: overwrite hardcoded dependency to virtual
    reference
  initramfs-framework: overwrite hardcoded dependency to virtual
    reference
  packagegroup-core-boot: overwrite hardcoded dependency to virtual
    reference

 meta/recipes-core/images/core-image-minimal-initramfs.bb   | 2 +-
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb  | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.1.0


