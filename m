Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB217C2DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:59:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p7so25596474wru.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 02:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Q1m0RUkVgkd9i6xSszDlUByPXn8ybYbhICSTaUne1YM=;
	b=JJGadu0J8REn0QJmHNOs9gOufUAY3ZKQYV0ICrB9Yd1avVisA9PKRIpuz5sCmcmOjl
	9ihHa3OHFRjNNJ8L2uyDwB6mu62IAQq0/dvAinsAWeD7AaL3i9rJa3s06i0D9LBUFoS0
	c+TA6TAELXJ2G8oIh/w4iYB+cJCN5T1oVdIwMpVGAq6mU2hDqgFZIgSYWD9u5tb5fkbA
	s1WBIyBPOkNPzw8CVKJ4nenQ5vHSbbN7sucTdhEzfgg2saZrWEGS2HojVrwfPcK2SKSa
	CH2TRTJBuFxSZFcNm7S+Zw7hvXVFiadFt2awmhHFGShjs5qCq8O12b56MW4kDGbRqqqI
	z8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Q1m0RUkVgkd9i6xSszDlUByPXn8ybYbhICSTaUne1YM=;
	b=OLOboKlYFmJwZti6uGnimAJ2OlW5scpGekFTAptOGEUtk6DERAOnvRrLPUDN7PcMbo
	qdndZkfzFFx5WShndVfgYEn1M6J6Ffzr0cWil/XPMnbYyhwOyFw0pfnKhFEgK89krNxw
	FqGLMgRuom+s2qsBPceyZnYtBf4/t4LxZvREChr5mVoFDVa+GEus+VGACuJxM1T65vtg
	blWbrWZPYkJTfkcg3/DeAg3mfN0uCrUXibAx5rxcE5I47S1gQEQb6qA5nfvfjOFkdgvO
	+Ed4HOPERaxPNBqfFiDqvHf06XiFILLru676gPPMGienHAednQVryV0Yz2lg3NW5dEI0
	ZZWQ==
X-Gm-Message-State: AJcUukeyXpmSZOZ86S9VVX2mYhSq5hkApyjo6KkNLQXLOuK8jP7XKxDT
	mQEz7qpn4+w9Kmjc1ydmgYI40ycx
X-Google-Smtp-Source: ALg8bN7bi1YHZC+cgZaW5IXTy7lKMN4qgWbdJqXieUvewIjKquBImomdQ1k7pqm9UzX+59EyfIlwmQ==
X-Received: by 2002:adf:e891:: with SMTP id d17mr31907356wrm.140.1548845990936;
	Wed, 30 Jan 2019 02:59:50 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.02.59.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 02:59:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:24 +0100
Message-Id: <810615f94f5c4c97e79e43be7924a981a1fe9d92.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 01/20] gtk+3: enable native/nativesdk variant
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
X-List-Received-Date: Wed, 30 Jan 2019 10:59:51 -0000

Host-assisted GL in Qemu in theory works with both SDL
and GTK; in practice SDL shows an empty screen. This
prepares the switchover of graphical qemu to use
native gtk, which also provides a neat set of menus to
control the emulator.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 1b0829de075..0b5fffb752f 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -12,6 +12,10 @@ LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
 inherit autotools gettext pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check gobject-introspection
 
+BBCLASSEXTEND = "native nativesdk"
+
+GSETTINGS_PACKAGE_class-native = ""
+
 # versions >= 3.90 are development versions, otherwise like upstream-version-is-even
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>3\.([1-8]?[02468])+(\.\d+)+)\.tar"
 
@@ -51,14 +55,27 @@ PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
 PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/mesa wayland-native"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
 
-do_install_append() {
-	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
+prepare_gtk_scripts() {
+    mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
 
     # duplicate gtk-query-immodules for post install script update_gtk_immodules_cache
     mkdir -p ${D}${libexecdir}
     ln ${D}${bindir}/gtk-query-immodules-3.0 ${D}${libexecdir}/${MLPREFIX}gtk-query-immodules-3.0
 }
 
+do_install_append_class-target() {
+    prepare_gtk_scripts
+}
+
+do_install_append_class-nativesdk() {
+    prepare_gtk_scripts
+}
+
+do_install_append_class-native() {
+    # provided by gtk-icon-utils-native
+    rm ${D}${bindir}/gtk-encode-symbolic-svg
+}
+
 PACKAGES =+ "${PN}-demo"
 LIBV = "3.0.0"
 
@@ -104,6 +121,10 @@ GTKBASE_RRECOMMENDS ?= "liberation-fonts \
                         shared-mime-info \
                         adwaita-icon-theme-symbolic \
                         "
+
+GTKBASE_RRECOMMENDS_class-native ?= "\
+                        "
+
 GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
 
 RRECOMMENDS_${PN} = "${GTKBASE_RRECOMMENDS}"
-- 
2.17.1


