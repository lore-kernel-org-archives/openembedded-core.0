Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGnUz-0002nx-84
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 09:57:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 00:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64982237"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 00:51:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 00:51:01 -0700
Message-Id: <1f0e36588b91001a6252ef2586ac6983b3c10072.1319096633.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL - v2 25/26] gst-plugins-good: correctly handle gconf schema
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
X-List-Received-Date: Thu, 20 Oct 2011 08:02:05 -0000

From: Joshua Lock <josh@linux.intel.com>

Add the shipped gconf schema to the base package and inherit the gconf class
so that scheme processing is handled via post* scripts.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../gstreamer/gst-plugins-good_0.10.30.bb          |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
index 96855aa..d63b09a 100644
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
+FILES_${PN} += "${sysconfdir}/gconf/schemas/gstreamer-0.10.schemas"
-- 
1.7.6.2



