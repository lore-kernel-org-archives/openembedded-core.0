Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE9860809
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 14:01:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jul 2014 07:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,601,1400050800"; d="scan'208";a="557488947"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2014 07:01:55 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jul 2014 17:01:44 +0300
Message-Id: <1404482504-25076-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] builder: removed setting of BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Fri, 04 Jul 2014 14:02:00 -0000

This values are now adjusted automatically, based on underlying
hardware CPU cores count, so no need to enable manually.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-graphics/builder/files/builder_hob_start.sh | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh b/meta/recipes-graphics/builder/files/builder_hob_start.sh
index 42c93dd..65a68ee 100644
--- a/meta/recipes-graphics/builder/files/builder_hob_start.sh
+++ b/meta/recipes-graphics/builder/files/builder_hob_start.sh
@@ -30,10 +30,6 @@ fi
 cd /home/builder/poky
 . ./oe-init-build-env
 
-#uncomment the settings for BB_NUMBER_THREADS and PARALLEL_MAKE
-sed -i 's/^#BB_NUMBER_THREADS =/BB_NUMBER_THREADS =/g' conf/local.conf
-sed -i 's/^#PARALLEL_MAKE =/PARALLEL_MAKE =/g' conf/local.conf
-
 hob &
 
 matchbox-terminal&
-- 
1.9.1


