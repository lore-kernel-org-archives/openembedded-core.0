Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 08ED777154
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 08:52:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 Nov 2015 00:52:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,281,1444719600"; d="scan'208";a="598940294"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Nov 2015 00:52:54 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 207466A4083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 00:51:48 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 10:53:22 +0200
Message-Id: <1447318403-23267-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] ethtool: bump version to 4.2
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
X-List-Received-Date: Thu, 12 Nov 2015 08:52:57 -0000

4.0 -> 4.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/ethtool/{ethtool_4.0.bb => ethtool_4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.0.bb => ethtool_4.2.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool_4.0.bb b/meta/recipes-extended/ethtool/ethtool_4.2.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_4.0.bb
rename to meta/recipes-extended/ethtool/ethtool_4.2.bb
index 13f2b1c..95df784 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.0.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.2.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "0a1c78787c7dcf077016ed86372a472f"
-SRC_URI[sha256sum] = "e200516727cc9583e8b63fd6e72f667f9ed41bb4f0577ff4803b60c64cfd1dbc"
+SRC_URI[md5sum] = "5b55f7cd76e901dfc2738ac22cab96ca"
+SRC_URI[sha256sum] = "f84226db8dd18afaf91d8d00f5cb8f87ec3d7f787d2a3605de08d6dfa95ab8ef"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
2.4.0


