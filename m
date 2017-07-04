Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5B65577E82
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 13:29:23 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jul 2017 06:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,307,1496127600"; d="scan'208";a="122617956"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 04 Jul 2017 06:29:25 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 631A75801CF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 06:29:24 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jul 2017 16:29:35 +0300
Message-Id: <1499174980-28223-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1499174980-28223-1-git-send-email-maxin.john@intel.com>
References: <1499174980-28223-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 06/11] gstreamer1.0-rtsp-server: upgrade 1.10.4 -> 1.12.1
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
X-List-Received-Date: Tue, 04 Jul 2017 13:29:23 -0000

Upgrade to 1.12.1

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb | 6 ------
 .../recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.1.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.1.bb

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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.1.bb
new file mode 100644
index 0000000..2e115dc
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.1.bb
@@ -0,0 +1,6 @@
+require gstreamer1.0-rtsp-server.inc
+
+SRC_URI[md5sum] = "5fdc18925caab476b4388d77b9ffbc72"
+SRC_URI[sha256sum] = "f27b9bde057e861a7705fa1263a9288a09fce8c42d8d5363c0bef4fe93994292"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
-- 
2.4.0


