Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8C76571A5E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 08:10:48 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 01:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,308,1491289200"; d="scan'208";a="96943841"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 08 May 2017 01:10:49 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 4C8D26A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 01:10:35 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 May 2017 11:11:26 +0300
Message-Id: <1494231086-31827-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1494231086-31827-1-git-send-email-maxin.john@intel.com>
References: <1494231086-31827-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 5/5] harfbuzz: upgrade to 1.4.6
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
X-List-Received-Date: Mon, 08 May 2017 08:10:50 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.4.1.bb => harfbuzz_1.4.6.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.4.1.bb => harfbuzz_1.4.6.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.6.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.4.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.4.6.bb
index fc4773e..0d73465 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.6.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "7b3f445d0a58485a31c18c03ce9b4e3c"
-SRC_URI[sha256sum] = "85a27fab639a1d651737dcb6b69e4101e3fd09522fdfdcb793df810b5cb315bd"
+SRC_URI[md5sum] = "e246c08a3bac98e31e731b2a1bf97edf"
+SRC_URI[sha256sum] = "21a78b81cd20cbffdb04b59ac7edfb410e42141869f637ae1d6778e74928d293"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.4.0


