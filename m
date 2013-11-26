Return-Path: <cristiana.voicu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9EFA06DD3A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 12:34:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Nov 2013 04:34:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,774,1378882800"; d="scan'208";a="434308355"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by fmsmga001.fm.intel.com with ESMTP; 26 Nov 2013 04:34:07 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 14:39:46 +0200
Message-Id: <3a7a6426bcd0318f8b169b8b626cad27159dc942.1385469411.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385469411.git.cristiana.voicu@intel.com>
References: <cover.1385469411.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1385469411.git.cristiana.voicu@intel.com>
References: <cover.1385469411.git.cristiana.voicu@intel.com>
Subject: [PATCH 2/3] apr-util: upgrade to 1.5.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Nov 2013 12:34:11 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../apr/{apr-util_1.5.2.bb => apr-util_1.5.3.bb}   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/apr/{apr-util_1.5.2.bb => apr-util_1.5.3.bb} (92%)

diff --git a/meta/recipes-support/apr/apr-util_1.5.2.bb b/meta/recipes-support/apr/apr-util_1.5.3.bb
similarity index 92%
rename from meta/recipes-support/apr/apr-util_1.5.2.bb
rename to meta/recipes-support/apr/apr-util_1.5.3.bb
index ea0f7fb..3ca1f57 100644
--- a/meta/recipes-support/apr/apr-util_1.5.2.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.3.bb
@@ -13,8 +13,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
            file://configure_fixes.patch"
 
-SRC_URI[md5sum] = "eb682cfb8642babba427a4fb391b15e8"
-SRC_URI[sha256sum] = "a1ec5025373815795d2fa5bfac40c0984675feffc88e049be9a162c408c2f613"
+SRC_URI[md5sum] = "71a11d037240b292f824ba1eb537b4e3"
+SRC_URI[sha256sum] = "76db34cb508e346e3bf69347c29ed1500bf0b71bcc48d54271ad9d1c25703743"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ 
 		--without-odbc \
-- 
1.7.9.5


