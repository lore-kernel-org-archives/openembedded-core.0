Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCd-0000Ym-Ca
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181362"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:20 +0300
Message-Id: <45e25fd92f7a6ac1f89a1a9bd63deeba4039f4dd.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 33/64] gawk: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:30:11 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/gawk/gawk_3.1.5.bb |    7 +++----
 meta/recipes-extended/gawk/gawk_4.0.1.bb |    7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_3.1.5.bb b/meta/recipes-extended/gawk/gawk_3.1.5.bb
index 89dd01c..5500974 100644
--- a/meta/recipes-extended/gawk/gawk_3.1.5.bb
+++ b/meta/recipes-extended/gawk/gawk_3.1.5.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 RDEPENDS_gawk += "gawk-common"
 RDEPENDS_pgawk += "gawk-common"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
 	file://gawk-3.1.5_fix_for_automake-1.12.patch"
@@ -30,9 +30,8 @@ FILES_gawk-common += "${datadir}/awk/* ${libexecdir}/awk/*"
 FILES_pgawk = "${bindir}/pgawk*"
 FILES_${PN}-dbg += "${libexecdir}/awk/.debug"
 
-ALTERNATIVE_NAME = "awk"
-ALTERNATIVE_PATH = "gawk"
-ALTERNATIVE_LINK = "${bindir}/awk"
+ALTERNATIVE_${PN} = "awk"
+ALTERNATIVE_TARGET[awk] = "${bindir}/gawk"
 ALTERNATIVE_PRIORITY = "100"
 
 CFLAGS += "-D PROTOTYPES"
diff --git a/meta/recipes-extended/gawk/gawk_4.0.1.bb b/meta/recipes-extended/gawk/gawk_4.0.1.bb
index b986ebd..fcd7619 100644
--- a/meta/recipes-extended/gawk/gawk_4.0.1.bb
+++ b/meta/recipes-extended/gawk/gawk_4.0.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 RDEPENDS_gawk += "gawk-common"
 RDEPENDS_pgawk += "gawk-common"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz"
 
@@ -28,9 +28,8 @@ FILES_pgawk = "${bindir}/pgawk*"
 FILES_${PN}-dbg += "${libexecdir}/awk/.debug"
 FILES_dgawk = "${bindir}/dgawk*"
 
-ALTERNATIVE_NAME = "awk"
-ALTERNATIVE_PATH = "gawk"
-ALTERNATIVE_LINK = "${bindir}/awk"
+ALTERNATIVE_${PN} = "awk"
+ALTERNATIVE_TARGET[awk] = "${bindir}/gawk"
 ALTERNATIVE_PRIORITY = "100"
 
 do_install_append() {
-- 
1.7.7.6



