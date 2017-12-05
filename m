Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 435547870E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 14:18:57 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id z34so444443wrz.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 06:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=N9k3r0y3ki+pcUQQ4T6lajMQcKe1QUUjojsk/j4HVg4=;
	b=rCN2ksJ3vq14TxnMzRYfTYZcnVB32bVwiiMj8tVhVzVneZKSvkKlbOT3P/F2ByVxDl
	38i1qhMlfxxrsMtWoiqj1dqjEwKLuDptpQfXU+RGW77aWdPKhP9QqKFakWn2iJPngrQu
	qMaM9Dp/KcJGkeHi/NMjGLTwrv27lqQzRT1efpVBKLRME/NUQ0UQAQEFO1sp3FWSb0At
	7moapvo4eHCL8ZPQIG2lL0crzleJRnF8iBlsHogG8kwI5xXpE6AyRG8azm7uYjoPeY29
	6Hl3E7C3sE/08yzROusz0O0b4fHaBFbaLS3unw/+GSZZIZ6ypPO7JscOjoYtyW08s5X0
	Slgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=N9k3r0y3ki+pcUQQ4T6lajMQcKe1QUUjojsk/j4HVg4=;
	b=RUJyhfYMJI4AMc03lbCKvRRuv8CYxL+XdMFuy+cFoQO1r9wvGnT0fiXaZLJyO7YXNz
	uLeBTZvp4kmGl2R+ZX5YrWXuXji9EPHdNZU7MzqpwB+wJe9Fac3Eizi4sBytCb9IUGyU
	Ol+vXarnWJ5VSL2KmLYnPeZiVC0sF1O39py/w11SEruwIEFtItOPz2JlJFjOzCwT/U1d
	eFMk40Zk1uP8/m9ajKwkPpT80gyGlaNGzCfHs3OxVS9erl5nyYwyaojtawqvY/wZB+QZ
	zHnzpxCgtEFmOa8Afbojug2zpGFDHMLf+g6890A4STqqH5PtTeEDBbi3TwSyvvzza30m
	/OeQ==
X-Gm-Message-State: AJaThX5SBufoPJPm1ubMnmzuymyhbg0K2fhw/ac3NYM9tdIijbUrU/a5
	0loDoexabiTSV3HMpY9u/oZP5UX+
X-Google-Smtp-Source: AGs4zMZhJmva0cwqMHBVIJgCQjowFL9IefqFLE5PcWwOSW+qQKbjXaZyTzn/7ut0ju+Qr0fEZ1xRSQ==
X-Received: by 10.223.129.247 with SMTP id 110mr15530866wra.208.1512483538470; 
	Tue, 05 Dec 2017 06:18:58 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 34sm301178wra.39.2017.12.05.06.18.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Dec 2017 06:18:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:18:46 +0000
Message-Id: <20171205141848.24825-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171205141848.24825-1-ross.burton@intel.com>
References: <20171205141848.24825-1-ross.burton@intel.com>
Subject: [PATCH 2/4] gtk+3: remove redundant Wayland patch
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
X-List-Received-Date: Tue, 05 Dec 2017 14:18:58 -0000

The installation path and wayland-scanner location problems in Wayland were
resolved in "wayland: Fix installation patch issue" (oe-core 14c0d99) which made
the WAYLAND_PROTOCOLS_SYSROOT_DIR workaround redundant.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...4-configure.ac-Fix-wayland-protocols-path.patch | 36 ----------------------
 meta/recipes-gnome/gtk+/gtk+3_3.22.24.bb           |  1 -
 2 files changed, 37 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
deleted file mode 100644
index aca55ceaf49..00000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 34f4d3928e8206a89b0a601bdf79d6194b3cc77e Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 9 Jun 2016 11:21:36 +0300
-Subject: [PATCH 4/4] configure.ac: Fix wayland-protocols path
-
-The wayland-protocols directory is used during build: Fix the path
-to point to sysroot specified in recipe.
-
-Normally PKG_CONFIG_SYSROOT_DIR could be used in configure.ac but that
-breaks multilib gtk+ as it would point to multilib sysroot when the
-(allarch) wayland-protocols is actually in the machine sysroot.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 00bf544..5515915 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -465,7 +465,7 @@ fi
- if test "$enable_wayland_backend" = "yes"; then
-   # For the cairo image backend
-   cairo_backends="$cairo_backends cairo"
--  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
-+  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, ${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
-   GDK_BACKENDS="$GDK_BACKENDS wayland"
-   GDK_WINDOWING="$GDK_WINDOWING
- #define GDK_WINDOWING_WAYLAND"
--- 
-2.12.0
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.22.24.bb b/meta/recipes-gnome/gtk+/gtk+3_3.22.24.bb
index 02eca3f5cbd..ac0a9b715f3 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.22.24.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.22.24.bb
@@ -6,7 +6,6 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0001-Hardcoded-libtool.patch \
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
-           file://0004-configure.ac-Fix-wayland-protocols-path.patch \
           "
 SRC_URI[md5sum] = "b782a15b7b5b2005a1ce4647fb002a49"
 SRC_URI[sha256sum] = "cbb16e4cfc928ab8f5f22f7290616f95f6ebc8c97cc724a2007b07ced833592b"
-- 
2.11.0


