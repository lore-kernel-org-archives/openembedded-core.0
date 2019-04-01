Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 493677CFEE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 07:13:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,295,1549900800"; d="scan'208";a="58188234"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Apr 2019 15:12:59 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 925224CD7794
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 15:13:01 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Apr 2019 15:13:02 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Apr 2019 15:13:37 +0800
Message-ID: <20190401071337.29430-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 925224CD7794.A6423
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] nss:upgrade 3.42.1 -> 3.43
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
X-List-Received-Date: Mon, 01 Apr 2019 07:13:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from nss_3.42.1.bb to nss_3.43.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-support/nss/{nss_3.42.1.bb => nss_3.43.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nss/{nss_3.42.1.bb => nss_3.43.bb} (98%)

diff --git a/meta/recipes-support/nss/nss_3.42.1.bb b/meta/recipes-support/nss/nss_3.43.bb
similarity index 98%
rename from meta/recipes-support/nss/nss_3.42.1.bb
rename to meta/recipes-support/nss/nss_3.43.bb
index b6bbd800fc..14a17335a2 100644
--- a/meta/recipes-support/nss/nss_3.42.1.bb
+++ b/meta/recipes-support/nss/nss_3.43.bb
@@ -30,8 +30,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            "
 
-SRC_URI[md5sum] = "1f6cc6c702379478a3a72298caaef0a7"
-SRC_URI[sha256sum] = "087db37d38fd49dfd584dd2a8b5baa7fc88de7c9bd97c0c2d5be4abcafc61fc6"
+SRC_URI[md5sum] = "67c8fa282c32cb56117fdd530dd77001"
+SRC_URI[sha256sum] = "f30bc1b7330887b75de9fec37dbc173001758dc43fb095ffbc45dac4093fe2ca"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.20.1




