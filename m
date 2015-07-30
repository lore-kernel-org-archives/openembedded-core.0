Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7714076499
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:31:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 06:31:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758407500"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 06:31:04 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:31:36 +0300
Message-Id: <9c75bea242526a82f0cff2a42d2ad375ec776b8f.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/26] gptfdisk: use tarballs instead of git for fetching source code
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
X-List-Received-Date: Thu, 30 Jul 2015 13:31:27 -0000

git repository does not have version tags, so upstream version check
cannot be performed

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../fdisk/{gptfdisk_git.bb => gptfdisk_0.8.10.bb}                 | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/fdisk/{gptfdisk_git.bb => gptfdisk_0.8.10.bb} (75%)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_git.bb b/meta/recipes-devtools/fdisk/gptfdisk_0.8.10.bb
similarity index 75%
rename from meta/recipes-devtools/fdisk/gptfdisk_git.bb
rename to meta/recipes-devtools/fdisk/gptfdisk_0.8.10.bb
index 477c1d9..3b94b56 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_git.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_0.8.10.bb
@@ -5,11 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 DEPENDS = "util-linux popt ncurses"
 
-PV = "0.8.10+git${SRCPV}"
-SRCREV = "a920398fa393f9d6301b32b191bc01e086ab8bc8"
-SRC_URI = "git://git.code.sf.net/p/gptfdisk/code"
-
-S = "${WORKDIR}/git"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz"
+SRC_URI[md5sum] = "9cf4246c181c324bdbd553fe9b348373"
+SRC_URI[sha256sum] = "73e64151203ae0c347c488358e71ca582bb7fb7f0d66df86b71c42050390eb9b"
 
 do_install() {
     install -d ${D}${sbindir}
-- 
2.1.4


