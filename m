Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 972607F021
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 07:56:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,302,1559491200"; d="scan'208";a="72077663"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Jul 2019 15:56:44 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A9A754CDE65B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 15:56:43 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 24 Jul 2019 15:56:42 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jul 2019 15:55:58 +0800
Message-ID: <20190724075558.12209-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: A9A754CDE65B.AA660
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] curl:upgrade 7.65.2 -> 7.65.3
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
X-List-Received-Date: Wed, 24 Jul 2019 07:56:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-support/curl/{curl_7.65.2.bb => curl_7.65.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.65.2.bb => curl_7.65.3.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.65.2.bb b/meta/recipes-support/curl/curl_7.65.3.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.65.2.bb
rename to meta/recipes-support/curl/curl_7.65.3.bb
index 2fff04434a..96f90fb8ba 100644
--- a/meta/recipes-support/curl/curl_7.65.2.bb
+++ b/meta/recipes-support/curl/curl_7.65.3.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "88910bdda3752a98083b6dbe85bafcaa"
-SRC_URI[sha256sum] = "8093398b51e7d8337dac6f8fa6f1f77d562bdd9eca679dff9d9c3b8160ebfd28"
+SRC_URI[md5sum] = "bdd220d018c23e7f9ee82894e62a70bc"
+SRC_URI[sha256sum] = "0a855e83be482d7bc9ea00e05bdb1551a44966076762f9650959179c89fce509"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.20.1




