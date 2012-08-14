Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCU-0000ne-Cu
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:24 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181319"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:13 +0300
Message-Id: <95b8665ed881cce1490246c7bd48cf7a7cd6ec81.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 26/64] mingetty: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:24 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/mingetty/mingetty_1.08.bb |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index a1f9eb2..235a3be 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -13,14 +13,13 @@ SRC_URI[sha256sum] = "0f55c90ba4faa913d91ef99cbf5cb2eb4dbe2780314c3bb17953f849c8
 EXTRA_OEMAKE = "CC='${CC}'"
 
 do_install(){
-    mkdir -p ${D}${mandir}/man8
-    mkdir -p ${D}${base_sbindir}
+    install -d ${D}${mandir}/man8 ${D}/${base_sbindir}
     oe_runmake install DESTDIR=${D}
 }
 
 inherit update-alternatives
 
-ALTERNATIVE_NAME = "getty"
-ALTERNATIVE_LINK = "${base_sbindir}/getty"
-ALTERNATIVE_PATH = "${base_sbindir}/mingetty"
+ALTERNATIVE_${PN} = "getty"
+ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
+ALTERNATIVE_TARGET[getty] = "${base_sbindir}/mingetty"
 ALTERNATIVE_PRIORITY = "50"
-- 
1.7.7.6



