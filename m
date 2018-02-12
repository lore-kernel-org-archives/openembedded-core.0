Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 721EE60670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 14:14:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 06:14:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="17820595"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga006.jf.intel.com with ESMTP; 12 Feb 2018 06:14:01 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 43A6E5803A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 06:14:01 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 16:16:24 +0200
Message-Id: <1518444986-25886-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1518444986-25886-1-git-send-email-maxin.john@intel.com>
References: <1518444986-25886-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/4] harfbuzz: upgrade to version 1.7.5
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
X-List-Received-Date: Mon, 12 Feb 2018 14:14:00 -0000

1.7.4 -> 1.7.5

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.7.4.bb => harfbuzz_1.7.5.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.7.4.bb => harfbuzz_1.7.5.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.4.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.7.4.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
index ce1ead4..0a9b029 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.4.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "c7476d8b989869d8b95b37fa53add6bf"
-SRC_URI[sha256sum] = "b5d6ac8415f97f3540d73f3f91c41c5c10f8a4d76350f11a7184062aae88ac0b"
+SRC_URI[md5sum] = "1466ab51fc5aaa6af4065936939cec62"
+SRC_URI[sha256sum] = "84574e1b1f65ca694cb8fb6905309665c0368af18a312357f8ff886ee2f29563"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.4.0


