Return-Path: <noor_ahsan@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 59D286E9A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 14:20:02 +0000 (UTC)
Received: from pkl-ahsann-ubuntu.mgc.mentorg.com
	(pkl-ahsann-ubuntu.pkl.mentorg.com [137.202.157.70])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id s0TEJx6E016307; 
	Wed, 29 Jan 2014 08:20:00 -0600
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 19:17:46 +0500
Message-Id: <1391005066-15501-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libcgroup: Add bison-native and flex-native in depends
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
X-List-Received-Date: Wed, 29 Jan 2014 14:20:02 -0000

From: Noor <noor_ahsan@mentor.com>

* libcgroup require native packages for bison and flex. Added those
  in its DEPENDS.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/recipes-core/libcgroup/libcgroup_0.38.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libcgroup/libcgroup_0.38.bb b/meta/recipes-core/libcgroup/libcgroup_0.38.bb
index 8bd0ead..711229f 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.38.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.38.bb
@@ -10,7 +10,7 @@ PR = "r1"
 
 inherit autotools pkgconfig
 
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS = "bison-native flex-native ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${BPN}/v.038/${BPN}-${PV}.tar.bz2"
 
-- 
1.7.9.5


