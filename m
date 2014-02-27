Return-Path: <sebmennetrier@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id DE81F6E8DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 13:54:23 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id a1so2881414wgh.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 05:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=r7NHFm+R7M5v/7Pv2cASuXLwpdgQzMMdxPlcUYjS6O0=;
	b=c3s9BZebZFxcCl8KtO2/48o51DSK7jD2vaxLRQ7Lb7sbKdZ0RndUEzWN0L6HXkKX5/
	kkV9xHk2K/H7iiKjKP2ws/Z94QspSccIlie7qqY5fh384X8ArDpdA3auruAv1v8Bqs7g
	mKopARb48jcIaTh5iTwb0LlPFIVuBAhsedlOspFsAMMPG5gnTW/9Om3oYM1JlDF5/G0H
	kKZq4nIslu7hTsmlXgJVXcO0b9RzpAAK03Z53+cFiPUoNirft0+Pp6dMNL4aCf6Ge85q
	W+bNsZ0PDm0uiHXVlsdcZrhghvaqYx0sY6xRLueL1ZpOQyqKaTXN9blW2qeBBFVIt20+
	TcpQ==
X-Received: by 10.194.92.38 with SMTP id cj6mr2020736wjb.70.1393509263650;
	Thu, 27 Feb 2014 05:54:23 -0800 (PST)
Received: from smennetrier-desktop.mpl.mstarsemi.fr
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id f3sm15536606wiv.2.2014.02.27.05.54.22
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 05:54:22 -0800 (PST)
Sender: Sebastien MENNETRIER <sebmennetrier@gmail.com>
From: =?UTF-8?q?S=C3=A9bastien=20Mennetrier?= <s.mennetrier@innotis.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2014 14:53:59 +0100
Message-Id: <1393509239-26637-1-git-send-email-s.mennetrier@innotis.org>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH] Create gstreamer-1.0 package groups
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
X-List-Received-Date: Thu, 27 Feb 2014 13:54:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This recipe is based on gst-meta-base

Signed-off-by: Sébastien Mennetrier <s.mennetrier@innotis.org>
---
 .../gstreamer/gstreamer1.0-meta-base.bb            | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
new file mode 100644
index 0000000..3b797f0
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
@@ -0,0 +1,63 @@
+DESCRIPTION = "Gstreamer1.0 package groups"
+LICENSE = "MIT"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PACKAGES = "\
+    gstreamer1.0-meta-base \
+    gstreamer1.0-meta-x11-base \
+    gstreamer1.0-meta-audio \
+    gstreamer1.0-meta-debug \
+    gstreamer1.0-meta-video"
+
+ALLOW_EMPTY_gstreamer1.0-meta-base = "1"
+ALLOW_EMPTY_gstreamer1.0-meta-x11-base = "1"
+ALLOW_EMPTY_gstreamer1.0-meta-audio = "1"
+ALLOW_EMPTY_gstreamer1.0-meta-debug = "1"
+ALLOW_EMPTY_gstreamer1.0-meta-video = "1"
+
+RDEPENDS_gstreamer1.0-meta-base = "\
+    ${@base_contains('DISTRO_FEATURES', 'x11', 'gstreamer1.0-meta-x11-base', '', d)} \
+    gstreamer1.0 \
+    gstreamer1.0-plugins-base-playback \
+    gstreamer1.0-plugins-base-gio \
+    gstreamer1.0-plugins-base-alsa \
+    gstreamer1.0-plugins-base-volume \
+    gstreamer1.0-plugins-base-audioconvert \
+    gstreamer1.0-plugins-base-audioresample \
+    gstreamer1.0-plugins-base-typefindfunctions \
+    gstreamer1.0-plugins-base-videoscale \
+    gstreamer1.0-plugins-base-videoconvert \
+    gstreamer1.0-plugins-good-autodetect \
+    gstreamer1.0-plugins-good-souphttpsrc"
+
+RRECOMMENDS_gstreamer1.0-meta-x11-base = "\
+    gstreamer1.0-plugins-base-ximagesink \
+    gstreamer1.0-plugins-base-xvimagesink"
+
+RDEPENDS_gstreamer1.0-meta-audio = "\
+    gstreamer1.0-meta-base \
+    gstreamer1.0-plugins-base-vorbis \
+    gstreamer1.0-plugins-base-ogg \
+    gstreamer1.0-plugins-good-wavparse \
+    gstreamer1.0-plugins-good-flac \
+    ${COMMERCIAL_AUDIO_PLUGINS}"
+
+
+RDEPENDS_gstreamer1.0-meta-debug = "\
+    gstreamer1.0-meta-base \
+    gstreamer1.0-plugins-good-debug \
+    gstreamer1.0-plugins-base-audiotestsrc \
+    gstreamer1.0-plugins-base-videotestsrc"
+
+
+RDEPENDS_gstreamer1.0-meta-video = "\
+    gstreamer1.0-meta-base \
+    gstreamer1.0-plugins-good-avi \
+    gstreamer1.0-plugins-good-matroska \
+    gstreamer1.0-plugins-base-theora \
+    ${COMMERCIAL_VIDEO_PLUGINS}"
+
+RRECOMMENDS_gstreamer1.0-meta-video = "\
+    gstreamer1.0-meta-audio"
-- 
1.8.1.2


