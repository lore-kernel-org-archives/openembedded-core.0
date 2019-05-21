Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A38927D672
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 09:00:46 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id i3so2073042wml.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 02:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=583AUgwzhIOUV3CBGX0Xyh3vZ1j+80slesM8Vef5F7A=;
	b=fx+G1t1aJXs3PYhrtYBqdtsAAmsG88gr2b0qQRbhZw38TQMK7KgULMuKs+4tu2HAJQ
	nbd6LSeaTYb4FO1dkWcJphnSvYHKeokBGe2KQ3nZwmZ/u+EoNfAQFMZFYa7jiYqnTmoe
	sJveUDVKQeioCrz1dltfFvCZhUbSrzxlIl7f3I93cdX383R7lkCA82x1ysPmyi48ToWA
	epVR2S3UqzFLvCNbNKLVp1cC0uJ/EAUHCpKUvXgPlFQixMtLuADLFgYKzszn1MCZiQf1
	BybwHykrU2saToSNLOcO05gt+moYlaahigUogd5vsgaSbzml25Mfe7hUIb1uk8DY/oKf
	q9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=583AUgwzhIOUV3CBGX0Xyh3vZ1j+80slesM8Vef5F7A=;
	b=DeKOpXjnmQchSnfXPoTujQuE2b3FEKaEdkBIBXtcVCNtsqVZ2GtasW7Y320EL9XqDg
	D5ZRB6OZue8BS4bt/rXbETNjakPQs5ceknKoAkhFDJvZOpjc1K9XlSL/8vGkcG5Te9QS
	WISuxhpYhuBjNIQgVhmtX26f0cvrIPniufFNTQz7COL9z++eNmTbMOwcacdfm/kUcYus
	Ds93k0TKSrO14QoFiiIcMAvZBi+ygUTOUZMEzDeixkdcbIMWSIsq7qd26CoLuRKncIna
	7od0kwTI3gHPaKzDoRxMZuY7d/8e97e358Id+iWgoEJYjrQ6NBaTFodVoBjWmWReXBYx
	lJpw==
X-Gm-Message-State: APjAAAV37OA3cmZBW5O7Tq8TwP7EKQpfDfRem/jXS03ixSy9YDbQoRbI
	I15Gk8b+GnCuQRVF+fmtK7/aV/U/
X-Google-Smtp-Source: APXvYqwd0hB7xByJjAxjIk5B6fHlbF/ekYZ6xEHC8UmgA4rYCM2TTGO5P61YvrWGeP6BZnarq6tMEw==
X-Received: by 2002:a1c:6a17:: with SMTP id f23mr2378210wmc.94.1558429246634; 
	Tue, 21 May 2019 02:00:46 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	f20sm2194838wmh.22.2019.05.21.02.00.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 02:00:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 11:00:31 +0200
Message-Id: <20190521090032.14859-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] gsettings-desktop-schemas: upgrade 3.28.1 -> 3.32.0
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
X-List-Received-Date: Tue, 21 May 2019 09:00:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build with meson
* dependency intltool-native can go - they moved gettext only translation
* put gnome inherits together

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...gir-installation-for-cross-compiling.patch | 33 +++++++++++++++++++
 ...bb => gsettings-desktop-schemas_3.32.0.bb} | 11 ++++---
 2 files changed, 40 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas/0001-Do-not-skip-gir-installation-for-cross-compiling.patch
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.28.1.bb => gsettings-desktop-schemas_3.32.0.bb} (43%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas/0001-Do-not-skip-gir-installation-for-cross-compiling.patch b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas/0001-Do-not-skip-gir-installation-for-cross-compiling.patch
new file mode 100644
index 0000000000..c481b18f1c
--- /dev/null
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas/0001-Do-not-skip-gir-installation-for-cross-compiling.patch
@@ -0,0 +1,33 @@
+From 42e58c4c3e95a4a78ee8294f9b3901726bbbabe4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 11 May 2019 00:21:11 +0200
+Subject: [PATCH] Do not skip gir installation for cross compiling
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We are cool and can handle cross gobject-introspection.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ headers/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/headers/meson.build b/headers/meson.build
+index 3ce8b61..1132695 100644
+--- a/headers/meson.build
++++ b/headers/meson.build
+@@ -19,7 +19,7 @@ enums_xml = custom_target(
+   install: true,
+   install_dir: schemasdir)
+ 
+-if not meson.is_cross_build() and get_option('introspection')
++if get_option('introspection')
+   noinst_lib = shared_library('noinst',
+                               headers,
+                               install: false)
+-- 
+2.20.1
+
diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.1.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
similarity index 43%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.1.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
index 693c109d83..859f70466b 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.1.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
@@ -5,9 +5,12 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "glib-2.0 intltool-native"
+DEPENDS = "glib-2.0"
 
-inherit gnomebase gsettings gettext gobject-introspection upstream-version-is-even
+GNOMEBASEBUILDCLASS = "meson"
 
-SRC_URI[archive.md5sum] = "83bb19d025f126fae495ab43a2f26f40"
-SRC_URI[archive.sha256sum] = "f88ea6849ffe897c51cfeca5e45c3890010c82c58be2aee18b01349648e5502f"
+inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even
+
+SRC_URI[archive.md5sum] = "0c2d468a482c12594757442c983aa8ea"
+SRC_URI[archive.sha256sum] = "2d59b4b3a548859dfae46314ee4666787a00d5c82db382e97df7aa9d0e310a35"
+SRC_URI += "file://0001-Do-not-skip-gir-installation-for-cross-compiling.patch"
-- 
2.20.1


