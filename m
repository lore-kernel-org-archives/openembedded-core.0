Return-Path: <sgw@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 400E460125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 18:38:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 06 Oct 2016 11:39:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,454,1473145200"; d="scan'208";a="1061410887"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.86.96])
	by orsmga002.jf.intel.com with ESMTP; 06 Oct 2016 11:38:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu,  6 Oct 2016 11:38:59 -0700
Message-Id: <1475779139-13738-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] xmlto: Add libxslt to native DEPENDS
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
X-List-Received-Date: Thu, 06 Oct 2016 18:39:00 -0000

xmlto requires xsltproc to work correctly, it was being included
for the target, but may have been finding host contamination.

[YOCTO #10366]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 886e7b4..aaaeb6e 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -13,6 +13,7 @@ SRC_URI[md5sum] = "a1fefad9d83499a15576768f60f847c6"
 SRC_URI[sha256sum] = "2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51fd8aad3"
 
 inherit autotools
+RDEPENDS_class-native = "libxslt-native"
 
 # xmlto needs getopt/xmllint/xsltproc/bash/tail at runtime
 RDEPENDS_${PN} = "docbook-xml-dtd4 \
-- 
2.7.4


