Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DA7AC60720
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 13:46:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jul 2017 06:46:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,415,1496127600"; d="scan'208";a="291679978"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2017 06:46:39 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 91F015808F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 06:46:38 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2017 16:47:27 +0300
Message-Id: <1501076847-22921-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] harfbuzz: upgrade to 1.4.7
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
X-List-Received-Date: Wed, 26 Jul 2017 13:46:39 -0000

1.4.6 -> 1.4.7

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.4.6.bb => harfbuzz_1.4.7.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.4.6.bb => harfbuzz_1.4.7.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.6.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.7.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.4.6.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.4.7.bb
index 0d73465..be1dd64 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.6.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.7.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "e246c08a3bac98e31e731b2a1bf97edf"
-SRC_URI[sha256sum] = "21a78b81cd20cbffdb04b59ac7edfb410e42141869f637ae1d6778e74928d293"
+SRC_URI[md5sum] = "37096205bc43e2977de0f1cf2706940a"
+SRC_URI[sha256sum] = "b85f6627425d54f32118308e053b939c63a388de9bf455b3830f68cad406bc6d"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.4.0


