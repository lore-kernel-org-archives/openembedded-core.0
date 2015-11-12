Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 66DC5771C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 08:53:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Nov 2015 00:53:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,281,1444719600"; d="scan'208";a="848702113"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 12 Nov 2015 00:53:02 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 246346A4083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 00:51:56 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 10:53:23 +0200
Message-Id: <1447318403-23267-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1447318403-23267-1-git-send-email-maxin.john@intel.com>
References: <1447318403-23267-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] harfbuzz: update to 1.0.6
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
X-List-Received-Date: Thu, 12 Nov 2015 08:53:04 -0000

1.0.2 -> 1.0.6

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.0.2.bb => harfbuzz_1.0.6.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.0.2.bb => harfbuzz_1.0.6.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.6.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.0.2.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.0.6.bb
index 670bd98..58541aa 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.6.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 SECTION = "libs"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "e74f644045fe42c38a2641fc1e82a800"
-SRC_URI[sha256sum] = "beb3caf8654010fcdca61c810a3a7532237fc567ee4271deb674b5efbbe3b466"
+SRC_URI[md5sum] = "2256fd144c936936db9c92e77510a011"
+SRC_URI[sha256sum] = "f616a7fbdc78a627043f9029000bf08c0c71df59cde4143fc92a014f6a993b26"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.4.0


