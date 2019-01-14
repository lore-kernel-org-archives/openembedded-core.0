Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 86D1C7C03C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:25 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y139so9179614wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9Uqw9Yuqb7fA9OSq7w+rE5mCtcFtQRS+fyT3xEsmwmw=;
	b=vVkIj9ojxe/1U+KYt1QgsDyRpR7VRTNtVHHFkkXDs92c21BMLgFSB1F90PvKTqnOIy
	KcLjF1N2ODBXAn0tjTV4c9tWH3ZLaTvohMJau8U/5V7mL2S/STu3HenlvnN9v7RqRD7/
	djqLnVwou0hIRjSNpGk965Ji6ajpiFro2uWI+cCXf98gv4FHIz8g+LV3zv6xc+IIbOGH
	syoj5askApXwYfHf5DAtd0XCEwncK28qX4cUnGXPLL+Zjt4Dv9ByOxrSLhCl65kC8PIZ
	NL0iV6SgVQ8WujiaBctVH/FNjF8N1kShN90luGVsYYdGxrS3d9H2Xuq4fQZ4zl3JB66y
	T8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9Uqw9Yuqb7fA9OSq7w+rE5mCtcFtQRS+fyT3xEsmwmw=;
	b=skJWtxEDaWxiLfKzBWpvQYmW1x9zyq+r4UB86i9jd80a3TlpKur2h3gtv4pvnULm+Z
	Q4hedLfoiYpMEhrfnyY4BQZBq3+3f5RxMlJMcAzP7xrmTik2KZZtsdPk2uhr41jDwKYx
	yfq+XCZ0irNGGFpkg0u/DQvtvw93jciofuJTMVoozDt39j2BgaBVtm++k4plibzH7vYf
	0SiJzHLwosfykc3c7WHW31O2O69KeGNTVq6ltTuJ4cdJaqv5mbKpW9+zTGbTRyYGQRWH
	a0JDjGWAry2zpgAWWauQdhd0qLFcmxziuX+tnWPqP9F2uk2NbS/Qv8gQrHUvGiz6Rh/x
	kEzA==
X-Gm-Message-State: AJcUukcJEc/p4U2uKfmfES1Dpf865JUN+sDEbGYgsXGSpPlMb7vMUlKl
	wkbo3N8XtnLnlMdLPmL7b8kGpdf2
X-Google-Smtp-Source: ALg8bN4tki/sHzoiAa2Nc9atBhNqf6I+SBbhZULPhA28unnQgGW9DUL6Ozii1dSWhHCqXSvhBENyrw==
X-Received: by 2002:a1c:2884:: with SMTP id o126mr12667925wmo.17.1547478206067;
	Mon, 14 Jan 2019 07:03:26 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:02:57 +0100
Message-Id: <efbccd5c0602463770dca1c064e8fd7afc02933d.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 01/23] gtk+3: enable native/nativesdk variant
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:25 -0000

Host-assisted GL in Qemu in theory works with both SDL
and GTK; in practice SDL shows an empty screen. This
prepares the switchover of graphical qemu to use
native gtk, which also provides a neat set of menus to
control the emulator.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 519a9840f42..77e8cb33f94 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -12,6 +12,8 @@ LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
 inherit autotools gettext pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check gobject-introspection
 
+BBCLASSEXTEND = "native nativesdk"
+
 # versions >= 3.90 are development versions, otherwise like upstream-version-is-even
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>3\.([1-8]?[02468])+(\.\d+)+)\.tar"
 
@@ -59,6 +61,11 @@ do_install_append() {
     ln ${D}${bindir}/gtk-query-immodules-3.0 ${D}${libexecdir}/${MLPREFIX}gtk-query-immodules-3.0
 }
 
+do_install_append_class-native() {
+    # provided by gtk-icon-utils-native
+    rm ${D}${bindir}/gtk-encode-symbolic-svg
+}
+
 PACKAGES =+ "${PN}-demo"
 LIBV = "3.0.0"
 
@@ -104,6 +111,15 @@ GTKBASE_RRECOMMENDS ?= "liberation-fonts \
                         shared-mime-info \
                         adwaita-icon-theme-symbolic \
                         "
+
+GTKBASE_RRECOMMENDS_class-native ?= "\
+                        gdk-pixbuf-loader-png \
+                        gdk-pixbuf-loader-jpeg \
+                        gdk-pixbuf-loader-gif \
+                        gdk-pixbuf-loader-xpm \
+                        shared-mime-info \
+                        "
+
 GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
 
 RRECOMMENDS_${PN} = "${GTKBASE_RRECOMMENDS}"
-- 
2.17.1


