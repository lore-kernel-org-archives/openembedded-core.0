Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 86A8D601F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 12:12:54 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id r201so22813944wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=M7EUKZQrT5xb6xBjzsSypd+agj6kCctAwRvIbqZ/9Jc=;
	b=UBYTqn6TewbYNa6U4dBWJUe7yZhM03+hpsvGBNGwti3k7hZo2OxoPU4d/7t+ZtVmRY
	Z/q4G2CwyaniCTZ5Cbrf0JITpGNxK7oUoHGTOs2T7FVx7h+sAMsXcNKkIi06N4/xsu65
	e0XrvNeRDck/8sh/g/l6xeo/7A2CMqx+EqYgruUVauV3BVDHaaTEOXQbIWgRfgBjl/cb
	D+k+EAxCf+IzP/IPREwITuLh3/KYUOPaWY7eZIx6mcScRVNdWiNZLzjnz+Lt/cAvgfmL
	E8m2phFdD8QPuFZaiG8E4bErAUkrwxcrZL7Vb2r/mw2z3q/P0cHn+ubYY6Y7hvLjY64e
	s9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=M7EUKZQrT5xb6xBjzsSypd+agj6kCctAwRvIbqZ/9Jc=;
	b=io4SRq4Lu1xrs62KVdfZUGlTgV6dlhKu9zVNs1HEl6SKLoFuq7kx0s7g6NKG5SfuGf
	5y667bSU8j852y0qM92JLBIFhyLOgajdGVjSi/nKdJGSWcndn+FO4pcQwbOI68FZLILy
	ye3grDQjNf/7u0zXwLdA1kiz1xyuJpanm3dBcxaxeh/IyR4/nSwFsa2PtryMXf05Ot5g
	gN+g6isvD6H+qJiNBsfS3hXZTai0p836uToaewRTEKB4mhv4qLvLJm7OyjxHQPtzVgNi
	V7Z8Lw9IcTNpOncyrtxfTfLBkWlruMy6va+giOADroS9D8iOrZBPF2MByInsgFE9hzt7
	1YPg==
X-Gm-Message-State: ALyK8tKPgMCJpHWrMhCkQuURy6ZX7SqxARNRs8oZ2C2MFIMAwAiPpikk0DyKK9rcAOE156BI
X-Received: by 10.28.66.148 with SMTP id k20mr5984601wmi.55.1466770374221;
	Fri, 24 Jun 2016 05:12:54 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	f196sm2855222wmg.15.2016.06.24.05.12.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jun 2016 05:12:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:12:50 +0100
Message-Id: <1466770370-6412-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] gst-player: upgrade to latest HEAD
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
X-List-Received-Date: Fri, 24 Jun 2016 12:12:54 -0000

Update to the latest revision now that we have gst-plugins-bad 1.8.x which has
integrated the GstPlayer object.  This upstream is now just the user interface,
so remove all redundant items from the packaging and package the binaries in PN
instead of PN-bin.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-multimedia/gstreamer/gst-player_git.bb | 31 ++++++++++------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 6d39c2d..b09244b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -1,20 +1,20 @@
 SUMMARY = "GStreamer playback helper library and examples"
 LICENSE = "LGPL-2.0+"
-LIC_FILES_CHKSUM = "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=03aeca9d8295f811817909075a15ff65"
+LIC_FILES_CHKSUM = "file://gtk/gtk-play.c;beginline=1;endline=20;md5=f8c72dae3d36823ec716a9ebcae593b9"
 
-DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+3"
+DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3"
 
 SRC_URI = "git://github.com/sdroege/gst-player.git \
-           file://filechooser.patch \
-           file://Fix-pause-play.patch \
-           file://Add-error-signal-emission-for-missing-plugins.patch \
+           file://filechooser.patch;apply=0 \
+           file://Fix-pause-play.patch;apply=0 \
+           file://Add-error-signal-emission-for-missing-plugins.patch;apply=0 \
            file://gst-player.desktop"
 
-SRCREV = "5386c5b984d40ef5434673ed62204e69aaf52645"
+SRCREV = "ea90e63c1064503f9ba5d59aa4ca604f13ca5def"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gtk-doc lib_package pkgconfig distro_features_check gobject-introspection
+inherit autotools pkgconfig distro_features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -22,17 +22,14 @@ do_configure_prepend() {
 	touch ${S}/ChangeLog
 }
 
-EXTRA_OECONF += "ac_cv_path_VALGRIND=no ac_cv_path_GDB=no"
-
 do_install_append() {
 	install -m 0644 -D ${WORKDIR}/gst-player.desktop ${D}${datadir}/applications/gst-player.desktop
 }
 
-FILES_${PN}-bin += "${datadir}/applications/*.desktop"
-
-RDEPENDS_${PN}-bin = "gstreamer1.0-plugins-base-playback"
-RRECOMMENDS_${PN}-bin = "gstreamer1.0-plugins-base-meta \
-                         gstreamer1.0-plugins-good-meta \
-                         gstreamer1.0-plugins-bad-meta \
-                         ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-libav", "", d)} \
-                         ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
+RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback"
+RRECOMMENDS_${PN} = "gstreamer1.0-plugins-base-meta \
+                     gstreamer1.0-plugins-good-meta \
+                     gstreamer1.0-plugins-bad-meta \
+                      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-libav", "", d)} \
+                     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
+RPROVIDES_${PN} += "${PN}-bin"
-- 
2.8.1


