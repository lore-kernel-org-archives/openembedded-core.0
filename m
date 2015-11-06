Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B084A77120
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 15:28:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 06 Nov 2015 07:28:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="595303995"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Nov 2015 07:28:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 15:28:27 +0000
Message-Id: <57f8134bd270a9e0266a637478e9f4f1aae07404.1446823542.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1446823542.git.paul.eggleton@linux.intel.com>
References: <cover.1446823542.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1446823542.git.paul.eggleton@linux.intel.com>
References: <cover.1446823542.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/11] tzcode-native: set SUMMARY instead of DESCRIPTION
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
X-List-Received-Date: Fri, 06 Nov 2015 15:28:47 -0000

We only have a short description, so set SUMMARY and DESCRIPTION
will be defaulted from it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2015g.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015g.bb b/meta/recipes-extended/tzcode/tzcode-native_2015g.bb
index 989e24b..34e338e 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2015g.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2015g.bb
@@ -1,6 +1,6 @@
 # note that we allow for us to use data later than our code version
 #
-DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 LICENSE = "PD & BSD"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d0ff93a73dd5bc3c6e724bb4343760f6"
-- 
2.1.0


