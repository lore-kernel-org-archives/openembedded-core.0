Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1ReNQz-00049J-48
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Dec 2011 09:58:29 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Dec 2011 00:51:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89951658"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga001.jf.intel.com with ESMTP; 24 Dec 2011 00:51:21 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Dec 2011 17:06:25 +0800
Message-Id: <100daa853c8d0ffd2d4bbb2333ece531f9eabba0.1324717264.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <b24a112a399a16e8cde104f43faa567a0963bb30.1324717264.git.shane.wang@intel.com>
References: <b24a112a399a16e8cde104f43faa567a0963bb30.1324717264.git.shane.wang@intel.com>
In-Reply-To: <cover.1324717264.git.shane.wang@intel.com>
References: <cover.1324717264.git.shane.wang@intel.com>
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
X-List-Received-Date: Sat, 24 Dec 2011 08:58:29 -0000

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



