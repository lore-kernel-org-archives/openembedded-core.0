Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7411F6AA5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 14:59:52 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Jul 2013 07:59:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1036,1363158000"; d="scan'208";a="329343544"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by azsmga001.ch.intel.com with ESMTP; 10 Jul 2013 07:59:52 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2013 18:07:08 +0300
Message-Id: <6c15f39c5d3d9c6d7d8788d1c76758078b446fbd.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a9d90af766913d932c03bc57e395bab720cfbe3c.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
References: <a9d90af766913d932c03bc57e395bab720cfbe3c.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH 2/3] docbook-sgml-dtd-4.1-native.bb: Add real PV inside the recipe
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
X-List-Received-Date: Wed, 10 Jul 2013 14:59:52 -0000

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../docbook-sgml-dtd-4.1-native.bb                 |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
index 88c9396..1f338fd 100644
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
+++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
 DTD_VERSION = "4.1"
 
 PR = "${INC_PR}.0"
+PV = "41"
 
 # Note: the upstream sources are not distributed with a license file.
 # LICENSE-OASIS is included as a "patch" to workaround this. When
-- 
1.7.9.5


