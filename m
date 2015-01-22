Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA167251B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 06:13:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56452276"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Jan 2015 14:10:08 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0M6CwB4010930
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 14:12:58 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 22 Jan 2015 14:13:47 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jan 2015 14:13:31 +0800
Message-ID: <1421907211-21484-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH] curl: add ssl to PACKAGECONFIG
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
X-List-Received-Date: Thu, 22 Jan 2015 06:13:41 -0000
Content-Type: text/plain

Enable openssl default, just like ubuntu do.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta/recipes-support/curl/curl_7.40.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.40.0.bb b/meta/recipes-support/curl/curl_7.40.0.bb
index 209ed94..5081eb4 100644
--- a/meta/recipes-support/curl/curl_7.40.0.bb
+++ b/meta/recipes-support/curl/curl_7.40.0.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "899109eb3900fa6b8a2f995df7f449964292776a04763e94fae640700f
 
 inherit autotools pkgconfig binconfig multilib_header
 
-PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} gnutls zlib"
+PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} gnutls zlib ssl"
 PACKAGECONFIG_class-native = "ipv6 ssl zlib"
 PACKAGECONFIG_class-nativesdk = "ipv6 ssl zlib"
 
-- 
1.8.3.1


