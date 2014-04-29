Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2E34065D21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 08:51:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 01:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,949,1389772800"; d="scan'208";a="531450530"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 01:51:17 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 11:54:26 +0300
Message-Id: <c7bd1fa823f19133211193a718cd14bb0ebd7927.1398761629.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398761629.git.cristian.iorga@intel.com>
References: <cover.1398761629.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1398761629.git.cristian.iorga@intel.com>
References: <cover.1398761629.git.cristian.iorga@intel.com>
Subject: [PATCH 5/7] gstreamer1.0-plugins-good: upgrade to 1.2.4
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
X-List-Received-Date: Tue, 29 Apr 2014 08:51:17 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...er1.0-plugins-good_1.2.3.bb => gstreamer1.0-plugins-good_1.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.2.3.bb => gstreamer1.0-plugins-good_1.2.4.bb} (73%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.4.bb
similarity index 73%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.4.bb
index d5e4b6a..93813a0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.4.bb
@@ -3,7 +3,7 @@ include gstreamer1.0-plugins-good.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
-SRC_URI[md5sum] = "1a1f96bc27ad446e559474299160a9a8"
-SRC_URI[sha256sum] = "bfb33536a515bdcc34482f64b8d9cc3e47c753878b254923b419bc2f7485e470"
+SRC_URI[md5sum] = "8aac024ee0cd98b67a3066ad31d8c677"
+SRC_URI[sha256sum] = "c9c90368393c2e5e78387e95c02ce7b19f48e793bba6d8547f2c4b51c6f420d3"
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
1.9.1


