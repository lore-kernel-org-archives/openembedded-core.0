Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0CE6B531
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:38:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2013 08:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,802,1367996400"; d="scan'208";a="375219348"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2013 08:38:23 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 18:39:54 +0300
Message-Id: <1323a4eb059623f52486fede72a2bf1831c256c4.1375457906.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
Subject: [PATCH 5/7] gstreamer1.0-plugins-good: upgrade to v1.0.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2013 15:38:23 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc       | 2 --
 ...er1.0-plugins-good_1.0.7.bb => gstreamer1.0-plugins-good_1.0.9.bb} | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.0.7.bb => gstreamer1.0-plugins-good_1.0.9.bb} (73%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 68bc9f1..19b16ca 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -5,8 +5,6 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
 # libid3tag
 DEPENDS += "gstreamer1.0-plugins-base gconf zlib bzip2"
 
-PR = "r1"
-
 inherit gettext gconf
 
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.9.bb
similarity index 73%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.9.bb
index b2bcd44..1b65b7d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.9.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-SRC_URI[md5sum] = "e4b1c825475a9b478fe29e8e9f34516f"
-SRC_URI[sha256sum] = "a016a3b377c86658627aef902b9204108209100b2e88fcc3b695c392af1b4035"
+SRC_URI[md5sum] = "20bb77f201b044f4ba61de167c4466d7"
+SRC_URI[sha256sum] = "cfa2e617a76f93e9ddd4ae1109297e93fb4a06b152042b996231234a72c5a5ff"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
1.8.1.2


