Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFXEo-0003VQ-1c
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 22:23:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2011 13:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,354,1315206000"; d="scan'208";a="74375158"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2011 13:17:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 13:17:12 -0700
Message-Id: <d8ce0b914684d848098d30281a54e402eb9be984.1318796061.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
Subject: [v2 -CONSOLIDATED PULL 10/14] libomxil: Fix QA Package Errors
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
X-List-Received-Date: Sun, 16 Oct 2011 20:23:14 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb
index 665601f..da3ddde 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
                     file://src/omxcore.h;beginline=1;endline=27;md5=c2e37f68ba9652ca9b2431f466944174"
 DEPENDS = "libvorbis libogg alsa-lib libmad"
 
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/libomxil-B-${PV}.tar.gz"
 
 S = "${WORKDIR}/${BPN}-B-${PV}"
@@ -13,6 +15,9 @@ inherit autotools
 
 EXTRA_OECONF += "--disable-ffmpegcomponents"
 
-FILES_${PN} += "${libdir}/omxilcomponents/*.so*"
-FILES_${PN}-dev += "${libdir}/omxilcomponents/*.*a"
+FILES_${PN} += "${libdir}/omxilcomponents/*${SOLIBS} \
+                ${datadir}/libomxil-B"
+FILES_${PN}-staticdev += "${libdir}/omxilcomponents/*.a"
+FILES_${PN}-dev += "${libdir}/omxilcomponents/*.la \
+                    ${libdir}/omxilcomponents/*${SOLIBSDEV}"
 FILES_${PN}-dbg += "${libdir}/omxilcomponents/.debug/"
-- 
1.7.6.2



