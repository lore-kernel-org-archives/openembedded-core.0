Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5527FC08
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 11:26:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47sVSS6SfKz4H;
	Tue,  7 Jan 2020 12:26:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1578396378;
	bh=N92E+bZusy7x0182SkBRGFaFJBQgFTAJxRVLprF9fHw=;
	h=From:To:Cc:Subject:Date:From;
	b=Lp2Z/doEGNcyhSVprZeCmU0Bkr7LKi2h+Mh5T4C4wf3H9E81AogWdUtcHUUYIhu3w
	1hoSz/Qp1ltpinXsvv+GI4BwZpgKVCcTPYpRUfU0+BrLzpAQm1OWn4BycmEqscr0cc
	uWwuIT+gjD80Nma+vOMv8v1P1BxHh3XeEBAe04ECaaj5lTzIM8CEDsfQ7YM5GjgT8U
	I0/8Hm01h3KFcd+fv86b2XQctR1f9StNL0OQBgQlC+wjxuapA5TRSHD7f5dkKSfkPZ
	XWig0VqhRuOeiRNB6l0y/YV1jg00bbRRn4nRKeWH8v/3xpGDe4/LYxRCjCSe7u2aP/
	Mtur1cRafTMaMbio/cnDFikawhW7x6o0FTjK8eki3nr4QIpjOcXGksAXDGUXR9t/Ws
	DVxAWRCb9SxuZZGBtS2NALbsMJexs4kXYVc536ygOHLmOc/8LdZQdB36vVKw+XxMw6
	F/MbwjCoiIemzwU31LRAcOhcQFk2FJc/cKCBRX7XeORhYbEC0if+1umMg7U22v0AT9
	e3d24ROHVgXsBwqEedgPMP5TBrrwu6mlRDh+R1dWpZ6z2TQbcg5X2kA9ryzb4hN9aC
	1nzzWxoW/7rVROvIapKDPAxmVt1c/tO2XxNtBQMZENakZ3fGRs4+T2Yj97Vf5Okum1
	qEROHxQlLBujpMFCAml4fdEI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jan 2020 13:26:15 +0200
Message-Id: <20200107112615.7397-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] enchant: Replace with enchant2 from meta-oe
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
X-List-Received-Date: Tue, 07 Jan 2020 11:26:20 -0000

webkitgtk does now support the new version.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/recipes-sato/webkit/webkitgtk_2.26.2.bb  |  2 +-
 .../recipes-support/enchant/enchant2_2.2.7.bb | 28 +++++++++++++++
 meta/recipes-support/enchant/enchant_1.6.0.bb | 34 -------------------
 4 files changed, 30 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-support/enchant/enchant2_2.2.7.bb
 delete mode 100644 meta/recipes-support/enchant/enchant_1.6.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 39eee9475c..dc78576ba4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -167,7 +167,7 @@ RECIPE_MAINTAINER_pn-efivar = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-efibootmgr = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-ell = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-enchant = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-enchant2 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ethtool = "Changhyeok Bae <changhyeok.bae@gmail.com>"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
index fa424f606f..bf4697ded7 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
@@ -47,7 +47,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'waylan
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland"
 PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11"
 PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
-PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant"
+PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
 PACKAGECONFIG[gtk2] = "-DENABLE_PLUGIN_PROCESS_GTK2=ON,-DENABLE_PLUGIN_PROCESS_GTK2=OFF,gtk+"
 PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
 PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
diff --git a/meta/recipes-support/enchant/enchant2_2.2.7.bb b/meta/recipes-support/enchant/enchant2_2.2.7.bb
new file mode 100644
index 0000000000..bdfd738487
--- /dev/null
+++ b/meta/recipes-support/enchant/enchant2_2.2.7.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Enchant Spell checker API Library"
+SECTION = "libs"
+HOMEPAGE = "https://abiword.github.io/enchant/"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7"
+
+DEPENDS = "glib-2.0"
+
+inherit autotools pkgconfig
+
+SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
+SRC_URI[md5sum] = "8a6ea1bb143c64e0edf5e49c7e7cb984"
+SRC_URI[sha256sum] = "1b22976135812b35cb5b8d21a53ad11d5e7c1426c93f51e7a314a2a42cab3a09"
+
+UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
+
+S = "${WORKDIR}/enchant-${PV}"
+
+EXTRA_OEMAKE = "pkgdatadir=${datadir}/enchant-2"
+
+PACKAGECONFIG ??= "aspell"
+PACKAGECONFIG[aspell]  = "--with-aspell,--without-aspell,aspell,aspell"
+PACKAGECONFIG[hunspell]  = "--with-hunspell,--without-hunspell,hunspell,hunspell"
+
+FILES_${PN} += " \
+    ${datadir}/enchant-2 \
+    ${libdir}/enchant-2 \
+"
diff --git a/meta/recipes-support/enchant/enchant_1.6.0.bb b/meta/recipes-support/enchant/enchant_1.6.0.bb
deleted file mode 100644
index 44eb2e3df4..0000000000
--- a/meta/recipes-support/enchant/enchant_1.6.0.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "Enchant Spell checker API Library"
-SECTION = "libs"
-HOMEPAGE = "http://www.abisource.com/projects/enchant/"
-BUGTRACKER = "http://bugzilla.abisource.com/enter_bug.cgi?product=Enchant"
-
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=dfcbabf9131dc9a95febef6753a2958b \
-                    file://src/enchant.h;beginline=1;endline=29;md5=8d881caa1d37523567e1d8f726675a18"
-
-DEPENDS = "glib-2.0"
-
-inherit autotools pkgconfig
-
-PR = "r3"
-
-SRC_URI = "http://www.abisource.com/downloads/enchant/${PV}/enchant-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "de11011aff801dc61042828041fb59c7"
-SRC_URI[sha256sum] = "2fac9e7be7e9424b2c5570d8affe568db39f7572c10ed48d4e13cddf03f7097f"
-
-PACKAGECONFIG ??= "aspell"
-PACKAGECONFIG[aspell]  = " --with-aspell-prefix=${STAGING_DIR_HOST}${prefix}  --enable-aspell,  --disable-aspell,  aspell,  aspell"
-PACKAGECONFIG[ispell]  = " --with-ispell-prefix=${STAGING_DIR_HOST}${prefix}  --enable-ispell,  --disable-ispell,  ispell,  ispell"
-PACKAGECONFIG[uspell]  = " --with-uspell-prefix=${STAGING_DIR_HOST}${prefix}  --enable-uspell,  --disable-uspell,  uspell,  uspell"
-PACKAGECONFIG[hspell]  = " --with-hspell-prefix=${STAGING_DIR_HOST}${prefix}  --enable-hspell,  --disable-hspell,  hspell,  hspell"
-PACKAGECONFIG[myspell] = "--with-myspell-prefix=${STAGING_DIR_HOST}${prefix} --enable-myspell, --disable-myspell, myspell, myspell"
-
-EXTRA_OECONF = "br_cv_binreloc=no"
-
-export CXXFLAGS += " -L${STAGING_LIBDIR} -lstdc++ "
-
-FILES_${PN} = "${bindir} ${libdir}/*${SOLIBS} ${datadir}/${BPN} ${libdir}/${BPN}/*.so"
-FILES_${PN}-dev += "${libdir}/${BPN}/*{SOLIBSDEV} ${libdir}/${BPN}/*.la"
-FILES_${PN}-staticdev += "${libdir}/${BPN}/*.a"
-- 
2.17.1


