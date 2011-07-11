Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgPjM-0005b8-G8
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 01:17:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2011 16:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,517,1304319600"; d="scan'208";a="26491806"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2011 16:13:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 16:13:12 -0700
Message-Id: <b7b22ed31de766af73e19834937744280273bdd5.1310425837.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
Subject: [PATCH 05/26] wireless-tools: Updated for staticdev packaging
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
X-List-Received-Date: Mon, 11 Jul 2011 23:17:36 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../wireless-tools/wireless-tools_29.bb            |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
index cc51dec..a9de242 100644
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 			file://sample_enc.c;beginline=1;endline=4;md5=838372be07874260b566bae2f6ed33b6"
 SECTION = "base"
 PE = "1"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.29.tar.gz \
            file://man.patch;apply=yes \
@@ -41,13 +41,15 @@ do_install() {
 }
 
 PACKAGES = "libiw-dbg ifrename-dbg ${PN}-dbg \
-libiw libiw-dev libiw-doc ifrename-doc ifrename ${PN} ${PN}-doc"
+libiw libiw-dev libiw-doc libiw-staticdev ifrename-doc ifrename ${PN} ${PN}-doc"
 
-FILES_libiw-dbg = "${libdir}/.debug/*.so.*"
+FILES_libiw-dbg = "${libdir}/.debug/*${SOLIBS}"
 FILES_ifrename-dbg = "${sbindir}/.debug/ifrename"
-FILES_libiw = "${libdir}/*.so.*"
-FILES_libiw-dev = "${libdir}/*.a ${libdir}/*.so ${includedir}"
+FILES_libiw = "${libdir}/*${SOLIBS}"
+FILES_libiw-dev = "${libdir}/${SOLIBSDEV} ${includedir}"
 FILES_libiw-doc = "${mandir}/man7"
+FILES_libiw-staticdev = "${libdir}/*.a"
+RDEPENDS_libiw-staticdev = "libiw-dev (= ${EXTENDPKGV})"
 FILES_ifrename = "${sbindir}/ifrename"
 FILES_ifrename-doc = "${mandir}/man8/ifrename.8 ${mandir}/man5/iftab.5"
 FILES_${PN} = "${bindir} ${sbindir}/iw* ${base_sbindir} ${base_bindir} ${sysconfdir}/network"
-- 
1.7.3.4



