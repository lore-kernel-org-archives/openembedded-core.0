Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9C682731A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 12:50:56 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 20 May 2016 05:50:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,339,1459839600"; d="scan'208";a="107492332"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 20 May 2016 05:50:59 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0660A6A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 06:38:27 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2016 15:51:22 +0300
Message-Id: <1463748682-22067-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1463748682-22067-1-git-send-email-maxin.john@intel.com>
References: <1463748682-22067-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/4] harfbuzz: update to 1.2.7
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
X-List-Received-Date: Fri, 20 May 2016 12:50:57 -0000

1.2.6 -> 1.2.7

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.2.6.bb => harfbuzz_1.2.7.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.2.6.bb => harfbuzz_1.2.7.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.7.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.2.7.bb
index e80b194..d3f81c3b 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.7.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "9f4b6831c86135faef011e991f59f77f"
-SRC_URI[sha256sum] = "7537bacccb3524df0cd2a4d5bc7e168bcc10e8171e0324f3cd522583868192c1"
+SRC_URI[md5sum] = "3ac286c9f9756aa92257c278b2815d34"
+SRC_URI[sha256sum] = "bba0600ae08b84384e6d2d7175bea10b5fc246c4583dc841498d01894d479026"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.4.0


