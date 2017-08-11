Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id E65BB785E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 21:37:10 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 98B2E4CB5A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 23:37:11 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 23:36:57 +0200
Message-Id: <1502487421-18235-7-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502487421-18235-1-git-send-email-dv@pseudoterminal.org>
References: <1502487421-18235-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH v2 06/10] gstreamer1.0-rtsp-server: upgrade to version 1.12.2
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
X-List-Received-Date: Fri, 11 Aug 2017 21:37:11 -0000

From: Maxin John <maxin.john@intel.com>

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb | 6 ------
 .../recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb

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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb
new file mode 100644
index 0000000..2426cca
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb
@@ -0,0 +1,6 @@
+require gstreamer1.0-rtsp-server.inc
+
+SRC_URI[md5sum] = "022757cab183f5b970086e9101c60a98"
+SRC_URI[sha256sum] = "d8ba9264e8ae6e440293328e759e40456f161aa66077b3143dd07581136190b3"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
-- 
2.7.4


