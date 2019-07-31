Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7122D7F367
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 08:25:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,329,1559491200"; d="scan'208";a="72580527"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2019 16:25:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7EE6E4CDE868
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 16:25:53 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 31 Jul 2019 16:25:56 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jul 2019 16:25:12 +0800
Message-ID: <20190731082512.26935-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 7EE6E4CDE868.AAB45
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] glib-2.0:upgrade 2.60.5 -> 2.60.6
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
X-List-Received-Date: Wed, 31 Jul 2019 08:25:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta/recipes-core/glib-2.0/{glib-2.0_2.60.5.bb => glib-2.0_2.60.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.60.5.bb => glib-2.0_2.60.6.bb} (88%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.60.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.60.6.bb
similarity index 88%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.60.5.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.60.6.bb
index bcb1fdb..a3c5a09 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.60.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.60.6.bb
@@ -21,5 +21,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 SRC_URI_append_class-target = " file://glib-meson.cross"
 
-SRC_URI[md5sum] = "7dced27cfa79419dc6cc82c02190c457"
-SRC_URI[sha256sum] = "3edf1df576ee82b2ecb8ba85c343644e48ee62e68290e71e6084b00d6ba2622e"
+SRC_URI[md5sum] = "cd6865d8ce40db5e4c12b7d180953de6"
+SRC_URI[sha256sum] = "ff8fab8d8deaa4fd0536c90f90d9769a09071779c7e6183907f6855645bffb6c"
-- 
2.7.4




