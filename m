Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8E2706D242
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 01:19:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,316,1539619200"; d="scan'208";a="49007521"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Dec 2018 09:19:42 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D609E4B6EC92
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 09:19:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 5 Dec 2018 09:19:43 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2018 09:21:32 +0800
Message-ID: <20181205012132.27831-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: D609E4B6EC92.A2465
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] tcl:upgrade to 8.6.9
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
X-List-Received-Date: Wed, 05 Dec 2018 01:19:43 -0000
Content-Type: text/plain

1.Upgrade tcl from 8.6.8 to 8.6.9.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/tcltk/{tcl_8.6.8.bb => tcl_8.6.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.8.bb => tcl_8.6.9.bb} (95%)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.8.bb b/meta/recipes-devtools/tcltk/tcl_8.6.9.bb
similarity index 95%
rename from meta/recipes-devtools/tcltk/tcl_8.6.8.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.9.bb
index 4be2e89..7f37781 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.8.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.9.bb
@@ -24,8 +24,8 @@ SRC_URI = "${BASE_SRC_URI} \
            file://alter-includedir.patch \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "81656d3367af032e0ae6157eff134f89"
-SRC_URI[sha256sum] = "c43cb0c1518ce42b00e7c8f6eaddd5195c53a98f94adc717234a65cbcfd3f96a"
+SRC_URI[md5sum] = "aa0a121d95a0e7b73a036f26028538d4"
+SRC_URI[sha256sum] = "ad0cd2de2c87b9ba8086b43957a0de3eb2eb565c7159d5f53ccbba3feb915f4e"
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
-- 
2.7.4




