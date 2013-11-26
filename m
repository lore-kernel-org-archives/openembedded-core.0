Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C73816DD3C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:42:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Nov 2013 06:42:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,775,1378882800"; d="scan'208";a="440218479"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.39])
	by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2013 06:42:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 14:41:51 +0000
Message-Id: <b84e88ddec3058f8d08b653be506cf39c81751e5.1385476873.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1385476873.git.paul.eggleton@linux.intel.com>
References: <cover.1385476873.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1385476873.git.paul.eggleton@linux.intel.com>
References: <cover.1385476873.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/7] squashfs-tools: drop FILESPATHPKG
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
X-List-Received-Date: Tue, 26 Nov 2013 14:42:06 -0000

Drop FILESPATHPKG setting since it seems to be superfluous.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
index 00b68ab..5de02cd 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
@@ -37,9 +37,6 @@ do_install () {
         install -m 0755 mksquashfs ${D}${sbindir}/
 }
 
-# required to share same place with -lzma specific packages
-FILESPATHPKG =. "squashfs-tools-${PV}:"
-
 ARM_INSTRUCTION_SET = "arm"
 
 BBCLASSEXTEND = "native"
-- 
1.8.1.2


