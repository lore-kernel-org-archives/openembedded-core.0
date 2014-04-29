Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 42DDE65D01
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 08:51:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 01:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,949,1389772800"; d="scan'208";a="531450523"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 01:51:16 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 11:54:25 +0300
Message-Id: <8396f7802851eb9fad5f56f1273a33bdeb0d10ae.1398761629.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398761629.git.cristian.iorga@intel.com>
References: <cover.1398761629.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1398761629.git.cristian.iorga@intel.com>
References: <cover.1398761629.git.cristian.iorga@intel.com>
Subject: [PATCH 4/7] gstreamer1.0-plugins-base: upgrade to 1.2.4
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
X-List-Received-Date: Tue, 29 Apr 2014 08:51:16 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...er1.0-plugins-base_1.2.3.bb => gstreamer1.0-plugins-base_1.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.2.3.bb => gstreamer1.0-plugins-base_1.2.4.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb
index 4ef34cf..ed8babe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                    "
-SRC_URI[md5sum] = "17aeabfbcd232526f50c9bee375f1b97"
-SRC_URI[sha256sum] = "61edec35c270f86928bad434bd059da4efff865d1ef01bcc64ecbd903625dae1"
+SRC_URI[md5sum] = "278e0a1872ecb981e91830b2cb7f3e98"
+SRC_URI[sha256sum] = "4d6273dc3f5a94bcc53ccfe0711cfddd49e31371d1136bf62fa1ecc604fc6550"
 S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
1.9.1


