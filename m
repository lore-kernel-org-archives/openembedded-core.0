Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C1D896FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:32:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2016 07:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="1048688651"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2016 07:31:58 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 17:30:09 +0300
Message-Id: <d2f5f2892fd7e9f3a50e5c2add9bd3a9dc3828d9.1472480768.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/15] btrfs-tools: update to 4.7.1
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
X-List-Received-Date: Mon, 29 Aug 2016 14:32:06 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../btrfs-tools/{btrfs-tools_4.6.1.bb => btrfs-tools_4.7.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.6.1.bb => btrfs-tools_4.7.1.bb} (94%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.6.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.7.1.bb
similarity index 94%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.6.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.7.1.bb
index cede73e..becf093 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.6.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.7.1.bb
@@ -13,7 +13,7 @@ SECTION = "base"
 DEPENDS = "util-linux attr e2fsprogs lzo acl"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "40650bf1694bbc833a40afa239a81627ef4fb5c6"
+SRCREV = "6819fbcdcab63c2d95da1a2997e37be9a71ca533"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://fix-parallel.patch \
 "
-- 
2.9.3


