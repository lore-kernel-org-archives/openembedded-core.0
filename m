Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 27B3A65D18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 08:51:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 01:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,949,1389772800"; d="scan'208";a="531450509"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 01:51:14 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 11:54:23 +0300
Message-Id: <b3bd09d656c64bb8d483ae7ebe12ae9034feffd5.1398761629.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398761629.git.cristian.iorga@intel.com>
References: <cover.1398761629.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1398761629.git.cristian.iorga@intel.com>
References: <cover.1398761629.git.cristian.iorga@intel.com>
Subject: [PATCH 2/7] gstreamer1.0: upgrade to 1.2.4
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
X-List-Received-Date: Tue, 29 Apr 2014 08:51:14 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../gstreamer/{gstreamer1.0_1.2.3.bb => gstreamer1.0_1.2.4.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.2.3.bb => gstreamer1.0_1.2.4.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.4.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.4.bb
index f2c1db5..1204dd5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.4.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
     "
-SRC_URI[md5sum] = "8155b9c7574ccaa361cc504e8e0e72dc"
-SRC_URI[sha256sum] = "0f9a9817a384b3448c368c23345e5122435caef9c00f1c40d7b1953827b0d8eb"
+SRC_URI[md5sum] = "74d8f674187a5f0ddf38da594c3998c3"
+SRC_URI[sha256sum] = "1e7ca67a7870a82c9ed51d51d0008cdbc550c41d64cc3ff3f9a1c2fc311b4929"
 S = "${WORKDIR}/gstreamer-${PV}"
 
-- 
1.9.1


