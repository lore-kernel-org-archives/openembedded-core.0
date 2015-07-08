Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 11DAA75D9A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 17:57:40 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jul 2015 10:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,433,1432623600"; d="scan'208";a="602496442"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by orsmga003.jf.intel.com with ESMTP; 08 Jul 2015 10:57:38 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 20:57:53 +0300
Message-Id: <a512db39c828808cc61040814d8e64f0c6c7822f.1436378222.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436378222.git.cristian.iorga@intel.com>
References: <cover.1436378222.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1436378222.git.cristian.iorga@intel.com>
References: <cover.1436378222.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] harfbuzz: upgrade to 0.9.41
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
X-List-Received-Date: Wed, 08 Jul 2015 17:57:40 -0000

Fix hb-coretext with trailing whitespace in right-to-left.
New API: hb_buffer_reverse_range().
Allow implementing atomic ops in config.h.
Fix hb_language_t in language bindings.
Misc fixes.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../harfbuzz/{harfbuzz_0.9.40.bb => harfbuzz_0.9.41.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.40.bb => harfbuzz_0.9.41.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.40.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.41.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_0.9.40.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_0.9.41.bb
index 2517ede..1ea4563 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.40.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.41.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 SECTION = "libs"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "0e27e531f4c4acff601ebff0957755c2"
-SRC_URI[sha256sum] = "1771d53583be6d91ca961854b2a24fb239ef0545eed221ae3349abae0ab8321f"
+SRC_URI[md5sum] = "a2966f1b6a470c2cd84eb511f924cf68"
+SRC_URI[sha256sum] = "d81aa53d0c02b437beeaac159d7fc16394d676bbce0860fb6f6a10b587dc057c"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.1.4


