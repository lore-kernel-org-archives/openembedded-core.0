Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8257C3AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 09:36:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,398,1544457600"; d="scan'208";a="54956791"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Feb 2019 17:36:15 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A174246BA6D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 17:36:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Fri, 22 Feb 2019 17:36:16 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Feb 2019 17:37:25 +0800
Message-ID: <20190222093725.624-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: A174246BA6D7.AEB7B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] cairo:upgrade to 1.17.2
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
X-List-Received-Date: Fri, 22 Feb 2019 09:36:14 -0000
Content-Type: text/plain

Upgrade cairo from 1.16.0 to 1.17.2

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../cairo/{cairo_1.16.0.bb => cairo_1.17.2.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/cairo/{cairo_1.16.0.bb => cairo_1.17.2.bb} (94%)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.17.2.bb
similarity index 94%
rename from meta/recipes-graphics/cairo/cairo_1.16.0.bb
rename to meta/recipes-graphics/cairo/cairo_1.17.2.bb
index 3e176930cc..fadec5711b 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.17.2.bb
@@ -22,12 +22,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
 DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
 
-SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
+SRC_URI = "http://cairographics.org/snapshots/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \ 
           "
 
-SRC_URI[md5sum] = "f19e0353828269c22bd72e271243a552"
-SRC_URI[sha256sum] = "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331"
+SRC_URI[md5sum] = "321a07adaeb125cb5513079256d465fb"
+SRC_URI[sha256sum] = "6b70d4655e2a47a22b101c666f4b29ba746eda4aa8a0f7255b32b2e9408801df"
 
 inherit autotools pkgconfig upstream-version-is-even gtk-doc multilib_script
 
-- 
2.17.2




