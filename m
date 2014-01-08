Return-Path: <irina.patru@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 73D756D07F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 13:04:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Jan 2014 05:04:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,624,1384329600"; d="scan'208";a="435691453"
Received: from irina-vostro-460.rb.intel.com ([10.237.105.140])
	by orsmga001.jf.intel.com with ESMTP; 08 Jan 2014 05:04:46 -0800
From: Irina Patru <irina.patru@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2014 15:08:04 +0200
Message-Id: <a9f379493f1ab5763db423dd8fe53b16a089f182.1389186276.git.irina.patru@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389186276.git.irina.patru@intel.com>
References: <cover.1389186276.git.irina.patru@intel.com>
In-Reply-To: <cover.1389186276.git.irina.patru@intel.com>
References: <cover.1389186276.git.irina.patru@intel.com>
Subject: [PATCH 1/2] libtasn1: upgrade to 3.4
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
X-List-Received-Date: Wed, 08 Jan 2014 13:04:46 -0000

Signed-off-by: Irina Patru <irina.patru@intel.com>
---
 .../gnutls/{libtasn1_3.3.bb => libtasn1_3.4.bb}    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_3.3.bb => libtasn1_3.4.bb} (82%)

diff --git a/meta/recipes-support/gnutls/libtasn1_3.3.bb b/meta/recipes-support/gnutls/libtasn1_3.4.bb
similarity index 82%
rename from meta/recipes-support/gnutls/libtasn1_3.3.bb
rename to meta/recipes-support/gnutls/libtasn1_3.4.bb
index 573d8c8..590987e 100644
--- a/meta/recipes-support/gnutls/libtasn1_3.3.bb
+++ b/meta/recipes-support/gnutls/libtasn1_3.4.bb
@@ -13,8 +13,8 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            "
 
-SRC_URI[md5sum] = "2bdd687f487c50a0382b99553866a6e0"
-SRC_URI[sha256sum] = "92652a2cd10f63c56984b5e5cee46ecadf2292e2262fff99278f7ee46ff93ac0"
+SRC_URI[md5sum] = "21ec021c534b0f30b2834ce233c70f15"
+SRC_URI[sha256sum] = "f353507a458fe2372b791016a056c95946eebfc7256b49013851f134a5e6acc8"
 
 inherit autotools binconfig lib_package
 
-- 
1.7.9.5


