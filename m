Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4311D782B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 13:56:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Aug 2017 06:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,421,1498546800"; d="scan'208";a="893707278"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Aug 2017 06:56:21 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 16:53:14 +0300
Message-Id: <20170824135314.4630-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] ninja: fix upstream version check
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
X-List-Received-Date: Thu, 24 Aug 2017 13:56:21 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/ninja/ninja_1.7.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/ninja/ninja_1.7.2.bb b/meta/recipes-devtools/ninja/ninja_1.7.2.bb
index 20dca2f0af5..4d3b272309d 100644
--- a/meta/recipes-devtools/ninja/ninja_1.7.2.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.7.2.bb
@@ -8,6 +8,7 @@ DEPENDS = "re2c-native ninja-native"
 SRCREV = "717b7b4a31db6027207588c0fb89c3ead384747b"
 
 SRC_URI = "git://github.com/martine/ninja.git;branch=release"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
 
-- 
2.14.1


