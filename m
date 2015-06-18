Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CA2BB758D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 12:35:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 18 Jun 2015 05:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,638,1427785200"; d="scan'208";a="745804034"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2015 05:35:51 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2015 15:35:40 +0300
Message-Id: <2397e5123a79e97f676cb46cebab9b13c87cc9b1.1434630758.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <6ef0af09f1d738f8f447f286ccefb0b74c4511de.1434630758.git.alexander.kanavin@linux.intel.com>
References: <6ef0af09f1d738f8f447f286ccefb0b74c4511de.1434630758.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
References: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 02/21] harfbuzz: enable icu feature
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
X-List-Received-Date: Thu, 18 Jun 2015 12:35:50 -0000

This is required to build latest webkitgtk

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.40.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.40.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.40.bb
index 2517ede..b3608c9 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.40.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.40.bb
@@ -22,7 +22,7 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF = "--with-glib --with-freetype --with-cairo --without-graphite2"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "icu"
 PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
 
 PACKAGES =+ "${PN}-icu ${PN}-icu-dbg ${PN}-icu-dev"
-- 
2.1.4


