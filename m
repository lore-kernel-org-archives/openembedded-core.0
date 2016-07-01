Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BF33B60621
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 11:13:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 01 Jul 2016 04:13:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,556,1459839600"; d="scan'208";a="1013430412"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jul 2016 04:13:40 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id B4C2A2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 04:13:35 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 14:13:07 +0300
Message-Id: <1467371591-12270-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1467371591-12270-1-git-send-email-maxin.john@intel.com>
References: <1467371591-12270-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/6] remove core-image-directfb.bb
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
X-List-Received-Date: Fri, 01 Jul 2016 11:13:39 -0000

remove core-image-directfb.bb as part of moving directfb
from oe-core

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/images/core-image-directfb.bb | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta/recipes-graphics/images/core-image-directfb.bb

diff --git a/meta/recipes-graphics/images/core-image-directfb.bb b/meta/recipes-graphics/images/core-image-directfb.bb
deleted file mode 100644
index c6ce658..0000000
--- a/meta/recipes-graphics/images/core-image-directfb.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "An image that uses DirectFB instead of X11"
-LICENSE = "MIT"
-
-inherit core-image distro_features_check
-
-REQUIRED_DISTRO_FEATURES = "directfb"
-CONFLICT_DISTRO_FEATURES = "x11"
-
-IMAGE_INSTALL += "\
-	${CORE_IMAGE_BASE_INSTALL} \
-	packagegroup-core-full-cmdline \
-	packagegroup-core-directfb \
-"
-- 
2.4.0


