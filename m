Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF0E6B7F9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010115"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:23 +0000
Message-Id: <4d13e7cc98027644faf5f6785c2939329603b806.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 27/38] binutils: add/tweak SUMMARY
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
X-List-Received-Date: Sat, 28 Dec 2013 22:30:24 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 2 +-
 meta/recipes-devtools/binutils/binutils.inc                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 81349c0..52c573e 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -1,6 +1,6 @@
 inherit cross-canadian
 
-DESCRIPTION = "A GNU collection of cross-canadian binary utilities for ${TARGET_ARCH} target"
+SUMMARY = "GNU binary utilities (cross-canadian for ${TARGET_ARCH} target)"
 PN = "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "binutils"
 
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index cf13c4f..1259342 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -1,4 +1,4 @@
-SUMMARY = "A GNU collection of binary utilities"
+SUMMARY = "GNU binary utilities"
 DESCRIPTION = "The GNU Binutils are a collection of binary tools. \
 The main ones are ld (GNU Linker), and as (GNU Assembler). This \
 package also includes addition tools such as addr2line (Converts \
-- 
1.8.1.2


