Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C27E560E79
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:29:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:29:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457009920"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:29:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:28:59 +0000
Message-Id: <6ad5f30bc8232dff91299c18f0c86b46b772f772.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/38] Replace OpenedHand Bugzilla in BUGTRACKER
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
X-List-Received-Date: Sat, 28 Dec 2013 22:29:48 -0000

This site no longer exists, and all of these are now (semi-)maintained
on yoctoproject.org infrastructure, so set BUGTRACKER to point to the
Yocto Project Bugzilla.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/libfakekey/libfakekey_git.bb                      | 2 +-
 meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb   | 2 +-
 meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb          | 2 +-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb                    | 2 +-
 .../xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb        | 2 +-
 meta/recipes-kernel/oprofile/oprofileui.inc                             | 2 +-
 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc                       | 2 +-
 meta/recipes-sato/libowl/libowl_git.bb                                  | 2 +-
 meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb        | 2 +-
 meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb    | 2 +-
 meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb              | 2 +-
 meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb            | 2 +-
 meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb              | 2 +-
 meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb            | 2 +-
 meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb            | 2 +-
 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc           | 2 +-
 meta/recipes-sato/owl-video-widget/libowl-av_git.bb                     | 2 +-
 meta/recipes-sato/owl-video-widget/owl-video_git.bb                     | 2 +-
 meta/recipes-sato/puzzles/oh-puzzles_git.bb                             | 2 +-
 meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb              | 2 +-
 meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb                | 2 +-
 meta/recipes-sato/settings-daemon/settings-daemon_git.bb                | 2 +-
 22 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index 187e5e8..862fe38 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Library for converting characters to X key-presses"
 DESCRIPTION = "libfakekey is a simple library for converting UTF-8 characters into 'fake' X \
 key-presses."
 HOMEPAGE = "http://matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://src/libfakekey.c;endline=30;md5=602b5ccd48f64407510867f3373b448c"
diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
index 0a1f953..d7a8030 100644
--- a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
+++ b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
@@ -4,7 +4,7 @@ setting propagation protocol. Controls setting of double click timeout, drag-and
 threshold, and default foreground and background colors for all applications running within a \
 desktop."
 HOMEPAGE = "http://matchbox-project.org/sources/optional-dependencies/"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 SECTION = "x/libs"
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
index b9e83a5..9453eae 100644
--- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
+++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Custom MB session files for poky"
 HOMEPAGE = "http://www.matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://matchbox-session;endline=20;md5=180f1c169a15d059a56c30094f6fb5ea"
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index a4656dd..7d112ef 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Matchbox window manager"
 HOMEPAGE = "http://matchbox-project.org"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa835 \
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
index fecc8ea..0dcfbea 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Transparent xcursor theme for handheld systems"
 HOMEPAGE = "http://www.matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta/recipes-kernel/oprofile/oprofileui.inc b/meta/recipes-kernel/oprofile/oprofileui.inc
index 9a9bc19..6d59e47 100644
--- a/meta/recipes-kernel/oprofile/oprofileui.inc
+++ b/meta/recipes-kernel/oprofile/oprofileui.inc
@@ -1,7 +1,7 @@
 SUMMARY = "User Interface for the System-Wide Profiler"
 DESCRIPTION = "User interface for the OProfile tool"
 HOMEPAGE = "http://labs.o-hand.com/oprofileui/"
-BUGTRACKER = "http://bugzilla.o-hand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 SECTION = "x11"
 
diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
index f75a038..e5dedad 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Sato theme engine for GTK"
 HOMEPAGE = "http://www.o-hand.com"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "LGPLv2.1 & LGPLv2+"
 
diff --git a/meta/recipes-sato/libowl/libowl_git.bb b/meta/recipes-sato/libowl/libowl_git.bb
index 0c3f9a3..a6965f0 100644
--- a/meta/recipes-sato/libowl/libowl_git.bb
+++ b/meta/recipes-sato/libowl/libowl_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "OpenedHand Widget Library"
 HOMEPAGE = "http://www.o-hand.com"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPLv2 & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
index 079d779..8103005 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Matchbox GTK+ theme configuration application."
 HOMEPAGE = "http://matchbox-project.org"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
index 148cc55..1b0f9ed 100644
--- a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
+++ b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Sato desktop folders"
 HOMEPAGE = "http://matchbox-project.org"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
index d894e84..003f440 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Matchbox Window Manager Desktop"
 HOMEPAGE = "http://matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 225e66e..cecaa99 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Matchbox virtual keyboard for X11"
 HOMEPAGE = "http://matchbox-project.org"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 SECTION = "x11"
 
 LICENSE = "LGPLv2.1"
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 34542b2..603f292 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A simple GTK+ based panel for handheld devices."
 HOMEPAGE = "http://matchbox-project.org"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index 2d18c66..5e19396 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Custom MB session files for poky"
 HOMEPAGE = "http://www.matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPLv2.0+"
 LIC_FILES_CHKSUM = "file://session;endline=3;md5=f8a5c5b9c279e52dc094d10e11c2be63"
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
index 45549d9..432b8ea 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Matchbox Terminal"
 HOMEPAGE = "http://www.matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
index f031ce0..797d239 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Matchbox window manager Sato themes"
 HOMEPAGE = "http://www.matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=aae86bb34b0a83716ca09f4e783d6ba4"
diff --git a/meta/recipes-sato/owl-video-widget/libowl-av_git.bb b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
index 1b5d38c..572132b 100644
--- a/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
+++ b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "OpenedHand Widget Library Audio/Video"
 HOMEPAGE = "http://www.o-hand.com"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ac14b7ca45afea5af040da54db270eb0 \
diff --git a/meta/recipes-sato/owl-video-widget/owl-video_git.bb b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
index 51c0149..c881745 100644
--- a/meta/recipes-sato/owl-video-widget/owl-video_git.bb
+++ b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "OpenedHand Widget Library video widget"
 HOMEPAGE = "http://o-hand.com/"
-BUGTRACKER = "http://bugzilla.o-hand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 LICENSE = "LGPLv2.1 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ac14b7ca45afea5af040da54db270eb0 \
                     file://src/video.c;endline=22;md5=e8e9f23c3691c11af7d8fc03264ca9da \
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_git.bb b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
index 3ddb32f..1de0201 100644
--- a/meta/recipes-sato/puzzles/oh-puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Portable Puzzle Collection"
 HOMEPAGE = "http://o-hand.com/"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=f56ec6772dd1c7c367067bbea8ea1675 \
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
index a32e1a9..2b0b729 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Sato Icon Theme"
 HOMEPAGE = "http://www.o-hand.com"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=56a830bbe6e4697fe6cbbae01bb7c2b2"
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
index 5d23f41..2460e03 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "An ultra-simple screen capture utility, aimed at handheld devices"
 HOMEPAGE = "http://www.o-hand.com"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb b/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
index c0bb2b0..a11e5a0 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Settings-daemon provides a bridge between gconf and xsettings"
 HOMEPAGE = "http://svn.o-hand.com/view/matchbox/trunk/settings-daemon/"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://xsettings-manager.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
                     file://xsettings-common.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b"
-- 
1.8.1.2


