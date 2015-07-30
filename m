Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 03730764A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:27:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2015 07:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="616054372"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga003.jf.intel.com with ESMTP; 30 Jul 2015 07:27:01 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 17:27:25 +0300
Message-Id: <cf5fc95496175b1732e94a497a3a788fe1916bc4.1438265949.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/21] harfbuzz: enable icu feature
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
X-List-Received-Date: Thu, 30 Jul 2015 14:27:18 -0000

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


