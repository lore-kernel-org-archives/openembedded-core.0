Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQh-0006gd-DF
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:06:03 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772222"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:50 -0700
Message-Id: <8cafa8da894fa7549a38bb683025ced30c0d5f20.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 31/36] xkbcomp: Update to 1.2.4
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
X-List-Received-Date: Thu, 03 May 2012 02:07:14 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{xkbcomp_1.2.3.bb => xkbcomp_1.2.4.bb}         |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.2.3.bb => xkbcomp_1.2.4.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.2.4.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.2.4.bb
index f5f0870..5c274b1 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.2.4.bb
@@ -13,8 +13,7 @@ PR = "${INC_PR}.0"
 
 DEPENDS += "libxkbfile"
 
-SRC_URI[md5sum] = "35622a497894c1cff9182d42696c3e27"
-SRC_URI[sha256sum] = "7598e8f44e2643c96d2e37aa44f344f6c48f1a262fc9207154353195b760cb16"
-
 BBCLASSEXTEND = "native"
 
+SRC_URI[md5sum] = "a0fc1ac3fc4fe479ade09674347c5aa0"
+SRC_URI[sha256sum] = "91d0c9ab445d21dfe1892dbae5ae5264f39bae68223dd092ffc547c9450b5a2d"
-- 
1.7.7.6



