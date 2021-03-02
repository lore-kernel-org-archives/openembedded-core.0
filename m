Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.6336.1614679672733944289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 02:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WSY92AXC;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: idadelm@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id o16so2061558wmh.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 02:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ByfVJ768q8F2nvojNd0ukeh/bkvTJVvkWwePUunHipA=;
        b=WSY92AXCU6vds3Pxy66CeyF4v9fuYWc1KtXv55C9TC1OFdmln/wTlH2gM4yfJQBTQh
         U9osT4BJR3TmqCo0NOQI7GSqXrDhoCv78xOZZNlELk4PJG4u7YHudoNmPsnKH4E/0px7
         nvu5f7pcINUIw/ijpX5gJHWz9tgAG0R9OkcaCQUgYES9aqMh0xvplCjUj3hK9CGHtIHN
         yuOzgioqrpa3mCM6TN3S0x1qYfViEbDN+e0WY6bdSeCQt5FLT3J6NOeH+Em3HbaZXDp+
         U2UiItxjOqEKWNvWAogIJNsoF9OrPSfMKQu9jLFFgVdUq9tYyO9N1f7al29134jN5JVK
         uI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ByfVJ768q8F2nvojNd0ukeh/bkvTJVvkWwePUunHipA=;
        b=Srq5y8tZgfXhHWv/+/dlcOsUXvxNCTS9nCKgDLVkoZAbAHfZ3zszXHWZh6+ejSGlcV
         YppC+vF3Ce3eNOq6XLI8pFzK/53A99hxgNkpp1SFM8DZohHb+j8MRsTigrLBBx3wyiYA
         3iIgGXUXTGTT50JxCO895acJ6mEiStmFtdu8KV7HiCzqwW7eG+XXfu20ZsWp/3nstbp0
         DIdZk4bFWohB27UA5Z/pa9gSqfNJQ/Dx6cLZoCUlQS+HsHCSJ4wiZivcv8YK/VVFz/G5
         Dw+NPdvJCKkIUVxgqhjosp6hSxd1V4kKVf02edqUZ5U78wtBKL28f0CjP1FQSel+v7bb
         VfLg==
X-Gm-Message-State: AOAM532dz50XXUtzci4WcS5NH+26zjE6MeZB2kkurJrhFtAQ+5Fqs3jP
	nwXMe7IwdiUyvcjvG+pfwweTbdhYp8OlGg==
X-Google-Smtp-Source: ABdhPJwdKbIB7E0NknbaQIUlz4t+jQnWasC+RjmLe/Ob/fTdHTzHnGUZs+zUF387Ut6Kz3CPODJsPw==
X-Received: by 2002:a1c:7e4e:: with SMTP id z75mr3246515wmc.168.1614679670683;
        Tue, 02 Mar 2021 02:07:50 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([154.72.153.141])
        by smtp.gmail.com with ESMTPSA id m11sm15369568wrz.40.2021.03.02.02.07.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 02:07:50 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] recipes-sato: Add missing HOMEPAGE and DESCRIPTION for recipes
Date: Tue,  2 Mar 2021 11:07:32 +0100
Message-Id: <20210302100734.114315-2-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302100734.114315-1-idadelm@gmail.com>
References: <20210302100734.114315-1-idadelm@gmail.com>
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
 meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb                   | 1 +
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
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
index 37723e9320..d3a9b84227 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Fast lightweight tabbed filemanager"
+DESCRIPTION = "A free file manager application and the standard file manager of LXDE."
 HOMEPAGE = "http://pcmanfm.sourceforge.net/"
 
 LICENSE = "GPLv2 & GPLv2+ & LGPLv2.1+"
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index ecc2b9844d..16a08585cc 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Simon Tatham's Portable Puzzle Collection"
+DESCRIPTION = "Collection of small computer programs which implement one-player puzzle games."
 HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=6099f4981f9461d7f411091e69a7f07a"
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index 1855232973..ff2c8f009d 100644
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

