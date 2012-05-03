Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQc-0006go-5E
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772209"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:46 -0700
Message-Id: <94805e38e077b3e6bba68f72dbdcaba7120ad3fa.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 27/36] xhost: Update to 1.0.5
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
X-List-Received-Date: Thu, 03 May 2012 02:06:02 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-app/{xhost_1.0.4.bb => xhost_1.0.5.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xhost_1.0.4.bb => xhost_1.0.5.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-app/xhost_1.0.4.bb b/meta/recipes-graphics/xorg-app/xhost_1.0.5.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-app/xhost_1.0.4.bb
rename to meta/recipes-graphics/xorg-app/xhost_1.0.5.bb
index 7a78f80..6dc97a1 100644
--- a/meta/recipes-graphics/xorg-app/xhost_1.0.4.bb
+++ b/meta/recipes-graphics/xorg-app/xhost_1.0.5.bb
@@ -14,5 +14,5 @@ DEPENDS += "libxmu libxau"
 PR = "${INC_PR}.0"
 PE = "1"
 
-SRC_URI[md5sum] = "2be663a0afbcc0856c1591477d5bf32a"
-SRC_URI[sha256sum] = "5e02c06caeb7a258f3621bf11459a7820cfeaf9bf269c1f8da86d7071346a594"
+SRC_URI[md5sum] = "a0fcd2cb6ddd9f378944cc6f4f83cd7c"
+SRC_URI[sha256sum] = "2870d19f3f4867ead5ba4e35bb73d1fa302be29d812c13e4195066c78d1f8850"
-- 
1.7.7.6



