Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EA799784C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:07 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402262"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:58:08 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:46 +0200
Message-Id: <20171114145754.9643-19-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/27] btrfs-tools: update to 4.13.3
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:08 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../btrfs-tools/{btrfs-tools_4.13.2.bb => btrfs-tools_4.13.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.13.2.bb => btrfs-tools_4.13.3.bb} (96%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
similarity index 96%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
index 43924d874d1..263fc657550 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "37f1faef159ebcf91846e7126879b1a413cb29a5"
+SRCREV = "a7a1ea0f4f2a1d6eeeb3d106e062c7f1034f16d4"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Makefile-build-mktables-using-native-gcc.patch \
            file://0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch \
-- 
2.15.0


