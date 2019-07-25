Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF3B7D537
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 01:00:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,304,1559491200"; d="scan'208";a="72151065"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jul 2019 09:00:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E973B4CDE923
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 09:00:27 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 25 Jul 2019 09:00:34 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jul 2019 08:59:43 +0800
Message-ID: <20190725005943.27855-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: E973B4CDE923.A96D2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] iso-codes:upgrade 4.2 -> 4.3
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
X-List-Received-Date: Thu, 25 Jul 2019 01:00:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../iso-codes/{iso-codes_4.2.bb => iso-codes_4.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.2.bb => iso-codes_4.3.bb} (92%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.2.bb b/meta/recipes-support/iso-codes/iso-codes_4.3.bb
similarity index 92%
rename from meta/recipes-support/iso-codes/iso-codes_4.2.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.3.bb
index 15130dd7c4..5651a96c66 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.2.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.3.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http"
-SRCREV = "58a4f20f8e6f4d8f9545333f3eae4cfe5678de16"
+SRCREV = "43398a317371e309361ce43072603863cb2f57e1"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.20.1




