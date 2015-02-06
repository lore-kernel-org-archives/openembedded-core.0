Return-Path: <martri@arantia.com>
Received: from mailext0.televes.com (mailext0.televes.com [212.163.42.140])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA2365C75
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 13:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailext0.televes.com (Postfix) with ESMTP id 438329A3D70
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 14:59:27 +0100 (CET)
X-Virus-Scanned: by amavisd-new at mailext0.televes.com
Received: from mailext0.televes.com ([127.0.0.1])
	by localhost (mailext0.televes.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id qoY0TqEN+lSL
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 14:59:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailext0.televes.com (Postfix) with ESMTP id 0FCA29A3D74
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 14:59:27 +0100 (CET)
Received: from tves0.televes.com (tvesbackup0 [212.163.42.137])
	by mailext0.televes.com (Postfix) with ESMTP id E81029A3D70
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 14:59:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by tves0.televes.com (Postfix) with ESMTP id BF50DF04B0A40
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 14:59:27 +0100 (CET)
Received: from arantia1.arantia.com (ARANTIA0.televes.com [192.168.178.2])
	by tves0.televes.com (Postfix) with ESMTP id B4D70F021A472
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 14:59:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by arantia1.arantia.com (Postfix) with ESMTP id 72E1319E9CDA;
	Fri,  6 Feb 2015 14:59:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by arantia1.arantia.com (Postfix) with ESMTP id 46B9D19EC6E8;
	Fri,  6 Feb 2015 14:59:27 +0100 (CET)
Received: from arantia1.arantia.com ([127.0.0.1])
	by localhost (arantia0 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 12947-01; Fri,  6 Feb 2015 14:59:26 +0100 (CET)
Received: from arantia-STB-Server.televes.com (unknown [192.168.178.47])
	by arantia1.arantia.com (Postfix) with ESMTP id E537719E9CDA;
	Fri,  6 Feb 2015 14:59:25 +0100 (CET)
From: Marco Trillo <martri@arantia.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Feb 2015 14:58:57 +0100
Message-Id: <1423223906-8568-1-git-send-email-martri@arantia.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Ruben Morgade <rmorgade@arantia.com>
Subject: [PATCH 1/2] Update gst-fluendo-mpegdemux plugin to latest release from Fluendo.
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
X-List-Received-Date: Fri, 06 Feb 2015 13:59:29 -0000

Hello all,

The patch below updates the `gst-fluendo-mpegdemux' recipe from version
0.10.72 (Oct 31 2013) to the latest version from upstream which is
0.10.85 (Nov 28 2014).

The ChangeLog is rather big so I opted for not pasting it here; it can
be consulted instead at the following URL: 
<https://core.fluendo.com/gstreamer/trac/browser/tags/gst-fluendo-mpegdemux-0.10.85/ChangeLog?rev=2667>

A second patch follows with cosmetic updates to the recipe description
and a broken link fixed in included file `gst-fluendo.inc'.

Signed-off-by: Marco Trillo <martri@arantia.com>
---

 .../gstreamer/gst-fluendo-mpegdemux_0.10.72.bb     |   12 ------------
 .../gstreamer/gst-fluendo-mpegdemux_0.10.85.bb     |   12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
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
index 0000000..ad06eb0
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.85.bb
@@ -0,0 +1,12 @@
+require gst-fluendo.inc
+
+SUMMARY = "Fluendo closed-format mpeg video GStreamer plug-in"
+LICENSE = "MPLv1.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=be282f1c3cc9a98cc0dc5c2b25dfc510 \
+                    file://src/gstmpegdemux.h;beginline=1;endline=19;md5=a9e90033f59897b91664d9f2a2ff01dd"
+LICENSE_FLAGS = "commercial"
+
+acpaths = "-I ${S}/common/m4 -I ${S}/m4"
+
+SRC_URI[md5sum] = "7c4fb993f80b9ae631b11897733f0970"
+SRC_URI[sha256sum] = "df04c91cc8e5d9a892c2492ed989974b4547beaa2a3647649e85113317897424"
-- 
1.7.9.5



