Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D97457DD72
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 05:42:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,483,1559491200"; d="scan'208";a="75151544"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Sep 2019 13:42:24 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8B5BA4CE03E8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 13:42:18 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 9 Sep 2019 13:42:24 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Sep 2019 13:41:53 +0800
Message-ID: <20190909054153.9555-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 8B5BA4CE03E8.AA8DF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libxcrypt:upgrade 4.4.8 -> 4.4.9
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
X-List-Received-Date: Mon, 09 Sep 2019 05:42:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-core/libxcrypt/{libxcrypt_4.4.8.bb => libxcrypt_4.4.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.8.bb => libxcrypt_4.4.9.bb} (94%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.9.bb
similarity index 94%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.9.bb
index 1787f69..1ffa0af 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.9.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM ?= "file://LICENSING;md5=3bb6614cf5880cbf1b9dbd9e3d145e2c \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "acd84997a5a8b2badd28b70a642abee11272fad2"
+SRCREV = "b503e2fb3a0271986b6b2756404f0593467cf5d7"
 SRCBRANCH ?= "develop"
 
 PROVIDES = "virtual/crypt"
-- 
2.7.4




