Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Slx78-00036R-TW
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:01:35 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2012 23:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118373964"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Jul 2012 23:50:34 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 09:50:21 +0300
Message-Id: <1341298228-4412-5-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
References: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 04/10] libdrm: upgrade to 2.4.35
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
X-List-Received-Date: Tue, 03 Jul 2012 07:01:35 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../drm/{libdrm_2.4.34.bb => libdrm_2.4.35.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.34.bb => libdrm_2.4.35.bb} (62%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.34.bb b/meta/recipes-graphics/drm/libdrm_2.4.35.bb
similarity index 62%
rename from meta/recipes-graphics/drm/libdrm_2.4.34.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.35.bb
index bf489cf..3677b8d 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.34.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.35.bb
@@ -8,5 +8,5 @@ SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
            "
 
-SRC_URI[md5sum] = "293cb2b31392d52caa02ab0861dfc2c9"
-SRC_URI[sha256sum] = "a468570e7c85107b7c2f8eaceeebaa8f8a0da86482618f445bb74fa0b0d0f8d0"
+SRC_URI[md5sum] = "a40f5293dc0a7b49d2a1e959d7d60194"
+SRC_URI[sha256sum] = "c390aee132f05910edb09398b70e108c6b53f9b69b21914a9ea3165eed6f1b21"
-- 
1.7.9.5



