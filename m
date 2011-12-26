Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RfBto-0004iO-8q
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Dec 2011 15:51:36 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Dec 2011 06:44:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="91609805"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 26 Dec 2011 06:44:20 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Dec 2011 22:56:22 +0800
Message-Id: <9452abf1be4a8741d5cc619e534974aed141a2b9.1324911023.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <e996720b98f6979a4ee65d26b942ec3fd2ab9371.1324911023.git.shane.wang@intel.com>
References: <e996720b98f6979a4ee65d26b942ec3fd2ab9371.1324911023.git.shane.wang@intel.com>
In-Reply-To: <cover.1324911023.git.shane.wang@intel.com>
References: <cover.1324911023.git.shane.wang@intel.com>
Subject: [PATCH 02/13] gst-plugins-ugly: upgrade to 0.10.18
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
 ...ugly_0.10.17.bb => gst-plugins-ugly_0.10.18.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-ugly_0.10.17.bb => gst-plugins-ugly_0.10.18.bb} (84%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
rename to meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
index 26bc0ba..2d7fa91 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/mpegstream/gstmpegparse.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9"
 
 DEPENDS += "gst-plugins-base libid3tag libmad mpeg2dec liba52 lame"
-PR = "r2"
+PR = "r0"
 
 inherit gettext
 
@@ -18,5 +18,5 @@ do_configure_prepend() {
 	rm ${S}/m4/lib-link.m4 || true
 }
 
-SRC_URI[md5sum] = "504ed6508c3a8f035a2002ed69d68506"
-SRC_URI[sha256sum] = "0cbd4aa8dceafea21ddd547dfde686a8836f68ba547afa5575a52b64cfa0b369"
+SRC_URI[md5sum] = "04a7009a4efea2844075949c111f5e4d"
+SRC_URI[sha256sum] = "f9c16748cd9269fae86422d8254a579fa6db073797a5a19a9dc5c72cd66c8e14"
-- 
1.7.6



