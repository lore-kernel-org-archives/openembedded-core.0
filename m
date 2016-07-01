Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6AC1F60111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 11:13:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 01 Jul 2016 04:13:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,556,1459839600"; d="scan'208";a="1008874484"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 01 Jul 2016 04:13:39 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id C43C22C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 04:13:33 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 14:13:06 +0300
Message-Id: <1467371591-12270-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1467371591-12270-1-git-send-email-maxin.john@intel.com>
References: <1467371591-12270-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/6] remove packagegroup-core-directfb.bb
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
X-List-Received-Date: Fri, 01 Jul 2016 11:13:47 -0000

remove packagegroup-core-directfb.bb as part of moving directfb
from oe-core

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../packagegroups/packagegroup-core-directfb.bb           | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
deleted file mode 100644
index 5ead60d..0000000
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "DirectFB without X11"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-TOUCH = ' ${@bb.utils.contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
-
-RDEPENDS_${PN} = " \
-		directfb \
-		directfb-examples \
-		pango \
-		fontconfig \
-		${TOUCH} \
-"
-- 
2.4.0


