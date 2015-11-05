Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA08770C5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 08:32:23 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 5DA8F239DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 09:32:19 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 09:32:12 +0100
Message-Id: <1446712332-17113-7-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1446712332-17113-1-git-send-email-dv@pseudoterminal.org>
References: <1446712332-17113-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 7/7] gstreamer1.0-rtsp-server: upgrade to version 1.6.1
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
X-List-Received-Date: Thu, 05 Nov 2015 08:32:23 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb | 6 ------
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.1.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.1.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb
deleted file mode 100644
index bb9b42b..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include gstreamer1.0-rtsp-server.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
-
-SRC_URI[md5sum] = "a9f9b8899ec7ab33663cda7627db40d3"
-SRC_URI[sha256sum] = "3089254bd31b7c1f1cf2c034a3b3551f92878f9e3cab65cef3a901a04c0f1d37"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.1.bb
new file mode 100644
index 0000000..5b53818
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.1.bb
@@ -0,0 +1,6 @@
+include gstreamer1.0-rtsp-server.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
+
+SRC_URI[md5sum] = "fbb67bb9375ae483fcffe6390bcfbefb"
+SRC_URI[sha256sum] = "4308110981c768dcbcc92ee29c49a4f6dbd2560bb82e33b10d197e10c74bb72c"
-- 
2.5.0


