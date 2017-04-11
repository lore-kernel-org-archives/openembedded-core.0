Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EADA077CE1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 07:05:48 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 11 Apr 2017 00:05:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,184,1488873600"; d="scan'208";a="85951314"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga005.jf.intel.com with ESMTP; 11 Apr 2017 00:05:48 -0700
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 15:05:57 +0800
Message-Id: <1491894357-128763-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ed: update to 1.14.2
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
X-List-Received-Date: Tue, 11 Apr 2017 07:05:49 -0000

From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>

The previous version of ed-1.14.1 no longer exist in upstream source
archive at https://ftp.gnu.org/gnu/ed/. Upstream version was being
replaced by a brand new version.

Updated version to build and tarball checksums.

[YOCTO #11322]

Signed-off-by: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/recipes-extended/ed/{ed_1.14.1.bb => ed_1.14.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.14.1.bb => ed_1.14.2.bb} (84%)

diff --git a/meta/recipes-extended/ed/ed_1.14.1.bb b/meta/recipes-extended/ed/ed_1.14.2.bb
similarity index 84%
rename from meta/recipes-extended/ed/ed_1.14.1.bb
rename to meta/recipes-extended/ed/ed_1.14.2.bb
index 5d89a87..8cd9392 100644
--- a/meta/recipes-extended/ed/ed_1.14.1.bb
+++ b/meta/recipes-extended/ed/ed_1.14.2.bb
@@ -13,8 +13,8 @@ bindir = "${base_bindir}"
 
 SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
 
-SRC_URI[md5sum] = "7f4a54fa7f366479f03654b8af645fd0"
-SRC_URI[sha256sum] = "ffb97eb8f2a2b5a71a9b97e3872adce953aa1b8958e04c5b7bf11d556f32552a"
+SRC_URI[md5sum] = "273d04778b2a51f7c3cbfcd2001876bf"
+SRC_URI[sha256sum] = "f57962ba930d70d02fc71d6be5c5f2346b16992a455ab9c43be7061dec9810db"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.7.4


