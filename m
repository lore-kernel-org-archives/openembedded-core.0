Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qgu1A-0003mD-Ml
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 09:38:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jul 2011 00:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="25272054"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.40])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 00:33:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 00:33:37 -0700
Message-Id: <c8ddb47e45e42067f53a2b311e42bc5a9d4e4159.1310541680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
Subject: [PATCH V2 05/25] augeas: inherit shlibpackaging class
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
X-List-Received-Date: Wed, 13 Jul 2011 07:38:00 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/augeas/augeas.inc      |    7 ++-----
 meta/recipes-extended/augeas/augeas_0.8.1.bb |    2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index 619cd20..4ceea0e 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -9,14 +9,11 @@ SRC_URI = "http://augeas.net/download/${BP}.tar.gz"
 
 DEPENDS = "readline"
 
-inherit autotools
+inherit autotools shlibpackaging
 
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



