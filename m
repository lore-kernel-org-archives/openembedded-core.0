Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5790365F90
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 15:07:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2014 08:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1010,1389772800"; d="scan'208";a="537126465"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2014 08:06:21 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 May 2014 18:05:58 +0300
Message-Id: <034e381ae3a12bacfd4e0eea9f6f4bc128377f85.1399561398.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1399561398.git.valentin.popa@intel.com>
References: <cover.1399561398.git.valentin.popa@intel.com>
In-Reply-To: <cover.1399561398.git.valentin.popa@intel.com>
References: <cover.1399561398.git.valentin.popa@intel.com>
Subject: [PATCH 3/4] libtasn1: upgrade to 3.5
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
X-List-Received-Date: Thu, 08 May 2014 15:07:14 -0000

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-support/gnutls/{libtasn1_3.4.bb => libtasn1_3.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_3.4.bb => libtasn1_3.5.bb} (82%)

diff --git a/meta/recipes-support/gnutls/libtasn1_3.4.bb b/meta/recipes-support/gnutls/libtasn1_3.5.bb
similarity index 82%
rename from meta/recipes-support/gnutls/libtasn1_3.4.bb
rename to meta/recipes-support/gnutls/libtasn1_3.5.bb
index 174eddf..0c0ebcd 100644
--- a/meta/recipes-support/gnutls/libtasn1_3.4.bb
+++ b/meta/recipes-support/gnutls/libtasn1_3.5.bb
@@ -13,8 +13,8 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            "
 
-SRC_URI[md5sum] = "21ec021c534b0f30b2834ce233c70f15"
-SRC_URI[sha256sum] = "f353507a458fe2372b791016a056c95946eebfc7256b49013851f134a5e6acc8"
+SRC_URI[md5sum] = "62c76352d0e17df1c082fe1c38bad5cf"
+SRC_URI[sha256sum] = "d7fcffbc08b6413533b817d4ede5c2eadcb3dcb21c71cc91de6ece25191519ed"
 
 inherit autotools texinfo binconfig lib_package
 
-- 
1.9.1


