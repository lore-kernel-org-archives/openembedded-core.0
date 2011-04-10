Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q91hb-0005pv-0o
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2011 22:57:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Apr 2011 13:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,335,1299484800"; d="scan'208";a="416786115"
Received: from unknown (HELO localhost) ([10.255.12.197])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2011 13:55:33 -0700
Message-Id: <a627fa2524dfcd9c17371a01e44fd8b88e463ad9.1302468695.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302468695.git.sgw@linux.intel.com>
References: <cover.1302468695.git.sgw@linux.intel.com>
Old-Date: Sun, 10 Apr 2011 13:46:02 -0700
Date: Sun, 10 Apr 2011 13:55:33 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 1/1] gst-plugins-good: add dependcy on libsoup-2.4
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
X-List-Received-Date: Sun, 10 Apr 2011 20:57:47 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gstreamer/gst-plugins-good_0.10.26.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb
index ac47ecf..cab728d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
-	    speex"
-PR = "r1"
+	    speex libsoup-2.4"
+PR = "r2"
 
 inherit gettext
 
-- 
1.7.1.1



