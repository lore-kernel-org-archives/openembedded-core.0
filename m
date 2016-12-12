Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 48AD865CC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:12:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 02:12:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,334,1477983600"; d="scan'208";a="1097955466"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2016 02:12:03 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 47E316A4006;
	Mon, 12 Dec 2016 02:11:16 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 12:11:43 +0200
Message-Id: <6fc72334f14633e4be8043b5a763adb49a58051f.1481536730.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481536730.git.jussi.kukkonen@intel.com>
References: <cover.1481536730.git.jussi.kukkonen@intel.com>
Subject: [PATCH 06/12] xf86-input-mouse: Upgrade 1.9.1 -> 1.9.2
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
X-List-Received-Date: Mon, 12 Dec 2016 10:12:02 -0000

Tiny update with ABI 23/24 support.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-mouse_1.9.1.bb => xf86-input-mouse_1.9.2.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.9.1.bb => xf86-input-mouse_1.9.2.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb
index 1f0b78a..0750476 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb
@@ -10,6 +10,5 @@ driver."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=90ea9f90d72b6d9327dede5ffdb2a510"
 
-SRC_URI[md5sum] = "77085b649c5c0b333565ba562f573951"
-SRC_URI[sha256sum] = "3485d375779c08406f0789feedde15933dc703158a086ddac638598f479fc5ce"
-
+SRC_URI[md5sum] = "ce2d679283a22c8e0dccdd9248594845"
+SRC_URI[sha256sum] = "f425d5b05c6ab412a27e0a1106bb83f9e2662b307210abbe48270892387f4b2f"
-- 
2.1.4


