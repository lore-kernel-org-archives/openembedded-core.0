Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C6FA47E782
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:39:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,391,1557158400"; d="scan'208";a="68011550"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jun 2019 14:39:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id CCC054CDD989
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 14:39:55 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 19 Jun 2019 14:40:01 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2019 14:41:18 +0800
Message-ID: <20190619064118.12978-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: CCC054CDD989.AB279
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gnupg:upgrade 2.2.15 -> 2.2.16
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
X-List-Received-Date: Wed, 19 Jun 2019 06:39:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from gnupg_2.2.15.bb to gnupg_2.2.16.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../gnupg/{gnupg_2.2.15.bb => gnupg_2.2.16.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.15.bb => gnupg_2.2.16.bb} (93%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.15.bb b/meta/recipes-support/gnupg/gnupg_2.2.16.bb
similarity index 93%
rename from meta/recipes-support/gnupg/gnupg_2.2.15.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.16.bb
index 06a257333d..cb7c6c5c62 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.15.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.16.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 
 
-SRC_URI[md5sum] = "3ab87e377aa0af2f463649515bf66508"
-SRC_URI[sha256sum] = "cb8ce298d7b36558ffc48aec961b14c830ff1783eef7a623411188b5e0f5d454"
+SRC_URI[md5sum] = "d90e186df1c06845880ea58a318f070b"
+SRC_URI[sha256sum] = "6cbe8d454bf5dc204621eed3016d721b66298fa95363395bb8eeceb1d2fd14cb"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.20.1




