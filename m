Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 73CF56EFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 14:12:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Feb 2014 06:12:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,505,1389772800"; d="scan'208";a="477667129"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2014 06:11:57 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 16:14:45 +0200
Message-Id: <0e4c9c9ec0489b6fa72ebbcc9eef33eb30e408de.1392819236.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1392819236.git.cristian.iorga@intel.com>
References: <cover.1392819236.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1392819236.git.cristian.iorga@intel.com>
References: <cover.1392819236.git.cristian.iorga@intel.com>
Subject: [PATCH 5/8] gstreamer1.0-plugins-ugly: upgrade to 1.2.3
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
 ...1.0-plugins-ugly_1.2.2.bb => gstreamer1.0-plugins-ugly_1.2.3.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.2.2.bb => gstreamer1.0-plugins-ugly_1.2.3.bb} (65%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
similarity index 65%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
index 87927f9..33fd5ad 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
@@ -2,9 +2,7 @@ include gstreamer1.0-plugins-ugly.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
-
-SRC_URI[md5sum] = "32f57ac91369bbb3299469cc418507d0"
-SRC_URI[sha256sum] = "4b6aac272a5be0d68f365ef6fba0f829fc5c1d1d601bb4dd9e85f5289b2b56c3"
-
+SRC_URI[md5sum] = "7ae60e2f759f58f32af5fcdc3c9193c4"
+SRC_URI[sha256sum] = "537b0a7607eee499026388bb705b5b68985a3fd59fe22ee09accaf8cdf57eb3b"
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
1.8.3.2


