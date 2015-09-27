Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id A56C3757AB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Sep 2015 21:48:24 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 6C0F1208A8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Sep 2015 23:48:22 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Sep 2015 23:48:11 +0200
Message-Id: <1443390491-23728-7-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
References: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 7/7] gstreamer1.0-rtsp-server: upgrade to version 1.6.0
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
X-List-Received-Date: Sun, 27 Sep 2015 21:48:24 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb | 6 ------
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.0.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.0.bb

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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.0.bb
new file mode 100644
index 0000000..4746230
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.0.bb
@@ -0,0 +1,6 @@
+include gstreamer1.0-rtsp-server.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
+
+SRC_URI[md5sum] = "c8162f67c184663c1e1aa3ce872ef1e3"
+SRC_URI[sha256sum] = "1e1526d700ba36df5b30c887ccc37179903255022e57f716afb3ef172fe0746f"
-- 
1.9.1


