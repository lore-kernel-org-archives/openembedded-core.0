Return-Path: <martri@arantia.com>
Received: from mailext0.televes.com (mailext0.televes.com [212.163.42.140])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE0B65C97
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 08:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailext0.televes.com (Postfix) with ESMTP id 396B99A3E0C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 09:33:52 +0100 (CET)
X-Virus-Scanned: by amavisd-new at mailext0.televes.com
Received: from mailext0.televes.com ([127.0.0.1])
	by localhost (mailext0.televes.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Eh+YJDXMp0El
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 09:33:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailext0.televes.com (Postfix) with ESMTP id 0012A9A3E15
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 09:33:51 +0100 (CET)
Received: from tves0.televes.com (tvesbackup0 [212.163.42.137])
	by mailext0.televes.com (Postfix) with ESMTP id D43D89A3E0C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 09:33:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by tves0.televes.com (Postfix) with ESMTP id 9AA12F021A465
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 09:33:52 +0100 (CET)
Received: from arantia1.arantia.com (ARANTIA0.televes.com [192.168.178.2])
	by tves0.televes.com (Postfix) with ESMTP id 947E2F021A454
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 09:33:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by arantia1.arantia.com (Postfix) with ESMTP id 659AD188E107;
	Mon,  9 Feb 2015 09:33:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by arantia1.arantia.com (Postfix) with ESMTP id 409FD188E104;
	Mon,  9 Feb 2015 09:33:52 +0100 (CET)
Received: from arantia1.arantia.com ([127.0.0.1])
	by localhost (arantia0 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 07416-02-5; Mon,  9 Feb 2015 09:33:49 +0100 (CET)
Received: from martri.televes.com (unknown [192.168.178.108])
	by arantia1.arantia.com (Postfix) with ESMTP id 1FFB4188E10D;
	Mon,  9 Feb 2015 09:33:49 +0100 (CET)
From: Marco Trillo <martri@arantia.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Feb 2015 09:33:18 +0100
Message-Id: <1423470798-8053-1-git-send-email-martri@arantia.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gst-fluendo-mpegdemux: update to 0.10.85
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
X-List-Received-Date: Mon, 09 Feb 2015 08:34:01 -0000

*	Update gst-fluendo-mpegdemux recipe from 0.10.72 to 0.10.85.
*	Provide a more descriptive SUMMARY.
*	Fix broken link in parent file gst-fluendo.inc.

Signed-off-by: Marco Trillo <martri@arantia.com>
---
 .../gstreamer/gst-fluendo-mpegdemux_0.10.72.bb     |   12 ------------
 .../gstreamer/gst-fluendo-mpegdemux_0.10.85.bb     |   12 ++++++++++++
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc  |    2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.72.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.85.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.72.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.72.bb
deleted file mode 100644
index f790154..0000000
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.72.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require gst-fluendo.inc
-
-SUMMARY = "Fluendo closed-format mpeg video GStreamer plug-in"
-LICENSE = "MPLv1.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=be282f1c3cc9a98cc0dc5c2b25dfc510 \
-                    file://src/gstmpegdemux.h;beginline=1;endline=19;md5=a9e90033f59897b91664d9f2a2ff01dd"
-LICENSE_FLAGS = "commercial"
-
-acpaths = "-I ${S}/common/m4 -I ${S}/m4"
-
-SRC_URI[md5sum] = "df726579404af65b9536428661ab4322"
-SRC_URI[sha256sum] = "a9784bc16352d0fb73de81b9c17142609e8bede46f6d9b881fc3d19673954abf"
diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.85.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.85.bb
new file mode 100644
index 0000000..7bba41a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.85.bb
@@ -0,0 +1,12 @@
+require gst-fluendo.inc
+
+SUMMARY = "Fluendo MPEG Transport Stream and Program Stream demuxer for GStreamer"
+LICENSE = "MPLv1.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=be282f1c3cc9a98cc0dc5c2b25dfc510 \
+                    file://src/gstmpegdemux.h;beginline=1;endline=19;md5=a9e90033f59897b91664d9f2a2ff01dd"
+LICENSE_FLAGS = "commercial"
+
+acpaths = "-I ${S}/common/m4 -I ${S}/m4"
+
+SRC_URI[md5sum] = "7c4fb993f80b9ae631b11897733f0970"
+SRC_URI[sha256sum] = "df04c91cc8e5d9a892c2492ed989974b4547beaa2a3647649e85113317897424"
diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
index 3cbb465..7a77d62 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Fluendo closed-format GStreamer plug-in"
 SECTION = "multimedia"
-HOMEPAGE = "http://www.fluendo.com/resources/source-plugins.php"
+HOMEPAGE = "https://core.fluendo.com/gstreamer/trac/wiki"
 DEPENDS = "gstreamer gst-plugins-base zlib"
 
 inherit autotools pkgconfig
-- 
1.7.9.5



