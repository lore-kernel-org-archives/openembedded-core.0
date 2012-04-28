Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SO2yC-0005LI-LZ
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 10:25:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Apr 2012 01:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="136424151"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by azsmga001.ch.intel.com with ESMTP; 28 Apr 2012 01:15:51 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Apr 2012 16:12:25 +0800
Message-Id: <d475b6fc0d9e8f39a7c355826789d68eeda7e6bb.1335600691.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1335600691.git.dongxiao.xu@intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1335600691.git.dongxiao.xu@intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/8] gst-fluendo-mpegdemux: upgrade to version 0.10.70
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
X-List-Received-Date: Sat, 28 Apr 2012 08:25:32 -0000

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
1.7.4.1



