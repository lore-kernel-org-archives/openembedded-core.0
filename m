Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 381DC7990B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 00:40:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="46232906"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Oct 2018 08:40:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CFFBC4B6ED74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:40:03 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 17 Oct 2018 08:40:04 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Oct 2018 08:40:16 +0800
Message-ID: <20181017004016.7897-3-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20181017004016.7897-1-hongl.fnst@cn.fujitsu.com>
References: <20181017004016.7897-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: CFFBC4B6ED74.A312B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] harfbuzz:1.8.8->1.9.0
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
X-List-Received-Date: Wed, 17 Oct 2018 00:40:07 -0000
Content-Type: text/plain

1.Upgrade harfbuzz from 1.8.8 to 1.9.0.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../harfbuzz/{harfbuzz_1.8.8.bb => harfbuzz_1.9.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.8.8.bb => harfbuzz_1.9.0.bb} (90%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.8.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.9.0.bb
similarity index 90%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.8.8.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.9.0.bb
index b904d93..0b27634 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.8.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.9.0.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "81dbce82d6471ec2b2a627ce02d03e5d"
-SRC_URI[sha256sum] = "a8e5c86e4d99e1cc9865ec1b8e9b05b98e413c2a885cd11f8e9bb9502dd3e3a9"
+SRC_URI[md5sum] = "263a3f1cb014e3ad2e4123c238a9bfc5"
+SRC_URI[sha256sum] = "11eca62bf0ac549b8d6be55f4e130946399939cdfe7a562fdaee711190248b00"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.7.4




