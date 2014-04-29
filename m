Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 308EB65D10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 08:51:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 01:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,949,1389772800"; d="scan'208";a="531450543"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 01:51:18 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 11:54:27 +0300
Message-Id: <7f0fa68196e79b85cdfc84a8a40b513a509c574c.1398761629.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398761629.git.cristian.iorga@intel.com>
References: <cover.1398761629.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1398761629.git.cristian.iorga@intel.com>
References: <cover.1398761629.git.cristian.iorga@intel.com>
Subject: [PATCH 6/7] gstreamer1.0-plugins-bad: upgrade to 1.2.4
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
X-List-Received-Date: Tue, 29 Apr 2014 08:51:18 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...amer1.0-plugins-bad_1.2.3.bb => gstreamer1.0-plugins-bad_1.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.2.3.bb => gstreamer1.0-plugins-bad_1.2.4.bb} (75%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.4.bb
similarity index 75%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.4.bb
index a19988c..c57c98f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
-SRC_URI[md5sum] = "cfd6f303c8df2740b27cc63b945decef"
-SRC_URI[sha256sum] = "595d7911a9e6207dea37200587724bdbf841b81a5eb0730118be36976684278c"
+SRC_URI[md5sum] = "16c2050716383926909664aa6c6aca2b"
+SRC_URI[sha256sum] = "984c133ec9d5d705e313d9e2bbd1472b93c6567460602a9a316578925ffe2eca"
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
1.9.1


