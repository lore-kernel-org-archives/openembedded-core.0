Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id B4AF26AC3E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 11:40:59 +0000 (UTC)
Received: by layy10 with SMTP id y10so50729162lay.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 04:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4CezyPAGaU2Ork8wWR9394ClBeishSkQVGutg44L/GA=;
	b=y3gkalDOHwllwRD3SDJxigSogbhMiI6nCY9qfuFi4+NfD3EfiQccxCPPyt6zvAyHKB
	ncWlxYj7IjN7phcHl1prRYRuJbvw+bKwyj0TVkqA3HTajmODtJzS2VgLeii8jaToBGZc
	pwGUAsG6BzXMFtmOuM6DVivzHj4EcVKZ/P3bW6HFLTTbHaG+U+HcXmSTy/64GdNBmjCr
	C1PyiRPxmebs/C9/OEhG4ZpdIs4G+2IFtU1SYOoJZtpAYTIUjL1bdIkOu7j1ajzdBd99
	uQfrkWVjTM6Q+tLW5NENv6D/OFJ0+y3B/1BArr1l75Ca7s2BllU9CKDlGJLV2L1JpSpw
	BF3A==
X-Received: by 10.152.206.103 with SMTP id ln7mr2625891lac.40.1431085260371;
	Fri, 08 May 2015 04:41:00 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by mx.google.com with ESMTPSA id k12sm1102671lbg.42.2015.05.08.04.40.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 May 2015 04:40:59 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>,
	Ross Burton <ross.burton@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Fri,  8 May 2015 13:40:59 +0200
Message-Id: <1431085259-22281-1-git-send-email-ricardo.ribalda@gmail.com>
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
X-List-Received-Date: Fri, 08 May 2015 11:41:04 -0000

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


