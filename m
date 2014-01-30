Return-Path: <noor_ahsan@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 858246E9CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 11:08:19 +0000 (UTC)
Received: from pkl-ahsann-ubuntu.mgc.mentorg.com
	(pkl-ahsann-ubuntu.pkl.mentorg.com [137.202.157.70])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id s0UB8G8N009911; 
	Thu, 30 Jan 2014 05:08:18 -0600
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jan 2014 16:06:05 +0500
Message-Id: <1391079965-12870-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2] libcgroup: Add bison-native and flex-native in depends
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
X-List-Received-Date: Thu, 30 Jan 2014 11:08:20 -0000

From: Noor <noor_ahsan@mentor.com>

* libcgroup requires native packages for bison and flex to configure
  itself successfully. Added those in its DEPENDS.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/recipes-core/libcgroup/libcgroup_0.41.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libcgroup/libcgroup_0.41.bb b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
index 5db1079..76b0b58 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.41.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 inherit autotools pkgconfig
 
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS = "bison-native flex-native ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${BPN}/v0.41/${BPN}-${PV}.tar.bz2"
 
-- 
1.7.9.5


