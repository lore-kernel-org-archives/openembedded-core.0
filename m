Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DE39E767C7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 14:27:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Aug 2015 07:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,630,1432623600"; d="scan'208";a="779724767"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2015 07:27:49 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Aug 2015 17:28:43 +0300
Message-Id: <45936f059111b38f8850d5972db1ea1485dee82a.1438956967.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/7] gptfdisk: update to 1.0.0
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
X-List-Received-Date: Fri, 07 Aug 2015 14:27:50 -0000

Also, use tarballs instead of git for fetching source code.
git repository does not have version tags, so upstream version check
cannot be performed.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-devtools/fdisk/{gptfdisk_git.bb => gptfdisk_1.0.0.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/fdisk/{gptfdisk_git.bb => gptfdisk_1.0.0.bb} (75%)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_git.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
similarity index 75%
rename from meta/recipes-devtools/fdisk/gptfdisk_git.bb
rename to meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
index 477c1d9..f4b0e32 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_git.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
@@ -5,11 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 DEPENDS = "util-linux popt ncurses"
 
-PV = "0.8.10+git${SRCPV}"
-SRCREV = "a920398fa393f9d6301b32b191bc01e086ab8bc8"
-SRC_URI = "git://git.code.sf.net/p/gptfdisk/code"
-
-S = "${WORKDIR}/git"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz"
+SRC_URI[md5sum] = "2061f917af084215898d4fea04d8388f"
+SRC_URI[sha256sum] = "5b66956743a799fc0471cdb032665c1391e82f9c5b3f1d7d726d29fe2ba01d6c"
 
 do_install() {
     install -d ${D}${sbindir}
-- 
2.1.4


