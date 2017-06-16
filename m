Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E2149784D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279605"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:15 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:50 +0300
Message-Id: <00bb214ae7913ff1b6b95285c2945acb868012dd.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 27/32] btrfs-tools: upgrade to 4.11
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:30 -0000

From: Upgrade Helper <auh@auh.yoctoproject.org>

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../btrfs-tools/{btrfs-tools_4.10.2.bb => btrfs-tools_4.11.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.10.2.bb => btrfs-tools_4.11.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.10.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.10.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.bb
index 38062ce58c8..6ccb44a0db8 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.10.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "bd0ab27afbf14370f9f0da1f5f5ecbb0adc654c1"
+SRCREV = "981f2d8fdc37741098bb977921c6e3f1ea88365b"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git"
 
 inherit autotools-brokensep pkgconfig manpages
-- 
2.11.0


