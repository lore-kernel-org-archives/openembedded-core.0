Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEF-0005Jw-K0
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2011 00:29:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="739028385"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2011 00:29:37 -0700
Message-Id: <d9e265623a7ddf2a86cb76309b6280cda1bd25ef.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Wed, 20 Apr 2011 14:13:01 +0800
Date: Wed, 27 Apr 2011  0:29:37 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 17/52] gst-fluendo-mpegdemux: upgrade to version 0.10.67
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:07 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...0.10.62.bb => gst-fluendo-mpegdemux_0.10.67.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mpegdemux_0.10.62.bb => gst-fluendo-mpegdemux_0.10.67.bb} (71%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.62.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.67.bb
similarity index 71%
rename from meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.62.bb
rename to meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.67.bb
index b0b4bc2..85ebb43 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.62.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.67.bb
@@ -9,5 +9,5 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
 PR = "r0"
 
-SRC_URI[md5sum] = "de2a22760f73ba678b7cb51e9f94bc21"
-SRC_URI[sha256sum] = "c4ba24502f59849fc2f3948389213c99e23a0986506111cc22cce3a64a33ac05"
+SRC_URI[md5sum] = "4ee0353eaa386f9b1c5570298d204357"
+SRC_URI[sha256sum] = "410897527f8bd8f007c9915c9450113c9e73c76f89aee3d36da825422a83a621"
-- 
1.7.1.1



