Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 37A1D77D3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 02:13:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="17684307"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Apr 2017 10:13:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B909D47CE222
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 10:13:01 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 13 Apr 2017 10:13:01 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Apr 2017 10:12:42 +0800
Message-ID: <1492049562-2349-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: B909D47CE222.A68D7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] harfbuzz: 1.4.1 -> 1.4.5
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
X-List-Received-Date: Thu, 13 Apr 2017 02:13:05 -0000
Content-Type: text/plain

Upgrade harfbuzz from 1.4.1 to 1.4.5.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../harfbuzz/{harfbuzz_1.4.1.bb => harfbuzz_1.4.5.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.4.1.bb => harfbuzz_1.4.5.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.5.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.4.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.4.5.bb
index fc4773e..c8756ff 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.5.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "7b3f445d0a58485a31c18c03ce9b4e3c"
-SRC_URI[sha256sum] = "85a27fab639a1d651737dcb6b69e4101e3fd09522fdfdcb793df810b5cb315bd"
+SRC_URI[md5sum] = "635126eeab703d1729df9391ffb7983c"
+SRC_URI[sha256sum] = "d0e05438165884f21658154c709075feaf98c93ee5c694b951533ac425a9a711"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.7.4




