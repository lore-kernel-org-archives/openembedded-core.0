Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.2584.1615661455299820002
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:50:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sBYeTWo7;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id y131so27542543oia.8
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iyf8xiLjU35cxDxmT2jJdsMk0pcEmZhWZDtkSZUVhkY=;
        b=sBYeTWo74PORczwngm1plGFk5EBk4nJ9h4qwirU4vwIM4ObDYOfmGB0beDTFY1xta6
         XCR0KgtmMMfsu5HiJv16e6L72aRHXCpAHD33CDo+3tQwWjuKxmUEHEOEOVruMl0CY7a+
         2/UVlRf2GI37Vu31GONY0T0X0hWP51JcHDEcAnKIsvLKCRQXIR6qW7AmyT9GYEaPR5GI
         MaWZjYhUCSK+xhYYQSYkXrcxnhqXRP+wtaB2jvLCosmWQXUuZXEnpAGur535ZGZP+I9Z
         KdjZer2CdcIZMwBPk0vLP/oObshQiLMuxt6EkxJXZjs9AR2+3LNwsQBjcTT4yM7rQL3s
         xD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iyf8xiLjU35cxDxmT2jJdsMk0pcEmZhWZDtkSZUVhkY=;
        b=Bg9W/y5U9QYaBeITw0oCtxB1RCZTXsJCsDSGMVQ09PKkY145p5ydMgyOXv4tBKg1Bz
         vI1c/vseuaOeBApxa47ul4XS4EiWI1MP4XRC7ck951jkAUvFdbYJnmw90FtyuftZfFSJ
         rt3rXhwh7286wi/1zEEJyxcqQnv+UaEHGBpI5SWAa8PdgztNNgkoGyNjrFDglm+b+0NP
         RH4JxnWkZtBgEJ9P5g56GZ/bDyBf3CJD5Lh9b0h29hvnVYzTeRUjazjFX5YyZ/zyFJIp
         ItzOMFg4fG6WnYiIwNMbeHj5avNyGene+j1+SY6KcLoDBnWMi61zfcxr5uQTNwHIjhv4
         kPtw==
X-Gm-Message-State: AOAM531unGdr63kMy3co9CictT6wdMQ9zYMyOA5ZDGN+fs7u1WRfU06l
	L0L2e8fMBUOt7KetIwIzvHaK/9FwRj1asjvQ
X-Google-Smtp-Source: ABdhPJxREdLNgAb6jFHbVIww/D7hgisDWbfjzjg968LXXD3orCOIm5NQIRlgG8aMpIF8FG4X2PXK/Q==
X-Received: by 2002:aca:5b02:: with SMTP id p2mr13624410oib.90.1615661453946;
        Sat, 13 Mar 2021 10:50:53 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.50.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:50:53 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/38] recipes-sato: Add missing HOMEPAGE and DESCRIPTION for recipes
Date: Sat, 13 Mar 2021 08:49:01 -1000
Message-Id: <bee215c7d3b2759635f6e3a8e5c385ad95e9330e.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Meh Mbeh Ida Delphine <idadelm@gmail.com>

Fixes: [YOCTO #13471]

Signed-off-by: Ida Delphine <idadelm@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dad63dcd37948388a7a1ffe7f9af187306295d5a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/images/core-image-sato-dev.bb               | 1 +
 meta/recipes-sato/images/core-image-sato-ptest-fast.bb        | 1 +
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb         | 1 +
 meta/recipes-sato/images/core-image-sato-sdk.bb               | 1 +
 meta/recipes-sato/images/core-image-sato.bb                   | 1 +
 meta/recipes-sato/l3afpad/l3afpad_git.bb                      | 4 ++++
 meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb    | 1 +
 .../recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb | 1 +
 meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb   | 2 ++
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 2 ++
 meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb                    | 1 +
 meta/recipes-sato/puzzles/puzzles_git.bb                      | 1 +
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc               | 1 +
 13 files changed, 18 insertions(+)

diff --git a/meta/recipes-sato/images/core-image-sato-dev.bb b/meta/recipes-sato/images/core-image-sato-dev.bb
index 7fa69d0997..f45a83273c 100644
--- a/meta/recipes-sato/images/core-image-sato-dev.bb
+++ b/meta/recipes-sato/images/core-image-sato-dev.bb
@@ -3,5 +3,6 @@ require core-image-sato.bb
 DESCRIPTION = "Image with Sato for development work. It includes everything \
 within core-image-sato plus a native toolchain, application development and \
 testing libraries, profiling and debug symbols."
+HOMEPAGE = "https://www.yoctoproject.org/"
 
 IMAGE_FEATURES += "dev-pkgs"
diff --git a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
index 4f08d6eb64..d37ad00cf8 100644
--- a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
+++ b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
@@ -7,6 +7,7 @@ require conf/distro/include/ptest-packagelists.inc
 IMAGE_INSTALL += "${PTESTS_FAST}"
 
 DESCRIPTION += "Also includes ptest packages with fast execution times to allow for more automated QA."
+HOMEPAGE = "https://www.yoctoproject.org/"
 
 # This image is sufficiently large (~1.8GB) that it can't actually fit in a live
 # image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index 4d59c9536b..eea89a5d6c 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -5,6 +5,7 @@ require core-image-sato-sdk.bb
 require conf/distro/include/ptest-packagelists.inc
 
 DESCRIPTION += "Also includes ptest packages."
+HOMEPAGE = "https://www.yoctoproject.org/"
 
 PROVIDES += "core-image-sato-ptest"
 
diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index d7cc52b52b..b52de0def0 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -3,6 +3,7 @@ require core-image-sato.bb
 DESCRIPTION = "Image with Sato support that includes everything within \
 core-image-sato plus meta-toolchain, development headers and libraries to \
 form a standalone SDK."
+HOMEPAGE = "https://www.yoctoproject.org/"
 
 IMAGE_FEATURES += "dev-pkgs tools-sdk \
 	tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks ssh-server-openssh"
diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index 673106eb6d..e50b24a476 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Image with Sato, a mobile environment and visual style for \
 mobile devices. The image supports X11 with a Sato theme, Pimlico \
 applications, and contains terminal, editor, and file manager."
+HOMEPAGE = "https://www.yoctoproject.org/"
 
 IMAGE_FEATURES += "splash package-management x11-base x11-sato ssh-server-dropbear hwcodecs"
 
diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
index 6fdcc3e392..85c2c500ea 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Simple GTK+ Text Editor"
+DESCRIPTION = "L3afpad is a simple GTK+ text editor that emphasizes simplicity. As development \
+focuses on keeping weight down to a minimum, only the most essential features \
+are implemented in the editor. L3afpad is simple to use, is easily compiled, \
+requires few libraries, and starts up quickly."
 HOMEPAGE = "https://github.com/stevenhoneyman/l3afpad"
 
 # Note that COPYING seems to mistakenly contain LGPLv2.1.
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
index 5c23e85202..cc51f47b63 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Matchbox Window Manager Desktop"
+DESCRIPTION = "A lightweight windows manager for embedded systems. It uses the desktop background to provide an application launcher and allows modules to be loaded for additional functionality."
 HOMEPAGE = "http://matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
index dfc7fbad57..49e37bd77c 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Matchbox virtual keyboard for X11"
+DESCRIPTION = "An on screen 'virtual' or 'software' keyboard."
 HOMEPAGE = "http://matchbox-project.org"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 SECTION = "x11"
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
index 2e6f5b7085..c659964a2b 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Simple GTK+ based panel for handheld devices"
+DESCRIPTION = "A flexible always present 'window bar' for holding application \
+launchers and small 'applet' style applications"
 HOMEPAGE = "http://matchbox-project.org"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index ed3f1a69a1..25725e078d 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -3,6 +3,8 @@
 #
 
 SUMMARY = "Sato desktop"
+DESCRIPTION = "Packagegroups provide a convenient mechanism of bundling a collection of packages."
+HOMEPAGE = "https://www.yoctoproject.org/"
 PR = "r33"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
index 7885e0abae..153fbeb0b7 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Fast lightweight tabbed filemanager"
+DESCRIPTION = "A free file manager application and the standard file manager of LXDE."
 HOMEPAGE = "http://pcmanfm.sourceforge.net/"
 
 LICENSE = "GPLv2 & GPLv2+ & LGPLv2.1+"
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 41b78d6fe1..befe4a53f4 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Simon Tatham's Portable Puzzle Collection"
+DESCRIPTION = "Collection of small computer programs which implement one-player puzzle games."
 HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=6099f4981f9461d7f411091e69a7f07a"
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index b568f04580..0e5bcbe480 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -5,6 +5,7 @@ terminal emulator rxvt, modified to store text in Unicode \
 (either UCS-2 or UCS-4) and to use locale-correct input and \
 output. It also supports mixing multiple fonts at the \
 same time, including Xft fonts."
+HOMEPAGE = "https://rxvt.org/"
 DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu"
 
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
-- 
2.25.1

