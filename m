Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A1BEE621B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 14:58:56 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2013 07:58:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,819,1367996400"; d="scan'208";a="277922107"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Aug 2013 07:58:55 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2013 17:59:52 +0300
Message-Id: <473f6bf9c00112d4e661857229291a90a902e962.1375714695.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375714695.git.cristian.iorga@intel.com>
References: <cover.1375714695.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1375714695.git.cristian.iorga@intel.com>
References: <cover.1375714695.git.cristian.iorga@intel.com>
Subject: [PATCH 2/4] gstreamer1.0-plugins-ugly: upgrade to v1.0.9
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
X-List-Received-Date: Mon, 05 Aug 2013 14:58:57 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc       | 2 --
 ...er1.0-plugins-ugly_1.0.7.bb => gstreamer1.0-plugins-ugly_1.0.9.bb} | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.0.7.bb => gstreamer1.0-plugins-ugly_1.0.9.bb} (66%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
index 4a54d1b..3f47949 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
@@ -5,8 +5,6 @@ LICENSE_FLAGS = "commercial"
 
 DEPENDS += "gstreamer1.0-plugins-base libid3tag"
 
-PR = "r1"
-
 inherit gettext
 
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.9.bb
similarity index 66%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.9.bb
index 7e9b8aa..30fa3a3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.9.bb
@@ -3,8 +3,8 @@ include gstreamer1.0-plugins-ugly.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
 
-SRC_URI[md5sum] = "8754edf6c3be235f232fb75ad11708bb"
-SRC_URI[sha256sum] = "b78b8cfabe322497da432a0f297dbb21862a033f95e8d4cd8f207eccb5288f2b"
+SRC_URI[md5sum] = "ea8b4e05ed5beb982762b45aba266720"
+SRC_URI[sha256sum] = "11250fe9e44b0169c3a289e981b31874b483643ed78f619682ae1644d7088379"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
1.8.1.2


