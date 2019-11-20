Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 779E77F265
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 05:48:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,220,1571673600"; d="scan'208";a="78778092"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 13:48:18 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 324A34B6EC6D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:39:57 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 20 Nov 2019 13:48:13 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Nov 2019 13:48:46 +0800
Message-ID: <20191120054846.27180-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 324A34B6EC6D.AA22F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] alsa-plugins:upgrade 1.1.9 -> 1.2.1
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
X-List-Received-Date: Wed, 20 Nov 2019 05:48:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../alsa/{alsa-plugins_1.1.9.bb => alsa-plugins_1.2.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.9.bb => alsa-plugins_1.2.1.bb} (98%)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.9.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
similarity index 98%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.1.9.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
index b94fc5cee3..9882e12763 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
@@ -21,8 +21,8 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/plugins/${BP}.tar.bz2"
-SRC_URI[md5sum] = "e0caffbd849c51ed81751378f56cb563"
-SRC_URI[sha256sum] = "161772303da521abbbf1d91f63b470c4791392d5728f2192a42d71292078f907"
+SRC_URI[md5sum] = "5b11cd3ec92e5f9190ec378565b529e8"
+SRC_URI[sha256sum] = "4d94de7ad41734b8604a652521200bb6554fcf0c2c00fdbd302b1710d76548da"
 
 DEPENDS += "alsa-lib"
 
-- 
2.20.1




