Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 38DD9719B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945923"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:39:13 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:40 +0300
Message-Id: <0de7a019b64d91c7b5c0a960f420d0e32ade5578.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 48/50] glew: update to 2.1.0
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:12 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/glew/{glew_2.0.0.bb => glew_2.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glew/{glew_2.0.0.bb => glew_2.1.0.bb} (92%)

diff --git a/meta/recipes-graphics/glew/glew_2.0.0.bb b/meta/recipes-graphics/glew/glew_2.1.0.bb
similarity index 92%
rename from meta/recipes-graphics/glew/glew_2.0.0.bb
rename to meta/recipes-graphics/glew/glew_2.1.0.bb
index f2ab75629c1..be725e05301 100644
--- a/meta/recipes-graphics/glew/glew_2.0.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.1.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://no-strip.patch"
 
-SRC_URI[md5sum] = "2a2cd7c98f13854d2fcddae0d2b20411"
-SRC_URI[sha256sum] = "c572c30a4e64689c342ba1624130ac98936d7af90c3103f9ce12b8a0c5736764"
+SRC_URI[md5sum] = "b2ab12331033ddfaa50dc39345343980"
+SRC_URI[sha256sum] = "04de91e7e6763039bc11940095cd9c7f880baba82196a7765f727ac05a993c95"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/glew/files/glew"
 UPSTREAM_CHECK_REGEX = "/glew/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.14.1


