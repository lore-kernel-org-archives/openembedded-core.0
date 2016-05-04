Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 859D66FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 08:20:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 May 2016 01:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,576,1455004800"; d="scan'208";a="972236286"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 04 May 2016 01:20:27 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 7FBCD6A4008
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 02:08:01 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 11:20:16 +0300
Message-Id: <1462350024-29932-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462350024-29932-1-git-send-email-maxin.john@intel.com>
References: <1462350024-29932-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 02/10] ethtool: upgrade to 4.5
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
X-List-Received-Date: Wed, 04 May 2016 08:20:29 -0000

4.2 -> 4.5

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/ethtool/{ethtool_4.2.bb => ethtool_4.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.2.bb => ethtool_4.5.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool_4.2.bb b/meta/recipes-extended/ethtool/ethtool_4.5.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_4.2.bb
rename to meta/recipes-extended/ethtool/ethtool_4.5.bb
index 95df784..c47b30a 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.2.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.5.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "5b55f7cd76e901dfc2738ac22cab96ca"
-SRC_URI[sha256sum] = "f84226db8dd18afaf91d8d00f5cb8f87ec3d7f787d2a3605de08d6dfa95ab8ef"
+SRC_URI[md5sum] = "10038f417db89a1508584d5c375f79bb"
+SRC_URI[sha256sum] = "3b1e69d4de3322e2fe2b1e90befaf2c1ea886469d43ba73af3da36be5e2cc5e7"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
2.4.0


