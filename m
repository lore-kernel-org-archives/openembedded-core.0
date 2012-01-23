Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpOrO-0004vP-FO
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:43:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2012 10:34:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59212159"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.82])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Jan 2012 10:34:34 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:34:10 -0800
Message-Id: <f006935034b89bf7c2208c505816bb72943674c9.1327343524.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
Subject: [PATCH v2 05/21] libsoup: refactor packages for staticdev
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



