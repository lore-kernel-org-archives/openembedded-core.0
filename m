Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1THALW-0006uO-LU
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 11:25:26 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Sep 2012 02:12:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,494,1344236400"; d="scan'208";a="149753122"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.66])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Sep 2012 02:12:07 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 11:17:37 +0300
Message-Id: <1348733857-18055-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH] gnome-keyring: include unpackaged files with PAM enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2012 09:25:26 -0000

Include missing files/dirs:
    ${base_libdir}/security/*.la
    ${base_libdir}/security/*${SOLIBSDEV}
    ${base_libdir}/security/.debug/

[YOCTO #2805]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
index d822721..92e0e1b 100644
--- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
+++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/gnome"
 
-PR = "r9"
+PR = "r10"
 
 inherit autotools gnome gtk-doc pkgconfig
 
@@ -43,7 +43,10 @@ FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr"
 
 FILES_${PN}-dev += "${libdir}/${BPN}/devel/*.la \
                     ${libdir}/${BPN}/devel/*${SOLIBSDEV} \
-                    ${libdir}/${BPN}/standalone/*.la"
+                    ${libdir}/${BPN}/standalone/*.la \
+                    ${base_libdir}/security/*.la \
+                    ${base_libdir}/security/*${SOLIBSDEV}"
 
 FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
-                    ${libdir}/${BPN}/devel/.debug/"
+                    ${libdir}/${BPN}/devel/.debug/ \
+                    ${base_libdir}/security/.debug/"
-- 
1.7.9.5



