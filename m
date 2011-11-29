Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RVXD1-0003Rr-DI
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 00:35:31 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2011 15:28:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81086460"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 15:28:50 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 07:24:16 +0800
Message-Id: <1ab25f1249edf44e4496d4585f41634ef5271362.1322608823.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
Subject: [PATCH 5/8] libcroco: Upgrade to 0.6.3
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
X-List-Received-Date: Tue, 29 Nov 2011 23:35:32 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../{libcroco_0.6.2.bb => libcroco_0.6.3.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcroco/{libcroco_0.6.2.bb => libcroco_0.6.3.bb} (80%)

diff --git a/meta/recipes-support/libcroco/libcroco_0.6.2.bb b/meta/recipes-support/libcroco/libcroco_0.6.3.bb
similarity index 80%
rename from meta/recipes-support/libcroco/libcroco_0.6.2.bb
rename to meta/recipes-support/libcroco/libcroco_0.6.3.bb
index bac0c8d..e886e62 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.2.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.3.bb
@@ -15,5 +15,5 @@ inherit autotools pkgconfig gnome
 
 SRC_URI_append = " file://croco.patch;apply=yes "
 
-SRC_URI[archive.md5sum] = "1429c597aa4b75fc610ab3a542c99209"
-SRC_URI[archive.sha256sum] = "be24853f64c09b63d39e563fb0222e29bae1a33c3d9f6cbffc0bc27669371749"
+SRC_URI[archive.md5sum] = "e1e93eeff4367c896f3959af34ba20eb"
+SRC_URI[archive.sha256sum] = "746192d979263c74094d41e5ff0e19900b3d81eb2bd42c27c1c320dd94008034"
-- 
1.7.1



