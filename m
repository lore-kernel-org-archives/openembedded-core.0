Return-Path: <jussi.kukkonen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 05D3D78062
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 11:23:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 31 May 2017 04:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,423,1491289200"; d="scan'208";a="93867037"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 31 May 2017 04:23:34 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 11398580244;
	Wed, 31 May 2017 04:23:32 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 14:23:19 +0300
Message-Id: <0b1d0477b094f29ef58a6a7e2a434d8dbdbb29cb.1496229576.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496229576.git.jussi.kukkonen@intel.com>
References: <cover.1496229576.git.jussi.kukkonen@intel.com>
Subject: [PATCH 10/10] gnome-themes-standard: Upgrade 3.22.2 -> 3.22.3
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
X-List-Received-Date: Wed, 31 May 2017 11:23:33 -0000

Just a few bug fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...nome-themes-standard_3.22.2.bb => gnome-themes-standard_3.22.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome/{gnome-themes-standard_3.22.2.bb => gnome-themes-standard_3.22.3.bb} (91%)

diff --git a/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.2.bb b/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb
similarity index 91%
rename from meta/recipes-gnome/gnome/gnome-themes-standard_3.22.2.bb
rename to meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb
index 2b3cc97..f75f7c8 100644
--- a/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.2.bb
+++ b/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb
@@ -16,8 +16,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "84624dbcecab7add32672abae030314d"
-SRC_URI[sha256sum] = "b34516cd59b873c187c1897c25bac3b9ce2d30a472f1fd7ae9d7105d93e17da5"
+SRC_URI[md5sum] = "b51c362b157b6407303d44f93c31ee11"
+SRC_URI[sha256sum] = "61dc87c52261cfd5b94d65e8ffd923ddeb5d3944562f84942eeeb197ab8ab56a"
 
 EXTRA_OECONF = "--disable-gtk3-engine"
 
-- 
2.1.4


