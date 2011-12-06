Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RXkiC-00059i-Fk
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 03:24:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Dec 2011 18:18:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,302,1320652800"; d="scan'208";a="82548337"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.192])
	by azsmga001.ch.intel.com with ESMTP; 05 Dec 2011 18:18:03 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 18:18:01 -0800
Message-Id: <4dc5e05611fad73bbd9647b77fce565700121f00.1323137480.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1323137480.git.josh@linux.intel.com>
References: <cover.1323137480.git.josh@linux.intel.com>
In-Reply-To: <cover.1323137480.git.josh@linux.intel.com>
References: <cover.1323137480.git.josh@linux.intel.com>
Subject: [PATCH 4/4] clutter-gst: upgrade to 1.4.4
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
X-List-Received-Date: Tue, 06 Dec 2011 02:24:52 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 ...r-gst-1.8_1.4.2.bb => clutter-gst-1.8_1.4.4.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-gst-1.8_1.4.2.bb => clutter-gst-1.8_1.4.4.bb} (80%)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.2.bb b/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.4.bb
similarity index 80%
rename from meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.2.bb
rename to meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.4.bb
index 54b1fc1..a0616c7 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.2.bb
+++ b/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.4.bb
@@ -13,8 +13,8 @@ SRC_URI = "http://source.clutter-project.org/sources/clutter-gst/1.4/clutter-gst
 
 S = "${WORKDIR}/clutter-gst-${PV}"
 
-SRC_URI[md5sum] = "fd6b2a54f43d04382748e9e4d8a335c5"
-SRC_URI[sha256sum] = "b0e7ff76ee14307b6d26856972ec9e718f62aec2bc8807fb3f2960e508e578b5"
+SRC_URI[md5sum] = "c660649907785ee96f6e84d97f19d574"
+SRC_URI[sha256sum] = "23cb10e7629696a696ca8619614c517ff0a341e89a701075f2a123a2e26999e9"
 
 do_configure_prepend () {
        # Disable DOLT
-- 
1.7.7.3



