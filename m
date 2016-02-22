Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E6BD677196
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:53:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 22 Feb 2016 05:53:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,484,1449561600"; d="scan'208";a="657136086"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2016 05:53:25 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 6782E6A4002
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 06:41:14 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 15:56:56 +0200
Message-Id: <1456149416-3871-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] harfbuzz: update to version 1.2.0
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
X-List-Received-Date: Mon, 22 Feb 2016 13:53:25 -0000

1.1.3 -> 1.2.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.1.3.bb => harfbuzz_1.2.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.1.3.bb => harfbuzz_1.2.0.bb} (87%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.3.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.0.bb
similarity index 87%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.1.3.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.2.0.bb
index ead355f..2ef7d4d 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.3.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.0.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "671daf05153d57258e5cb992aa28c64a"
-SRC_URI[sha256sum] = "d93d7cb7979c32672e902fdfa884599e63f07f2fa5b06c66147d20c516d4b8f7"
+SRC_URI[md5sum] = "59e3464e78a9864dff09f608a6befdca"
+SRC_URI[sha256sum] = "79ff5305153d15931fbdda80c9612783b0283dee44f4c2af71aa37353daaa685"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.4.0


