Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5DF7106F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 13:10:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2014 06:10:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,424,1406617200"; d="scan'208";a="591690115"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2014 06:10:47 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 16:10:40 +0300
Message-Id: <4c46eb579ed861938ebeddad954df7fbf55dacb6.1409317786.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409317786.git.cristian.iorga@intel.com>
References: <cover.1409317786.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409317786.git.cristian.iorga@intel.com>
References: <cover.1409317786.git.cristian.iorga@intel.com>
Subject: [PATCH 1/3] iproute2: upgrade to 3.16.0
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
X-List-Received-Date: Fri, 29 Aug 2014 13:10:48 -0000

Bugfixes.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../iproute2/{iproute2_3.15.0.bb => iproute2_3.16.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.15.0.bb => iproute2_3.16.0.bb} (68%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.15.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.16.0.bb
similarity index 68%
rename from meta/recipes-connectivity/iproute2/iproute2_3.15.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_3.16.0.bb
index 7cf9115..b1a68f2 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.15.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.16.0.bb
@@ -4,8 +4,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
           "
-SRC_URI[md5sum] = "5b1711c9d16071959052e369a2682d77"
-SRC_URI[sha256sum] = "5359ed1f31839d8542a057c0c4233131ab9c28d8c41fc9c8484579d9c0b99af4"
+SRC_URI[md5sum] = "6c823b40fdcfa7b8120743349a52ac18"
+SRC_URI[sha256sum] = "1f0a8a6c0e872166f75433f5cbf9766f3002b5c2f13501b3bb8c51846a127b79"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
1.9.1


