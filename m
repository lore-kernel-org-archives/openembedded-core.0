Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6277C434
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2019 05:33:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,431,1559491200"; d="scan'208";a="74277579"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Aug 2019 13:33:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C57B34CE0431
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2019 13:33:07 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 26 Aug 2019 13:33:22 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Aug 2019 13:32:38 +0800
Message-ID: <20190826053238.28912-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: C57B34CE0431.AA239
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCHv2] libxcrypt:upgrade 4.4.6 -> 4.4.7
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
X-List-Received-Date: Mon, 26 Aug 2019 05:33:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Many individual files are under other licenses,update their information.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libxcrypt/{libxcrypt_4.4.6.bb => libxcrypt_4.4.7.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.6.bb => libxcrypt_4.4.7.bb} (86%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.7.bb
similarity index 86%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.7.bb
index 893f5e7..e61f59b 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.7.bb
@@ -3,16 +3,16 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM ?= "file://LICENSING;md5=be275bc7f91642efe7709a8ae7a1433b \
+LIC_FILES_CHKSUM ?= "file://LICENSING;md5=3bb6614cf5880cbf1b9dbd9e3d145e2c \
                      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
 inherit autotools pkgconfig
 
-PV = "4.4.6"
+PV = "4.4.7"
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "398943774c5ff38baf1bc5ee088855fd8983bb05"
+SRCREV = "66360ea0a9720951e45d41b9752aea69cdb1aefc"
 SRCBRANCH ?= "develop"
 
 PROVIDES = "virtual/crypt"
-- 
2.7.4




