Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E98176B3D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:21:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2013 10:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,935,1367996400"; d="scan'208";a="385034921"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2013 10:21:27 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 20:23:07 +0300
Message-Id: <d88b206ccf48f085df77c7c4234253b9d1453c00.1377191890.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377191890.git.cristian.iorga@intel.com>
References: <cover.1377191890.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377191890.git.cristian.iorga@intel.com>
References: <cover.1377191890.git.cristian.iorga@intel.com>
Subject: [PATCH v2 2/4] Build Appliance: pcmanfm integration
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
X-List-Received-Date: Thu, 22 Aug 2013 17:21:27 -0000

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


