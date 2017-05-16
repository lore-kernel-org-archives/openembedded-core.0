Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 2400477D67
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 11:26:27 +0000 (UTC)
Received: from soylentgreen.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 4924146E59
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:26:28 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 13:26:17 +0200
Message-Id: <1494933979-5139-7-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
References: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 7/9] gstreamer1.0-rtsp-server: upgrade to version 1.12.0
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
X-List-Received-Date: Tue, 16 May 2017 11:26:27 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb | 6 ------
 .../recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.0.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.0.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb
deleted file mode 100644
index 6aa9a53..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require gstreamer1.0-rtsp-server.inc
-
-SRC_URI[md5sum] = "ef587fa6393e09bc26f884510596e305"
-SRC_URI[sha256sum] = "2f6e12fd4e3568ee190dc24e57e4c3a878971c3a3fb6904a9674404fac256de6"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.0.bb
new file mode 100644
index 0000000..7a208cc
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.0.bb
@@ -0,0 +1,6 @@
+require gstreamer1.0-rtsp-server.inc
+
+SRC_URI[md5sum] = "70815a2ca055e1d8505965b17ac79aeb"
+SRC_URI[sha256sum] = "85ae6bbe173b365ddf4859967144f1999b436531ecbe09935914bfa9f6b37652"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
-- 
2.7.4


