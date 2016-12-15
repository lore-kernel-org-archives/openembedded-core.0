Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B2A6F772CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:48:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 04:48:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,351,1477983600"; d="scan'208";a="18480802"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 04:48:33 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:47:58 +0200
Message-Id: <3219961cc5e14c6dff00f69c3abfbf08d32cc2dc.1481805889.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
References: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/16] btrfs-tools: update to 4.8.5
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
X-List-Received-Date: Thu, 15 Dec 2016 12:48:32 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../btrfs-tools/{btrfs-tools_4.8.4.bb => btrfs-tools_4.8.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.8.4.bb => btrfs-tools_4.8.5.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.4.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.4.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
index a15fcf2..7047c43 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.4.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
@@ -13,7 +13,7 @@ SECTION = "base"
 DEPENDS = "util-linux attr e2fsprogs lzo acl udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "3ae37eaad1f1ef3f46838da57d8616126fdaffd8"
+SRCREV = "144a19145e248513c7a676defad59836830535c6"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
 "
 
-- 
2.10.2


