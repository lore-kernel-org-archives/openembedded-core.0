Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbheG-0005el-Ua
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 02:01:40 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4771205eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 16:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=SuJgxUaCjA2Ak4CDQet+H54BJul1PQklzAbjkwPtmEA=;
	b=YHHowA06GZFexgpw+KqAQRmea8eKDuOZhQvJez4+W09Fc9ElcFzobhwhVq+W3E/QkG
	13Vt2hmA5YoVXvd2J6RXNm4Yw5DXZjTdEEsjBVDCNp1LC1hPwX5oPDL6yUDauPU6OP+p
	rFQF+l1Ne+3Xa34cdfvMOCx3tXguBpmtZdX1MAjlxZdgtdM7nvY5rDtuU6mN2hl6Zek0
	GUl4volH8agoPUFqjwxqS69UAlOhh6QB1AFzJ+3j9I49TbfQZOxBvjcezalsUnO/rIsU
	jeEJpu3vXoxJcDWRp/QLZHg/42e3CqTz/kB7dD1e1FNv0JD5TbkmBjwOZiZMjlF5Xe7T
	6gEA==
Received: by 10.14.216.70 with SMTP id f46mr7183854eep.12.1353631656335;
	Thu, 22 Nov 2012 16:47:36 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm10271992eeo.8.2012.11.22.16.47.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 16:47:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2012 01:47:16 +0100
Message-Id: <c72e7b4c61ac2a309ba3454feda1a579ce6bdbf8.1353631583.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1353631583.git.Martin.Jansa@gmail.com>
References: <cover.1353631583.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1353631583.git.Martin.Jansa@gmail.com>
References: <cover.1353631583.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/4] xserver-xorg: disable dri2 too when building without glx PACKAGECONFIG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 01:01:41 -0000

* it was enabled when dri2proto was built before xserver-xorg

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 4135a8b..d410707 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -13,7 +13,7 @@ PROVIDES = "virtual/xserver-xf86"
 PROVIDES += "virtual/xserver"
 
 PE = "2"
-INC_PR = "r5"
+INC_PR = "r6"
 
 XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
@@ -133,7 +133,7 @@ EXTRA_OECONF += "--with-fop=no \
 PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'glx', '', d)}"
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
 PACKAGECONFIG[glx] = "--enable-dri --enable-dri2 --enable-glx --enable-glx-tls,\
-                      --disable-dri --disable-glx,\
+                      --disable-dri --disable-dri2 --disable-glx,\
                       xf86driproto dri2proto mesa-dri"
 
 do_install_append () {
-- 
1.8.0



