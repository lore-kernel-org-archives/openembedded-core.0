Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rppsf-0008Cn-On
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 00:34:26 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Jan 2012 15:26:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59668885"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.34])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jan 2012 15:26:38 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2012 15:26:33 -0800
Message-Id: <903bcf639d2ef09090884912e24b8d132b183126.1327447344.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1327447344.git.josh@linux.intel.com>
References: <cover.1327447344.git.josh@linux.intel.com>
In-Reply-To: <cover.1327447344.git.josh@linux.intel.com>
References: <cover.1327447344.git.josh@linux.intel.com>
Subject: [PATCH 1/4] clutter-gst: update to 1.4.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jan 2012 23:34:26 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 ...r-gst-1.8_1.4.4.bb => clutter-gst-1.8_1.4.6.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-gst-1.8_1.4.4.bb => clutter-gst-1.8_1.4.6.bb} (80%)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.4.bb b/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.6.bb
similarity index 80%
rename from meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.4.bb
rename to meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.6.bb
index a0616c7..facb0a1 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.4.bb
+++ b/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.6.bb
@@ -13,8 +13,8 @@ SRC_URI = "http://source.clutter-project.org/sources/clutter-gst/1.4/clutter-gst
 
 S = "${WORKDIR}/clutter-gst-${PV}"
 
-SRC_URI[md5sum] = "c660649907785ee96f6e84d97f19d574"
-SRC_URI[sha256sum] = "23cb10e7629696a696ca8619614c517ff0a341e89a701075f2a123a2e26999e9"
+SRC_URI[md5sum] = "98aeed6baa7b3a80f10e7733080eb088"
+SRC_URI[sha256sum] = "54e2966e507563bd3f123a4e25780c2487f854c6cc3df3bedc8c6b5eb45e9769"
 
 do_configure_prepend () {
        # Disable DOLT
-- 
1.7.7.6



