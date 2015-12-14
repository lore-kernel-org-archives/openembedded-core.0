Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3417316E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064100"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:05 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:16 +0200
Message-Id: <a709265f9b19eb1d4def2ea5806ecc85a06c53c6.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/20] cdrtools-native: update to 3.01 final
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:05 -0000

Introduce a PE to avoid the version going backwards

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{cdrtools-native_3.01a31.bb => cdrtools-native_3.01.bb}    | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/cdrtools/{cdrtools-native_3.01a31.bb => cdrtools-native_3.01.bb} (61%)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
similarity index 61%
rename from meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
rename to meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index d7ad253..796e437 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -7,14 +7,12 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/alpha/cdrtools-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "78172557894f469b4584d008e93ec469"
-SRC_URI[sha256sum] = "183b5c12777779e78d8b69461aae52401f863768e7e7391d60730006f8cadc5a"
+SRC_URI[md5sum] = "7d45c5b7e1f78d85d1583b361aee6e8b"
+SRC_URI[sha256sum] = "ed282eb6276c4154ce6a0b5dee0bdb81940d0cbbfc7d03f769c4735ef5f5860f"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/cdrtools/files/alpha/"
-
-S = "${WORKDIR}/cdrtools-3.01"
+PE = "1"
 
 inherit native
 
-- 
2.6.2


