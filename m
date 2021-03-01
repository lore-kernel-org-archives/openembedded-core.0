Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.12570.1614607079862831339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 05:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ltJWDD6l;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: idadelm@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id a18so8050648wrc.13
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 05:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LGW1oFalwuksioawEVCXkqj7JXfzbIRrPqEViv7BcvQ=;
        b=ltJWDD6lTR/id/aWd7/LwQD6v8cq/hKo0lfl0+O++NGIolDFpylXhR3jxIlBNIcFm+
         kw0YoSFfZ+AVbGcLPcyj/ANbuU2z3x+rD9daUb3fPmQndkgqGKtdtRKPzeNGsw6mIBPX
         eLmQDAoG8Jm308WhyEu2tbQZL7+bRitHjjJcGs9wy3zg68tr5owymwjsPs6IzYfaBSzj
         Ze+6nYS3Xb4ARj66vteqMO3eBuuW9PvE+ctRq6WAi0FCDDVNlsQ4UyKRuK4ydYVYn+72
         k61eQ+UwOtmYpEYjjKJgB5VbjRJMMJ3W8vrItkboN8XBsXyQSUJWxUjjugBPfxsJTuZ4
         2Duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LGW1oFalwuksioawEVCXkqj7JXfzbIRrPqEViv7BcvQ=;
        b=uCdLJTUAoCSwDT5WYTGM13cdzSaeCh/Kf13roNlV5QlaUfvtS9eclbDsYdOpXXoXmf
         NbDF9tmxu1fjK6qbHD9XMO0Cin3ez9BkDvp5efvpC7j4tkobjDK2MJMeyQDLE9D9SOA0
         GQq0Vku1NP/t9EeDQqh4yP1P2Ii8D1kpOH/C/smOvneRwBa5oX7t3Qu1W51EnH0KbfZK
         7QijzJwIEYPSF5IprXD5MKEffiHQn0KZx9ZpSVTgkF+rjOgfLPl7itcj+4ZEoT0HZsEC
         qwZvo0vKM8HWwwWePLoSKJkizzGZNYkvLA7TzHNtBWmTIBlFPYEElgUg0I5OfENQhsuT
         Up9A==
X-Gm-Message-State: AOAM533u5xa690+l3PJTXOXty3lIDSPQF+9iADpkmoqIhA0TuGF+uhEE
	4HcK6GFGoCRqanq+TiKRSpRXOUpd9PgmSQ==
X-Google-Smtp-Source: ABdhPJxZ0az+6VT17gYLwc6N2hlpaGA6IrnZ3u6nWNR/w4jVI6lx+zLhEjR2JbAVr3swooU+TVswiw==
X-Received: by 2002:adf:a59a:: with SMTP id g26mr17067534wrc.271.1614607078138;
        Mon, 01 Mar 2021 05:57:58 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([154.72.153.131])
        by smtp.gmail.com with ESMTPSA id d13sm17611472wro.23.2021.03.01.05.57.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 05:57:57 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] recipes-sato: Add missing HOMEPAGE and DESCRIPTION for recipes
Date: Mon,  1 Mar 2021 14:57:37 +0100
Message-Id: <20210301135738.12541-5-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301135738.12541-1-idadelm@gmail.com>
References: <20210301135738.12541-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: [YOCTO #13471]

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/recipes-sato/images/core-image-sato-dev.bb              | 1 +
 meta/recipes-sato/images/core-image-sato-ptest-fast.bb       | 1 +
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb        | 1 +
 meta/recipes-sato/images/core-image-sato-sdk.bb              | 1 +
 meta/recipes-sato/images/core-image-sato.bb                  | 1 +
 meta/recipes-sato/l3afpad/l3afpad_git.bb                     | 5 +++++
 meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb   | 1 +
 .../matchbox-keyboard/matchbox-keyboard_0.1.1.bb             | 1 +
 meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb  | 2 ++
 .../recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 2 ++
 meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb                   | 1 +
 meta/recipes-sato/puzzles/puzzles_git.bb                     | 1 +
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc              | 1 +
 13 files changed, 19 insertions(+)

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
index 3641217306..f5a0463d6b 100644
--- a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
+++ b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
@@ -4,6 +4,7 @@ require conf/distro/include/ptest-packagelists.inc
 IMAGE_INSTALL += "${PTESTS_FAST}"
 
 DESCRIPTION += "Also includes ptest packages with fast execution times to allow for more automated QA."
+HOMEPAGE = "https://www.yoctoproject.org/"
 
 # This image is sufficiently large (~1.8GB) that it can't actually fit in a live
 # image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index bf749acd79..ba816379b0 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -2,6 +2,7 @@ require core-image-sato-sdk.bb
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
index 6fdcc3e392..e399a9d2af 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -1,4 +1,9 @@
 SUMMARY = "Simple GTK+ Text Editor"
+DESCRIPTION = "L3afpad is a simple GTK+ text editor that emphasizes simplicity. As development \
+focuses on keeping weight down to a minimum, only the most essential features \
+are implemented in the editor. L3afpad is simple to use, is easily compiled, \
+requires few libraries, and starts up quickly.
+"
 HOMEPAGE = "https://github.com/stevenhoneyman/l3afpad"
 
 # Note that COPYING seems to mistakenly contain LGPLv2.1.
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
index e7d8a284bb..d775b5c651 100644
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
index 8e4d5b3349..674a6b5d8a 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Simon Tatham's Portable Puzzle Collection"
+DESCRIPTION = "Collection of small computer programs which implement one-player puzzle games."
 HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=6099f4981f9461d7f411091e69a7f07a"
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index b064a63caa..cce789b111 100644
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

