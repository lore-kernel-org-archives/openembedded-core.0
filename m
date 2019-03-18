Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 50A836C0EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 01:20:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,491,1544457600"; d="scan'208";a="57008402"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Mar 2019 09:20:39 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id F28054C8B6E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 09:20:09 +0800 (CST)
Received: from localhost.local (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Mon, 18 Mar 2019 09:20:44 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2019 09:22:12 +0800
Message-ID: <20190318012212.16295-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: F28054C8B6E8.A9B3F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] openssl:upgrade to 1.1.1b
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
X-List-Received-Date: Mon, 18 Mar 2019 01:20:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade openssl from 1.1.1a to 1.1.1b

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../openssl/{openssl_1.1.1a.bb => openssl_1.1.1b.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1a.bb => openssl_1.1.1b.bb} (97%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
similarity index 97%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
index 02fd66910e..d68fa237b0 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
@@ -7,7 +7,7 @@ SECTION = "libs/network"
 # "openssl" here actually means both OpenSSL and SSLeay licenses apply
 # (see meta/files/common-licenses/OpenSSL to which "openssl" is SPDXLICENSEMAPped)
 LICENSE = "openssl"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d343e62fc9c833710bbbed25f27364c8"
 
 DEPENDS = "hostperl-runtime-native"
 
@@ -23,8 +23,8 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "963deb2272d6be7d4c2458afd2517b73"
-SRC_URI[sha256sum] = "fc20130f8b7cbd2fb918b2f14e2f429e109c31ddd0fb38fc5d71d9ffed3f9f41"
+SRC_URI[md5sum] = "4532712e7bcc9414f5bce995e4e13930"
+SRC_URI[sha256sum] = "5c557b023230413dfb0756f3137a13e6d726838ccd1430888ad15bfb2b43ea4b"
 
 inherit lib_package multilib_header ptest
 
-- 
2.20.1




