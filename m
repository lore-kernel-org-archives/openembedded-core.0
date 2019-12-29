Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5CFA67F8A9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:41 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a6so13075657plm.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wqtdATYeQlCjy+o4Z/lA9ZB3cCcB29TcYwIgurG5psk=;
	b=kX4rk9khLp/AjxBkswXK2dXfxVndqrXcpEsXd5Nrt7mxF8+Mpt5t8jQRVC9DZ9R8KC
	cpJfY29iKFhSb3iD3nwppEfqwSV6Xb0s8RnTGYN8HCNW87vK6ZLY87MBzPtdAUTJg8UX
	DQnQz70SL1e0ckTCEMkJyF2yA5ta2wbdbheMxtks578vkvqGZPRMJwOZEac2UcGaFWnS
	34gKehAqKVTUFmJeI9fzyI6X365fmGTMt4nfx7sAiYbH9XAeZyRgonXLlm5PcBtabJYE
	s6k6eudfwtXCzwiqOLUdlOpwWeGZ0qV0FPmTKUYTDpzNoUL7mPHyRiiyf+Ih9aPOv5J9
	o6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wqtdATYeQlCjy+o4Z/lA9ZB3cCcB29TcYwIgurG5psk=;
	b=ej8kHuGp4Y2QghRK22FO/yTktcnu0uqwsFhiGu2McQnBmPh8t81CjWbEAng8Soz4wN
	AuJxRBy8dZKBWTR3+yXOEv5DKFNjbJ2t90vDZPL/rK7wKET9Ks//Q+46vcbKsZUnS36R
	Par7b14Zy3qzly8BkEzIQ482F1TO9XcHSrTD6g7BDDxo6/3xwb3sTVdoowMOZMbtPAat
	U/LU2XY/07tsh3Gi7VFaebeWQ7QBJRa5W3vyakjN/pcI1V9sBOwEiZZzvfk0gBzhtLdD
	W+xui3MmAAYjTkYQuzygBYa5N/+ac/MK5BKV5G2oqv5/3v7F7e2G36yRundKR1nGyftm
	p4Lw==
X-Gm-Message-State: APjAAAWF1cqPlGQTBLIqTguBw30Hsjg/rzCIb2yBENmSm0EonnwlGiG5
	sTA5sCxXz0t+139J2IPxHhDg6DScGQE=
X-Google-Smtp-Source: APXvYqw6mg5ljYxMX0xqwWyWmJ79l7cuBaXWiRS6N1TdUw9vrk9pga6brE8WZNnUvUTx79K99eN9SA==
X-Received: by 2002:a17:90a:8a8f:: with SMTP id
	x15mr41912783pjn.87.1577645082090; 
	Sun, 29 Dec 2019 10:44:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:13 -0800
Message-Id: <20191229184415.19514-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 17/19] recipes: Use -fcommon explicitly
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:41 -0000
Content-Transfer-Encoding: 8bit

This is needed with gcc 10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/iproute2/iproute2_5.3.0.bb      | 2 +-
 meta/recipes-connectivity/socat/socat_1.7.3.3.bb          | 2 ++
 meta/recipes-core/libxcrypt/libxcrypt.inc                 | 2 ++
 meta/recipes-devtools/llvm/llvm_git.bb                    | 2 ++
 meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb          | 2 ++
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb    | 2 ++
 meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb      | 2 ++
 meta/recipes-graphics/mesa/mesa_19.2.4.bb                 | 2 ++
 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb | 2 ++
 meta/recipes-support/atk/at-spi2-atk_2.32.0.bb            | 2 ++
 meta/recipes-support/gdbm/gdbm_1.18.1.bb                  | 2 ++
 11 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.3.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.3.0.bb
index 8a86cbf78c..75772d4696 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.3.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.3.0.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "cb1c1e45993a3bd2438543fd4332d70f1726a6e6ff97dc613a8258c993
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS}'"
+EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS} -fcommon'"
diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.3.bb b/meta/recipes-connectivity/socat/socat_1.7.3.3.bb
index 1dbbe5cd55..ee01578c1a 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.3.bb
@@ -44,6 +44,8 @@ PACKAGECONFIG ??= "readline"
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 
+CFLAGS += "-fcommon"
+
 do_install_prepend () {
     mkdir -p ${D}${bindir}
     install -d ${D}${bindir} ${D}${mandir}/man1
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 6d6990c3d5..accbdd6361 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -27,6 +27,8 @@ BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS_append_class-nativesdk = " -Wno-error"
 
+CFLAGS += "-fcommon"
+
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
 
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index a84e4d21b6..59ab181a73 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -90,6 +90,8 @@ EXTRA_OECMAKE_append_class-nativesdk = "\
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
                  "
 
+CFLAGS += "-fcommon"
+
 do_configure_prepend() {
 # Fix paths in llvm-config
 	sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
index a02e35d19a..53ed5e81f7 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
@@ -21,6 +21,8 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-gssapi"
 
+CFLAGS += "-fcommon"
+
 do_install_append() {
 	chown root:root ${D}${sysconfdir}/netconfig
 }
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
index b9961c398c..675ee40fa4 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
@@ -21,6 +21,8 @@ inherit autotools pkgconfig features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
+CFLAGS += "-fcommon"
+
 FILES_${PN} = "${bindir}/* \
                ${datadir}/matchbox \
                ${sysconfdir}/matchbox \
diff --git a/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
index ddbbd94066..7a11228ef0 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
@@ -16,3 +16,5 @@ SRC_URI[sha256sum] = "ed02eb459dcb398f69b9fa5bf4dd813020405afc84331115469cdf7be9
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lxde/files/menu-cache/1.1/"
 
 inherit autotools gettext pkgconfig gtk-doc
+
+CFLAGS += "-fcommon"
diff --git a/meta/recipes-graphics/mesa/mesa_19.2.4.bb b/meta/recipes-graphics/mesa/mesa_19.2.4.bb
index 46ecee3a73..115663b066 100644
--- a/meta/recipes-graphics/mesa/mesa_19.2.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.2.4.bb
@@ -13,6 +13,8 @@ SRC_URI[sha256sum] = "09000a0f7dbbd82e193b81a8f1bf0c118eab7ca975c0329181968596e5
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
+CFLAGS += "-fcommon"
+
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb
index 9218b4f69d..a1cd490394 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb
@@ -8,6 +8,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
 SRC_URI[md5sum] = "a98170084f2c8fed480d2ff601f8a14b"
 SRC_URI[sha256sum] = "6316146304e6e8a36d5904987ae2917b5d5b195dc9fc63d67f7aca137e5a51d1"
 
+CFLAGS += "-fcommon"
+
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
 
diff --git a/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
index d3a9de1e41..b717a9c7f7 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
@@ -17,3 +17,5 @@ FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
 FILES_${PN}-gtk2 = "${libdir}/gtk-2.0/modules/libatk-bridge.*"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CFLAGS += "-fcommon"
diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
index 16ecc506ce..7e2efe3c9b 100644
--- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
@@ -23,6 +23,8 @@ CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
 
 BBCLASSEXTEND = "native nativesdk"
 
+CFLAGS += "-fcommon"
+
 do_install_append () {
     # Create a symlink to ndbm.h and gdbm.h in include/gdbm to let other packages to find
     # these headers
-- 
2.24.1


