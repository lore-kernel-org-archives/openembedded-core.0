Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 460CD65EAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:13:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2014 17:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,541,1400050800"; d="scan'208";a="560482013"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2014 17:13:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2014 17:13:16 -0700
Message-Id: <8fc6f01cc245737557b3689fef0c67542a04cd08.1403654908.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
Subject: [PATCH 06/10] xcb-util-renderutil: Update to version 0.3.9
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
X-List-Received-Date: Wed, 25 Jun 2014 00:13:41 -0000

Updated LIC_FILES_CHKSUM to focus only on header section
no license changes

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...xcb-util-renderutil_0.3.8.bb => xcb-util-renderutil_0.3.9.bb} | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xcb-util-renderutil_0.3.8.bb => xcb-util-renderutil_0.3.9.bb} (49%)

diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.8.bb b/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.9.bb
similarity index 49%
rename from meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.8.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.9.bb
index 93b34e8..25c22e5 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.8.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.9.bb
@@ -3,11 +3,8 @@ require xcb-util.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://renderutil/glyph.c;endline=24;md5=c517c483b8d726234ec94f9169236661 \
 					file://renderutil/util.c;endline=20;md5=6e0bfc44fb13298c0f4694eb70dc80d4 \
-					file://renderutil/xcb_renderutil.h;md5=c8732d30d204d3b55e956489f635cefb \
+					file://renderutil/xcb_renderutil.h;endline=24;md5=d0ddab3052dd4949c93cfcb0891c96df \
 					"
 
-SRC_URI[md5sum] = "b346ff598ee093c141f836fbc0f8f721"
-SRC_URI[sha256sum] = "9789a5c55728fa7bae374d9fdf1c61095869bdc68561911760879095644c7452"
-
-
-
+SRC_URI[md5sum] = "468b119c94da910e1291f3ffab91019a"
+SRC_URI[sha256sum] = "c6e97e48fb1286d6394dddb1c1732f00227c70bd1bedb7d1acabefdd340bea5b"
-- 
1.8.3.1


