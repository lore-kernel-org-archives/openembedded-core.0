Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8866AF56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 13:40:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 06:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="385466300"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2013 06:40:33 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 16:42:17 +0300
Message-Id: <b14c1c4990e540ebaee263fd631fecea7154682a.1377264698.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377264698.git.cristian.iorga@intel.com>
References: <cover.1377264698.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377264698.git.cristian.iorga@intel.com>
References: <cover.1377264698.git.cristian.iorga@intel.com>
Subject: [PATCH v3 2/4] packagegroup-self-hosted: pcmanfm and xdg-utils integration
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
X-List-Received-Date: Fri, 23 Aug 2013 13:40:49 -0000

PCManFm file manager is integrated in Build Appliance;
xdg-utils is also integrated for file
association support.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 6a0722a..2d35c16 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -38,11 +38,13 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
     hdparm \
     iptables \
     lsb \
+    xdg-utils \
     mc \
     mc-fish \
     mc-helpers \
     mc-helpers-perl \
     mc-helpers-python \
+    pcmanfm \
     parted \
     pseudo \
     screen \
-- 
1.8.1.2


