Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 562746B7AD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010081"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:19 +0000
Message-Id: <56852476ad9bf502e4c03fddacdafc8f7cfe503a.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 23/38] xf86-video-fbdev: set SUMMARY and DESCRIPTION
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
X-List-Received-Date: Sat, 28 Dec 2013 22:30:16 -0000

Set these consistent with other X.org video driver recipes.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb
index 5d33854..52e9bd1 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb
@@ -1,8 +1,9 @@
 require xorg-driver-video.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 
-DESCRIPTION = "X.Org X server -- fbdev display driver"
+SUMMARY = "X.Org X server -- fbdev display driver"
+DESCRIPTION = "fbdev is an Xorg driver for framebuffer devices. This is a non-accelerated driver."
 
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 
 SRC_URI[md5sum] = "3931c0e19d441cc576dc088f9eb9fd73"
 SRC_URI[sha256sum] = "9dd4b326498223abbfdf786089a46ea3db4fa6bbd341308eb48a9e00bc3fd51b"
-- 
1.8.1.2


