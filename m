Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0E2FA71B98
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 11:29:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 23 Oct 2016 04:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,388,1473145200"; d="scan'208";a="1057842256"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2016 04:29:25 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 251966A4080
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 04:28:51 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2016 14:29:55 +0300
Message-Id: <1477222197-3698-8-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
References: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 08/10] ethtool: Upgrade 4.6 -> 4.8
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
X-List-Received-Date: Sun, 23 Oct 2016 11:29:24 -0000

Various bug fixes and improvements.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/ethtool/{ethtool_4.6.bb => ethtool_4.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.6.bb => ethtool_4.8.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool_4.6.bb b/meta/recipes-extended/ethtool/ethtool_4.8.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_4.6.bb
rename to meta/recipes-extended/ethtool/ethtool_4.8.bb
index 788d4ea..4ca88d7 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.6.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.8.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "1186dd83a0384109b92c6cd40a7bb0e5"
-SRC_URI[sha256sum] = "ad45620887f7e61312fc2f9ca3fd50d49ac7737ed874b0b02845d07e0fa3ca49"
+SRC_URI[md5sum] = "28c4a4d85c33f573c49ff6d81ec094fd"
+SRC_URI[sha256sum] = "1bd82ebe3d41de1b7b0d8f4fb18a8e8466fba934c952bc5c5002836ffa8bb606"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
2.4.0


