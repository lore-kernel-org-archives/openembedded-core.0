Return-Path: <martri@arantia.com>
Received: from mailext0.televes.com (mailext0.televes.com [212.163.42.140])
	by mail.openembedded.org (Postfix) with ESMTP id CDECF6AC12
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 12:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailext0.televes.com (Postfix) with ESMTP id 8CFE79A3EBA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 13:03:43 +0100 (CET)
X-Virus-Scanned: by amavisd-new at mailext0.televes.com
Received: from mailext0.televes.com ([127.0.0.1])
	by localhost (mailext0.televes.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id e49tR7WwBh5T
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 13:03:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailext0.televes.com (Postfix) with ESMTP id 5A59F9A3F8D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 13:03:43 +0100 (CET)
Received: from tves0.televes.com (tvesbackup0 [212.163.42.137])
	by mailext0.televes.com (Postfix) with ESMTP id 4A6BB9A3D70
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 13:03:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by tves0.televes.com (Postfix) with ESMTP id 01685F021A468
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 13:03:44 +0100 (CET)
Received: from arantia1.arantia.com (ARANTIA0.televes.com [192.168.178.2])
	by tves0.televes.com (Postfix) with ESMTP id EE402F021A456
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 13:03:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by arantia1.arantia.com (Postfix) with ESMTP id A2801161A0E7;
	Fri,  6 Feb 2015 13:03:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by arantia1.arantia.com (Postfix) with ESMTP id 6BC0C161D5EA;
	Fri,  6 Feb 2015 13:03:43 +0100 (CET)
Received: from arantia1.arantia.com ([127.0.0.1])
	by localhost (arantia0 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 08488-06; Fri,  6 Feb 2015 13:03:42 +0100 (CET)
Received: from arantia-STB-Server.televes.com (unknown [192.168.178.47])
	by arantia1.arantia.com (Postfix) with ESMTP id 987D5161A0E7;
	Fri,  6 Feb 2015 13:03:42 +0100 (CET)
From: Marco Trillo <martri@arantia.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Feb 2015 13:02:32 +0100
Message-Id: <1423224152-10542-2-git-send-email-martri@arantia.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1423223906-8568-1-git-send-email-martri@arantia.com>
References: <1423223906-8568-1-git-send-email-martri@arantia.com>
Cc: Ruben Morgade <rmorgade@arantia.com>
Subject: [PATCH 2/2] Fix broken link in gst-fluendo.inc. Better description for gst-fluendo-mpegdemux.
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
X-List-Received-Date: Fri, 06 Feb 2015 12:11:41 -0000

---
 .../gstreamer/gst-fluendo-mpegdemux_0.10.85.bb     |    2 +-
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.85.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.85.bb
index ad06eb0..7bba41a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.85.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.85.bb
@@ -1,6 +1,6 @@
 require gst-fluendo.inc
 
-SUMMARY = "Fluendo closed-format mpeg video GStreamer plug-in"
+SUMMARY = "Fluendo MPEG Transport Stream and Program Stream demuxer for GStreamer"
 LICENSE = "MPLv1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=be282f1c3cc9a98cc0dc5c2b25dfc510 \
                     file://src/gstmpegdemux.h;beginline=1;endline=19;md5=a9e90033f59897b91664d9f2a2ff01dd"
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



