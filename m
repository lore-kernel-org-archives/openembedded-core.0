Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6EC5371CB4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 12:57:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 13 Jan 2017 04:57:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,221,1477983600"; d="scan'208";a="1082559842"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 13 Jan 2017 04:57:06 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id E5D6E6A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 04:56:12 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 14:57:11 +0200
Message-Id: <1484312231-28167-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1484312231-28167-1-git-send-email-maxin.john@intel.com>
References: <1484312231-28167-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/4] harfbuzz: upgrade to 1.4.1
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
X-List-Received-Date: Fri, 13 Jan 2017 12:57:07 -0000

1.3.4 -> 1.4.1

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.3.4.bb => harfbuzz_1.4.1.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.3.4.bb => harfbuzz_1.4.1.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.4.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.1.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.3.4.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.4.1.bb
index 74d6c6a..fc4773e 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.4.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.1.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "065843caf247687b94126773285bc70f"
-SRC_URI[sha256sum] = "718aa6fcadef1a6548315b8cfe42cc27e926256302c337f42df3a443843f6a2b"
+SRC_URI[md5sum] = "7b3f445d0a58485a31c18c03ce9b4e3c"
+SRC_URI[sha256sum] = "85a27fab639a1d651737dcb6b69e4101e3fd09522fdfdcb793df810b5cb315bd"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.4.0


