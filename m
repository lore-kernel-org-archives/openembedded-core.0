Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpOrP-0004vA-Hy
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:43:20 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2012 10:34:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59212186"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.82])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Jan 2012 10:34:37 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:34:15 -0800
Message-Id: <9dca696a91a98f7b36c0edb9c60e5851128164a8.1327343524.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
Subject: [PATCH v2 10/21] mpeg2dec: refactor packages for staticdev
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
X-List-Received-Date: Mon, 23 Jan 2012 18:43:20 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
index 351962f..fd45640 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "virtual/libx11"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://libmpeg2.sourceforge.net/files/mpeg2dec-${PV}.tar.gz \
            file://altivec_h_needed.patch"
@@ -19,16 +19,18 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--enable-shared --disable-sdl --with-x"
 
-PACKAGES = "mpeg2dec-dbg mpeg2dec mpeg2dec-doc libmpeg2 libmpeg2-dev libmpeg2convert libmpeg2convert-dev"
+PACKAGES = "mpeg2dec-dbg mpeg2dec mpeg2dec-doc libmpeg2 libmpeg2-dev libmpeg2convert libmpeg2convert-dev libmpeg2-staticdev libmpeg2convert-staticdev"
 
 FILES_${PN} = "${bindir}/*"
 FILES_libmpeg2 = "${libdir}/libmpeg2.so.*"
 FILES_libmpeg2convert = "${libdir}/libmpeg2convert.so.*"
 FILES_libmpeg2-dev = "${libdir}/libmpeg2.so \
-                      ${libdir}/libmpeg2.*a \
+                      ${libdir}/libmpeg2.la \
                       ${libdir}/pkgconfig/libmpeg2.pc \
                       ${includedir}/mpeg2dec/mpeg2.h"
+FILES_libmpeg2-staticdev = "${libdir}/libmpeg2.a"
 FILES_libmpeg2convert-dev = "${libdir}/libmpeg2convert.so \
-                             ${libdir}/libmpeg2convert.*a \
+                             ${libdir}/libmpeg2convert.la \
                              ${libdir}/pkgconfig/libmpeg2convert.pc \
                              ${includedir}/mpeg2dec/mpeg2convert.h"
+FILES_libmpeg2convert-staticdev = "${libdir}/libmpeg2convert.a"
-- 
1.7.6.5



