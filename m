Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 92F1B7C041
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:30 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id q18so23203287wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=DsDQZbazt4Z/2x7Pa4IUgxj366Y/F+/xsmZRGjoNmyI=;
	b=F1dgV6NlwfHI9XgWUl5ilBFS/eNYpx74yNn/uRH+LBB4R/eSWn46jEK7aHvLy/zg0T
	w28W+1G09etLxcdX+8JtAptdgsXE4bA+lFG8Vu+l09wxwD9/sOclBbDEmMIeel+Is8Um
	NKQ8fhtsZ3UiLi3bko6Cq2AKyPixoN2Dk1JVd0Hxx99JACWDcchMnCRitrsEfXpWVlF5
	83yaaJRRYoTQzeZT5WAaA2SdPEqOvRoZPwvpeUpDTJFEdzW4yzBXf9XoCbRhdEa4UV29
	+i+ZL3d8KfPL+hqd9/ukRSuyuXaaTv9h8rebabB9KgXRz9U1MdeJioqVMaTYj0ZSZ4q4
	JCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=DsDQZbazt4Z/2x7Pa4IUgxj366Y/F+/xsmZRGjoNmyI=;
	b=WNNV+Xuta67y6pzTSJCvGuXDexSMzLehAy5fdM7m4TYiS22r6mMPVCM+PzGW9PpDA7
	jxThL45pT5Bd1/hCc16/yOpmVXiRZ1L5dC4SL0Bv8uWKic8zdfqypGG4EUWM65o9iaPQ
	aYUy/FErjZglG37K+/CoWnFtf6HK6iO1K0Rxciv8ujFId2X8DcIDFpPSMJkZiojeIRzy
	LmLHY7I8BdYkOWQ3szZW8WTe+esCDJhRpL2TCs3aHYazaGHDvoJ0g0TgzI4oeYNDkYDJ
	+ohZR/6CuyjpizfjS9JYlMNFJNBqwobilTnm1Tm7OSSu6zC0Ty6v+ir/8LzqVFygUM5J
	8BWg==
X-Gm-Message-State: AJcUukcsU+SACweaRwkr/iymzuWQw7wy3DJV0dUDnTaqXN9jmwKJpEbN
	ID1XgbRyH+j/20D3qi+HZaNSjqhw
X-Google-Smtp-Source: ALg8bN7IG/ugJzfW2uqIPEJSNF9LjzYfBU04k/xSl7OQuklaWARzBxc5Q505Ap5Bd3Z35YKRgtlpWQ==
X-Received: by 2002:adf:9dd2:: with SMTP id q18mr8259283wre.12.1547478210571; 
	Mon, 14 Jan 2019 07:03:30 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:02 +0100
Message-Id: <accaa43b9672c25f00b91ca9ef5f87dae79aa48c.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 06/23] meta: add native and nativesdk variants to various recipes to enable gtk+3-native/nativesdk
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:31 -0000
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
index 99c84c6dda4..bf202ef8609 100644
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
index d7ea9be87fe..fe8f9955822 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
@@ -37,3 +37,4 @@ FILES_${PN} += "${datadir}/dbus-1/services/*.service \
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


