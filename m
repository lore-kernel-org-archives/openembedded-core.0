Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA816B2CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 15:58:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 18 Jul 2013 08:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,694,1367996400"; d="scan'208";a="367399827"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2013 08:58:21 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 19:05:39 +0300
Message-Id: <e56fe1753c97c2cedeeaa3556a775ff9fcc33cd1.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <07012a0b109ff8a20ad219351cc6a0e4c54d1dcb.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
References: <07012a0b109ff8a20ad219351cc6a0e4c54d1dcb.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH v2 11/11] docbook-sgml-dtd-4.5-native.bb: Add real PV inside the recipe
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
X-List-Received-Date: Thu, 18 Jul 2013 15:58:21 -0000

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../docbook-sgml-dtd-4.5-native.bb                 |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
index 6c464f4..ae723c7 100644
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
+++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
 DTD_VERSION = "4.5"
 
 PR = "${INC_PR}.0"
+PV = "4.5"
 
 SRC_URI[md5sum] = "07c581f4bbcba6d3aac85360a19f95f7"
 SRC_URI[sha256sum] = "8043e514e80c6c19cb146b5d37937d1305bf3abf9b0097c36df7f70f611cdf43"
-- 
1.7.9.5


