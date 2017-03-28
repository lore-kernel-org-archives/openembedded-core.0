Return-Path: <jonathan.yong@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1750371A99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 04:02:17 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 27 Mar 2017 21:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,235,1486454400"; d="scan'208";a="81705144"
Received: from vanguard-01.png.intel.com ([10.221.118.162])
	by fmsmga006.fm.intel.com with ESMTP; 27 Mar 2017 21:02:17 -0700
From: "Yong, Jonathan" <jonathan.yong@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 04:01:59 +0000
Message-Id: <20170328040201.20341-1-jonathan.yong@intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] f2f2-tools 1.4.0 -> 1.8.0
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
X-List-Received-Date: Tue, 28 Mar 2017 04:02:19 -0000

Upgrade f2fs-tools, now supports encryption.

Yong, Jonathan (1):
  f2fs-tools: Update to Version 1.8.0

 .../0002-Fix-mkfs-out-of-tree-builds.patch         | 27 ++++++++++++++++++++++
 .../{f2fs-tools_1.4.0.bb => f2fs-tools_1.8.0.bb}   |  5 ++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
 rename meta-filesystems/recipes-utils/f2fs-tools/{f2fs-tools_1.4.0.bb => f2fs-tools_1.8.0.bb} (81%)

-- 
2.10.2


