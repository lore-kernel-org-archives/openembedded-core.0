Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 407EB782D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 14:31:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2017 07:31:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,407,1496127600"; d="scan'208";a="1198786732"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2017 07:30:57 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 17:28:09 +0300
Message-Id: <20170724142818.44403-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/11] btrfs-tools: upgrade to 4.11.1
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
X-List-Received-Date: Mon, 24 Jul 2017 14:31:08 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../btrfs-tools/{btrfs-tools_4.11.bb => btrfs-tools_4.11.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.11.bb => btrfs-tools_4.11.1.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.1.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.1.bb
index 6ccb44a0db8..a7b42e9546b 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "981f2d8fdc37741098bb977921c6e3f1ea88365b"
+SRCREV = "88221fc081a7a0979a012f243b66cf097382cc8f"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git"
 
 inherit autotools-brokensep pkgconfig manpages
-- 
2.13.2


