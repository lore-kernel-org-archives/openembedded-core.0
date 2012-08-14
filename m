Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCZ-0000ne-4R
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181355"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:19 +0300
Message-Id: <bed129aee04252901fdb9f981f9478f2a47526ba.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 32/64] sed: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:36 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/sed/sed_4.1.2.bb |    9 ++++-----
 meta/recipes-extended/sed/sed_4.2.1.bb |    9 ++++-----
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/sed/sed_4.1.2.bb b/meta/recipes-extended/sed/sed_4.1.2.bb
index 3455c20..821ff65 100644
--- a/meta/recipes-extended/sed/sed_4.1.2.bb
+++ b/meta/recipes-extended/sed/sed_4.1.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://sed/sed.h;beginline=1;endline=17;md5=e00ffd1837f298439a214fd197f6a407"
 SECTION = "console/utils"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz \
            file://fix_return_type.patch \
@@ -18,13 +18,12 @@ inherit autotools update-alternatives gettext
 do_install () {
 	autotools_do_install
 	install -d ${D}${base_bindir}
-	mv ${D}${bindir}/sed ${D}${base_bindir}/sed.${BPN}
+	mv ${D}${bindir}/sed ${D}${base_bindir}/sed
 	rmdir ${D}${bindir}/
 }
 
-ALTERNATIVE_NAME = "sed"
-ALTERNATIVE_PATH = "sed.${BPN}"
-ALTERNATIVE_LINK = "${base_bindir}/sed"
+ALTERNATIVE_${PN} = "sed"
+ALTERNATIVE_LINK_NAME[sed] = "${base_bindir}/sed"
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/sed/sed_4.2.1.bb b/meta/recipes-extended/sed/sed_4.2.1.bb
index b39eca0..96c509a 100644
--- a/meta/recipes-extended/sed/sed_4.2.1.bb
+++ b/meta/recipes-extended/sed/sed_4.2.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://sed/sed.h;beginline=1;endline=17;md5=767ab3a06d7584f6fd0469abaec4412f"
 SECTION = "console/utils"
-PR = "r3"
+PR = "r5"
 
 SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz"
 
@@ -18,13 +18,12 @@ EXTRA_OECONF = "--disable-acl"
 do_install () {
 	autotools_do_install
 	install -d ${D}${base_bindir}
-	mv ${D}${bindir}/sed ${D}${base_bindir}/sed.${BPN}
+	mv ${D}${bindir}/sed ${D}${base_bindir}/sed
 	rmdir ${D}${bindir}/
 }
 
-ALTERNATIVE_NAME = "sed"
-ALTERNATIVE_PATH = "sed.${BPN}"
-ALTERNATIVE_LINK = "${base_bindir}/sed"
+ALTERNATIVE_${PN} = "sed"
+ALTERNATIVE_LINK_NAME[sed] = "${base_bindir}/sed"
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
-- 
1.7.7.6



