Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9FE780B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 11:23:29 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2017 04:23:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,423,1491289200"; d="scan'208";a="108658297"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 31 May 2017 04:23:31 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 54E90580244;
	Wed, 31 May 2017 04:23:29 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 14:23:16 +0300
Message-Id: <23fbed5305458cb176f49598c36c73048ec5c113.1496229576.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496229576.git.jussi.kukkonen@intel.com>
References: <cover.1496229576.git.jussi.kukkonen@intel.com>
Subject: [PATCH 07/10] libepoxy: Upgrade 1.4.1 -> 1.4.2
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
X-List-Received-Date: Wed, 31 May 2017 11:23:29 -0000

Mostly a bug fix release

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libepoxy/{libepoxy_1.4.1.bb => libepoxy_1.4.2.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.1.bb => libepoxy_1.4.2.bb} (81%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.1.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb
similarity index 81%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.4.1.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb
index 4b3f56a..e69e828 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.1.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb
@@ -6,8 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "a0dc66910009a99c47c5def50b042d77"
-SRC_URI[sha256sum] = "88c6abf5522fc29bab7d6c555fd51a855cbd9253c4315f8ea44e832baef21aa6"
+SRC_URI[md5sum] = "632fcfd7ae9d21f5a634326d753a89c4"
+SRC_URI[sha256sum] = "bea6fdec3d10939954495da898d872ee836b75c35699074cbf02a64fcb80d5b3"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
 inherit autotools pkgconfig distro_features_check
-- 
2.1.4


