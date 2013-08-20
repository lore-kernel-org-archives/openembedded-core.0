Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C74766B7CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 16:04:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2013 09:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,921,1367996400"; d="scan'208";a="389202972"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2013 09:03:53 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 19:05:34 +0300
Message-Id: <c3d72ead7aeef67db0792738b194891ae8ed3871.1377014441.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377014441.git.cristian.iorga@intel.com>
References: <cover.1377014441.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377014441.git.cristian.iorga@intel.com>
References: <cover.1377014441.git.cristian.iorga@intel.com>
Subject: [PATCH 1/3] Build Appliance: pcmanfm integration
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
X-List-Received-Date: Tue, 20 Aug 2013 16:04:34 -0000

PCManFm file manager is integrated in Build Appliance
xprop, xdg-utils are also integrated for file
association support.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 6a0722a..b58d238 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -38,11 +38,14 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
     hdparm \
     iptables \
     lsb \
+    xprop \
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


