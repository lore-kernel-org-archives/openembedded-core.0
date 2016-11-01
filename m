Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3385971C30
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:27:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2016 08:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,580,1473145200"; d="scan'208";a="780876139"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2016 08:27:50 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:25:08 +0200
Message-Id: <663642ea941366a7b10a53948c06166fd55da663.1478013701.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/13] btrfs-tools: update to 4.8.2
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
X-List-Received-Date: Tue, 01 Nov 2016 15:27:50 -0000

Add udev dependency as btrfs-tools installs a udev rule.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../btrfs-tools/{btrfs-tools_4.8.1.bb => btrfs-tools_4.8.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.8.1.bb => btrfs-tools_4.8.2.bb} (90%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.2.bb
similarity index 90%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.2.bb
index e7fd24d..818951c 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.2.bb
@@ -10,10 +10,10 @@ HOMEPAGE = "https://btrfs.wiki.kernel.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
-DEPENDS = "util-linux attr e2fsprogs lzo acl"
+DEPENDS = "util-linux attr e2fsprogs lzo acl udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "d8d0a60406b14b140e83a8c0d5eaedb5dca44092"
+SRCREV = "08d31c1c7ca5a6bb4e6485fa118c552c938e9efb"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
 "
 
-- 
2.10.1


