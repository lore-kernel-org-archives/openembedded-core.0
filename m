Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RGIAj-0002QY-2L
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 00:30:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Oct 2011 15:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,366,1315206000"; d="scan'208";a="63915357"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.46])
	by azsmga001.ch.intel.com with ESMTP; 18 Oct 2011 15:24:17 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2011 15:24:11 -0700
Message-Id: <36d6035f30aedab85ce5acf79d5a935151514f1f.1318976197.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1318976197.git.josh@linux.intel.com>
References: <cover.1318976197.git.josh@linux.intel.com>
In-Reply-To: <cover.1318976197.git.josh@linux.intel.com>
References: <cover.1318976197.git.josh@linux.intel.com>
Subject: [PATCH 1/2] gst-plugins-good: update to 0.10.30
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
X-List-Received-Date: Tue, 18 Oct 2011 22:30:09 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 ...good_0.10.28.bb => gst-plugins-good_0.10.30.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-good_0.10.28.bb => gst-plugins-good_0.10.30.bb} (84%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
rename to meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
index 6c837a7..96855aa 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
@@ -18,5 +18,5 @@ do_configure_prepend() {
 	rm ${S}/m4/lib-link.m4 || true
 }
 
-SRC_URI[md5sum] = "6ef1588921f59d85c44ee2e49a3c97a0"
-SRC_URI[sha256sum] = "adfbce68b9fbadb7a7aeda2227af6afe1928ef025af4158726617b9d6834b028"
+SRC_URI[md5sum] = "62fd7a3ef187c4f99b3d7c352d58dae9"
+SRC_URI[sha256sum] = "b12cba90b27d8423cd0a808939098d19db3996cfb9bf528507c6321782e095f6"
-- 
1.7.6.4



