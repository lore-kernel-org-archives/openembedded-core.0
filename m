Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B525D7EC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 07:29:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,407,1559491200"; d="scan'208";a="73934392"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Aug 2019 15:29:46 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9EC554CE03EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 15:29:43 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 20 Aug 2019 15:29:55 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2019 15:29:08 +0800
Message-ID: <20190820072908.28603-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 9EC554CE03EB.AB1A2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] pango:upgrade 1.44.3 -> 1.44.5
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
X-List-Received-Date: Tue, 20 Aug 2019 07:29:48 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/pango/{pango_1.44.3.bb => pango_1.44.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.44.3.bb => pango_1.44.5.bb} (90%)

diff --git a/meta/recipes-graphics/pango/pango_1.44.3.bb b/meta/recipes-graphics/pango/pango_1.44.5.bb
similarity index 90%
rename from meta/recipes-graphics/pango/pango_1.44.3.bb
rename to meta/recipes-graphics/pango/pango_1.44.5.bb
index 1973c63..448df98 100644
--- a/meta/recipes-graphics/pango/pango_1.44.3.bb
+++ b/meta/recipes-graphics/pango/pango_1.44.5.bb
@@ -18,8 +18,8 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspec
 SRC_URI += "file://run-ptest \
             "
 
-SRC_URI[archive.md5sum] = "7f91f1b5883ff848b445ab11ebabcf03"
-SRC_URI[archive.sha256sum] = "290bb100ca5c7025ec3f97332eaf783b76ba1f444110f06ac5ee3285e3e5aece"
+SRC_URI[archive.md5sum] = "b6bf689e3ce4f46b0fd887b64c850ea1"
+SRC_URI[archive.sha256sum] = "8527dfcbeedb4390149b6f94620c0fa64e26046ab85042c2a7556438847d7fc1"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.7.4




