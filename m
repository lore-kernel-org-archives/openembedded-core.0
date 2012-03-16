Received: from [74.125.82.175] (helo=mail-we0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.72) id 1S8Kj3-00009v-8m
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:08:57 +0100
Received: by wera1 with SMTP id a1so3449215wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 17:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=kacVukQ1cv1snHJI1tz9Ba9dwXpE0jABmg9cFb9hgR8=;
	b=ZjORiltqJk0xTTu8nGeKWxmjjk9pWcYEsOTOBGD7Ox3uDNwOgQXpj/OoLdGL6vL9os
	ZCeAND/q49Y6+mxHl/FpUJ8P7Y3QWIBe3n2p4Qp4pXJch/io3Y2UKkbanTEh6Bd0iqhH
	CbanC5KYxi8NenCF5Smj0fsV1N/ggqeRXwu8DWztOxGCFPTz66tMJpEsTscFxZKIGtTd
	TkaXEE/V3Qp7OTy39/HWRUbtQ8jTKaRcHUyiDc5sDryzyBtoypfkMiuj5cMqcvgprL8Q
	yds+V/KAbjqHsmjE5wvYspm9j4z6zyHa7nZkvmdPi1LvY30nVghjVnql5Z4Ooy1Tttgo
	MvQQ==
Received: by 10.216.136.13 with SMTP id v13mr313544wei.32.1331856010263;
	Thu, 15 Mar 2012 17:00:10 -0700 (PDT)
Received: from localhost.localdomain (93-142-247-48.adsl.net.t-com.hr.
	[93.142.247.48])
	by mx.google.com with ESMTPS id l5sm9100883wia.11.2012.03.15.17.00.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 17:00:09 -0700 (PDT)
From: Marko Katic <dromede@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 01:00:04 +0100
Message-Id: <1331856008-21536-1-git-send-email-user@dromedary>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 1/5] xcb_util.inc: Remove packaging and modify SRC_URI for multiple ${BPN} names
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 00:08:57 -0000

Xcb-util was split into separate packages during the 0.3.6 -> 0.3.8 transition. 
Update xcb_util.inc to reflect that by removing the older packaging.
Libxcbatom, libxcbaux and libxcbevent are merged into libxcbutil.
Libxcbicccm, libxcbimage, libxcbkeysyms and libxcbwm are now separate packages.
Libxcbproperty and libxcbreply were made obsolete with this commit:

http://cgit.freedesktop.org/xcb/util/commit/?id=81c62e7a04213abefa1ea82819887aaaa3c31a74
---
 meta/recipes-graphics/xcb/xcb-util.inc |   16 +---------------
 1 files changed, 1 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-graphics/xcb/xcb-util.inc b/meta/recipes-graphics/xcb/xcb-util.inc
index cd9923d..7dad545 100644
--- a/meta/recipes-graphics/xcb/xcb-util.inc
+++ b/meta/recipes-graphics/xcb/xcb-util.inc
@@ -18,20 +18,6 @@ DEPENDS += "gperf-native"
 
 PARALLEL_MAKE = ""
 
-SRC_URI = "http://xcb.freedesktop.org/dist/xcb-util-${PV}.tar.bz2"
-
-PACKAGES =+ "libxcbatom libxcbaux libxcbevent libxcbicccm \
-             libxcbimage libxcbkeysyms libxcbproperty \
-             libxcbreply libxcbwm"
-
-FILES_libxcbatom = "${libdir}/libXCBAtom.so.*"
-FILES_libxcbaux = "${libdir}/libXCBAux.so.*"
-FILES_libxcbevent = "${libdir}/libXCBEvent.so.*"
-FILES_libxcbicccm = "${libdir}/libXCBICCCM.so.*"
-FILES_libxcbimage = "${libdir}/libXCBImage.so.*"
-FILES_libxcbkeysyms = "${libdir}/libXCBKeysyms.so.*"
-FILES_libxcbproperty = "${libdir}/libXCBProperty.so.*"
-FILES_libxcbreply = "${libdir}/libXCBReply.so.*"
-FILES_libxcbwm = "${libdir}/libXCBWM.so.*"
+SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.bz2"
 
 inherit autotools pkgconfig
-- 
1.7.4.1



