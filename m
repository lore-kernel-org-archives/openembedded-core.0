Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TBTIu-0002Ln-KL
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:27:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Sep 2012 09:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,406,1344236400"; d="scan'208";a="220783445"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2012 09:14:41 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 18:19:47 +0300
Message-Id: <2c0368423dda9201653a03a39799e352b37318a7.1347376068.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347376068.git.constantinx.musca@intel.com>
References: <cover.1347376068.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1347376068.git.constantinx.musca@intel.com>
References: <cover.1347376068.git.constantinx.musca@intel.com>
Subject: [PATCH 2/5] glew: upgrade to 1.9.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 16:27:12 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../glew/{glew_1.7.0.bb => glew_1.9.0.bb}          |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/glew/{glew_1.7.0.bb => glew_1.9.0.bb} (80%)

diff --git a/meta/recipes-graphics/glew/glew_1.7.0.bb b/meta/recipes-graphics/glew/glew_1.9.0.bb
similarity index 80%
rename from meta/recipes-graphics/glew/glew_1.7.0.bb
rename to meta/recipes-graphics/glew/glew_1.9.0.bb
index cdb778c..00fff11 100644
--- a/meta/recipes-graphics/glew/glew_1.7.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.9.0.bb
@@ -7,14 +7,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
 DEPENDS = "virtual/libx11 virtual/libgl libxext libxi libxmu"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://autotools.patch \
            file://glew_fix_for_automake-1.12.patch \
           "
 
-SRC_URI[md5sum] = "fb7a8bb79187ac98a90b57f0f27a3e84"
-SRC_URI[sha256sum] = "1653a63fb1e1a518c4b5ccbaf1a617f1a0b4c1c29d39ae4e2583844d98365c09"
+SRC_URI[md5sum] = "69ce911decef6249d24742497e6ad06a"
+SRC_URI[sha256sum] = "9b36530e414c95d6624be9d6815a5be1531d1986300ae5903f16977ab8aeb787"
 
 inherit autotools lib_package
-- 
1.7.9.5



