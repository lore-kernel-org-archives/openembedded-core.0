Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U2ISi-0004yL-AI
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:35:45 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Feb 2013 01:19:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="252243190"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 04 Feb 2013 01:19:50 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:20:24 +0200
Message-Id: <63e210c9ce9f2b5228f4b8220e0bab0b98f71e1d.1359967266.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
Subject: [PATCH 10/10] blktool: fix SRC_URI typo
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
X-List-Received-Date: Mon, 04 Feb 2013 09:35:51 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-extended/blktool/blktool_4-6.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/blktool/blktool_4-6.1.bb b/meta/recipes-extended/blktool/blktool_4-6.1.bb
index 94a7a10..8bd1bae 100644
--- a/meta/recipes-extended/blktool/blktool_4-6.1.bb
+++ b/meta/recipes-extended/blktool/blktool_4-6.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://blktool.c;beginline=7;endline=8;md5=a5e798ea98fd50972088968a15e5f373"
 
 DEPENDS = "glib-2.0"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/b/blktool/blktool_4.orig.tar.gz;name=tarball \
            ${DEBIAN_MIRROR}/main/b/blktool/blktool_4-6.1.diff.gz;apply=yes;name=patch"
@@ -16,7 +16,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/b/blktool/blktool_4.orig.tar.gz;name=tarball \
 SRC_URI[tarball.md5sum] = "62edc09c9908107e69391c87f4f3fd40"
 SRC_URI[tarball.sha256sum] = "b1e6d5912546d2a4b704ec65c2b9664aa3b4663e7d800e06803330335a2cb764"
 
-RC_URI[patch.md5sum] = "cf605a683d54d1fbcb35b940076ddb0c"
+SRC_URI[patch.md5sum] = "cf605a683d54d1fbcb35b940076ddb0c"
 SRC_URI[patch.sha256sum] = "d7923527e1a00984620ab307c9047a653d7ae2856cd20a82de8a33328f381ae3"
 
 S = "${WORKDIR}/${BPN}-4.orig"
-- 
1.7.11.7



