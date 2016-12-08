Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8D6A060670
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 05:17:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13716389"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Dec 2016 13:17:33 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1BBE04670490
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 13:17:29 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 8 Dec 2016 13:17:29 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2016 05:17:33 -0800
Message-ID: <1481203053-54200-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 1BBE04670490.A54BC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] mpfr: 3.1.4 -> 3.1.5
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
X-List-Received-Date: Thu, 08 Dec 2016 05:17:38 -0000
Content-Type: text/plain

Upgrade mpfr from 3.1.4 to 3.1.5.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-support/mpfr/{mpfr_3.1.4.bb => mpfr_3.1.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/mpfr/{mpfr_3.1.4.bb => mpfr_3.1.5.bb} (75%)

diff --git a/meta/recipes-support/mpfr/mpfr_3.1.4.bb b/meta/recipes-support/mpfr/mpfr_3.1.5.bb
similarity index 75%
rename from meta/recipes-support/mpfr/mpfr_3.1.4.bb
rename to meta/recipes-support/mpfr/mpfr_3.1.5.bb
index 230a862..2d59c4a 100644
--- a/meta/recipes-support/mpfr/mpfr_3.1.4.bb
+++ b/meta/recipes-support/mpfr/mpfr_3.1.5.bb
@@ -8,8 +8,8 @@ DEPENDS = "gmp"
 SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz \
            file://long-long-thumb.patch \
            "
-SRC_URI[md5sum] = "064b2c18185038e404a401b830d59be8"
-SRC_URI[sha256sum] = "761413b16d749c53e2bfd2b1dfaa3b027b0e793e404b90b5fbaeef60af6517f5"
+SRC_URI[md5sum] = "c4ac246cf9795a4491e7766002cd528f"
+SRC_URI[sha256sum] = "015fde82b3979fbe5f83501986d328331ba8ddf008c1ff3da3c238f49ca062bc"
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 
-- 
2.7.4




