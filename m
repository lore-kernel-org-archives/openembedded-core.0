Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id C375B601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 10:30:04 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so270737172wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 02:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=4l1vDflxf8U0xDAL9aXSjDwmechyUQRKkSqtKFjqUVk=;
	b=nvjqPDAv6m70HCMjaPgPIUcFZGmAiODU18NahiHCRtc+Y0XZjsFtIrBOQmzoRRCJgV
	KzfNkoQrwK543rs2igtngkDWGfIU5HhJ9bwasZGvb2QpRlRQ4aHwDJMMEQtw4ojMftns
	OgAw3X4lB6WcX7Y3Lo2bLVrq+X32f1ZD4txMbjODDwFxfEH9+uo7nGaWRr+u9a7WfMqz
	oYwunGi/bDCmP8PekTH0+RNK0m5Eh67UOIq7z+EHcjYtZO87BH3pUGIfuPBEOGm3WjzY
	/kmYw3Em/bmgA8Cpj043MK+NaoqsdoJp81ear/nYxnAZFGgSqpgnOjIWWziiBxYtHotG
	P5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4l1vDflxf8U0xDAL9aXSjDwmechyUQRKkSqtKFjqUVk=;
	b=D5hO3IOP8t4teGusSyBkSegzVEXoPFQyuCeuN8IODas7AA8GSbzoXjt4ULesbGPghG
	pDOji+t5jYtpxHjmEBSDtxfbKA3G0LIxOag5VIRWB80bCrsE0Xa/wJKPK0LyyMLcBvv9
	LVsANaCSkvLDVvYIqQ2Z8CYxZD/uqnLccY6wQ3cUbkau7xqPv8AEPZ3Xi068tzTGYToW
	GL+ZTL3L833gncI67fz5Xlhu0pJx2Jw4USPIzfpnam9MYQtpF8quL+UHfxJjHUpz06gT
	BhbiXlOp7LhiKqb8LfsXnOfqIADQ8lrNIcvZUcegOnJD+KhXgoqyNasY4cEFwB031BDu
	+HXg==
X-Gm-Message-State: ALoCoQmuxwShI3Q5iRPTqv1KgSMt4w4fmV2nvuWmbKGTZXgATK3+k1aGddpX6ok6PZKQVNFKofax
X-Received: by 10.28.16.72 with SMTP id 69mr3254845wmq.100.1447842604749;
	Wed, 18 Nov 2015 02:30:04 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v196sm2573339wmv.10.2015.11.18.02.30.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Nov 2015 02:30:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 10:21:33 +0000
Message-Id: <1447842093-16328-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] pango: use ptest-gnome
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
X-List-Received-Date: Wed, 18 Nov 2015 10:30:05 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/pango/pango.inc | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 04143bd..78cd560 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -12,16 +12,13 @@ LICENSE = "LGPLv2.0+"
 X11DEPENDS = "virtual/libx11 libxft"
 DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo harfbuzz qemu-native"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'ptest', '', d)}"
-
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-xft,--without-xft,${X11DEPENDS}"
-PACKAGECONFIG[ptest] = "--enable-installed-tests,--disable-installed-tests,glib-2.0-native"
 
 BBCLASSEXTEND = "native"
 DEPENDS_class-native = "glib-2.0-native cairo-native harfbuzz-native"
 
-inherit gnomebase gtk-doc qemu ptest
+inherit gnomebase gtk-doc qemu ptest-gnome
 
 EXTRA_AUTORECONF = ""
 
@@ -46,11 +43,7 @@ FILES_${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
 FILES_${PN}-dbg += "${libdir}/pango/${LIBV}/modules/.debug"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
 
-FILES_${PN}-ptest += "${libexecdir}/installed-tests/* \
-                      ${datadir}/installed-tests/pango"
-FILES_${PN}-dbg += "${libexecdir}/installed-tests/.debug"
-
-RDEPENDS_${PN}-ptest += "gnome-desktop-testing liberation-fonts"
+RDEPENDS_${PN}-ptest += "liberation-fonts"
 
 RPROVIDES_${PN} += "pango-modules pango-module-indic-lang \
                     pango-module-basic-fc pango-module-arabic-lang"
-- 
2.1.4


