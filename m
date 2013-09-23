Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0D362610DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 13:18:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Sep 2013 06:18:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,962,1371106800"; d="scan'208";a="405828734"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.20])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2013 06:18:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 14:18:03 +0100
Message-Id: <1379942283-19059-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] libav: make X11 dependencies dependent on DISTRO_FEATURES
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
X-List-Received-Date: Mon, 23 Sep 2013 13:18:06 -0000

This enables building libav when x11 is not in DISTRO_FEATURES.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-multimedia/libav/libav.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index eae190d..c33f7ed 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -23,7 +23,7 @@ BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
 EXTRA_FFCONF ?= ""
 
-PACKAGECONFIG ??= "bzip2 x264 x11"
+PACKAGECONFIG ??= "bzip2 x264 ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
 PACKAGECONFIG[bzip2] = "--enable-bzlib,--disable-bzlib,bzip2"
 PACKAGECONFIG[schroedinger] = "--enable-libschroedinger,--disable-libschroedinger,schroedinger"
-- 
1.8.1.2


