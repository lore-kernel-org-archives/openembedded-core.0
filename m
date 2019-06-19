Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA147BFB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:55:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,391,1557158400"; d="scan'208";a="68013238"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jun 2019 14:55:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5DBED4CDD980
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 14:55:00 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 19 Jun 2019 14:55:02 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2019 14:56:23 +0800
Message-ID: <20190619065623.29644-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 5DBED4CDD980.A916B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] curl:upgrade 7.64.1 -> 7.65.1
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
X-List-Received-Date: Wed, 19 Jun 2019 06:55:06 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from curl_7.64.1.bb to curl_7.65.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-support/curl/{curl_7.64.1.bb => curl_7.65.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.64.1.bb => curl_7.65.1.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.64.1.bb b/meta/recipes-support/curl/curl_7.65.1.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.64.1.bb
rename to meta/recipes-support/curl/curl_7.65.1.bb
index 47c28beff6..e7bfe6cc0b 100644
--- a/meta/recipes-support/curl/curl_7.64.1.bb
+++ b/meta/recipes-support/curl/curl_7.65.1.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "790c101927845208a9d7e8c429ddd1b2"
-SRC_URI[sha256sum] = "4cc7c738b35250d0680f29e93e0820c4cb40035f43514ea3ec8d60322d41a45d"
+SRC_URI[md5sum] = "03ca3fa53ac4d791be66e30ba75b56ea"
+SRC_URI[sha256sum] = "cbd36df60c49e461011b4f3064cff1184bdc9969a55e9608bf5cadec4686e3f7"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.20.1




