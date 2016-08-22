Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ED60573243
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:23:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2016 05:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,559,1464678000"; d="scan'208";a="751984557"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2016 05:23:23 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 15:23:11 +0300
Message-Id: <03133a9254dfab24b551e7bc84b6498d64f82d70.1471868237.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7b711df547a725dd97f54a6c3524b7e505a2330d.1471868237.git.jussi.kukkonen@intel.com>
References: <7b711df547a725dd97f54a6c3524b7e505a2330d.1471868237.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1471868237.git.jussi.kukkonen@intel.com>
References: <cover.1471868237.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/9] vte: Upgrade 0.44.1 -> 0.44.2
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
X-List-Received-Date: Mon, 22 Aug 2016 12:23:23 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/vte/{vte_0.44.1.bb => vte_0.44.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.44.1.bb => vte_0.44.2.bb} (86%)

diff --git a/meta/recipes-support/vte/vte_0.44.1.bb b/meta/recipes-support/vte/vte_0.44.2.bb
similarity index 86%
rename from meta/recipes-support/vte/vte_0.44.1.bb
rename to meta/recipes-support/vte/vte_0.44.2.bb
index f3baa1e..a1204a3 100644
--- a/meta/recipes-support/vte/vte_0.44.1.bb
+++ b/meta/recipes-support/vte/vte_0.44.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 inherit gnomebase gtk-doc distro_features_check upstream-version-is-even vala gobject-introspection
 
 SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch"
-SRC_URI[archive.md5sum] = "20916d97a5902657e54307cc2757beee"
-SRC_URI[archive.sha256sum] = "712dd548339f600fd7e221d12b2670a13a4361b2cd23ba0e057e76cc19fe5d4e"
+SRC_URI[archive.md5sum] = "eca8f8a9d9f9bb8e9d592d0acfeec015"
+SRC_URI[archive.sha256sum] = "a1ea594814bb136a3a9a6c7656b46240571f6a198825c1111007fe99194b0949"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.1.4


