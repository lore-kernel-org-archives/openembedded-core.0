Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 87D486FCE0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 18:54:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2014 11:48:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,425,1406617200"; d="scan'208";a="595239760"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 29 Aug 2014 11:54:02 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 21:53:46 +0300
Message-Id: <8e8a1532fe8a32273c9046e9de9e5e3058d8c898.1409338378.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409338378.git.cristian.iorga@intel.com>
References: <cover.1409338378.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409338378.git.cristian.iorga@intel.com>
References: <cover.1409338378.git.cristian.iorga@intel.com>
Subject: [PATCH 4/7] gstreamer1.0-plugins-good: upgrade to 1.4.1
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
X-List-Received-Date: Fri, 29 Aug 2014 18:54:55 -0000

Bugfix release.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...r1.0-plugins-good_1.4.0.bb => gstreamer1.0-plugins-good_1.4.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.4.0.bb => gstreamer1.0-plugins-good_1.4.1.bb} (77%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.1.bb
similarity index 77%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.1.bb
index 2d392c6..441dd51 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.1.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 SRC_URI += "file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
 "
-
-SRC_URI[md5sum] = "8007d57a38f6b2882961b2547fa4597c"
-SRC_URI[sha256sum] = "48a62e7987fffa289a091dfc8ccc80b401d110632b8fc1adce5b82fc092f2685"
+SRC_URI[md5sum] = "eb3a3296b2f6009def1f5a09590ce767"
+SRC_URI[sha256sum] = "8559d4270065b30ed5c49b826e1b7a3a2bd5ee9a340ae745a2ae3f9718e4c637"
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
1.9.1


