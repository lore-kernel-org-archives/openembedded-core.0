Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.26491.1592249776942104805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=v5hmIfFX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id i4so303326pjd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ef96f5PaH/S7XKgjfzz+tAT4dGXeJlHHhdoSMMiCfhI=;
        b=v5hmIfFXhFXpxxRfTp4RLP5t3wNLHutyydWh/u59306xXpoA5q7qnN5LfP2uogte99
         74awrHUjAnUzZC3Nbl7uaQHpUfCM0zCf0HXhF/nYObFALK8wiPWZOCWioGyAXigc3Gcu
         JhF8ZfDM4ZFp0btl2H1f4SPHr2IVy85MxMNPkaFZGNNsKGw+yJnmTSySVKDYAHa0vbfQ
         e3Wp8tT5HADyO9oVspSiOegeBKOh0H1ZkNcxH+q9tWn8j3/Kh6wpugbwQIxVt2Cn9R4j
         RSvN3AJZT3jdLoXHkRtp1tURqtAV+fjFH+bynihDXgLY1QjP1vvKWzJk8eX1NGC3zTh6
         kObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ef96f5PaH/S7XKgjfzz+tAT4dGXeJlHHhdoSMMiCfhI=;
        b=XpUdRyJJzqqOieKbVvY/SMr4zrbRcdldcO2CpjW9xOi6Khdf2DllWs0B2rG1ODlcdI
         z6wstNRJQyRnY3EVHpyI/ETu4KDDLPIO2RA8GbXcbvGWx9cqxWrFOlH0Vqh8N1ncjJ7K
         l7l3FBSShUnNun30Ab3g8LzwFr9h4O0iWljNXU06OR4U8g4LaK+ut1ci361vmFC3Cudo
         WlCAX9VhANnk6PVFzMK6NU/wtnw4tNr9178rW2mybo1TiTycgJijY/s2U5C6kBYjQal8
         4b8GrUcLeynEkVvp/+E2z+u5ZeK4c5ND84a18efKQjFJeJ1P8ctStNM0Q+ShBeniWRcP
         XmBw==
X-Gm-Message-State: AOAM531a+TulNafF1m7gH6makBzKYbvKNsFbd68qDLcO6YyjI4r9kpAI
	yFEYjjjYM+4zJJRZSBfc5ADJH3oQbZs=
X-Google-Smtp-Source: ABdhPJzjIarUUIGYb/6BCtZ8adSgREi/bxm7r520f4DWCAtvMkHNnbwXpJcjyJR43BPfpNygoqeDkw==
X-Received: by 2002:a17:902:8544:: with SMTP id d4mr18296024plo.234.1592249775652;
        Mon, 15 Jun 2020 12:36:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/21] maintainers: Update Ross' email address
Date: Mon, 15 Jun 2020 09:35:25 -1000
Message-Id: <5a16ed258e9da39c66874b3ee1e5b52a8ea2dae9.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update Ross' address to a valid one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 22e1605ce45482c49d06a7c56a46b71f76955e31)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 126 +++++++++++------------
 1 file changed, 63 insertions(+), 63 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index a429b70e9b..4570fac454 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -28,9 +28,9 @@
 # Please keep this list in alphabetical order.
 #
 RECIPE_MAINTAINER_pn-acl = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-acpica = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-acpid = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-adwaita-icon-theme = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-acpica = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-acpid = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-adwaita-icon-theme = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-alsa-lib = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-alsa-plugins = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-alsa-state = "Tanu Kaskinen <tanuk@iki.fi>"
@@ -96,15 +96,15 @@ RECIPE_MAINTAINER_pn-cantarell-fonts = "Alexander Kanavin <alex.kanavin@gmail.co
 RECIPE_MAINTAINER_pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER_pn-clutter-1.0 = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-clutter-gst-3.0 = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-clutter-gtk-1.0 = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-clutter-1.0 = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-clutter-gst-3.0 = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-clutter-gtk-1.0 = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-cmake = "Pascal Bach <pascal.bach@siemens.com>"
 RECIPE_MAINTAINER_pn-cmake-native = "Pascal Bach <pascal.bach@siemens.com>"
-RECIPE_MAINTAINER_pn-cogl-1.0 = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-cogl-1.0 = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-connman = "Changhyeok Bae <changhyeok.bae@gmail.com>"
-RECIPE_MAINTAINER_pn-connman-conf = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-connman-gnome = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-connman-conf = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-connman-gnome = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-consolekit = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-core-image-base = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-core-image-minimal = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -135,8 +135,8 @@ RECIPE_MAINTAINER_pn-cryptodev-module = "Robert Yang <liezhi.yang@windriver.com>
 RECIPE_MAINTAINER_pn-cryptodev-tests = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-cups = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-curl = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-cve-update-db-native = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-cwautomacros = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-cve-update-db-native = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-cwautomacros = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-db = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus-glib = "Chen Qi <Qi.Chen@windriver.com>"
@@ -164,8 +164,8 @@ RECIPE_MAINTAINER_pn-dtc = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-dwarfsrcfiles = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-e2fsprogs = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ed = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-efivar = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-efibootmgr = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-efivar = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-efibootmgr = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-ell = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-enchant2 = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -182,10 +182,10 @@ RECIPE_MAINTAINER_pn-flac = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-flex = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-font-alias = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-font-util = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-fontconfig = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-formfactor = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-freetype = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-fribidi = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-fontconfig = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-formfactor = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-freetype = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-fribidi = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-fts = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gawk = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-gcc = "Khem Raj <raj.khem@gmail.com>"
@@ -195,13 +195,13 @@ RECIPE_MAINTAINER_pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-source-9.3.0 = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gconf = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gdb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gdb-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gdbm = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-gdk-pixbuf = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-gdk-pixbuf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-gettext = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-gettext-minimal-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ghostscript = "Hongxu Jia <hongxu.jia@windriver.com>"
@@ -216,7 +216,7 @@ RECIPE_MAINTAINER_pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glide = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-gmp = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gnome-desktop-testing = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-gnome-desktop-testing = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-gnu-config = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-gnu-efi = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-gnupg = "Hongxu Jia <hongxu.jia@windriver.com>"
@@ -252,7 +252,7 @@ RECIPE_MAINTAINER_pn-gstreamer1.0-plugins-ugly = "Anuj Mittal <anuj.mittal@intel
 RECIPE_MAINTAINER_pn-gstreamer1.0-python = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-gstreamer1.0-rtsp-server = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-gstreamer1.0-vaapi = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-gtk+3 = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-gtk+3 = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-gtk-doc = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gzip = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-harfbuzz = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -335,17 +335,17 @@ RECIPE_MAINTAINER_pn-libgcc-initial = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libgcrypt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libgfortran = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libgloss = "Alejandro Hernandez <aehs29@gmail.com>"
-RECIPE_MAINTAINER_pn-libglu = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-libglu = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-libgpg-error = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER_pn-libgudev = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-libical = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-libgudev = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-libical = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-libice = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libid3tag = "Tanu Kaskinen <tanuk@iki.fi>"
-RECIPE_MAINTAINER_pn-libidn2 = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-libinput = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-libjitterentropy = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-libidn2 = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-libinput = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-libjitterentropy = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-libksba = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-libmatchbox = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-libmatchbox = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-libmnl = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmpc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmodule-build-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
@@ -449,7 +449,7 @@ RECIPE_MAINTAINER_pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-lsb-release = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER_pn-lsof = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-lsof = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-ltp = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-lttng-modules = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-lttng-tools = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -466,18 +466,18 @@ RECIPE_MAINTAINER_pn-makedevs = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-make-mod-scripts = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-man-db = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-man-pages = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER_pn-matchbox-config-gtk = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-matchbox-desktop = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-matchbox-keyboard = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-matchbox-panel-2 = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-matchbox-session = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-matchbox-session-sato = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-matchbox-terminal = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-matchbox-theme-sato = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-matchbox-wm = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-mc = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-mdadm = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-menu-cache = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-matchbox-config-gtk = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-matchbox-desktop = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-matchbox-keyboard = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-matchbox-panel-2 = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-matchbox-session = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-matchbox-session-sato = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-matchbox-terminal = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-matchbox-theme-sato = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-matchbox-wm = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-mc = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-mdadm = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-menu-cache = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-mesa = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-mesa-demos = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-mesa-gl = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
@@ -513,7 +513,7 @@ RECIPE_MAINTAINER_pn-nativesdk-buildtools-perl-dummy = "Richard Purdie <richard.
 RECIPE_MAINTAINER_pn-nativesdk-icecc-toolchain = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-nativesdk-libtool = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-nativesdk-meson = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-nativesdk-packagegroup-sdk-host = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-nativesdk-packagegroup-sdk-host = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-nativesdk-qemu-helper = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-nativesdk-sdk-provides-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-newlib = "Alejandro Hernandez <aehs29@gmail.com>"
@@ -527,7 +527,7 @@ RECIPE_MAINTAINER_pn-nfs-utils = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ninja = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-npth = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-nss-myhostname = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-ofono = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-ofono = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-opensbi = "Alistair Francis <alistair.francis@wdc.com>"
 RECIPE_MAINTAINER_pn-openssh = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-openssl = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -536,12 +536,12 @@ RECIPE_MAINTAINER_pn-opkg-arch-config = "Alejandro del Castillo <alejandro.delca
 RECIPE_MAINTAINER_pn-opkg-keyrings = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
 RECIPE_MAINTAINER_pn-opkg-utils = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
 RECIPE_MAINTAINER_pn-orc = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-os-release = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-os-release = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-ovmf = "Ricardo Neri <ricardo.neri-calderon@linux.intel.com>"
 RECIPE_MAINTAINER_pn-ovmf-shell-image = "Ricardo Neri <ricardo.neri-calderon@linux.intel.com>"
 RECIPE_MAINTAINER_pn-p11-kit = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-package-index = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-pango = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-package-index = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-pango = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-parted = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-patch = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-patchelf = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -550,13 +550,13 @@ RECIPE_MAINTAINER_pn-pciutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-pcmanfm = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-perl = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-piglit = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-piglit = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-pigz = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-pinentry = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-pixman = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-pkgconf = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-pkgconfig = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-pm-utils = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-pkgconf = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-pkgconfig = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-pm-utils = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-pointercal-xinput = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-pong-clock = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-popt = "Yi Zhao <yi.zhao@windriver.com>"
@@ -568,7 +568,7 @@ RECIPE_MAINTAINER_pn-procps = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-pseudo = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-psmisc = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-psplash = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER_pn-ptest-runner = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-ptest-runner = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-pulseaudio = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -618,10 +618,10 @@ RECIPE_MAINTAINER_pn-rpcsvc-proto = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-rpm = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-rsync = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-rt-tests = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-ruby = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-run-postinsts = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-ruby = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-run-postinsts = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-rxvt-unicode = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-sato-screenshot = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-sbc = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-screen = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-sed = "Chen Qi <Qi.Chen@windriver.com>"
@@ -661,8 +661,8 @@ RECIPE_MAINTAINER_pn-systemd-systemctl-native = "Chen Qi <Qi.Chen@windriver.com>
 RECIPE_MAINTAINER_pn-systemtap = "Victor Kamensky <kamensky@cisco.com>"
 RECIPE_MAINTAINER_pn-systemtap-native = "Victor Kamensky <kamensky@cisco.com>"
 RECIPE_MAINTAINER_pn-systemtap-uprobes = "Victor Kamensky <kamensky@cisco.com>"
-RECIPE_MAINTAINER_pn-sysvinit = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-sysvinit-inittab = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-sysvinit = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-sysvinit-inittab = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-taglib = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-tar = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-tcf-agent = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -678,12 +678,12 @@ RECIPE_MAINTAINER_pn-tzcode-native = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-tzdata = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-u-boot = "Marek Vasut <marek.vasut@gmail.com>"
 RECIPE_MAINTAINER_pn-u-boot-tools = "Marek Vasut <marek.vasut@gmail.com>"
-RECIPE_MAINTAINER_pn-udev-extraconf = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-unfs3 = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-unifdef = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-udev-extraconf = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-unfs3 = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-unifdef = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-uninative-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-unzip = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-update-rc.d = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-update-rc.d = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-usbinit = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-usbutils = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-util-linux = "Chen Qi <Qi.Chen@windriver.com>"
@@ -696,11 +696,11 @@ RECIPE_MAINTAINER_pn-vim-tiny = "Tom Rini <trini@konsulko.com>"
 RECIPE_MAINTAINER_pn-virglrenderer = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-volatile-binds = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-vte = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-vulkan-demos = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-vulkan-demos = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-vulkan-headers = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan-loader = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan-tools = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-waffle = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-waffle = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-watchdog = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-watchdog-config = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-wayland = "Denys Dmytriyenko <denys@ti.com>"
@@ -740,7 +740,7 @@ RECIPE_MAINTAINER_pn-xf86-video-intel = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xf86-video-vesa = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xf86-video-vmware = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xhost = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-xinetd = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-xinetd = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-xinit = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xinput = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xinput-calibrator = "Armin Kuster <akuster808@gmail.com>"
-- 
2.17.1

