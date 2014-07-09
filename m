Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3195F7045A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 10:17:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s69AHQum001914
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Jul 2014 03:17:26 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 9 Jul 2014 03:17:25 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jul 2014 18:17:01 +0800
Message-ID: <cf53e769126cd311242b334989618fd969b8d521.1404885647.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1404885647.git.hongxu.jia@windriver.com>
References: <cover.1404885647.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 8/8] xserver-xorg.inc: add PACKAGECONFIG for xmlto
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
X-List-Received-Date: Wed, 09 Jul 2014 10:17:26 -0000
Content-Type: text/plain

Support xmlto for documentation generation and disable it by default.

[YOCTO #2416]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 8b5747e..6281eee 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -99,7 +99,6 @@ FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
 FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
 
 EXTRA_OECONF += "--with-fop=no \
-                 --without-xmlto \
                  --with-pic \
                  --disable-static \
                  --disable-xinerama \
@@ -125,6 +124,7 @@ PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto"
 PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtual/libgl virtual/libx11"
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
+PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
-- 
1.8.1.2


