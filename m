Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QmQLc-00080B-RN
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 15:09:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Jul 2011 06:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,282,1309762800"; d="scan'208";a="33091578"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 28 Jul 2011 06:05:40 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 21:03:06 +0800
Message-Id: <dbe75b1d05a85f17c749a45fdfbca0025c481c24.1311858056.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1311858056.git.edwin.zhai@intel.com>
References: <cover.1311858056.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1311858056.git.edwin.zhai@intel.com>
References: <cover.1311858056.git.edwin.zhai@intel.com>
Subject: [PATCH 4/7] apr-util: Upgrade to 1.3.12
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
X-List-Received-Date: Thu, 28 Jul 2011 13:09:57 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../apr/{apr-util_1.3.10.bb => apr-util_1.3.12.bb} |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-support/apr/{apr-util_1.3.10.bb => apr-util_1.3.12.bb} (74%)

diff --git a/meta/recipes-support/apr/apr-util_1.3.10.bb b/meta/recipes-support/apr/apr-util_1.3.12.bb
similarity index 74%
rename from meta/recipes-support/apr/apr-util_1.3.10.bb
rename to meta/recipes-support/apr/apr-util_1.3.12.bb
index 7071b90..8e9fd61 100644
--- a/meta/recipes-support/apr/apr-util_1.3.10.bb
+++ b/meta/recipes-support/apr/apr-util_1.3.12.bb
@@ -13,8 +13,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.gz \
            file://configfix.patch;patch=1 \
            file://configure_fixes.patch;patch=1"
 
-SRC_URI[md5sum] = "82acd25cf3df8c72eba44eaee8b80c19"
-SRC_URI[sha256sum] = "7c37ac40b2351bfc23000fb6b7b54a67e0872255df315c82eb60c821bcef4b23"
+SRC_URI[md5sum] = "d1977289889592ef998e3f777f68efe4"
+SRC_URI[sha256sum] = "815b6fc82950f61050a5e711a7f3c20fd9b6ffcc7a4cacfe9f291fb241210cd8"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ 
 		--without-odbc \
@@ -33,3 +33,7 @@ do_configure_prepend() {
 	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
 }
 
+FILES_${PN}-dev += "${libdir}/aprutil.exp"
+FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
+FILES_${PN}-dbg += "${libdir}/apr-util-1/* ${libdir}/apr-util-1/.debug/*"
+
-- 
1.7.1



