Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RfBtn-0004iM-Uk
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Dec 2011 15:51:36 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Dec 2011 06:44:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100391045"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga001.fm.intel.com with ESMTP; 26 Dec 2011 06:44:23 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Dec 2011 22:56:24 +0800
Message-Id: <7dd585fc39a6438e6a341c7a7e5c5523bade52de.1324911023.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <e996720b98f6979a4ee65d26b942ec3fd2ab9371.1324911023.git.shane.wang@intel.com>
References: <e996720b98f6979a4ee65d26b942ec3fd2ab9371.1324911023.git.shane.wang@intel.com>
In-Reply-To: <cover.1324911023.git.shane.wang@intel.com>
References: <cover.1324911023.git.shane.wang@intel.com>
Subject: [PATCH 04/13] gst-fluendo-mp3: upgrade to 0.10.16
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
X-List-Received-Date: Mon, 26 Dec 2011 14:51:36 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 ...o-mp3_0.10.15.bb => gst-fluendo-mp3_0.10.16.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mp3_0.10.15.bb => gst-fluendo-mp3_0.10.16.bb} (61%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.15.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
similarity index 61%
rename from meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.15.bb
rename to meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
index da9cb2b..5975513 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.15.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
@@ -9,5 +9,5 @@ PR = "r0"
 
 DESCRIPTION = "Fluendo closed-format mp3 GStreamer plug-in"
 
-SRC_URI[md5sum] = "dac7a9fa988650ec1be6c4c743a86cd4"
-SRC_URI[sha256sum] = "b444e6f3f87f5b819c1327ff3ed1afe9c09c195ba79ecf7e7409b375fa81cb06"
+SRC_URI[md5sum] = "33df57590e3f21f945fe7bace6146fa0"
+SRC_URI[sha256sum] = "12dbd307b25fed502a52666a9c956230da09ee140a18d987452492393340f442"
-- 
1.7.6



