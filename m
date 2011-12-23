Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Re7xu-0004Da-Hk
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:27:26 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Dec 2011 08:20:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105499011"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga002.fm.intel.com with ESMTP; 23 Dec 2011 08:20:14 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Dec 2011 00:35:12 +0800
Message-Id: <fc664effdb36717d49b5cf9acba27a25587f19e3.1324657801.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
In-Reply-To: <cover.1324657801.git.shane.wang@intel.com>
References: <cover.1324657801.git.shane.wang@intel.com>
Subject: [PATCH 02/14] gst-plugins-ugly: upgrade to 0.10.18
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
X-List-Received-Date: Fri, 23 Dec 2011 16:27:26 -0000

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



