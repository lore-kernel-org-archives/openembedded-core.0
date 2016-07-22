Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 58A876FFDA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 11:03:54 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jul 2016 04:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,404,1464678000"; d="scan'208";a="143740733"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2016 04:03:43 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 9B7BA6A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 04:03:32 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2016 09:09:28 +0300
Message-Id: <1469167768-9827-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469167768-9827-1-git-send-email-maxin.john@intel.com>
References: <1469167768-9827-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/3] harfbuzz: upgrade to 1.3.0
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
X-List-Received-Date: Fri, 22 Jul 2016 11:03:55 -0000

1.2.7 -> 1.3.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.2.7.bb => harfbuzz_1.3.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.2.7.bb => harfbuzz_1.3.0.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.7.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.0.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.2.7.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.3.0.bb
index d3f81c3b..e99a0a9 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.7.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.0.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "3ac286c9f9756aa92257c278b2815d34"
-SRC_URI[sha256sum] = "bba0600ae08b84384e6d2d7175bea10b5fc246c4583dc841498d01894d479026"
+SRC_URI[md5sum] = "a82d49ff67197bc3c96ea34b98880c52"
+SRC_URI[sha256sum] = "b04be31633efee2cae1d62d46434587302554fa837224845a62565ec68a0334d"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.4.0


