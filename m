Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 54A0171D42
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 02:05:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="17730202"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Apr 2017 10:05:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id AC51947CE222
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 10:05:14 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 14 Apr 2017 10:05:13 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Apr 2017 10:04:56 +0800
Message-ID: <1492135496-4096-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: AC51947CE222.A511F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gdk-pixbuf:2.36.5 -> 2.36.6
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
X-List-Received-Date: Fri, 14 Apr 2017 02:05:24 -0000
Content-Type: text/plain

Upgrade gdk-pixbuf from 2.36.5 to 2.36.6.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.36.5.bb => gdk-pixbuf_2.36.6.bb}        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.36.5.bb => gdk-pixbuf_2.36.6.bb} (96%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.5.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.6.bb
similarity index 96%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.5.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.6.bb
index 7da6d16..8ea2ea6 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.5.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.6.bb
@@ -19,8 +19,9 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            file://0001-Work-around-thumbnailer-cross-compile-failure.patch \
            "
-SRC_URI[md5sum] = "0173fd5c11a5d2030d09201090636477"
-SRC_URI[sha256sum] = "7ace06170291a1f21771552768bace072ecdea9bd4a02f7658939b9a314c40fc"
+
+SRC_URI[md5sum] = "5dd53760750670d27c194ff6ace7eb51"
+SRC_URI[sha256sum] = "455eb90c09ed1b71f95f3ebfe1c904c206727e0eeb34fc94e5aaf944663a820c"
 
 inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
 
-- 
2.7.4




