Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 940146BBB8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 14:27:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2014 06:27:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,598,1384329600"; d="scan'208";a="459627797"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2014 06:27:35 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 16:30:05 +0200
Message-Id: <ec5154e6aa3316b8ad3815be38f4cee6fe4ac6b4.1388759244.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
Subject: [PATCH 2/8] gstreamer1.0-plugins-base: upgrade to 1.2.2
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
 ...r1.0-plugins-base_1.2.0.bb => gstreamer1.0-plugins-base_1.2.2.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.2.0.bb => gstreamer1.0-plugins-base_1.2.2.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.2.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.2.bb
index cc4d11b..5de11d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.2.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                    "
-SRC_URI[md5sum] = "d0f7bb7f6c781be127902bff89b87c5c"
-SRC_URI[sha256sum] = "8656e20bf4b675e5696fb4af193793351926d428ca02826c5667a6384729a45d"
-
+SRC_URI[md5sum] = "ed0fd639a10d91870cc1d55727bb4f44"
+SRC_URI[sha256sum] = "fa90cf21eac0a77f9393100356aef99ae42072c31dc218d3ae2e7f86cd5ced69"
 S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
1.8.3.2


