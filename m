Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.11119.1632141987001227952
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=egXbdmIk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id t8so29319231wrq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=js9cXNMJLNOid+SoaWCsIc0SZtZu1oE2LRMIuQQ/kU4=;
        b=egXbdmIkb9mua2XFHKkMS4VR62EvxfoJs3KRgGTew2e3DdYYB1g8Vwt4nSsg/YU7vB
         CwLYn1jh0n/XysrguobFwJNZiY9Rm+vdGebOku2SRdXwWHMfIYtrUOCxRIwjOU96HZa0
         thUDDeO5Jm7BEWrHPkMpY+kXaXFvxLkaJ3DEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=js9cXNMJLNOid+SoaWCsIc0SZtZu1oE2LRMIuQQ/kU4=;
        b=i9Jfz609EfOPMfiEWzNthyGQ6uzjDFxZnZ5RpSXtpLkemZd4EDS1NBfwN1dUvmFm3D
         Sq3yk9c16bSOtAsXK2d+GrsEINWllgyWmav8zrG04279k2JTtFYsVxQlYG0KcKbb9byf
         R++zAaR+/U2hihOiWmrhrmb2ggJc6+sPkNqOICiuKLpw+ZSDD++pBDXsPDwt8GSGcrun
         T7DptahwnVZ7BP2Re+CyoTvOotUQNr0EM9hfglxj1Uy4MGG5MeDd6fxON+HtgKF+AJ65
         O3DOaIibFIdpg34eC+lUnn6pTZ3XvS0ertIr4qUcxWHIsdeJNM9xGLtDH8PvPKodbcl7
         O41A==
X-Gm-Message-State: AOAM532iuRy+OTvOz10AWrqvo2tLl+9aSvciigB/9DDyEu2MQFWmFLlS
	Lyb1ckr4Iv05KjtZtYH6zTwrv9eFXs23VSvE
X-Google-Smtp-Source: ABdhPJwsu9ysOLMOHbE2/+3jQ0y5ZQjLYoyISoGfnXP4WSTnnngE7OKggfo/1f153fK7dk5PytU9dQ==
X-Received: by 2002:a05:6000:184c:: with SMTP id c12mr1211459wri.165.1632141985424;
        Mon, 20 Sep 2021 05:46:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id j21sm15773514wrd.48.2021.09.20.05.46.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:46:24 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/14] recipes: Add missing pkgconfig inherit
Date: Mon, 20 Sep 2021 13:46:11 +0100
Message-Id: <20210920124621.1576702-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various recipes were missing a pkgconfig inherit or pkgconfig-native
dependency despite using pkgconfig.

Add the inherit to igt-gpu-tools/gdb/libmodulemd/libwpe/xwayland/waffle
shaderc/iputils/wpebackend-fdo/lttng-ust.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc         | 1 +
 meta/recipes-devtools/gdb/gdb.inc                        | 2 +-
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb     | 2 +-
 meta/recipes-extended/iputils/iputils_20210722.bb        | 2 +-
 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb | 2 +-
 meta/recipes-graphics/shaderc/shaderc_2021.1.bb          | 2 +-
 meta/recipes-graphics/waffle/waffle_1.6.1.bb             | 2 +-
 meta/recipes-graphics/xwayland/xwayland_21.1.2.bb        | 2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb            | 2 +-
 meta/recipes-sato/webkit/libwpe_1.10.1.bb                | 2 +-
 meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb        | 2 +-
 11 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 670534fb5f0..dfacba29a01 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -1,5 +1,6 @@
 inherit cross-canadian
 inherit python3-dir
+inherit pkgconfig
 
 SUMMARY = "GNU debugger (cross-canadian gdb for ${TARGET_ARCH} target)"
 PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 2b0ae1655f6..2c95ed3ca0f 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -1,6 +1,6 @@
 require gdb-common.inc
 
-inherit gettext
+inherit gettext pkgconfig
 
 #LDFLAGS:append = " -s"
 #export CFLAGS:append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 963e881d6c1..ee8ce4d6a67 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -11,7 +11,7 @@ SRCREV = "1a032da198333ee77bdbe4be65e60eb4115ea73f"
 
 S = "${WORKDIR}/git"
 
-inherit meson gobject-introspection
+inherit meson gobject-introspection pkgconfig
 
 EXTRA_OEMESON = "-Dwith_py3=false -Dwith_docs=false -Drpmio=disabled -Dlibmagic=disabled -Dwith_manpages=disabled -Dgobject_overrides_dir_py3=${PYTHON_SITEPACKAGES_DIR}/gi/overrides"
 
diff --git a/meta/recipes-extended/iputils/iputils_20210722.bb b/meta/recipes-extended/iputils/iputils_20210722.bb
index a9821e556f0..e1940b77b5a 100644
--- a/meta/recipes-extended/iputils/iputils_20210722.bb
+++ b/meta/recipes-extended/iputils/iputils_20210722.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG[tftpd] = "-DBUILD_TFTPD=true, -DBUILD_TFTPD=false,"
 PACKAGECONFIG[traceroute6] = "-DBUILD_TRACEROUTE6=true,-DBUILD_TRACEROUTE6=false,"
 PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MANS=false -DBUILD_MANS=false, libxslt"
 
-inherit meson systemd update-alternatives
+inherit meson systemd update-alternatives pkgconfig
 
 EXTRA_OEMESON += "--prefix=${root_prefix}/ -DSKIP_TESTS=true"
 
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index 79fab7a28a5..1a00eca7d3a 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=67bfee4df38fa6ecbe3a675c552d4c08"
 
 LICENSE = "MIT"
 
-inherit meson
+inherit meson pkgconfig
 
 SRCREV = "203def046b466fb2da67f9f15552d84e1c0b41f2"
 PV = "1.26"
diff --git a/meta/recipes-graphics/shaderc/shaderc_2021.1.bb b/meta/recipes-graphics/shaderc/shaderc_2021.1.bb
index e15b5794ee7..ad3f62ce17d 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2021.1.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2021.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
-inherit cmake python3native
+inherit cmake python3native pkgconfig
 
 DEPENDS = "spirv-headers spirv-tools glslang"
 
diff --git a/meta/recipes-graphics/waffle/waffle_1.6.1.bb b/meta/recipes-graphics/waffle/waffle_1.6.1.bb
index fa5efc12c45..395494018a5 100644
--- a/meta/recipes-graphics/waffle/waffle_1.6.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.6.1.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "31565649ff0e2d8dff1b8f7f2264ab7a78452063c7e04adfc4ce03e64b
 
 UPSTREAM_CHECK_URI = "http://www.waffle-gl.org/releases.html"
 
-inherit meson features_check lib_package bash-completion
+inherit meson features_check lib_package bash-completion pkgconfig
 
 DEPENDS:append = " python3"
 
diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.2.bb b/meta/recipes-graphics/xwayland/xwayland_21.1.2.bb
index 3df6fd1ff90..6aba65935bf 100644
--- a/meta/recipes-graphics/xwayland/xwayland_21.1.2.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_21.1.2.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "b81cbdd5ad60b8b7ad8c3ecc7ec2a28c9bf021448670735cebb501f08b
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-inherit meson features_check
+inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy"
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb
index 2074b8c3186..3b0e205ab86 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb
@@ -11,7 +11,7 @@ PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
 "
 
-inherit autotools lib_package manpages python3native
+inherit autotools lib_package manpages python3native pkgconfig
 
 include lttng-platforms.inc
 
diff --git a/meta/recipes-sato/webkit/libwpe_1.10.1.bb b/meta/recipes-sato/webkit/libwpe_1.10.1.bb
index 4e77481bc8f..68214ffbad0 100644
--- a/meta/recipes-sato/webkit/libwpe_1.10.1.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.10.1.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=371a616eb4903c6cb79e9893a5f615cc"
 DEPENDS = "virtual/egl libxkbcommon"
 
-inherit cmake features_check
+inherit cmake features_check pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
index 29ffb9091fe..f2d640f07a5 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "glib-2.0 libxkbcommon wayland virtual/egl libwpe libepoxy"
 
 DEPENDS:append:class-target = " wayland-native"
 
-inherit meson features_check
+inherit meson features_check pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-- 
2.32.0

