Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF437688F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 14:22:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 10 Aug 2015 07:22:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,645,1432623600"; d="scan'208";a="745684101"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2015 07:22:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 17:23:25 +0300
Message-Id: <ba5e15382543bbf5bcb234e57d490de30bb9021c.1439216269.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 7/8] cdrtools: update to 3.01a31
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
X-List-Received-Date: Mon, 10 Aug 2015 14:22:27 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{cdrtools-native_3.01a20.bb => cdrtools-native_3.01a31.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cdrtools/{cdrtools-native_3.01a20.bb => cdrtools-native_3.01a31.bb} (81%)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a20.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
similarity index 81%
rename from meta/recipes-devtools/cdrtools/cdrtools-native_3.01a20.bb
rename to meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
index 2827109..d0f36e2 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a20.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/alpha/cdrtools-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "f8c6f0fdcba7df0606095498d10315a7"
-SRC_URI[sha256sum] = "e399ea964b8048793721b71461271e46d81f242bd2feefb8dbd259c30e75a5a9"
+SRC_URI[md5sum] = "78172557894f469b4584d008e93ec469"
+SRC_URI[sha256sum] = "183b5c12777779e78d8b69461aae52401f863768e7e7391d60730006f8cadc5a"
 
 S = "${WORKDIR}/cdrtools-3.01"
 
-- 
2.1.4


