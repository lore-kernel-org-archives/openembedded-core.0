Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 837B96FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 02:42:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42039464"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jul 2018 10:42:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6552D4B5CBF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 10:42:43 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 10 Jul 2018 10:42:42 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2018 10:42:03 +0800
Message-ID: <20180710024207.6296-3-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
References: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 6552D4B5CBF2.AE478
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] harfbuzz:1.7.5 -> 1.7.6
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
X-List-Received-Date: Tue, 10 Jul 2018 02:42:44 -0000
Content-Type: text/plain

Upgrade harfbuzz from 1.7.5 to 1.7.6.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.7.6.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.7.6.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.6.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.7.6.bb
index 0a9b029..80d413a 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.6.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "1466ab51fc5aaa6af4065936939cec62"
-SRC_URI[sha256sum] = "84574e1b1f65ca694cb8fb6905309665c0368af18a312357f8ff886ee2f29563"
+SRC_URI[md5sum] = "ffb94cf2942327344ac31330d07036ba"
+SRC_URI[sha256sum] = "da7bed39134826cd51e57c29f1dfbe342ccedb4f4773b1c951ff05ff383e2e9b"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.7.4




