Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 28C1A62134
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 01:15:11 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id z24so2459962wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 18:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ywhcjjyrTAnHTKF9hgkFHFOUsJCotptxtu2HVKN5G8o=;
	b=tQR/FvzwZwClaCTNRivqEKCA+NlhYaKK2RuCO3sGnVDpAPXMpLBIoXV7SZfTtttYKp
	NRjTSdeMV3JIJHeW5FHYaUqIu5vAvc+8qfZIA5sM1W17yNJAtz1oP+00Mh6hy8qCuTkN
	JdeoSUL7GM9Xll81oTXCugCRRhA8f0eSP13MUcXnnsr8Bf63jdrmkum+VDFwGrDoYaI0
	w4R8hgplN4dCR3ZGpXUzsq1+ihIjh5LeZFy/gDxGQZXCXokoHHkbsLWD4Vpmxiahy7nK
	KlhObL/tZOKBchIVX2bXSd0XW/t9VsGwq4/ju6W9GieJMVgQ59KhWHosapv6bpvG9Smm
	eeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ywhcjjyrTAnHTKF9hgkFHFOUsJCotptxtu2HVKN5G8o=;
	b=J5PUfaYkWCnB4ni7lKbKm6GQEibZA2gWuq6z3qGzJySH1AYdEYhL2YTzL8TDfEglY3
	O9+lwuGSFNuBTQNB1K46vbTphdCaB43brsOjzzS0nS9BF77MPCQg9Z/84aRx8FJo5q4H
	BVD66zEMdOhAuMw/xBcz+wMNjo6belEQUP7Si+bSDBdvfZ8kLK5usloWmCojhxHeOFYa
	hTQv52WGUwOBBJS1MWQYQRZ1FVscFU7EnjZfUEtuBrlFXJj4EQ1sQJcqumq95yQaIfH0
	CVoN5nvSF272yBKbFqhPwTAFiVLz8B9y9fIbU6Ff6XMVOoF+LAJZRU3i1sbxSMbzAWvf
	bViA==
X-Gm-Message-State: APjAAAWw2ZOmRbVRR2c0woK+OonmJQ7GLns4JxqXtCqE+MQJuOEy3U+L
	PPQjL1LHs/cmqRgQNlITMHTXRAmA
X-Google-Smtp-Source: APXvYqz3R1I7N+S0lVnIhMEUQHOAPISKebw0JKWpgFhbqbr8rbOAj29Jsph6q7kZI7DiNAdlfqnAWA==
X-Received: by 2002:a05:600c:2055:: with SMTP id
	p21mr4460962wmg.118.1556068512355; 
	Tue, 23 Apr 2019 18:15:12 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F06D061E0920178A04BAB4C.dip0.t-ipconnect.de.
	[2003:f0:7f06:d061:e092:178:a04b:ab4c])
	by smtp.gmail.com with ESMTPSA id l1sm8152693wrh.58.2019.04.23.18.15.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Apr 2019 18:15:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 03:15:00 +0200
Message-Id: <20190424011500.9830-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] vte: upgrade 0.52.2 -> 0.56.1
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
X-List-Received-Date: Wed, 24 Apr 2019 01:15:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* license: COPYING was replaced by COPYING.LGPL2/COPYING.LGPL3/COPYING.GPL3
* pretify recipe a bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../vte/{vte_0.52.2.bb => vte_0.56.1.bb}       | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)
 rename meta/recipes-support/vte/{vte_0.52.2.bb => vte_0.56.1.bb} (78%)

diff --git a/meta/recipes-support/vte/vte_0.52.2.bb b/meta/recipes-support/vte/vte_0.56.1.bb
similarity index 78%
rename from meta/recipes-support/vte/vte_0.52.2.bb
rename to meta/recipes-support/vte/vte_0.56.1.bb
index 272ae66f13..0c0c0f4cd8 100644
--- a/meta/recipes-support/vte/vte_0.52.2.bb
+++ b/meta/recipes-support/vte/vte_0.56.1.bb
@@ -1,9 +1,15 @@
 SUMMARY = "Virtual terminal emulator GTK+ widget library"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
-LICENSE = "LGPLv2.1+"
-DEPENDS = "glib-2.0 gtk+3 libpcre2 intltool-native libxml2-native gperf-native"
+LICENSE = "GPLv3 & LGPLv2.1+"
+LICENSE_libvte = "LGPLv2.1+"
+
+LIC_FILES_CHKSUM = " \
+    file://COPYING.GPL3;md5=2f31b266d3440dd7ee50f92cf67d8e6c \
+    file://COPYING.LGPL2;md5=4fbd65380cdd255951079008b364516c \
+    file://COPYING.LGPL3;md5=b52f2d57d10c4f7ee67a7eb9615d5d24 \
+"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+DEPENDS = "glib-2.0 gtk+3 libpcre2 intltool-native libxml2-native gperf-native"
 
 inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject-introspection
 
@@ -12,8 +18,8 @@ SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
            file://0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch \
            "
-SRC_URI[archive.md5sum] = "de8181350dccb010e915e366bdd06d18"
-SRC_URI[archive.sha256sum] = "0f2657cef52accbfe56feede553155552d7c1984b1291838af3cb8cfc19b26af"
+SRC_URI[archive.md5sum] = "a8984cd5a101dbff0b0c875d1de3f692"
+SRC_URI[archive.sha256sum] = "02fa8ecc02a9332e47f486795494527b5687b3bd448e73e6b67285f2f326dc7c"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -27,7 +33,7 @@ export XDG_DATA_DIRS = "${STAGING_DATADIR}"
 
 # Help g-ir-scanner find the .so for linking
 do_compile_prepend() {
-        export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
+    export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
 }
 
 # Package additional files
-- 
2.20.1


