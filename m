Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpOrN-0004vE-8d
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:43:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2012 10:34:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59212151"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.82])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Jan 2012 10:34:32 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:34:08 -0800
Message-Id: <071437b2741e3f95afebddede1ada635bd76b1c3.1327343524.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
Subject: [PATCH v2 03/21] avahi-ui: refactor packages for staticdev
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
X-List-Received-Date: Mon, 23 Jan 2012 18:43:18 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
index bcc1f41..d7b9ed8 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 require avahi.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 DEPENDS += "avahi gtk+ libglade"
 
@@ -14,11 +14,12 @@ AVAHI_GTK = "--enable-gtk --disable-gtk3"
 
 S = "${WORKDIR}/avahi-${PV}"
 
-PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev ${PN}-doc python-avahi avahi-discover avahi-discover-standalone"
+PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc python-avahi avahi-discover avahi-discover-standalone"
 
 FILES_${PN} = "${libdir}/libavahi-ui*.so.*"
 FILES_${PN}-dbg += "${libdir}/.debug/libavah-ui*"
-FILES_${PN}-dev += "${libdir}/libavahi-ui*"
+FILES_${PN}-dev += "${libdir}/libavahi-ui${SOLIBSDEV}"
+FILES_${PN}-staticdev += "${libdir}/libavahi-ui.a"
 
 FILES_${PN}-utils = "${bindir}/b* ${datadir}/applications/b*"
 
-- 
1.7.6.5



