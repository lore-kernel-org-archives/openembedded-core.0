Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 33EFF6E7D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 14:12:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Feb 2014 06:12:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,505,1389772800"; d="scan'208";a="477667110"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2014 06:11:54 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 16:14:42 +0200
Message-Id: <5d5dd74db2662040aebefe37ab2fa17d778d8ba9.1392819236.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1392819236.git.cristian.iorga@intel.com>
References: <cover.1392819236.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1392819236.git.cristian.iorga@intel.com>
References: <cover.1392819236.git.cristian.iorga@intel.com>
Subject: [PATCH 2/8] gstreamer1.0: upgrade to 1.2.3
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
X-List-Received-Date: Wed, 19 Feb 2014 14:12:02 -0000

- bugfix release.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../gstreamer/{gstreamer1.0_1.2.2.bb => gstreamer1.0_1.2.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.2.2.bb => gstreamer1.0_1.2.3.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
index 07357d3..f2c1db5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
     "
-SRC_URI[md5sum] = "4293ca4d8333690d5acdffe3ad354924"
-SRC_URI[sha256sum] = "b9f12137ab663edc6c37429b38ca7911074b9c2a829267fe855d4e57d916a0b6"
+SRC_URI[md5sum] = "8155b9c7574ccaa361cc504e8e0e72dc"
+SRC_URI[sha256sum] = "0f9a9817a384b3448c368c23345e5122435caef9c00f1c40d7b1953827b0d8eb"
 S = "${WORKDIR}/gstreamer-${PV}"
 
-- 
1.8.3.2


