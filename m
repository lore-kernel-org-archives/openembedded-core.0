Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EAD486AC00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 05:48:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10032996"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2016 13:48:34 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6ECF642BC500
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 13:48:33 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 18 Aug 2016 13:48:33 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2016 01:48:28 -0400
Message-ID: <1471499308-1666-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 6ECF642BC500.A6E95
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gdk-pixbuf: 2.34.0 -> 2.35.3
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
X-List-Received-Date: Thu, 18 Aug 2016 05:48:43 -0000
Content-Type: text/plain

Upgrade gdk-pixbuf from 2.34.0 to 2.35.3.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.34.0.bb => gdk-pixbuf_2.35.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.34.0.bb => gdk-pixbuf_2.35.3.bb} (96%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.34.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.35.3.bb
similarity index 96%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.34.0.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.35.3.bb
index c24ec12..5e1fdae 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.34.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.35.3.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            "
 
-SRC_URI[md5sum] = "63cb19f92cf7709ccf44bbb6fe1ff70c"
-SRC_URI[sha256sum] = "d55e5b383ee219bd0e23bf6ed4427d56a7db5379729a6e3e0a0e0eba9a8d8879"
+SRC_URI[md5sum] = "e9dc096280aaa1a7c4252af12df81476"
+SRC_URI[sha256sum] = "ab4cdba365426685db049eca35e35147fe350b927cc68e469d54799c64d0cb23"
 
 inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection
 
-- 
2.7.4




