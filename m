Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6C2B96D147
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 05:55:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,442,1544457600"; d="scan'208";a="55931144"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Mar 2019 13:55:11 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id B613C4C7F2B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 13:54:51 +0800 (CST)
Received: from localhost.local (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 5 Mar 2019 13:55:14 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Mar 2019 13:56:30 +0800
Message-ID: <20190305055630.32025-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: B613C4C7F2B1.A80EF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [oe][meta-oe][PATCH] tslib: upgrade to 1.17
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
X-List-Received-Date: Tue, 05 Mar 2019 05:55:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade tslib from 1.16 to 1.17

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../recipes-graphics/tslib/{tslib_1.16.bb => tslib_1.17.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/tslib/{tslib_1.16.bb => tslib_1.17.bb} (96%)

diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.16.bb b/meta-oe/recipes-graphics/tslib/tslib_1.17.bb
similarity index 96%
rename from meta-oe/recipes-graphics/tslib/tslib_1.16.bb
rename to meta-oe/recipes-graphics/tslib/tslib_1.17.bb
index 8d23bd5eb..a095e69c6 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.16.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.17.bb
@@ -17,8 +17,8 @@ SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.
            file://ts.conf \
            file://tslib.sh \
 "
-SRC_URI[md5sum] = "254a022fc8aa89d164840fe8869c2441"
-SRC_URI[sha256sum] = "c9a54651337a701a66b074c603c313225579995a7910e519bbc7b1dcdab9a755"
+SRC_URI[md5sum] = "048c4c14aea95ec09d61faa340a2c6c3"
+SRC_URI[sha256sum] = "9fdd33e66976bf9cc799be33824ba66672f892826e9b22de12b14df15cb0fddc"
 
 UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
 
-- 
2.20.1




