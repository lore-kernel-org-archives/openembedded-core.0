Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B194703CF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 09:48:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s689mR7A006212
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Jul 2014 02:48:27 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Jul 2014 02:48:27 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Jul 2014 17:47:59 +0800
Message-ID: <1289b18b69cd36dca381ddb0be455c3fbf2ade30.1404812342.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1404812342.git.hongxu.jia@windriver.com>
References: <cover.1404812342.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 7/8] xorg-lib-common.inc: enable xmlto
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
X-List-Received-Date: Tue, 08 Jul 2014 09:48:27 -0000
Content-Type: text/plain

[YOCTO #2416]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 7231664..123a799 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -3,7 +3,7 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
 
 SECTION = "x11/libs"
 LICENSE = "MIT-X"
-DEPENDS = "util-macros"
+DEPENDS = "util-macros xmlto-native"
 
 XORG_PN = "${BPN}"
 
@@ -13,9 +13,9 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools distro_features_check pkgconfig
 
-EXTRA_OECONF = "--disable-specs --without-groff --without-ps2pdf --without-fop --without-xmlto"
+EXTRA_OECONF = "--disable-specs --without-groff --without-ps2pdf --without-fop --with-xmlto"
 
 UNKNOWN_CONFIGURE_WHITELIST += "--enable-malloc0returnsnull --disable-malloc0returnsnull \
-                                --disable-specs --without-groff --without-ps2pdf --without-fop --without-xmlto"
+                                --disable-specs --without-groff --without-ps2pdf --without-fop --with-xmlto"
 
 REQUIRED_DISTRO_FEATURES ?= "x11"
-- 
1.8.1.2


