Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B29A675F3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 21:09:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2015 14:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,554,1437462000"; d="scan'208";a="564474587"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.128.56])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Sep 2015 14:09:10 -0700
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 16:09:00 -0500
Message-Id: <cover.1442610201.git.alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH V2 0/3] Dynamic common utilities
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
X-List-Received-Date: Fri, 18 Sep 2015 21:09:13 -0000

It provide a virtual reference for the common utilities.
it replace of the lock to busybox, it will be simple exchange between other
common utilities like gnu core utils or toybox among others.

In order to enable its required to fill at the distro conf or local.conf

VIRTUAL-RUNTIME_login_manager ?= "busybox"
PREFERRED_PROVIDER_virtual/base-utils?= "busybox"
PREFERRED_RPROVIDER_virtual/base-utils?= "busybox"
VIRTUAL-RUNTIME_base-utils?= "busybox"
VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"

The following changes since commit 72682d72b52355c3fed947167ca3c6064340ead1:

  autotools.bbclass: mkdir ${B} -> mkdir -p ${B} (2015-09-16 22:17:19 +0100)

are available in the git repository at:

  git://github.com/Ajoyacr/openembedded-core base-utils
  https://github.com/Ajoyacr/openembedded-core/tree/base-utils

Alejandro Joya (3):
  core-mage-minimal-initramfs: replace dependency
  initramfs-framework:add virtual reference
  packagegroup-core-boot:change to virtual reference

 meta/recipes-core/images/core-image-minimal-initramfs.bb   | 2 +-
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb  | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.1.0


