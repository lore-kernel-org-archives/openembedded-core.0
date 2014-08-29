Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E82EB62252
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 18:54:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2014 11:48:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,425,1406617200"; d="scan'208";a="595239752"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 29 Aug 2014 11:54:01 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 21:53:45 +0300
Message-Id: <5f0a4de977c7b87b84ff08acf6ddd35f8bb3d333.1409338378.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409338378.git.cristian.iorga@intel.com>
References: <cover.1409338378.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409338378.git.cristian.iorga@intel.com>
References: <cover.1409338378.git.cristian.iorga@intel.com>
Subject: [PATCH 3/7] gstreamer1.0-plugins-base: upgrade to 1.4.1
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
 ...er1.0-plugins-base_1.4.0.bb => gstreamer1.0-plugins-base_1.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.4.0.bb => gstreamer1.0-plugins-base_1.4.1.bb} (78%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.1.bb
similarity index 78%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.1.bb
index 968f092..0db42ce 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.1.bb
@@ -9,6 +9,6 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://get-caps-from-src-pad-when-query-caps.patch \
 "
 
-SRC_URI[md5sum] = "1ff06280b03b9098a706d1290d8bb3bd"
-SRC_URI[sha256sum] = "5daed4b983b64e4e3fbe9cd29063e4302812cd03ba685a15b06a790911d04c1e"
+SRC_URI[md5sum] = "a825628225bd0a58c0df87cdd2a5db91"
+SRC_URI[sha256sum] = "aea9e25be6691bd3cc0785d005b2b5d70ce313a2c897901680a3f7e7cab5a499"
 S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
1.9.1


