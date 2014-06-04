Return-Path: <ajlennon@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 891046B89F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 21:54:37 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so124340wgh.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jun 2014 14:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WIYpbXyFTiAXxlqSVyX6A0W7Taf3SoYnVN1H02JsBqQ=;
	b=Vit79DyR29FOo4OykwXCppZfRp+CF6vWIsO/Sjy/uxUCNAyT7eezKpnQrXbVojyO0i
	i0M3m1xyYuisryne3/VjNzr2E6q79Og1pUZ3yEVx32pI9E2DFQ+mSxdTP/SfJA7dG9N4
	sqEtUX/uR4ScS68e6A7wk52aC1zPHfeoDUajqCXhv4tjI7o0O8uhs1fIbqpQGZBZ7Xuv
	VpSoka2fINOm6H7/bGzEEXAPGmZmTcb6dUv0ie9Jgxo0R902irSxXT+Ouga5Qwcb9PyU
	dm1uSURC5XzGgOFbFZL17cIw44D5P+QG4tHRIRMXwx01PBvxyfrptHFyne+h/CP8aP93
	EoWw==
X-Received: by 10.180.77.68 with SMTP id q4mr9534144wiw.21.1401918878516;
	Wed, 04 Jun 2014 14:54:38 -0700 (PDT)
Received: from localhost.localdomain
	(cpc32-live22-2-0-cust59.17-2.cable.virginm.net. [82.36.253.60])
	by mx.google.com with ESMTPSA id oy4sm5298921wjb.41.2014.06.04.14.54.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Jun 2014 14:54:37 -0700 (PDT)
Sender: Alex Lennon <ajlennon@gmail.com>
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jun 2014 22:53:46 +0100
Message-Id: <14f9de6c3225fa8a8ae8faab4c65a1253ce34ed0.1401918455.git.ajlennon@dynamicdevices.co.uk>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1401918455.git.ajlennon@dynamicdevices.co.uk>
References: <cover.1401918455.git.ajlennon@dynamicdevices.co.uk>
In-Reply-To: <cover.1401918455.git.ajlennon@dynamicdevices.co.uk>
References: <cover.1401918455.git.ajlennon@dynamicdevices.co.uk>
Subject: [PATCH 1/1] gstreamer1.0-rtsp-server: Add recipe to support gst-rtsp-server
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
X-List-Received-Date: Wed, 04 Jun 2014 21:54:40 -0000

A Gstreamer library which provides an API to create an RTSP server (e.g. to stream RTP to VLC clients and similar).

Tested, works with GStreamer 1.2.3 + videotestsrc based pipeline on RPi.

Signed-off-by: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
---
 .../gstreamer/gstreamer1.0-rtsp-server.inc                 | 14 ++++++++++++++
 .../gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb            |  9 +++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
new file mode 100644
index 0000000..6917d41
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -0,0 +1,14 @@
+SUMMARY = "A library on top of GStreamer for building an RTSP server"
+SECTION = "multimedia"
+LICENSE = "LGPLv2"
+HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
+DEPENDS = "gstreamer1.0"
+
+PNREAL = "gst-rtsp-server"
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+
+S = "${WORKDIR}/${PNREAL}-${PV}"
+
+inherit autotools pkgconfig 
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb
new file mode 100644
index 0000000..78d35f3
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb
@@ -0,0 +1,9 @@
+include gstreamer1.0-rtsp-server.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
+
+SRC_URI[md5sum] = "239f805e755deb388162e957fcffff1d"
+SRC_URI[sha256sum] = "c12befa5ec63818842c150725d3e9e38bf9948366317b67dc2536dfd00765da1"
+
+
+
-- 
2.0.0


