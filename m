Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOz7M-00084M-RI
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 00:30:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2012 15:21:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138453906"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 30 Apr 2012 15:21:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 15:20:50 -0700
Message-Id: <34353d4e5de13b2a286e60d82454e7de2e8988ed.1335824356.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/19] gst-fluendo-mpegdemux: upgrade to version 0.10.70
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
X-List-Received-Date: Mon, 30 Apr 2012 22:30:53 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...0.10.69.bb => gst-fluendo-mpegdemux_0.10.70.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mpegdemux_0.10.69.bb => gst-fluendo-mpegdemux_0.10.70.bb} (71%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.69.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.70.bb
similarity index 71%
rename from meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.69.bb
rename to meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.70.bb
index d5a3a95..e6a6255 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.69.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.70.bb
@@ -9,5 +9,5 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
 PR = "r0"
 
-SRC_URI[md5sum] = "098105ecb68779f34097faf35214fc97"
-SRC_URI[sha256sum] = "a62a1249f05c5b6d9d0ab31a0d5cb15f2682587dec0050fc57c1102a6d76b32d"
+SRC_URI[md5sum] = "ceb9001be71e8cbc3e97f9b46c9b611e"
+SRC_URI[sha256sum] = "b46f4a05f621e9742d22ac5c835c2f5d9aa495845b5c783475c03d1c46f47727"
-- 
1.7.7.6



