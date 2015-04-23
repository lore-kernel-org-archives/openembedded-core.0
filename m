Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1C02573D0F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 14:39:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 23 Apr 2015 07:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,631,1422950400"; d="scan'208";a="484703332"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2015 07:38:54 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 17:38:36 +0300
Message-Id: <1a55976003e57036ced5e47dd031575508dfc87b.1429799661.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429799661.git.cristian.iorga@intel.com>
References: <cover.1429799661.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1429799661.git.cristian.iorga@intel.com>
References: <cover.1429799661.git.cristian.iorga@intel.com>
Subject: [PATCH v5 4/4] bluez5: don't exclude from world builds
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
X-List-Received-Date: Thu, 23 Apr 2015 14:39:11 -0000

As BlueZ5 will be the default Bluetooth stack,
don't exclude it from world builds.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 67aafbb..bf845a8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -100,5 +100,3 @@ FILES_${PN}-dbg += "\
 RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
 
 SYSTEMD_SERVICE_${PN} = "bluetooth.service"
-
-EXCLUDE_FROM_WORLD = "1"
-- 
2.1.0


