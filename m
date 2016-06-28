Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AE9BC73179
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 08:06:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jun 2016 01:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,540,1459839600"; d="scan'208";a="129745531"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2016 01:06:34 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2016 11:06:17 +0300
Message-Id: <1467101180-23116-7-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/10] btrfs-tools: update to 4.6.1
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
X-List-Received-Date: Tue, 28 Jun 2016 08:06:39 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../btrfs-tools/{btrfs-tools_4.5.3.bb => btrfs-tools_4.6.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.5.3.bb => btrfs-tools_4.6.1.bb} (94%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.5.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.6.1.bb
similarity index 94%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.5.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.6.1.bb
index 50fe66e..cede73e 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.5.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.6.1.bb
@@ -13,7 +13,7 @@ SECTION = "base"
 DEPENDS = "util-linux attr e2fsprogs lzo acl"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "b72438362b2dbce880cefe9427ffe0947a94e060"
+SRCREV = "40650bf1694bbc833a40afa239a81627ef4fb5c6"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://fix-parallel.patch \
 "
-- 
2.8.1


