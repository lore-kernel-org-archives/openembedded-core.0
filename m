Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFLW1-000288-M8
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 09:52:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2011 00:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="63341616"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by orsmga001.jf.intel.com with ESMTP; 16 Oct 2011 00:46:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 00:46:15 -0700
Message-Id: <e3b03d7727dc4578e335bf48383c7b6ca7c4729a.1318751027.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318751027.git.sgw@linux.intel.com>
References: <cover.1318751027.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318751027.git.sgw@linux.intel.com>
References: <cover.1318751027.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/14] libomxil: Fix QA Package Errors
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
X-List-Received-Date: Sun, 16 Oct 2011 07:52:14 -0000

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



