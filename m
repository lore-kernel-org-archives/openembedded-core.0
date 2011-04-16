Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzPr-00069F-5j
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:55:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Apr 2011 23:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="734219485"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2011 23:53:17 -0700
Message-Id: <c52b9d7b277b949210f013a15859f6ffb51b3527.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Tue, 12 Apr 2011 16:39:18 +0800
Date: Fri, 15 Apr 2011 23:53:16 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 02/58] gst-plugins-base: upgrade to version 0.10.32
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
X-List-Received-Date: Sat, 16 Apr 2011 06:55:35 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../gst-plugins-base-tremor.patch                  |    2 ++
 ...base_0.10.31.bb => gst-plugins-base_0.10.32.bb} |    6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-base-0.10.31 => gst-plugins-base-0.10.32}/gst-plugins-base-tremor.patch (94%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-base_0.10.31.bb => gst-plugins-base_0.10.32.bb} (86%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.31/gst-plugins-base-tremor.patch b/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.32/gst-plugins-base-tremor.patch
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.31/gst-plugins-base-tremor.patch
rename to meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.32/gst-plugins-base-tremor.patch
index a6494fd..224bf1a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.31/gst-plugins-base-tremor.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.32/gst-plugins-base-tremor.patch
@@ -1,6 +1,8 @@
 Remove -DTREMOR option since Tremor has dropped its internal
 libogg2, and gst-plugins-base has dependency on that.
 
+Upstream-Status: Inappropriate [configuration]
+
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 
 diff -ruN gst-plugins-base-0.10.30-orig/ext/vorbis/Makefile.am gst-plugins-base-0.10.30/ext/vorbis/Makefile.am
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
similarity index 86%
rename from meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.31.bb
rename to meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
index 8bf243e..2d09c6c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
@@ -12,10 +12,10 @@ RDEPENDS_${PN} += "gnome-vfs-plugin-file gnome-vfs-plugin-http gnome-vfs-plugin-
 
 SRC_URI += " file://gst-plugins-base-tremor.patch"
 
-SRC_URI[md5sum] = "9baa0d87e81c88b2477a3554ab629c46"
-SRC_URI[sha256sum] = "abb006c78222cfb69d31e983268d1d5219e9d4e0da24c6c4cd687968af7a33bd"
+SRC_URI[md5sum] = "2920af2b3162f3d9fbaa7fabc8ed4d38"
+SRC_URI[sha256sum] = "e9aabfac83f6480896da0686e9c911989f896fbad634821b7771ed84a446172b"
 
-PR = "r1"
+PR = "r0"
 
 inherit gettext
 
-- 
1.7.1.1



