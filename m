Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PwHdr-0001vL-Vt
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Mar 2011 18:21:16 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Mar 2011 09:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,272,1297065600"; d="scan'208";a="609661646"
Received: from unknown (HELO localhost) ([10.255.12.181])
	by orsmga002.jf.intel.com with ESMTP; 06 Mar 2011 09:19:39 -0800
Message-Id: <c6b0c5720fa0fc2ba7a6792b7f52faad38dd47dc.1299431945.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299431945.git.sgw@linux.intel.com>
References: <cover.1299431945.git.sgw@linux.intel.com>
Old-Date: Sun, 6 Mar 2011 09:12:25 -0800
Date: Sun, 06 Mar 2011  9:19:39 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 1/2] gst-plugins: Added hal to DEPENDS
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
X-List-Received-Date: Sun, 06 Mar 2011 17:21:16 -0000

From: Saul Wold <sgw@linux.intel.com>

Fixes [YOCTO #810]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index 4edca95..d1abd36 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 PRIORITY = "optional"
-DEPENDS = "gstreamer"
+DEPENDS = "gstreamer hal"
 
 inherit autotools pkgconfig
 
-- 
1.7.1.1



