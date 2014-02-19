Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 722BC6EE67
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 14:12:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Feb 2014 06:12:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,505,1389772800"; d="scan'208";a="477667125"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2014 06:11:55 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 16:14:44 +0200
Message-Id: <5793439cdd1dee42bb668d00f1a16300cf4f2f9d.1392819236.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1392819236.git.cristian.iorga@intel.com>
References: <cover.1392819236.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1392819236.git.cristian.iorga@intel.com>
References: <cover.1392819236.git.cristian.iorga@intel.com>
Subject: [PATCH 4/8] gstreamer1.0-plugins-good: upgrade to 1.2.3
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
 ...r1.0-plugins-good_1.2.2.bb => gstreamer1.0-plugins-good_1.2.3.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.2.2.bb => gstreamer1.0-plugins-good_1.2.3.bb} (73%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
similarity index 73%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
index 3ec70a4..d5e4b6a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
@@ -3,8 +3,7 @@ include gstreamer1.0-plugins-good.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
-
-SRC_URI[md5sum] = "f8a9be6c5362d13ee41b600c74e843f4"
-SRC_URI[sha256sum] = "6c090f00e8e4588f12807bd9fbb06a03b84a512c93e84d928123ee4a42228a81"
+SRC_URI[md5sum] = "1a1f96bc27ad446e559474299160a9a8"
+SRC_URI[sha256sum] = "bfb33536a515bdcc34482f64b8d9cc3e47c753878b254923b419bc2f7485e470"
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
1.8.3.2


