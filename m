Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B2CA77E783
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 07:46:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,391,1557158400"; d="scan'208";a="68019385"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jun 2019 15:46:09 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5F31C4CDD988
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 15:46:05 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 19 Jun 2019 15:46:07 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2019 15:47:28 +0800
Message-ID: <20190619074728.26314-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 5F31C4CDD988.AA291
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gobject-introspection:upgrade 1.60.1 -> 1.60.2
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
X-List-Received-Date: Wed, 19 Jun 2019 07:46:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from gobject-introspection_1.60.1.bb to gobject-introspection_1.60.2.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ntrospection_1.60.1.bb => gobject-introspection_1.60.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.60.1.bb => gobject-introspection_1.60.2.bb} (98%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.2.bb
similarity index 98%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.2.bb
index 40beab0c41..f46053f443 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.2.bb
@@ -21,8 +21,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0001-meson.build-disable-tests-when-cross-compiling.patch \
            "
 
-SRC_URI[md5sum] = "46fc8a98f6563e64947ac3d574632525"
-SRC_URI[sha256sum] = "d844d1499ecd36f3ec8a3573616186d36626ec0c9a7981939e99aa02e9c824b3"
+SRC_URI[md5sum] = "57c1c5dcf3d0a9aa73d06c2d5e6960d7"
+SRC_URI[sha256sum] = "ffdfe2368fb2e34a547898b01aac0520d52d8627fdeb1c306559bcb503ab5e9c"
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.20.1




