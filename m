Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B50437F4FE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 08:48:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; d="scan'208";a="79574379"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 16:48:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id ED5C44CE1C0D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 16:40:13 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 4 Dec 2019 16:48:43 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Dec 2019 07:09:39 -0800
Message-ID: <1575472180-11923-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: ED5C44CE1C0D.A93E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] nss: 3.45 -> 3.47.1
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
X-List-Received-Date: Wed, 04 Dec 2019 08:48:44 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-support/nss/{nss_3.45.bb => nss_3.47.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nss/{nss_3.45.bb => nss_3.47.1.bb} (98%)

diff --git a/meta/recipes-support/nss/nss_3.45.bb b/meta/recipes-support/nss/nss_3.47.1.bb
similarity index 98%
rename from meta/recipes-support/nss/nss_3.45.bb
rename to meta/recipes-support/nss/nss_3.47.1.bb
index e89e7d6..f49a50a 100644
--- a/meta/recipes-support/nss/nss_3.45.bb
+++ b/meta/recipes-support/nss/nss_3.47.1.bb
@@ -33,8 +33,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            "
 
-SRC_URI[md5sum] = "f1752d7223ee9d910d551e57264bafa8"
-SRC_URI[sha256sum] = "112f05223d1fde902c170966bfc6f011b24a838be16969b110ecf2bb7bc24e8b"
+SRC_URI[md5sum] = "1c32c2e89958e8255a6da1ea43ea8206"
+SRC_URI[sha256sum] = "1ae3d1cb1de345b258788f2ef6b10a460068034c3fd64f42427a183d8342a6fb"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4




