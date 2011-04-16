Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQ1-00069x-5l
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:55:45 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Apr 2011 23:53:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="679865209"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2011 23:53:24 -0700
Message-Id: <6f5b8205805ac46732a77dae3ee32372ca0d6fc7.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 10:03:27 +0800
Date: Fri, 15 Apr 2011 23:53:23 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 05/58] gst-plugins-ugly: upgrade to version 0.10.17
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
X-List-Received-Date: Sat, 16 Apr 2011 06:55:45 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...ugly_0.10.16.bb => gst-plugins-ugly_0.10.17.bb} |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-ugly_0.10.16.bb => gst-plugins-ugly_0.10.17.bb} (85%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.16.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
similarity index 85%
rename from meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.16.bb
rename to meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
index 7dda685..76e00a5 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.16.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
@@ -17,3 +17,6 @@ do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
 	rm ${S}/m4/lib-link.m4 || true
 }
+
+SRC_URI[md5sum] = "504ed6508c3a8f035a2002ed69d68506"
+SRC_URI[sha256sum] = "0cbd4aa8dceafea21ddd547dfde686a8836f68ba547afa5575a52b64cfa0b369"
-- 
1.7.1.1



