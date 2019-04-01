Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 89A326C42C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 02:17:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,294,1549900800"; d="scan'208";a="58165894"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Apr 2019 10:17:06 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 85B694CD654C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 10:17:03 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Apr 2019 10:17:06 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Apr 2019 10:17:39 +0800
Message-ID: <20190401021739.2765-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 85B694CD654C.A7EF7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libgpg-error:upgrade 1.35 -> 1.36
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
X-List-Received-Date: Mon, 01 Apr 2019 02:17:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from libgpg-error_1.35.bb to libgpg-error_1.36.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libgpg-error_1.35.bb => libgpg-error_1.36.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.35.bb => libgpg-error_1.36.bb} (94%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
similarity index 94%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
index 57ac143fd5..2db544a12e 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
@@ -16,8 +16,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
 	  "
 
-SRC_URI[md5sum] = "2808a9e044f883f7554c5ba6a380b711"
-SRC_URI[sha256sum] = "cbd5ee62a8a8c88d48c158fff4fc9ead4132aacd1b4a56eb791f9f997d07e067"
+SRC_URI[md5sum] = "eff437f397e858a9127b76c0d87fa5ed"
+SRC_URI[sha256sum] = "babd98437208c163175c29453f8681094bcaf92968a15cafb1a276076b33c97c"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.20.1




