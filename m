Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id AD08A71A89
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 15:15:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 12 Dec 2016 07:15:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,337,1477983600"; d="scan'208";a="1071114023"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 12 Dec 2016 07:15:17 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 9F6BE6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 07:14:30 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 17:16:23 +0200
Message-Id: <1481555783-3130-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1481555783-3130-1-git-send-email-maxin.john@intel.com>
References: <1481555783-3130-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] harfbuzz: upgrade to 1.3.4
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
X-List-Received-Date: Mon, 12 Dec 2016 15:15:16 -0000

1.3.3 -> 1.3.4

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.3.3.bb => harfbuzz_1.3.4.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.3.3.bb => harfbuzz_1.3.4.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.3.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.4.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.3.3.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.3.4.bb
index 0bda42e..74d6c6a 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.3.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.4.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "97ae15a72a93f1f27324a2b8d9bd3b1d"
-SRC_URI[sha256sum] = "2620987115a4122b47321610dccbcc18f7f121115fd7b88dc8a695c8b66cb3c9"
+SRC_URI[md5sum] = "065843caf247687b94126773285bc70f"
+SRC_URI[sha256sum] = "718aa6fcadef1a6548315b8cfe42cc27e926256302c337f42df3a443843f6a2b"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.4.0


