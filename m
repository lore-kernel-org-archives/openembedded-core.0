Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BDD3B6BE13
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 14:27:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2014 06:27:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,598,1384329600"; d="scan'208";a="459627811"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2014 06:27:38 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 16:30:08 +0200
Message-Id: <d65ecb7f25518cbb835e61c0613feccd298068aa.1388759244.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
Subject: [PATCH 5/8] gstreamer1.0-plugins-ugly: upgrade to 1.2.2
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
X-List-Received-Date: Fri, 03 Jan 2014 14:27:38 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...er1.0-plugins-ugly_1.2.0.bb => gstreamer1.0-plugins-ugly_1.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.2.0.bb => gstreamer1.0-plugins-ugly_1.2.2.bb} (66%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.2.bb
similarity index 66%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.2.bb
index a772877..87927f9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.2.bb
@@ -3,8 +3,8 @@ include gstreamer1.0-plugins-ugly.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
 
-SRC_URI[md5sum] = "81c97981ed373bd77bb10f2ae555c166"
-SRC_URI[sha256sum] = "e4760af4b12bf97ba0a8001cfe733d9d52160a0ad81f6c6f0d0d3a9e798626de"
+SRC_URI[md5sum] = "32f57ac91369bbb3299469cc418507d0"
+SRC_URI[sha256sum] = "4b6aac272a5be0d68f365ef6fba0f829fc5c1d1d601bb4dd9e85f5289b2b56c3"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
1.8.3.2


