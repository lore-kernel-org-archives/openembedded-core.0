Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCn-0000ex-TE
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181431"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:30 +0300
Message-Id: <1532d097bb00ab4ec486c22a4f06dafa89ee52dd.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 43/64] tcl: uncomment a line that causing TCL_SRC_DIR point to the workdir.
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:42 -0000

From: Jackie Huang <jackie.huang@windriver.com>

The line 'sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh'
is commented somehow in previous commit, so that TCL_SRC_DIR
point to the tcl workdir which will cause package that use it
fail to configure or compile when the tcl workdir is removed,
so uncomment it back.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/tcltk/tcl_8.5.11.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
index f19e25a..e5fe7d3 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
@@ -46,7 +46,7 @@ do_install() {
 	autotools_do_install
 	oe_libinstall -so libtcl8.5 ${STAGING_LIBDIR}
 	ln -sf ./tclsh8.5 ${D}${bindir}/tclsh
-	#sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
+	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
 	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
 	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh 
 	install -d ${D}${bindir_crossscripts}
-- 
1.7.7.6



