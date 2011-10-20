Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RGxdT-0007VX-Uu
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 20:46:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 11:40:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="65230711"
Received: from jbkonno-mobl.jf.intel.com (HELO shamshir.jf.intel.com)
	([10.7.199.153])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 11:40:41 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 11:40:37 -0700
Message-Id: <64effb846c8f9b1e6fe57a7e213d24d046439b99.1319135920.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319135920.git.josh@linux.intel.com>
References: <cover.1319135920.git.josh@linux.intel.com>
In-Reply-To: <cover.1319135920.git.josh@linux.intel.com>
References: <cover.1319135920.git.josh@linux.intel.com>
Subject: [PATCH 1/1] gst-plugins-good: correctly handle gconf schema
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
X-List-Received-Date: Thu, 20 Oct 2011 18:46:36 -0000

Add the shipped gconf schema to the gconfelements package and inherit the gconf
class so that schema processing is handled via post* scripts.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../gstreamer/gst-plugins-good_0.10.30.bb          |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
index 96855aa..728175b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
 	    speex libsoup-2.4 pulseaudio"
-PR = "r2"
+PR = "r3"
 
-inherit gettext
+inherit gettext gconf
 
 EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check"
 
@@ -20,3 +20,5 @@ do_configure_prepend() {
 
 SRC_URI[md5sum] = "62fd7a3ef187c4f99b3d7c352d58dae9"
 SRC_URI[sha256sum] = "b12cba90b27d8423cd0a808939098d19db3996cfb9bf528507c6321782e095f6"
+
+FILES_${PN}-gconfelements += "${sysconfdir}/gconf/schemas/gstreamer-0.10.schemas"
-- 
1.7.6.4



