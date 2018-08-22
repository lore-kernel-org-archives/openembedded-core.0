Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A25C67459B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 10:25:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2018 03:25:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,273,1531810800"; d="scan'208";a="79088814"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2018 03:25:30 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 10EC6580332
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 03:25:29 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 13:27:20 +0300
Message-Id: <1534933645-30369-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1534933645-30369-1-git-send-email-maxin.john@intel.com>
References: <1534933645-30369-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/6] harfbuzz: upgrade 1.8.4 -> 1.8.8
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
X-List-Received-Date: Wed, 22 Aug 2018 10:25:29 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.8.4.bb => harfbuzz_1.8.8.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.8.4.bb => harfbuzz_1.8.8.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.4.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.8.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.8.4.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.8.8.bb
index 4d5964d..f41db98 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.4.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.8.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "f176eeda0a4e51a056d3ea6b9e65c27f"
-SRC_URI[sha256sum] = "3c592f86fa0da69e2e0e98cae9f5d5b61def3bb7948aa00ca45748f27fa545fd"
+SRC_URI[md5sum] = "81dbce82d6471ec2b2a627ce02d03e5d"
+SRC_URI[sha256sum] = "a8e5c86e4d99e1cc9865ec1b8e9b05b98e413c2a885cd11f8e9bb9502dd3e3a9"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.4.0


