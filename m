Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id F0C937D6AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 11:12:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,439,1557158400"; d="scan'208";a="70378886"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Jul 2019 19:12:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A0EB14CDBF7D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 19:12:19 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Jul 2019 19:12:19 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Jul 2019 19:13:55 +0800
Message-ID: <20190701111355.24491-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: A0EB14CDBF7D.AD2C5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] nss:upgrade 3.44 -> 3.44.1
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
X-List-Received-Date: Mon, 01 Jul 2019 11:12:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from nss_3.44.bb to nss_3.44.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-support/nss/{nss_3.44.bb => nss_3.44.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nss/{nss_3.44.bb => nss_3.44.1.bb} (98%)

diff --git a/meta/recipes-support/nss/nss_3.44.bb b/meta/recipes-support/nss/nss_3.44.1.bb
similarity index 98%
rename from meta/recipes-support/nss/nss_3.44.bb
rename to meta/recipes-support/nss/nss_3.44.1.bb
index 4205d79485..acef0a6cf9 100644
--- a/meta/recipes-support/nss/nss_3.44.bb
+++ b/meta/recipes-support/nss/nss_3.44.1.bb
@@ -33,8 +33,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            "
 
-SRC_URI[md5sum] = "e9222b9573452b9f4e6ff4915d6407c2"
-SRC_URI[sha256sum] = "a5620e59b6eeedfd5a12c9298b50ad92e9898b223e214eb675e36f4ffb5b6aff"
+SRC_URI[md5sum] = "511a37f35650812283274694b98c20b2"
+SRC_URI[sha256sum] = "fce4cb80c989cde35416ecbe55920856015a35151c4f21be64470e4dd4de12f8"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.20.1




