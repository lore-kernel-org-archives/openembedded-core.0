Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0FAF376599
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:55:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2015 03:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,677,1432623600"; d="scan'208";a="768726208"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2015 03:54:59 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 13:55:21 +0300
Message-Id: <885db3c12cc4c5e7a50feb2126908b3b11e014e3.1439549437.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/22] harfbuzz: enable icu feature
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
X-List-Received-Date: Fri, 14 Aug 2015 10:55:00 -0000

This is required to build latest webkitgtk

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.1.bb
index a199126..87c30be 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.1.bb
@@ -22,7 +22,7 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF = "--with-glib --with-freetype --with-cairo --without-graphite2"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "icu"
 PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
 
 PACKAGES =+ "${PN}-icu ${PN}-icu-dbg ${PN}-icu-dev"
-- 
2.1.4


