Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8789A601B8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 13:02:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 Jul 2016 06:02:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,574,1459839600"; d="scan'208";a="988798556"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 04 Jul 2016 06:02:16 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 6E7786A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:02:09 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2016 16:02:02 +0300
Message-Id: <1467637324-16642-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1467637324-16642-1-git-send-email-maxin.john@intel.com>
References: <1467637324-16642-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/4] ethtool: upgrade to 4.6
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
X-List-Received-Date: Mon, 04 Jul 2016 13:02:34 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/ethtool/{ethtool_4.5.bb => ethtool_4.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.5.bb => ethtool_4.6.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool_4.5.bb b/meta/recipes-extended/ethtool/ethtool_4.6.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_4.5.bb
rename to meta/recipes-extended/ethtool/ethtool_4.6.bb
index c47b30a..788d4ea 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.5.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.6.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "10038f417db89a1508584d5c375f79bb"
-SRC_URI[sha256sum] = "3b1e69d4de3322e2fe2b1e90befaf2c1ea886469d43ba73af3da36be5e2cc5e7"
+SRC_URI[md5sum] = "1186dd83a0384109b92c6cd40a7bb0e5"
+SRC_URI[sha256sum] = "ad45620887f7e61312fc2f9ca3fd50d49ac7737ed874b0b02845d07e0fa3ca49"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
2.4.0


