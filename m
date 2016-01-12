Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5B094731C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 07:47:24 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id cy9so335599280pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 23:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+nMZtHeMGn+j/FEu2rdHh+TkOoMWRuUn/c9YrNILvWI=;
	b=aaKw4Od0/J8vsJq31pFcmwbtdjHWN8AIu7r+48RLs01jeDypICIC8Owpxl+YQ9W+M0
	YFWgt1ixBWfp3IdEWFno1RCATWA/32Qa4l5pltU5ZnpbNmET1yIjx58N3AmqRMSihMxn
	Aen1GGyYB8h97mbHmFSQGVo1v3bP+Y2E46IY45Ei758AuzHu17+4xvE+kBGPIxqOkTf3
	wwEFQtL5hXYdYsFAMuxhN8FTsgIbjEmaQTwPIs1KJ9jxCx7MdsyOQpUc25TehBJU5kef
	n7Yog2X2ObAcfPC6o0wa0EoBweHNYMu1X+CpB1xd/xgRAcRA2/RxAU6XhN7uxa7lfd8n
	fSEQ==
X-Received: by 10.66.237.102 with SMTP id vb6mr186349934pac.133.1452584845612; 
	Mon, 11 Jan 2016 23:47:25 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	dz6sm190716073pab.19.2016.01.11.23.47.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jan 2016 23:47:24 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jan 2016 23:47:16 -0800
Message-Id: <1452584836-19186-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] harfbuzz: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Tue, 12 Jan 2016 07:47:25 -0000

Misc recipe formatting cleanup, plus version update as described below.

  http://cgit.freedesktop.org/harfbuzz/tree/NEWS

Overview of changes leading to 1.1.3
Monday, January 11, 2016
====================================

- Ported Indic shaper to Unicode 8.0 data.
- Universal Shaping Engine fixes.
- Speed up CoreText shaper when font fallback happens in CoreText.
- Documentation improvements, thanks to Khaled Hosny.
- Very rough directwrite shaper for testing, thanks to Ebrahim Byagowi.
- Misc bug fixes.
- New API:

  * Font extents:
      hb_font_extents_t
      hb_font_get_font_extents_func_t
      hb_font_get_font_h_extents_func_t
      hb_font_get_font_v_extents_func_t
      hb_font_funcs_set_font_h_extents_func
      hb_font_funcs_set_font_v_extents_func
      hb_font_get_h_extents
      hb_font_get_v_extents
      hb_font_get_extents_for_direction

  * Buffer message (aka debug):
      hb_buffer_message_func_t
      hb_buffer_set_message_func()
    Actual message protocol to be fleshed out later.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../harfbuzz/{harfbuzz_1.1.2.bb => harfbuzz_1.1.3.bb} | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.1.2.bb => harfbuzz_1.1.3.bb} (87%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.3.bb
similarity index 87%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.1.3.bb
index db1e578..ead355f 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.3.bb
@@ -2,29 +2,26 @@ SUMMARY = "Text shaping library"
 DESCRIPTION = "HarfBuzz is an OpenType text shaping engine."
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
-
+SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
                     file://src/hb-ucdn/COPYING;md5=994ba0f1295f15b4bda4999a5bbeddef \
 "
 
-SECTION = "libs"
+DEPENDS = "glib-2.0 cairo freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "e6210d3cfd4064d95621fc16913268ed"
-SRC_URI[sha256sum] = "4a2c5790bd3db7c3ca8c02e4858f2fd592df7932c1d2fa9f6b99acbce0f8461f"
 
-inherit autotools pkgconfig lib_package
-
-DEPENDS = "glib-2.0 cairo freetype"
+SRC_URI[md5sum] = "671daf05153d57258e5cb992aa28c64a"
+SRC_URI[sha256sum] = "d93d7cb7979c32672e902fdfa884599e63f07f2fa5b06c66147d20c516d4b8f7"
 
-BBCLASSEXTEND = "native"
-
-EXTRA_OECONF = "--with-glib --with-freetype --with-cairo --without-graphite2"
+inherit autotools pkgconfig lib_package
 
 PACKAGECONFIG ??= "icu"
 PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
 
+EXTRA_OECONF = "--with-glib --with-freetype --with-cairo --without-graphite2"
+
 PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
 
 FILES_${PN}-icu = "${libdir}/libharfbuzz-icu.so.*"
@@ -32,3 +29,5 @@ FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
                        ${libdir}/libharfbuzz-icu.so \
                        ${libdir}/pkgconfig/harfbuzz-icu.pc \
 "
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


