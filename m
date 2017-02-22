Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BD14A73100
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302176"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:22 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:05 +0200
Message-Id: <b374e92ac64abf8bb97c9813a8ec36e3c6198cb3.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/24] btrfs-tools: update to 4.9.1
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:22 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../btrfs-tools/{btrfs-tools_4.8.5.bb => btrfs-tools_4.9.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.8.5.bb => btrfs-tools_4.9.1.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.9.1.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.9.1.bb
index 7047c434024..2c7b7ea6852 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.9.1.bb
@@ -13,7 +13,7 @@ SECTION = "base"
 DEPENDS = "util-linux attr e2fsprogs lzo acl udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "144a19145e248513c7a676defad59836830535c6"
+SRCREV = "96485c34ac0329fb0073476f16d2083c64701f29"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
 "
 
-- 
2.11.0


