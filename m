Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 91B087054E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 18:54:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2014 11:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,425,1406617200"; d="scan'208";a="595239744"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 29 Aug 2014 11:53:59 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 21:53:43 +0300
Message-Id: <d4661f33ec216c21d82a9cbc7e9c991398f9bf69.1409338378.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409338378.git.cristian.iorga@intel.com>
References: <cover.1409338378.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409338378.git.cristian.iorga@intel.com>
References: <cover.1409338378.git.cristian.iorga@intel.com>
Subject: [PATCH 1/7] gstreamer1.0: upgrade to 1.4.1
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

bugfix release.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../gstreamer/{gstreamer1.0_1.4.0.bb => gstreamer1.0_1.4.1.bb}       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.4.0.bb => gstreamer1.0_1.4.1.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.1.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.1.bb
index a958064..56fc4f2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.1.bb
@@ -7,8 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
 "
-
-SRC_URI[md5sum] = "594c0c06eaace9b9d3bad010de1bdfae"
-SRC_URI[sha256sum] = "23c39fdc2b24f889b07cab0449825384fef7592a121e180729fd9025ec45c695"
+SRC_URI[md5sum] = "bd0938d680d657249b885162f310702d"
+SRC_URI[sha256sum] = "5638f75003282135815c0077d491da11e9a884ad91d4ba6ab3cc78bae0fb452e"
 S = "${WORKDIR}/gstreamer-${PV}"
 
-- 
1.9.1


