Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 18E2B6FF80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 12:21:51 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 22 Dec 2015 04:21:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,464,1444719600"; d="scan'208";a="17553600"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 22 Dec 2015 04:21:53 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 304506A4007
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 05:09:51 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 14:22:57 +0200
Message-Id: <1450786978-19993-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1450786978-19993-1-git-send-email-maxin.john@intel.com>
References: <1450786978-19993-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 6/7] gstreamer1.0-rtsp-server: upgrade to version 1.6.2
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
X-List-Received-Date: Tue, 22 Dec 2015 12:21:54 -0000

1.6.1 -> 1.6.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.1.bb | 6 ------
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.2.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.1.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.2.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.1.bb
deleted file mode 100644
index 5b53818..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include gstreamer1.0-rtsp-server.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
-
-SRC_URI[md5sum] = "fbb67bb9375ae483fcffe6390bcfbefb"
-SRC_URI[sha256sum] = "4308110981c768dcbcc92ee29c49a4f6dbd2560bb82e33b10d197e10c74bb72c"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.2.bb
new file mode 100644
index 0000000..5bdae6c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.2.bb
@@ -0,0 +1,6 @@
+include gstreamer1.0-rtsp-server.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
+
+SRC_URI[md5sum] = "a1cafefb5fc14ac5d7e7d8cdbdfa9694"
+SRC_URI[sha256sum] = "0f51f9879556c0950203c766b09a1b62f1f25b17f9a7d516e01b13ecf93c8858"
-- 
2.4.0


