Return-Path: <sebmennetrier@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 642396F7B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 09:44:19 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id x13so11281638wgg.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 02:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=9+z1lb9i/d7CF21t41vbM7KuJvalOMjBoqgH8tUgiOo=;
	b=sS5BTznirGXSfbpJ4MRA0TZ2IMQ0rltFEtFLud8tnp8AuRk4SYEiIqcec1q8SfOaVk
	00CmjnP0V1CSVEPtxW+GCEk9CiCgRCTJ9XYuq050X8xlo2HjLzWlTK3IPzZb/AFb8oc2
	bof05xRMf2TMT/WeJeWCab9qdMxWCzhKmsPNfNzsFbNQmX2VryaY5KptiZYr8qXrZdsM
	XJi6pEvDnTF/YXspD3YoJgoKkbAj0NSBYUtO7NqOu4HdWcZWLJLm+Ly3dLjBzgZjtk+x
	4qx7n87zvx6k9rbEk7pjLLTj+TsFBCFFFmAEYI9xQ9YKjDRdr/fYSqQrFXcYre+38xYk
	VzaQ==
X-Received: by 10.194.90.196 with SMTP id by4mr11995318wjb.45.1394617460349;
	Wed, 12 Mar 2014 02:44:20 -0700 (PDT)
Received: from smennetrier-desktop.mpl.mstarsemi.fr
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id fo6sm14407548wib.7.2014.03.12.02.44.18
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Mar 2014 02:44:19 -0700 (PDT)
Sender: =?UTF-8?Q?S=C3=A9bastien_Mennetrier?= <sebmennetrier@gmail.com>
From: =?UTF-8?q?S=C3=A9bastien=20Mennetrier?= <s.mennetrier@innotis.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 10:44:04 +0100
Message-Id: <1394617444-15843-1-git-send-email-s.mennetrier@innotis.org>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH v2] Create gstreamer-1.0 package groups
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
X-List-Received-Date: Wed, 12 Mar 2014 09:44:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This recipe is based on gst-meta-base

Signed-off-by: Sébastien Mennetrier <s.mennetrier@innotis.org>
---
 .../gstreamer/gstreamer1.0-meta-base.bb            | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
new file mode 100644
index 0000000..cb8dd1a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
@@ -0,0 +1,62 @@
+DESCRIPTION = "Gstreamer1.0 package groups"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad"
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
+RDEPENDS_gstreamer1.0-meta-debug = "\
+    gstreamer1.0-meta-base \
+    gstreamer1.0-plugins-good-debug \
+    gstreamer1.0-plugins-base-audiotestsrc \
+    gstreamer1.0-plugins-base-videotestsrc"
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


