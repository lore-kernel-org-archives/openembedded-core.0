Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKX-0004D6-Cz
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:30:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:23:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472105"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:23:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:34 -0800
Message-Id: <3bf212a248f591caeb8b5380682700b92bb63164.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/33] gst-openmax: refactor packages for staticdev
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
X-List-Received-Date: Thu, 19 Jan 2012 09:30:52 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gstreamer/gst-openmax_0.10.1.bb                |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb b/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
index 776ed1c..b4fe52d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
@@ -12,10 +12,11 @@ inherit autotools
 
 EXTRA_OECONF += "--disable-valgrind"
 
-PR = "r2"
+PR = "r3"
 
 FILES_${PN} += "${libdir}/gstreamer-0.10/libgstomx.so"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/libgstomx.*a"
+FILES_${PN}-dev += "${libdir}/gstreamer-0.10/libgstomx.la"
+FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/libgstomx.a"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug/"
 
 SRC_URI[md5sum] = "4d0370bfe99dea20918c84347abadb4e"
-- 
1.7.6.5



