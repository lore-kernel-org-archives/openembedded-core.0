Return-Path: <yau.wai.gan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 56F2E71B32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 07:19:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Aug 2017 00:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,351,1498546800"; d="scan'208";a="1181026517"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by fmsmga001.fm.intel.com with ESMTP; 10 Aug 2017 00:15:58 -0700
From: "Gan, Yau Wai" <yau.wai.gan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 17:06:24 -0700
Message-Id: <1502323585-64342-1-git-send-email-yau.wai.gan@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: marek.vasut@gmail.com, "Gan, Yau Wai" <yau.wai.gan@intel.com>
Subject: [PATCH] u-boot: updating nios2 device tree for 10m50 board
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
X-List-Received-Date: Thu, 10 Aug 2017 07:19:18 -0000

In the effort to enable u-boot for Nios II architecture (target to
10m50 board), the 10m50 device tree file requires update to tag
the CPU node with dm-pre-reloc. This enable CPU driver model before
u-boot relocation.

Gan, Yau Wai (1):
  u-boot: update nios2 device tree for 10m50 board

 .../u-boot/files/10m50-update-device-tree.patch    | 28 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc  |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/10m50-update-device-tree.patch

-- 
2.7.4


