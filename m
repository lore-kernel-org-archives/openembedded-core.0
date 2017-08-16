Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F3A8C78695
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 13:46:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Aug 2017 06:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,383,1498546800"; d="scan'208";a="890580239"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Aug 2017 06:45:36 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 0841958011C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 06:45:35 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 16:47:11 +0300
Message-Id: <1502891231-2284-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1502891231-2284-1-git-send-email-maxin.john@intel.com>
References: <1502891231-2284-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] harfbuzz: upgrade to 1.4.8
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
X-List-Received-Date: Wed, 16 Aug 2017 13:46:02 -0000

1.4.7 -> 1.4.8

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.4.7.bb => harfbuzz_1.4.8.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.4.7.bb => harfbuzz_1.4.8.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.7.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.8.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.4.7.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.4.8.bb
index be1dd64..4f5e5a3 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.7.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.8.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "37096205bc43e2977de0f1cf2706940a"
-SRC_URI[sha256sum] = "b85f6627425d54f32118308e053b939c63a388de9bf455b3830f68cad406bc6d"
+SRC_URI[md5sum] = "d1aa446e1e65717311c15d9ac0cf31ee"
+SRC_URI[sha256sum] = "ccec4930ff0bb2d0c40aee203075447954b64a8c2695202413cc5e428c907131"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.4.0


