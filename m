Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED8571B8E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 11:29:22 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 23 Oct 2016 04:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,388,1473145200"; d="scan'208";a="23024848"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 23 Oct 2016 04:29:24 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0B9E16A4080
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 04:28:50 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2016 14:29:54 +0300
Message-Id: <1477222197-3698-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
References: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 07/10] harfbuzz: Upgrade 1.3.0 -> 1.3.2
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
X-List-Received-Date: Sun, 23 Oct 2016 11:29:23 -0000

1.3.0 -> 1.3.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.3.0.bb => harfbuzz_1.3.2.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.3.0.bb => harfbuzz_1.3.2.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.2.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.3.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.3.2.bb
index f24c443..8d29340 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.3.2.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "a82d49ff67197bc3c96ea34b98880c52"
-SRC_URI[sha256sum] = "b04be31633efee2cae1d62d46434587302554fa837224845a62565ec68a0334d"
+SRC_URI[md5sum] = "5986e1bfcd983d1f6caa53ef64c4abc5"
+SRC_URI[sha256sum] = "8543a6372f08c5987c632dfaa86210c7edb3f43fbacd96095c609bc3539ce027"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.4.0


