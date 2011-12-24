Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1ReNU5-0004f8-Db
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Dec 2011 10:01:41 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Dec 2011 00:54:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="91099590"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 24 Dec 2011 00:54:31 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Dec 2011 17:06:26 +0800
Message-Id: <2c9897eadf140e68e188dfb19df3d17671daa433.1324717264.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <b24a112a399a16e8cde104f43faa567a0963bb30.1324717264.git.shane.wang@intel.com>
References: <b24a112a399a16e8cde104f43faa567a0963bb30.1324717264.git.shane.wang@intel.com>
In-Reply-To: <cover.1324717264.git.shane.wang@intel.com>
References: <cover.1324717264.git.shane.wang@intel.com>
Subject: [PATCH 05/13] gst-fluendo-mpegdemux: upgrade to 0.10.69
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
X-List-Received-Date: Sat, 24 Dec 2011 09:01:41 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 ...0.10.67.bb => gst-fluendo-mpegdemux_0.10.69.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mpegdemux_0.10.67.bb => gst-fluendo-mpegdemux_0.10.69.bb} (71%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.67.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.69.bb
similarity index 71%
rename from meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.67.bb
rename to meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.69.bb
index 85ebb43..d5a3a95 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.67.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.69.bb
@@ -9,5 +9,5 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
 PR = "r0"
 
-SRC_URI[md5sum] = "4ee0353eaa386f9b1c5570298d204357"
-SRC_URI[sha256sum] = "410897527f8bd8f007c9915c9450113c9e73c76f89aee3d36da825422a83a621"
+SRC_URI[md5sum] = "098105ecb68779f34097faf35214fc97"
+SRC_URI[sha256sum] = "a62a1249f05c5b6d9d0ab31a0d5cb15f2682587dec0050fc57c1102a6d76b32d"
-- 
1.7.6



