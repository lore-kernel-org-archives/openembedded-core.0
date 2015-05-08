Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id B819660034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 11:02:09 +0000 (UTC)
Received: by lbbzk7 with SMTP id zk7so50626296lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 04:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4CezyPAGaU2Ork8wWR9394ClBeishSkQVGutg44L/GA=;
	b=uI32vqEmnjTzgIPOv/CyvXOskfD3y0Ji7fsYO/s5mDQuX08h6giOj1LpEf5uUUbEPh
	H4nJzj8MVlF/Y8dCClOmP4OXiNHR8/C3OZQan0dFNNWnKEAh41AnogCmbGURNIwQ4lt/
	T6MZZziFFNDQRIDoN4xkR+Pr+6zXfm+/qpPttZcj9h/e7ejx+T86SHEGFggeng/hRpie
	0azvVkOCD5dMkXrOapM6vgue4t4cIVHJsHf3DYTDSDGCCv139t5TIm2oOelU8FzEkKYj
	AZBgHZ/AEhyM51LkWKVdG5JYk/Q8EjqOHq0A6YThXOozQvvQEa/AVUpAHavnBTQpIHp0
	c/lg==
X-Received: by 10.152.8.231 with SMTP id u7mr2402466laa.37.1431082929451;
	Fri, 08 May 2015 04:02:09 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by mx.google.com with ESMTPSA id e3sm1086676lag.26.2015.05.08.04.02.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 May 2015 04:02:08 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 May 2015 13:02:07 +0200
Message-Id: <1431082927-30249-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] xserver-xorg: Make xinerama selectable via PACKAGECONFIG
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
X-List-Received-Date: Fri, 08 May 2015 11:02:12 -0000

If xinerara can be selected via PACKAGECONFIG, xserver-xorg recipe can
be easier modified via bbappend.

xinerama is needed by the fglrx driver (from AMD).

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index f0da488412d5..18b1f896fe3a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -101,7 +101,6 @@ FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
 EXTRA_OECONF += "--with-fop=no \
                  --with-pic \
                  --disable-static \
-                 --disable-xinerama \
                  --disable-record \
                  --disable-dmx \
                  --disable-xnest \
@@ -128,6 +127,7 @@ PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
 PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[systemd-logind] = "--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,"
+PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
-- 
2.1.4


