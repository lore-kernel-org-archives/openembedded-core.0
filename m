Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9564C61582
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:21:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,455,1574092800"; d="scan'208";a="83480837"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Feb 2020 14:21:07 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 06F0E406AB15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 14:11:26 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 18 Feb 2020 14:21:03 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 18 Feb 2020 14:21:08 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Feb 2020 05:39:54 -0800
Message-ID: <1582033197-93331-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 06F0E406AB15.A5353
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] bison: upgrade 3.5.1 -> 3.5.2
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
X-List-Received-Date: Tue, 18 Feb 2020 06:21:09 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-devtools/bison/{bison_3.5.1.bb => bison_3.5.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/bison/{bison_3.5.1.bb => bison_3.5.2.bb} (90%)

diff --git a/meta/recipes-devtools/bison/bison_3.5.1.bb b/meta/recipes-devtools/bison/bison_3.5.2.bb
similarity index 90%
rename from meta/recipes-devtools/bison/bison_3.5.1.bb
rename to meta/recipes-devtools/bison/bison_3.5.2.bb
index e70252d974..b5b4a8ef76 100644
--- a/meta/recipes-devtools/bison/bison_3.5.1.bb
+++ b/meta/recipes-devtools/bison/bison_3.5.2.bb
@@ -17,8 +17,8 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
 
-SRC_URI[md5sum] = "6fc5fa4488832a65db934b9e93bd5d4c"
-SRC_URI[sha256sum] = "3e7e097bd9709a2d5e40e69446b74b149733b3de864fadb7a9b54eca7b2a4dd0"
+SRC_URI[md5sum] = "49fc2cf23e31e697d5072835e1662a97"
+SRC_URI[sha256sum] = "24e273db9eb6da8bbb6f0648284d0724a5cbd6268a163db402f961350a4e50dd"
 
 inherit autotools gettext texinfo
 
-- 
2.17.1




