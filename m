Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 645D16EE32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 14:12:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Feb 2014 06:12:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,505,1389772800"; d="scan'208";a="477667118"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2014 06:11:54 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 16:14:43 +0200
Message-Id: <f2aa508a9b63f0a4474431e37c65abfd213d0be8.1392819236.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1392819236.git.cristian.iorga@intel.com>
References: <cover.1392819236.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1392819236.git.cristian.iorga@intel.com>
References: <cover.1392819236.git.cristian.iorga@intel.com>
Subject: [PATCH 3/8] gstreamer1.0-plugins-base: upgrade to 1.2.3
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
X-List-Received-Date: Wed, 19 Feb 2014 14:12:02 -0000

- bugfix release.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...er1.0-plugins-base_1.2.2.bb => gstreamer1.0-plugins-base_1.2.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.2.2.bb => gstreamer1.0-plugins-base_1.2.3.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
index 5de11d6..4ef34cf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                    "
-SRC_URI[md5sum] = "ed0fd639a10d91870cc1d55727bb4f44"
-SRC_URI[sha256sum] = "fa90cf21eac0a77f9393100356aef99ae42072c31dc218d3ae2e7f86cd5ced69"
+SRC_URI[md5sum] = "17aeabfbcd232526f50c9bee375f1b97"
+SRC_URI[sha256sum] = "61edec35c270f86928bad434bd059da4efff865d1ef01bcc64ecbd903625dae1"
 S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
1.8.3.2


