Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5780871212
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 18:54:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2014 11:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,425,1406617200"; d="scan'208";a="595239776"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 29 Aug 2014 11:54:05 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 21:53:49 +0300
Message-Id: <1bdd29b08523d5b1519db49a8e382ee8476c9da0.1409338378.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409338378.git.cristian.iorga@intel.com>
References: <cover.1409338378.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409338378.git.cristian.iorga@intel.com>
References: <cover.1409338378.git.cristian.iorga@intel.com>
Subject: [PATCH 7/7] gstreamer1.0-plugins-ugly: upgrade to 1.4.1
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
X-List-Received-Date: Fri, 29 Aug 2014 18:54:56 -0000

Bugfix release.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...er1.0-plugins-ugly_1.4.0.bb => gstreamer1.0-plugins-ugly_1.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.4.0.bb => gstreamer1.0-plugins-ugly_1.4.1.bb} (66%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.1.bb
similarity index 66%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.1.bb
index 9035d2d..6d63ba6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.1.bb
@@ -2,7 +2,7 @@ include gstreamer1.0-plugins-ugly.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
-SRC_URI[md5sum] = "558146cb5ec8b313afe2113aafc3da85"
-SRC_URI[sha256sum] = "5314bb60f13d1a7b9c6317df73813af5f3f15a62c7c186b816b0024b5c61744d"
+SRC_URI[md5sum] = "316974af949ca4654efee704a0164076"
+SRC_URI[sha256sum] = "25440435ac4ed795d213f2420a0e7355e4a2e2e76d1f9d020b2073f815e8b071"
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
1.9.1


