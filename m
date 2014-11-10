Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-10.prod.phx3.secureserver.net
	(p3plsmtpa07-10.prod.phx3.secureserver.net [173.201.192.239])
	by mail.openembedded.org (Postfix) with ESMTP id 05763720B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 21:13:25 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-10.prod.phx3.secureserver.net with 
	id DxDM1p00G0BVjqb01xDSwf; Mon, 10 Nov 2014 14:13:26 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Nov 2014 15:13:05 -0600
Message-Id: <01cb8ceb7576735c0034283281f38cfe03aad4b2.1415647839.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1415647839.git.pab@pabigot.com>
References: <cover.1415647839.git.pab@pabigot.com>
In-Reply-To: <cover.1415647839.git.pab@pabigot.com>
References: <cover.1415647839.git.pab@pabigot.com>
Subject: [RFC 08/14] gstreamer1.0-plugins-bad: switch to virtual/bluez
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
X-List-Received-Date: Mon, 10 Nov 2014 21:13:29 -0000

Be aware that current versions of gstreamer1.0-plugins-bad (through
1.4.3) do not currently support bluez5, and will silently disable
bluetooth support until that has been addressed upstream.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc    | 4 ++--
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index dab0bf5..913a338 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -18,7 +18,7 @@ PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2',
 PACKAGECONFIG ??= " \
     ${PACKAGECONFIG_GL} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'virtual/bluez', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
     orc curl uvch264 neon sndfile \
     hls sbc dash bz2 smoothstreaming \
@@ -49,7 +49,7 @@ PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
 PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
 PACKAGECONFIG[schroedinger]    = "--enable-schro,--disable-schro,schroedinger"
 PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
-PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,bluez4"
+PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,virtual/bluez"
 PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
 PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index e1a5904..8f37be8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}/git"
 
 SRCREV = "6e5db57d2446a753aaa76bee268e1f95600b14ce"
 
-PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4"
+PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,virtual/bluez"
 PACKAGECONFIG[sbc] = "--enable-sbc,--disable-sbc,sbc"
 PACKAGECONFIG[hls] = "--enable-hls,--disable-hls,gnutls"
 
-- 
1.8.5.5


