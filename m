Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F02426E627
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 18:34:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Feb 2015 10:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,514,1418112000"; d="scan'208";a="672175759"
Received: from lzavalam-mobl.amr.corp.intel.com (HELO
	swold-mobl5.amr.corp.intel.com) ([10.252.252.168])
	by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2015 10:34:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Feb 2015 10:34:27 -0800
Message-Id: <662f4f0169db497ea9476d1901a25ad1b59a829b.1422988163.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1422988163.git.sgw@linux.intel.com>
References: <cover.1422988163.git.sgw@linux.intel.com>
In-Reply-To: <cover.1422988163.git.sgw@linux.intel.com>
References: <cover.1422988163.git.sgw@linux.intel.com>
Subject: [PATCH 1/6] glew: Upgrade to 1.12
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
X-List-Received-Date: Tue, 03 Feb 2015 18:35:02 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/glew/{glew_1.11.0.bb => glew_1.12.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glew/{glew_1.11.0.bb => glew_1.12.0.bb} (83%)

diff --git a/meta/recipes-graphics/glew/glew_1.11.0.bb b/meta/recipes-graphics/glew/glew_1.12.0.bb
similarity index 83%
rename from meta/recipes-graphics/glew/glew_1.11.0.bb
rename to meta/recipes-graphics/glew/glew_1.12.0.bb
index 4231320..9343604 100644
--- a/meta/recipes-graphics/glew/glew_1.11.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.12.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://fix-glew.pc-install.patch \
           "
 
-SRC_URI[md5sum] = "f6d72c7426a5f66580ad09e50816450a"
-SRC_URI[sha256sum] = "69bbce306ac281c4fa806a7a7d02c0596281a2d8f9d70690e98126f23ba513d6"
+SRC_URI[md5sum] = "01246c7ecd135d99be031aa63f86dca1"
+SRC_URI[sha256sum] = "af58103f4824b443e7fa4ed3af593b8edac6f3a7be3b30911edbc7344f48e4bf"
 
 inherit autotools lib_package pkgconfig
-- 
2.1.0


