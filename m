Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 035F47C7A6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 05:56:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,298,1549900800"; d="scan'208";a="58273364"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Apr 2019 13:56:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 509C04CD7BA6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 13:56:28 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 2 Apr 2019 13:56:26 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Apr 2019 13:57:04 +0800
Message-ID: <20190402055704.23989-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 509C04CD7BA6.A9FBB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] harfbuzz:upgrade 2.3.1 -> 2.4.0
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
X-List-Received-Date: Tue, 02 Apr 2019 05:56:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from harfbuzz_2.3.1.bb to harfbuzz_2.4.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../harfbuzz/{harfbuzz_2.3.1.bb => harfbuzz_2.4.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.3.1.bb => harfbuzz_2.4.0.bb} (89%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.3.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.4.0.bb
similarity index 89%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.3.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.4.0.bb
index 4b292d8ea9..5855d77c50 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.3.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.4.0.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "531de9df7c8a5405dd9c6a873fcee8c2"
-SRC_URI[sha256sum] = "f205699d5b91374008d6f8e36c59e419ae2d9a7bb8c5d9f34041b9a5abcae468"
+SRC_URI[md5sum] = "ebccf8203103766383d4c5a0767b102d"
+SRC_URI[sha256sum] = "9035005903da74667d28bb181986e879e11da3d5986722759fa145cca781ead6"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.20.1




