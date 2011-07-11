Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgPjM-0005bH-HH
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 01:17:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2011 16:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,517,1304319600"; d="scan'208";a="26491807"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2011 16:13:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 16:13:13 -0700
Message-Id: <6f965fc2df769b7cadd12870e27ee2b6836f1ed4.1310425837.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
Subject: [PATCH 06/26] augeas: inherit shared_lib class
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
X-List-Received-Date: Mon, 11 Jul 2011 23:17:39 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/augeas/augeas.inc      |    7 ++-----
 meta/recipes-extended/augeas/augeas_0.8.1.bb |    2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index 619cd20..76b1c05 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -9,14 +9,11 @@ SRC_URI = "http://augeas.net/download/${BP}.tar.gz"
 
 DEPENDS = "readline"
 
-inherit autotools
+inherit autotools shared_lib
 
-PACKAGES =+ "${PN}-lenses lib${PN} lib${PN}-dev lib${PN}-dbg"
+PACKAGES =+ "${PN}-lenses"
 
 FILES_${PN}-lenses = "${datadir}/augeas/lenses"
-FILES_lib${PN} = "${libdir}/*.so.*"
-FILES_lib${PN}-dev = "${libdir}/*.so ${libdir}/*.a ${libdir}/*.la ${includedir} ${libdir}/pkgconfig"
-FILES_lib${PN}-dbg = "${libdir}/.debug"
 
 RDEPENDS_lib${PN} += "${PN}-lenses"
 RRECOMMENDS_lib${PN} += "${PN}"
diff --git a/meta/recipes-extended/augeas/augeas_0.8.1.bb b/meta/recipes-extended/augeas/augeas_0.8.1.bb
index 51eeb33..ee45098 100644
--- a/meta/recipes-extended/augeas/augeas_0.8.1.bb
+++ b/meta/recipes-extended/augeas/augeas_0.8.1.bb
@@ -1,6 +1,6 @@
 require augeas.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "62d47bdc60e175f93aed3b81cb8e2785"
 SRC_URI[sha256sum] = "916fef67e8eed6d1abe02433830301bd01dfc8228e9cfffb490347545155c4d7"
-- 
1.7.3.4



