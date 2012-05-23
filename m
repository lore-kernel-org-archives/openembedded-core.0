Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWL-0002y6-AT
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:22:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416695"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:17 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:10:54 +0300
Message-Id: <8a4151d6d7cc1b194cd67ea9b7fc0fb2869edb25.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 02/19] libdrm: upgrade to 2.4.34
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
X-List-Received-Date: Wed, 23 May 2012 13:22:33 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../drm/{libdrm_2.4.31.bb => libdrm_2.4.34.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.31.bb => libdrm_2.4.34.bb} (62%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.31.bb b/meta/recipes-graphics/drm/libdrm_2.4.34.bb
similarity index 62%
rename from meta/recipes-graphics/drm/libdrm_2.4.31.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.34.bb
index 6aa0542..bf489cf 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.31.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.34.bb
@@ -8,5 +8,5 @@ SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
            "
 
-SRC_URI[md5sum] = "b8cf744ec113c6028fe0975b1133b649"
-SRC_URI[sha256sum] = "8fc7e0e5b2f9bf493447a4ef7adc49174a700824457774cb53c1b8f2da866af4"
+SRC_URI[md5sum] = "293cb2b31392d52caa02ab0861dfc2c9"
+SRC_URI[sha256sum] = "a468570e7c85107b7c2f8eaceeebaa8f8a0da86482618f445bb74fa0b0d0f8d0"
-- 
1.7.9.5



