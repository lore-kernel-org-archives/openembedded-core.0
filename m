Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 14F0570896
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 21:00:16 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id BC9B733185
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 22:53:32 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jul 2014 22:53:19 +0200
Message-Id: <1406667203-14914-3-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1406667203-14914-1-git-send-email-dv@pseudoterminal.org>
References: <1406667203-14914-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 3/7] gstreamer1.0-plugins-good: upgrade to 1.4.0
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
X-List-Received-Date: Tue, 29 Jul 2014 21:00:21 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc            | 4 ++--
 ...er1.0-plugins-good_1.2.4.bb => gstreamer1.0-plugins-good_1.4.0.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.2.4.bb => gstreamer1.0-plugins-good_1.4.0.bb} (73%)

diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 4e76a33..223e790 100644
--- a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -15,8 +15,8 @@ PACKAGECONFIG ??= " \
     "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
-X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
-X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
+X11ENABLEOPTS = "--enable-x --enable-xshm"
+X11DISABLEOPTS = "--disable-x --disable-xshm"
 PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.4.bb b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.0.bb
similarity index 73%
rename from recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.4.bb
rename to recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.0.bb
index 93813a0..33a75bd 100644
--- a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.4.bb
+++ b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.0.bb
@@ -3,7 +3,7 @@ include gstreamer1.0-plugins-good.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
-SRC_URI[md5sum] = "8aac024ee0cd98b67a3066ad31d8c677"
-SRC_URI[sha256sum] = "c9c90368393c2e5e78387e95c02ce7b19f48e793bba6d8547f2c4b51c6f420d3"
+SRC_URI[md5sum] = "8007d57a38f6b2882961b2547fa4597c"
+SRC_URI[sha256sum] = "48a62e7987fffa289a091dfc8ccc80b401d110632b8fc1adce5b82fc092f2685"
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
1.8.3.2


