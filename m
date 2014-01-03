Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 612076BCEF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 14:27:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2014 06:27:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,598,1384329600"; d="scan'208";a="459627800"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2014 06:27:36 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 16:30:06 +0200
Message-Id: <2767e43334550d627e463baf6bce2a83e33516ce.1388759244.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
Subject: [PATCH 3/8] gstreamer1.0-plugins-good: upgrade to 1.2.2
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
X-List-Received-Date: Fri, 03 Jan 2014 14:27:35 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...r1.0-plugins-good_1.2.0.bb => gstreamer1.0-plugins-good_1.2.2.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.2.0.bb => gstreamer1.0-plugins-good_1.2.2.bb} (73%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.2.bb
similarity index 73%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.2.bb
index 5d54f27..3ec70a4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.2.bb
@@ -4,8 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-SRC_URI[md5sum] = "df96825d4154940fd934aa0a95b40836"
-SRC_URI[sha256sum] = "2256a6b2744ea18d8810642cf9061a2f12f4b7eba87d3fbc98004262b4f0fdfa"
-
+SRC_URI[md5sum] = "f8a9be6c5362d13ee41b600c74e843f4"
+SRC_URI[sha256sum] = "6c090f00e8e4588f12807bd9fbb06a03b84a512c93e84d928123ee4a42228a81"
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
1.8.3.2


