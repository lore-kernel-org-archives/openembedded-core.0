Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4E32260761
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:25 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412230"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:26 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:14 +0200
Message-Id: <ce2e8637b450623d347454d8f142da1d7a7f3571.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/18] btrfs-tools: update to 4.8.4
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:25 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../btrfs-tools/{btrfs-tools_4.8.2.bb => btrfs-tools_4.8.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.8.2.bb => btrfs-tools_4.8.4.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.4.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.4.bb
index 818951c..a15fcf2 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.4.bb
@@ -13,7 +13,7 @@ SECTION = "base"
 DEPENDS = "util-linux attr e2fsprogs lzo acl udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "08d31c1c7ca5a6bb4e6485fa118c552c938e9efb"
+SRCREV = "3ae37eaad1f1ef3f46838da57d8616126fdaffd8"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
 "
 
-- 
2.10.2


