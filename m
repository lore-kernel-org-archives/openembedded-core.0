Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rppsh-0008Cn-Ly
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 00:34:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Jan 2012 15:26:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59668894"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.34])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jan 2012 15:26:38 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2012 15:26:35 -0800
Message-Id: <eb2a8a7f956693335635accf6cdc957d90d72926.1327447344.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1327447344.git.josh@linux.intel.com>
References: <cover.1327447344.git.josh@linux.intel.com>
In-Reply-To: <cover.1327447344.git.josh@linux.intel.com>
References: <cover.1327447344.git.josh@linux.intel.com>
Subject: [PATCH 3/4] cogl: update upstream status for build_for_armv4t.patch
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
X-List-Received-Date: Tue, 24 Jan 2012 23:34:28 -0000

This has patch has been merged into upstreams git repository and will be
available in the next stable release.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../clutter/cogl/build_for_armv4t.patch            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/clutter/cogl/build_for_armv4t.patch b/meta/recipes-graphics/clutter/cogl/build_for_armv4t.patch
index 3635085..003e9ff 100644
--- a/meta/recipes-graphics/clutter/cogl/build_for_armv4t.patch
+++ b/meta/recipes-graphics/clutter/cogl/build_for_armv4t.patch
@@ -3,7 +3,7 @@ check this to turn off the use of 'clz' instructions, which otherwise would
 cause compile errors like "selected processor does not support ARM mode 
 `clz r3,r0'". 
 
-Upstream-Status: Submitted
+Upstream-Status: Accepted (should be in the next cogl stable release)
 
 Signed-off-by: Wolfgang Denk <wd@denx.de>
 Signed-off-by: Joshua Lock <josh@linux.intel.com>
-- 
1.7.7.6



