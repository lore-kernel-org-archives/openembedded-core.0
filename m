Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A24DF731BC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 08:21:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 04 May 2016 01:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,576,1455004800"; d="scan'208";a="945864860"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2016 01:20:42 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 5C75B6A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 02:08:16 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 11:20:22 +0300
Message-Id: <1462350024-29932-9-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462350024-29932-1-git-send-email-maxin.john@intel.com>
References: <1462350024-29932-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 08/10] harfbuzz: upgrade to 1.2.6
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
X-List-Received-Date: Wed, 04 May 2016 08:21:06 -0000

1.2.3 -> 1.2.6

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.2.3.bb => harfbuzz_1.2.6.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.2.3.bb => harfbuzz_1.2.6.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb
index cfe885f..e80b194 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "da8d97e262e6ef8288e1ae76369421bd"
-SRC_URI[sha256sum] = "8216d2404aaab7fde87be0365a90d64aa6c55928e104557cfcb37b54a096cb8c"
+SRC_URI[md5sum] = "9f4b6831c86135faef011e991f59f77f"
+SRC_URI[sha256sum] = "7537bacccb3524df0cd2a4d5bc7e168bcc10e8171e0324f3cd522583868192c1"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.4.0


