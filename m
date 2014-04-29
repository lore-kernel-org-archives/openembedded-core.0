Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 36CE665D25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 08:51:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 01:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,949,1389772800"; d="scan'208";a="531450550"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 01:51:19 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 11:54:28 +0300
Message-Id: <809e8466daede4602ebef7dd8b6dfe3eb73808ce.1398761629.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398761629.git.cristian.iorga@intel.com>
References: <cover.1398761629.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1398761629.git.cristian.iorga@intel.com>
References: <cover.1398761629.git.cristian.iorga@intel.com>
Subject: [PATCH 7/7] gstreamer1.0-plugins-ugly: upgrade to 1.2.4
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
X-List-Received-Date: Tue, 29 Apr 2014 08:51:19 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...er1.0-plugins-ugly_1.2.3.bb => gstreamer1.0-plugins-ugly_1.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.2.3.bb => gstreamer1.0-plugins-ugly_1.2.4.bb} (66%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.4.bb
similarity index 66%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.4.bb
index 33fd5ad..dd5cb4e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.4.bb
@@ -2,7 +2,7 @@ include gstreamer1.0-plugins-ugly.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
-SRC_URI[md5sum] = "7ae60e2f759f58f32af5fcdc3c9193c4"
-SRC_URI[sha256sum] = "537b0a7607eee499026388bb705b5b68985a3fd59fe22ee09accaf8cdf57eb3b"
+SRC_URI[md5sum] = "c87a27db498bb736f6c266198657ea74"
+SRC_URI[sha256sum] = "4ef6f76a47d57b8385d457c7b620b4c28fc041ab1d7c2e3e2f5f05b12b988ea8"
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
1.9.1


