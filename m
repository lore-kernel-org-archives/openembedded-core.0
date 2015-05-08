Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6495373C7E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 13:36:02 +0000 (UTC)
Received: by lagv1 with SMTP id v1so52834635lag.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Z+xi7fsU57MEjxOuzrNPCYnER6ubLb0h5fUgb8++gyo=;
	b=K5ORuUJawC15nV1qmRYbgSbfgKcFo4VZLXYeTXuLTy0DhrH9Gd1rpsbIFVZw/HAy7f
	ctzp+i2Dg13/fPYROgwaiCncqpR+5H/rQBm/1u5tEjH01mhf65XTG/ONOmLbMkEa0dvF
	7n/MT4ywkI7OqD7n9fcfZuU5cDx3ivVY/wmiajEwHNgsf1LrLEpdlLoqjbmDzUgNFIpU
	TfJk2B9uVltV2C9rfJrp+7f5m4s8j1PXLVFNDs89gOtmsD5mOpN4yeNds1lV0T+BG/Wh
	HBNJVKund61sMwmyXKZ7sRETQPLEs7GfTaVm4scTLItwOiz9YyZOqjRqPI+VU/IbcLz7
	n5tA==
X-Received: by 10.112.77.234 with SMTP id v10mr2876210lbw.119.1431092163134;
	Fri, 08 May 2015 06:36:03 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by mx.google.com with ESMTPSA id gn6sm1176864lbc.28.2015.05.08.06.36.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 May 2015 06:36:02 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>,
	Ross Burton <ross.burton@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Fri,  8 May 2015 15:36:01 +0200
Message-Id: <1431092161-2500-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2] xserver-xorg: Make xinerama selectable via PACKAGECONFIG
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
X-List-Received-Date: Fri, 08 May 2015 13:36:03 -0000

If xinerara can be selected via PACKAGECONFIG, xserver-xorg recipe can
be easier modified via bbappend.

xinerama is needed by the fglrx driver (from AMD).

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---

v2: Fix by Ross Burton <ross.burton@intel.com>
 Add missing xineramaproto dep


 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index f0da488412d5..30299c2921ff 100644
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
+PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,xineramaproto"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
-- 
2.1.4


