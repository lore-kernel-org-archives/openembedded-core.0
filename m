Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2696CAA0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 07:13:36 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Sep 2013 00:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,983,1371106800"; d="scan'208";a="365760171"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 26 Sep 2013 00:13:37 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 10:15:35 +0300
Message-Id: <dba213991f6867ed7fffff0bdbf49813ddda4215.1380179531.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1380179531.git.cristian.iorga@intel.com>
References: <cover.1380179531.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1380179531.git.cristian.iorga@intel.com>
References: <cover.1380179531.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] packagegroup-self-hosted: add leafpad text editor
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
X-List-Received-Date: Thu, 26 Sep 2013 07:13:36 -0000

A text editor is needed to examine log files.

Part of [YOCTO #4727] fix.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 90ec74e..de2a076 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -44,6 +44,7 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
     mc-helpers \
     mc-helpers-perl \
     mc-helpers-python \
+    leafpad \
     midori \
     pcmanfm \
     parted \
-- 
1.8.1.2


