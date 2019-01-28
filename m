Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6049D7C483
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:12 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id m22so13826212wml.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=pCso8k/q1tchqbwFyFmmjNJC1h5gwaQmM2Gy446wBoQ=;
	b=vBIZ9Ngk5GieWT523HGaOjAraptNSylhNAOqCrhQoi3/ZDgzd5ahjn+UW1KOvrRnTW
	cyTQMFL8gh7ja5GdVtLIGYhbKdhONnTmekvBYd9iptr7EZhqeozR/mXvv21+3U9CWgRL
	dMgQBBwtaSw0vZllT+HN5sAr6mKqcf3fVzmlTkLcrBFAWoOuc98Z4axdbVdXw4f3ebIh
	TzD/UstqV7hVbxDilnHrvNaIEh3ZYvGtcl6NByatr9dXlzK2xj4XEs3i0joA+3LQVOaB
	alwrTt+6VhcdAYh9bi4x49WS2URT3+0J40RbzJfpU+r013mLfUs53JQdMtghn+ZqCFY7
	81Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=pCso8k/q1tchqbwFyFmmjNJC1h5gwaQmM2Gy446wBoQ=;
	b=gn5IttcI+Z+bgIXP4wYqrcsw2a8KCn/eQEGsp/Bo4XP/kuANZ2xn1Wv6lDw0Q0rs+x
	Uk/71ue/+T1PZ0RRbp8tLLL++zVRvZBjw9B+8wnVr2ncfipx+Se3X5QedHMY8uJXvV+b
	0zkJGbsqcBo5tjAvEiRyKEU/WAx41SXirXpg/MjVWfERQrJt6BKxH9rQQ81U2u40Qaqb
	G7MufhR6SHdJ6oJSljDhVIU83q03oIFfJBadKFPIK0XyW0X+k3GKsuo0CNfhmMnVXyjg
	0bYyjml4g9Tgm2rhblZxVazgCUZTIG6Q6jZ3MEgz9SQgePmTH8pBczNd/hghmqMiZB3j
	eV5g==
X-Gm-Message-State: AJcUukdTMlAywOmCKU1W/9/TI6hqLbGHQ2G+//MluYUkmxsnFHRLLUZx
	Y+VxfZGKqzv5pAWcrG46oPujPC3i
X-Google-Smtp-Source: ALg8bN74Ue8FHmcmHe82H+reYCvJD6cfGaX480XREMt/ZjZydCdd+4XCP1dowJZAjc0XiVr2c4FNlw==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr17246833wmi.10.1548679632481; 
	Mon, 28 Jan 2019 04:47:12 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:36 +0100
Message-Id: <c1f3994b036a46fe3eb607266831f1a1eeba0cdb.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 05/24] meta: add native and nativesdk variants to various recipes to enable gtk+3-native/nativesdk
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb             | 2 +-
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb           | 2 ++
 .../recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb | 2 ++
 meta/recipes-graphics/cairo/cairo_1.14.12.bb                    | 2 +-
 meta/recipes-graphics/harfbuzz/harfbuzz_2.2.0.bb                | 2 +-
 meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb               | 2 +-
 meta/recipes-graphics/pango/pango_1.42.4.bb                     | 2 +-
 meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb      | 2 ++
 meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb           | 2 +-
 meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb              | 2 +-
 meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb                   | 2 ++
 meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb                 | 1 +
 meta/recipes-support/atk/at-spi2-atk_2.30.0.bb                  | 2 ++
 meta/recipes-support/atk/at-spi2-core_2.30.0.bb                 | 1 +
 meta/recipes-support/atk/atk_2.30.0.bb                          | 2 +-
 meta/recipes-support/vte/vte_0.52.2.bb                          | 2 ++
 16 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb
index e4f2eee9764..a7d3884d1fb 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb
@@ -99,4 +99,4 @@ do_install_append_class-native() {
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache \
 		GDK_PIXBUF_MODULEDIR=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders
 }
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
index 40dd35ba306..7102a895955 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
@@ -42,3 +42,5 @@ FILES_${PN}-hires = "${prefix}/share/icons/Adwaita/256x256/ \
                      ${prefix}/share/icons/Adwaita/512x512/"
 FILES_${PN} = "${prefix}/share/icons/Adwaita/ \
                ${prefix}/share/pkgconfig/adwaita-icon-theme.pc"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
index 7064b1942d4..fb8033448d8 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
@@ -12,3 +12,5 @@ SRC_URI[sha256sum] = "317484352271d18cbbcfac3868eab798d67fff1b8402e740baa6ff41d5
 inherit allarch autotools
 
 FILES_${PN} += "${datadir}/icons"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/cairo/cairo_1.14.12.bb b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
index 18b947948a3..ad6745f60dc 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.12.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
@@ -84,4 +84,4 @@ FILES_${PN}-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
 FILES_${PN}-perf-utils = "${bindir}/cairo-trace* ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so.*"
 FILES_${PN}-dev += "${libdir}/cairo/*.so"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.2.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.2.0.bb
index 3b1e6a8181a..b62082f53d8 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.2.0.bb
@@ -37,4 +37,4 @@ FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
                        ${libdir}/pkgconfig/harfbuzz-icu.pc \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
index 72706be674f..d9d877dc0df 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
@@ -53,4 +53,4 @@ FILES_jpeg-tools = "${bindir}/*"
 DESCRIPTION_libturbojpeg = "A SIMD-accelerated JPEG codec which provides only TurboJPEG APIs"
 FILES_libturbojpeg = "${libdir}/libturbojpeg.so.*"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
index 22fe3af15d7..a09f7a8e701 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -42,4 +42,4 @@ RDEPENDS_${PN}-ptest += "liberation-fonts cantarell-fonts"
 RPROVIDES_${PN} += "pango-modules pango-module-indic-lang \
                     pango-module-basic-fc pango-module-arabic-lang"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
index 412da48725e..f5df9efa3b7 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
@@ -37,3 +37,5 @@ do_install () {
 
 PACKAGES = "${PN}"
 FILES_${PN} += "${sysconfdir} ${datadir}"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
index 73e29484047..5e26fca7cd5 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3f2907aad541f6f226fbc58cc1b3cdf1"
 
 DEPENDS += " xorgproto virtual/libx11 libxfixes libxext"
 PROVIDES = "xcomposite"
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
index 6d6ffadf209..530da0569c5 100644
--- a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9fe101f30dd24134cf43146863241868"
 
 DEPENDS += "virtual/libx11 xorgproto libxfixes"
 PROVIDES = "xdamage"
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb
index 08381d9c4d5..ab49cdba3fb 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb
@@ -20,3 +20,5 @@ XORG_PN = "libXi"
 SRC_URI[md5sum] = "1f0f2719c020655a60aee334ddd26d67"
 SRC_URI[sha256sum] = "c2e6b8ff84f9448386c1b5510a5cf5a16d788f76db018194dacdc200180faf45"
 
+BBCLASSEXTEND = "native nativesdk"
+
diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
index 266bd1ca59c..7837f69d38b 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
@@ -19,3 +19,4 @@ XORG_PN = "libXtst"
 SRC_URI[md5sum] = "ef8c2c1d16a00bd95b9fdcef63b8a2ca"
 SRC_URI[sha256sum] = "4655498a1b8e844e3d6f21f3b2c4e2b571effb5fd83199d428a6ba7ea4bf5204"
 
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/atk/at-spi2-atk_2.30.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.30.0.bb
index eb4be6b6d86..2244797071f 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.30.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.30.0.bb
@@ -18,3 +18,5 @@ PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
 
 FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
 FILES_${PN}-gtk2 = "${libdir}/gtk-2.0/modules/libatk-bridge.*"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
index 7d2d406cbc2..d0b567a5e57 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
@@ -38,3 +38,4 @@ FILES_${PN} += "${datadir}/dbus-1/services/*.service \
                 ${datadir}/defaults/at-spi2 \
                 ${systemd_user_unitdir}/at-spi-dbus-bus.service \
                 "
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/atk/atk_2.30.0.bb b/meta/recipes-support/atk/atk_2.30.0.bb
index c950862b6f0..481f8e89a13 100644
--- a/meta/recipes-support/atk/atk_2.30.0.bb
+++ b/meta/recipes-support/atk/atk_2.30.0.bb
@@ -33,5 +33,5 @@ SRC_URI_append = " \
 SRC_URI[archive.md5sum] = "769c85005d392ad17ffbc063f2d26454"
 SRC_URI[archive.sha256sum] = "dd4d90d4217f2a0c1fee708a555596c2c19d26fef0952e1ead1938ab632c027b"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-support/vte/vte_0.52.2.bb b/meta/recipes-support/vte/vte_0.52.2.bb
index 7324c9c63d5..62fb5288fa9 100644
--- a/meta/recipes-support/vte/vte_0.52.2.bb
+++ b/meta/recipes-support/vte/vte_0.52.2.bb
@@ -44,3 +44,5 @@ EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool
 
 PACKAGES =+ "libvte"
 FILES_libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


