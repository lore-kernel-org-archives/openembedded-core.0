Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LEV-000168-SO
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:41:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Mar 2012 17:32:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129564359"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2012 17:32:42 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:17 +0800
Message-Id: <1433374cd8c54510794bde29f1c40e11d6752628.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 20/60] gst-plugins-ugly: upgrade to 0.10.19
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
X-List-Received-Date: Fri, 16 Mar 2012 00:41:28 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 ...ugly_0.10.18.bb => gst-plugins-ugly_0.10.19.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-ugly_0.10.18.bb => gst-plugins-ugly_0.10.19.bb} (84%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
rename to meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
index 7f87cd3..233778d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/mpegstream/gstmpegparse.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9"
 
 DEPENDS += "gst-plugins-base libid3tag libmad mpeg2dec liba52 lame"
-PR = "r1"
+PR = "r0"
 
 inherit gettext
 
@@ -19,5 +19,5 @@ do_configure_prepend() {
 	rm ${S}/m4/lib-link.m4 || true
 }
 
-SRC_URI[md5sum] = "04a7009a4efea2844075949c111f5e4d"
-SRC_URI[sha256sum] = "f9c16748cd9269fae86422d8254a579fa6db073797a5a19a9dc5c72cd66c8e14"
+SRC_URI[md5sum] = "1d81c593e22a6cdf0f2b4f57eae93df2"
+SRC_URI[sha256sum] = "1ca90059275c0f5dca71d4d1601a8f429b7852baed0723e820703b977e2c8df0"
-- 
1.7.6



