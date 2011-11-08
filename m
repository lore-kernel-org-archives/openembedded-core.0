Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNrMF-0002iP-Ir
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:29:20 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Nov 2011 11:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="34587142"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 11:23:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 11:22:48 -0800
Message-Id: <3326df3ba8bcf848322c2a7b3782aa204825200e.1320780004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/17] distro_tracking_fields.inc: update to libarchive to 2.8.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Nov 2011 19:29:21 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Change the status of libarchive.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index e2bad6b..4212e7a 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -4615,7 +4615,10 @@ RECIPE_MAINTAINER_pn-libx11-diet = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 RECIPE_STATUS_pn-directfb = "red"
 RECIPE_MAINTAINER_pn-directfb = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
-RECIPE_STATUS_pn-libarchive  = "red"
+RECIPE_STATUS_pn-libarchive  = "green"
+RECIPE_LATEST_VERSION_pn-libarchive = "2.8.5"
+RECIPE_LATEST_RELEASE_DATE_pn-libarchive = "Sept 3, 2011"
+RECIPE_LAST_UPDATE_pn-libarchive = "Nov 7, 2011"
 RECIPE_MAINTAINER_pn-libarchive  = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
 RECIPE_STATUS_pn-xserver-kdrive  = "red"
-- 
1.7.6.4



