Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RoTT7-0001l8-Sv
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 06:26:26 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2012 21:18:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="101117505"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.79])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2012 21:18:41 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 21:18:23 -0800
Message-Id: <38d197edba63292e65b1b5658d44939d460885c5.1327123057.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
Subject: [PATCH 05/20] libsoup: refactor packages for staticdev
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
X-List-Received-Date: Sat, 21 Jan 2012 05:26:26 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libsoup/libsoup_2.2.105.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup_2.2.105.bb b/meta/recipes-support/libsoup/libsoup_2.2.105.bb
index 6ad90b8..cd0f552 100644
--- a/meta/recipes-support/libsoup/libsoup_2.2.105.bb
+++ b/meta/recipes-support/libsoup/libsoup_2.2.105.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "An HTTP library implementation in C"
 SECTION = "x11/gnome/libs"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "glib-2.0 gnutls libxml2"
 
@@ -14,6 +14,6 @@ SRC_URI[sha256sum] = "3760a127ee810cfd0fda257ff615d19a2dd8aeece199dad0d18690446d
 
 inherit autotools pkgconfig
 
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-dev = "${includedir}/ ${libdir}/"
-FILES_${PN}-doc = "${datadir}/"
+#FILES_${PN} = "${libdir}/lib*.so.*"
+#FILES_${PN}-dev = "${includedir}/ ${libdir}/"
+#FILES_${PN}-doc = "${datadir}/"
-- 
1.7.6.5



