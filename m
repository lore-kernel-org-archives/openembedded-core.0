Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BE1D86FFD4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 12:40:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2018 04:40:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,497,1508828400"; 
   d="scan'208";a="7776301"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga006.jf.intel.com with ESMTP; 02 Jan 2018 04:40:51 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 68EA2580319
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 04:40:50 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jan 2018 14:41:42 +0200
Message-Id: <1514896905-36107-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/4] harfbuzz: upgrade to 1.7.4
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
X-List-Received-Date: Tue, 02 Jan 2018 12:40:50 -0000

1.7.0 -> 1.7.4

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.7.0.bb => harfbuzz_1.7.4.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.7.0.bb => harfbuzz_1.7.4.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.4.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.7.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.7.4.bb
index c45ec84..ce1ead4 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.4.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "7e70e68ade0ed79719932b38c2130f0a"
-SRC_URI[sha256sum] = "042742d6ec67bc6719b69cf38a3fba24fbd120e207e3fdc18530dc730fb6a029"
+SRC_URI[md5sum] = "c7476d8b989869d8b95b37fa53add6bf"
+SRC_URI[sha256sum] = "b5d6ac8415f97f3540d73f3f91c41c5c10f8a4d76350f11a7184062aae88ac0b"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.4.0


