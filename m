Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBCA6612C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 12:22:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 21 Nov 2016 04:22:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,675,1473145200"; 
   d="scan'208";a="7375581"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 21 Nov 2016 04:22:24 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 26F5E6A4082
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 04:21:43 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 14:22:48 +0200
Message-Id: <1479730971-23120-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1479730971-23120-1-git-send-email-maxin.john@intel.com>
References: <1479730971-23120-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/5] harfbuzz: upgrade to 1.3.3
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
X-List-Received-Date: Mon, 21 Nov 2016 12:22:24 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.3.2.bb => harfbuzz_1.3.3.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.3.2.bb => harfbuzz_1.3.3.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.3.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.3.2.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.3.3.bb
index 8d29340..0bda42e 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.3.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "5986e1bfcd983d1f6caa53ef64c4abc5"
-SRC_URI[sha256sum] = "8543a6372f08c5987c632dfaa86210c7edb3f43fbacd96095c609bc3539ce027"
+SRC_URI[md5sum] = "97ae15a72a93f1f27324a2b8d9bd3b1d"
+SRC_URI[sha256sum] = "2620987115a4122b47321610dccbcc18f7f121115fd7b88dc8a695c8b66cb3c9"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.4.0


