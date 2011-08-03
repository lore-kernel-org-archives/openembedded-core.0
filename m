Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qojjf-0004YH-VC
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:16:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 15:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; 
   d="scan'208";a="3912943"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 15:11:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 15:11:01 -0700
Message-Id: <d00b84ded1608e061f6635ce4175214e72f9568b.1312407628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL v2 17/33] apr-util: Upgrade to 1.3.12
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
X-List-Received-Date: Wed, 03 Aug 2011 22:16:20 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>

Merged with ${BPN} change

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../apr/{apr-util_1.3.10.bb => apr-util_1.3.12.bb} |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)
 rename meta/recipes-support/apr/{apr-util_1.3.10.bb => apr-util_1.3.12.bb} (67%)

diff --git a/meta/recipes-support/apr/apr-util_1.3.10.bb b/meta/recipes-support/apr/apr-util_1.3.12.bb
similarity index 67%
rename from meta/recipes-support/apr/apr-util_1.3.10.bb
rename to meta/recipes-support/apr/apr-util_1.3.12.bb
index 01595df..6635202 100644
--- a/meta/recipes-support/apr/apr-util_1.3.10.bb
+++ b/meta/recipes-support/apr/apr-util_1.3.12.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=519e0a18e03f7c023070568c14b077bb \
 PR = "r0"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
-           file://configfix.patch;patch=1 \
-           file://configure_fixes.patch;patch=1"
+           file://configfix.patch \
+           file://configure_fixes.patch"
 
-SRC_URI[md5sum] = "82acd25cf3df8c72eba44eaee8b80c19"
-SRC_URI[sha256sum] = "7c37ac40b2351bfc23000fb6b7b54a67e0872255df315c82eb60c821bcef4b23"
+SRC_URI[md5sum] = "d1977289889592ef998e3f777f68efe4"
+SRC_URI[sha256sum] = "815b6fc82950f61050a5e711a7f3c20fd9b6ffcc7a4cacfe9f291fb241210cd8"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ 
 		--without-odbc \
@@ -33,3 +33,7 @@ do_configure_prepend() {
 	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
 }
 
+FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
+FILES_${PN}-dev += "${libdir}/aprutil.exp ${libdir}/apr-util-1/apr_dbm_gdbm.*"
+FILES_${PN}-dbg += "${libdir}/apr-util-1/.debug/*"
+
-- 
1.7.3.4



