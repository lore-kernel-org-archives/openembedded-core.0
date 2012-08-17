Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T2Poo-0002UW-Vl
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 18:54:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Aug 2012 09:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="182053207"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2012 09:41:25 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 18:46:11 +0300
Message-Id: <1345218371-15230-3-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345218371-15230-1-git-send-email-constantinx.musca@intel.com>
References: <1345218371-15230-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 2/2] gst-fluendo-mpegdemux: upgrade to 0.10.71
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
X-List-Received-Date: Fri, 17 Aug 2012 16:54:43 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 ...0.10.70.bb => gst-fluendo-mpegdemux_0.10.71.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mpegdemux_0.10.70.bb => gst-fluendo-mpegdemux_0.10.71.bb} (71%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.70.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.71.bb
similarity index 71%
rename from meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.70.bb
rename to meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.71.bb
index e6a6255..b939eff 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.70.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.71.bb
@@ -9,5 +9,5 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
 PR = "r0"
 
-SRC_URI[md5sum] = "ceb9001be71e8cbc3e97f9b46c9b611e"
-SRC_URI[sha256sum] = "b46f4a05f621e9742d22ac5c835c2f5d9aa495845b5c783475c03d1c46f47727"
+SRC_URI[md5sum] = "a7b5152cd73fd0f9fa653fca93c82bd7"
+SRC_URI[sha256sum] = "3be3907e860bce4cc8bee0c70e4b28e91d97f4037e611473b8c9bb954b4de4f9"
-- 
1.7.9.5



