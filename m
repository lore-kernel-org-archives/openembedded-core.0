Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7E8U-0000ts-QG
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 23:50:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Apr 2011 14:48:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,307,1299484800"; d="scan'208";a="624085408"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2011 14:48:00 -0700
Message-Id: <23fdb7fffa0e21931f4d6ddd2b02a0a44a450a61.1302039585.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302039585.git.sgw@linux.intel.com>
References: <cover.1302039585.git.sgw@linux.intel.com>
Old-Date: Fri, 1 Apr 2011 10:54:33 +0800
Date: Tue, 05 Apr 2011 14:48:00 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 2/6] gst-meta-base: Support http/https remote streams
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Apr 2011 21:50:07 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Add libgstsouphttpsrc library to support remote stream playing via
http/https protocols.

This solves the mp4 playing issue by regel from mediatomb file server.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../gstreamer/gst-meta-base_0.10.bb                |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
index 8d5e590..ada7f69 100644
--- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${POKYBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${POKYBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 
-PR = "r9"
+PR = "r10"
 
 PACKAGES = "\
     gst-meta-base \
@@ -29,7 +29,8 @@ RDEPENDS_gst-meta-base = "\
     gst-plugins-base-typefindfunctions \
     gst-plugins-base-videoscale \
     gst-plugins-base-ffmpegcolorspace \
-    gst-plugins-good-autodetect"
+    gst-plugins-good-autodetect \
+    gst-plugins-good-souphttpsrc"
 
 
 RDEPENDS_gst-meta-audio = "\
-- 
1.7.1



