Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0E10F6E905
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 16:39:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Feb 2014 08:39:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,833,1384329600"; d="scan'208";a="482281823"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2014 08:39:38 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2014 18:42:30 +0200
Message-Id: <be1d557bca5a527e76face9c04b9c66cfff29773.1392223206.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1392223206.git.cristian.iorga@intel.com>
References: <cover.1392223206.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1392223206.git.cristian.iorga@intel.com>
References: <cover.1392223206.git.cristian.iorga@intel.com>
Subject: [PATCH v2 1/3] telepathy-mission-control: typo in connectivity switch
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
X-List-Received-Date: Wed, 12 Feb 2014 16:39:38 -0000

telepathy-mission-control connectivity switch was
mistyped, defeating its purpose.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb
index b28b9ce..fbd8ba2 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb
@@ -18,7 +18,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[upower] = "--enable-upower,--disable-upower,upower"
 
 # to select connman or nm you need to use "connectivity" and "connman" or "nm", default is to disable both
-PACKAGECONFIG[connectvity] = ",--with-connectivity=no"
+PACKAGECONFIG[connectivity] = ",--with-connectivity=no"
 PACKAGECONFIG[connman] = "--with-connectivity=connman,,connman"
 PACKAGECONFIG[nm] = "--with-connectivity=nm,,networkmanager"
 
-- 
1.8.3.2


