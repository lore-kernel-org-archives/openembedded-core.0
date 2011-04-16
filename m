Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzPy-00069q-55
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:55:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2011 23:53:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="629634653"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga002.jf.intel.com with ESMTP; 15 Apr 2011 23:53:20 -0700
Message-Id: <14049ad43527f9a112f0ed3612662561c1e51c91.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 08:56:03 +0800
Date: Fri, 15 Apr 2011 23:53:19 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 03/58] gst-plugins-good: upgrade to version 0.10.28
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
X-List-Received-Date: Sat, 16 Apr 2011 06:55:42 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...good_0.10.26.bb => gst-plugins-good_0.10.28.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-good_0.10.26.bb => gst-plugins-good_0.10.28.bb} (82%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb
rename to meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
index cab728d..b9648e3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
 	    speex libsoup-2.4"
-PR = "r2"
+PR = "r0"
 
 inherit gettext
 
@@ -18,5 +18,5 @@ do_configure_prepend() {
 	rm ${S}/m4/lib-link.m4 || true
 }
 
-SRC_URI[md5sum] = "e1ed191adbf81edff04f348f8ce8e198"
-SRC_URI[sha256sum] = "ceb3bbea5ce18463b8fe470d34786bc846469e800305c436d799af9fe22bdcc4"
+SRC_URI[md5sum] = "6ef1588921f59d85c44ee2e49a3c97a0"
+SRC_URI[sha256sum] = "adfbce68b9fbadb7a7aeda2227af6afe1928ef025af4158726617b9d6834b028"
-- 
1.7.1.1



