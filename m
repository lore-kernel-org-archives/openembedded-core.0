Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1TzrM6-0000BB-Ro
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 17:14:47 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jan 2013 07:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,551,1355126400"; d="scan'208";a="253635680"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.33])
	by orsmga001.jf.intel.com with ESMTP; 28 Jan 2013 07:59:06 -0800
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 18:00:01 +0200
Message-Id: <1359388802-9440-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] blktool : upgrade to 4-6.1
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
X-List-Received-Date: Mon, 28 Jan 2013 16:14:47 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../blktool/{blktool_4-6.bb => blktool_4-6.1.bb}   |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/blktool/{blktool_4-6.bb => blktool_4-6.1.bb} (77%)

diff --git a/meta/recipes-extended/blktool/blktool_4-6.bb b/meta/recipes-extended/blktool/blktool_4-6.1.bb
similarity index 77%
rename from meta/recipes-extended/blktool/blktool_4-6.bb
rename to meta/recipes-extended/blktool/blktool_4-6.1.bb
index cc1174c..94a7a10 100644
--- a/meta/recipes-extended/blktool/blktool_4-6.bb
+++ b/meta/recipes-extended/blktool/blktool_4-6.1.bb
@@ -11,13 +11,13 @@ DEPENDS = "glib-2.0"
 PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/b/blktool/blktool_4.orig.tar.gz;name=tarball \
-           ${DEBIAN_MIRROR}/main/b/blktool/blktool_4-6.diff.gz;apply=yes;name=patch"
+           ${DEBIAN_MIRROR}/main/b/blktool/blktool_4-6.1.diff.gz;apply=yes;name=patch"
 
 SRC_URI[tarball.md5sum] = "62edc09c9908107e69391c87f4f3fd40"
 SRC_URI[tarball.sha256sum] = "b1e6d5912546d2a4b704ec65c2b9664aa3b4663e7d800e06803330335a2cb764"
 
-SRC_URI[patch.md5sum] = "2d1bc2f2c38b65d47e27da7c7508d17f"
-SRC_URI[patch.sha256sum] = "999f2062203e389327d997724621be37bea9c98fa226238f9f4eb4a6ea25bd4b"
+RC_URI[patch.md5sum] = "cf605a683d54d1fbcb35b940076ddb0c"
+SRC_URI[patch.sha256sum] = "d7923527e1a00984620ab307c9047a653d7ae2856cd20a82de8a33328f381ae3"
 
 S = "${WORKDIR}/${BPN}-4.orig"
 
-- 
1.7.9.5



