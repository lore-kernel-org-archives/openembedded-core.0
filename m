Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 69AFA617B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id C69682E457
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id nI68F9O7cZzn
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:38 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 057712E45B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:38 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id E26B51469
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id D599A1468
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id D0C553E049
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7DHkbfW003156
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7DHkbsm003155
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Aug 2014 19:46:37 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 19:46:36 +0200
Message-Id: <452f76082d13b3d1c7f9930c8754553c336bd176.1407951966.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1407951966.git.pkj@axis.com>
References: <cover.1407951966.git.pkj@axis.com>
In-Reply-To: <cover.1407951966.git.pkj@axis.com>
References: <cover.1407951966.git.pkj@axis.com>
Subject: [PATCH 2/2] gstreamer1.0-plugins-good: Add a PACKAGECONFIG for udev
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
X-List-Received-Date: Wed, 13 Aug 2014 17:46:44 -0000

This solves these floating dependencies:

WARNING: QA Issue: gstreamer1.0-plugins-good-video4linux2 rdepends on
libudev, but it isn't a build dependency? [build-deps]
WARNING: QA Issue: gstreamer1.0-plugins-good-video4linux2 rdepends on
libgudev-1.0, but it isn't a build dependency? [build-deps]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 223e790..b33ab2b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -11,7 +11,7 @@ inherit gettext
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-    orc cairo flac gdk-pixbuf jpeg libpng soup speex taglib \
+    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib \
     "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
@@ -22,6 +22,7 @@ PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
 PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
 PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
+PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,udev"
 PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
 PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
-- 
1.9.0


