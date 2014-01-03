Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E8BE16B8D0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 14:27:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2014 06:27:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,598,1384329600"; d="scan'208";a="459627792"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2014 06:27:34 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 16:30:04 +0200
Message-Id: <60a67fce0a9c665964fce7bf549d4f549b4c6b32.1388759244.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
Subject: [PATCH 1/8] gstreamer1.0: upgrade to 1.2.2
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
X-List-Received-Date: Fri, 03 Jan 2014 14:27:35 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../gstreamer/{gstreamer1.0_1.2.0.bb => gstreamer1.0_1.2.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.2.0.bb => gstreamer1.0_1.2.2.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.2.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.2.bb
index 98d5412..07357d3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.2.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
     "
-SRC_URI[md5sum] = "250b4bec48b0986103f5aab75e43cef9"
-SRC_URI[sha256sum] = "94af5274299f845adf41cc504e0209b269acab7721293f49850fea27b4099463"
+SRC_URI[md5sum] = "4293ca4d8333690d5acdffe3ad354924"
+SRC_URI[sha256sum] = "b9f12137ab663edc6c37429b38ca7911074b9c2a829267fe855d4e57d916a0b6"
 S = "${WORKDIR}/gstreamer-${PV}"
 
-- 
1.8.3.2


