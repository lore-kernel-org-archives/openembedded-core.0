Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1031A788C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 09:56:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37742836"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Mar 2018 17:56:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 44B1C4D0EFF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 17:56:23 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 12 Mar 2018 17:56:25 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Mar 2018 17:56:23 +0800
Message-ID: <1520848583-21222-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 44B1C4D0EFF7.A7A41
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [oe][meta-oe][PATCH] pkcs11-helper: 1.11 -> 1.22
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
X-List-Received-Date: Mon, 12 Mar 2018 09:56:25 -0000
Content-Type: text/plain

Upgrade pkcs11-helper from 1.11 to 1.22.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../pkcs11-helper/{pkcs11-helper_1.11.bb => pkcs11-helper_1.22.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/pkcs11-helper/{pkcs11-helper_1.11.bb => pkcs11-helper_1.22.bb} (95%)

diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.11.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.22.bb
similarity index 95%
rename from meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.11.bb
rename to meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.22.bb
index db71bd0..51ccf37 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.11.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.22.bb
@@ -20,7 +20,7 @@ SRC_URI[md5sum] = "9f62af9f475901b89355266141306673"
 SRC_URI[sha256sum] = "494ec59c93e7c56c528f335d9353849e2e7c94a6b1b41c89604694e738113386"
 
 S = "${WORKDIR}/git"
-SRCREV = "e7adf8f35be232a4f04c53b4ac409be52792093e"
+SRCREV = "a6e54e9bdd57dd4e98a2fbf984fe7fe4a9d60171"
 
 DEPENDS = "zlib nettle gnutls gmp openssl nss nspr"
 
-- 
2.7.4




