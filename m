Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C4E057E024
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:18 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c77so6288208wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KkU8lfxkxrSP5NuHR4IGraT9N7Pg0akt90ikeKg92rg=;
	b=MlEsryHZGLm7+fQxQTJXCFkT99LUXO4CwEE7BKVUdql17Gfxf8CxLY2xjSzu/OQYSo
	vaqqnUoNYPR2uB26AbF/aMYVOx9dS0JtOsvnadndm1RpCxN12gPUc/8jKrkhefWBCu1V
	kTQLezoNwRoVD9jli+8ax9qYTVph+pugiVnE1PU0pA+hB/HBm7tf6tLyhyZSwb61bpJd
	2Qy19iJWpVr8pb/qLLUNfjIO97DMSxm2hajKC84CPUT11wkggDj0Ph4iIKI33o7TGkDV
	AQbI62Lg658booRl2XcWKZYfxDYXU2wn0U0Wh/a0zyun1zSE5iXG3d+TaBVSOqFJqA5F
	49jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KkU8lfxkxrSP5NuHR4IGraT9N7Pg0akt90ikeKg92rg=;
	b=rEDLNMz3oAchkT8Zz4ylQ69ABlyHO2/aTkb/TgeKzq+TFK7J1Fclt/i7OVMoVbf13E
	mcuD+54NCJntniVQb1YKleiXNpW/J7JH3u8Wjas02kMF8gvVssGjMPLifbXNgeaRzYkq
	0t5Cbn5msznd0LaBghW9pSJZUZFA1g7BFQMUwEIHpfEtlMyxnwLpAzjw2r7XU79u/WeO
	sUE8JQo1ZOeG79DYheAj1Xlt4CdkkXoXYfiHzZYr3oElQE+uzBEOK/zBwsMciLrr3RDg
	UrxCj38cWMRPHyzJz04/m6Ldwu/dvduRWtE2zW4Qnj/kffn6b+fBIoXKnaZnfOHPeB8H
	y3TQ==
X-Gm-Message-State: APjAAAWvfSeQXyARgHCgE4ySaRs1rLBpQNAmFQDRjp3OQ1v3R5fXE9G1
	WnP4sxFQpMnln8QSsg3qPcpnnyao
X-Google-Smtp-Source: APXvYqwPOqrbKtgr3/ZVH0zDRFMrPRpZpysQzzhgZy3uSfZ2+43ry/ZoLcMvluOUA9gANSdo1usy+A==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr3045358wmh.14.1558116739465;
	Fri, 17 May 2019 11:12:19 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:38 +0200
Message-Id: <20190517181151.44001-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Cc: Upgrade Helper <auh@auh.yoctoproject.org>
Subject: [PATCH 24/37] at-spi2-core: upgrade 2.30.0 -> 2.32.1
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
X-List-Received-Date: Fri, 17 May 2019 18:12:19 -0000

From: Upgrade Helper <auh@auh.yoctoproject.org>

---
 .../atk/at-spi2-core/meson-0.50-fix.patch     | 31 -------------------
 ...-core_2.30.0.bb => at-spi2-core_2.32.1.bb} | 12 +++----
 2 files changed, 5 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-support/atk/at-spi2-core/meson-0.50-fix.patch
 rename meta/recipes-support/atk/{at-spi2-core_2.30.0.bb => at-spi2-core_2.32.1.bb} (79%)

diff --git a/meta/recipes-support/atk/at-spi2-core/meson-0.50-fix.patch b/meta/recipes-support/atk/at-spi2-core/meson-0.50-fix.patch
deleted file mode 100644
index fbdf7d0e2ea..00000000000
--- a/meta/recipes-support/atk/at-spi2-core/meson-0.50-fix.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 44a812ea51223d82f21a098a2d45fcc5c329ce7a Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Tue, 12 Mar 2019 11:46:24 +0100
-Subject: [PATCH] Fix meson.build for meson 0.50.0.
-
-Since meson 0.50.0 it is not possible anymore to specify an
-absolute directory for subdir. To keep current functionality,
-use install_dir instead.
-
-atspi/meson.build:60:0: ERROR: Subdir keyword must not be an absolute path.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
----
- atspi/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/atspi/meson.build b/atspi/meson.build
-index b7a9357..2a6915d 100644
---- a/atspi/meson.build
-+++ b/atspi/meson.build
-@@ -57,7 +57,7 @@ atspi_headers = [
- 
- atspi_includedir = join_paths(get_option('prefix'), get_option('includedir'), 'at-spi-2.0', 'atspi')
- 
--install_headers(atspi_headers, subdir: atspi_includedir)
-+install_headers(atspi_headers, install_dir: atspi_includedir)
- 
- atspi_enums = gnome.mkenums('atspi-enum-types',
-                             sources: [ 'atspi-constants.h', 'atspi-types.h' ],
diff --git a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb b/meta/recipes-support/atk/at-spi2-core_2.32.1.bb
similarity index 79%
rename from meta/recipes-support/atk/at-spi2-core_2.30.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.32.1.bb
index cfe0ddeef2d..0f84259d942 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.32.1.bb
@@ -5,12 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
-           file://meson-0.50-fix.patch \
-           "
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "d4f22c66b3210ffe6b10d01c04e008b5"
-SRC_URI[sha256sum] = "0175f5393d19da51f4c11462cba4ba6ef3fa042abf1611a70bdfed586b7bfb2b"
+SRC_URI[md5sum] = "998fd9d858f8fa22c4c8c15567bf6254"
+SRC_URI[sha256sum] = "3c2aa937ebfaca2c86569bce9b16a34fbe20d69ef0c58846313b1c42f53b0d53"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
@@ -22,9 +20,9 @@ inherit meson gtk-doc gettext systemd pkgconfig upstream-version-is-even gobject
 EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
                   -Ddbus_daemon=${bindir}/dbus-daemon"
 
-GTKDOC_MESON_OPTION = "enable_docs"
+GTKDOC_MESON_OPTION = "docs"
 
-GIR_MESON_OPTION = 'enable-introspection'
+GIR_MESON_OPTION = 'introspection'
 GIR_MESON_ENABLE_FLAG = 'yes'
 GIR_MESON_DISABLE_FLAG = 'no'
 
-- 
2.17.1


