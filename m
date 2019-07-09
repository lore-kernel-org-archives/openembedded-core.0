Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 394F97ECF9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 23:59:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jul 2019 16:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,472,1557212400"; d="scan'208";a="364758485"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.220])
	by fmsmga006.fm.intel.com with ESMTP; 09 Jul 2019 16:59:00 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 07:58:57 +0800
Message-Id: <20190709235858.21667-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] libva: upgrade 2.4.1 -> 2.5.0
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
X-List-Received-Date: Tue, 09 Jul 2019 23:59:01 -0000
Content-Transfer-Encoding: 8bit

For changes in this release, see:

https://github.com/intel/libva/releases

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-graphics/libva/{libva_2.4.1.bb => libva_2.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva_2.4.1.bb => libva_2.5.0.bb} (92%)

diff --git a/meta/recipes-graphics/libva/libva_2.4.1.bb b/meta/recipes-graphics/libva/libva_2.5.0.bb
similarity index 92%
rename from meta/recipes-graphics/libva/libva_2.4.1.bb
rename to meta/recipes-graphics/libva/libva_2.5.0.bb
index 525721f0ae..e75648b2be 100644
--- a/meta/recipes-graphics/libva/libva_2.4.1.bb
+++ b/meta/recipes-graphics/libva/libva_2.5.0.bb
@@ -19,8 +19,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
 SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "5b5ace9de3f07cb7b8f4d19b6979adf0"
-SRC_URI[sha256sum] = "e9e053908591b121793eaa5d8aa37675b4cd3af4b12f1f377dff4767f39cee70"
+SRC_URI[md5sum] = "3688212fb7a87947070f3729e91ff7cf"
+SRC_URI[sha256sum] = "3aa89cd369a506ac4dbe5de7c0ef5da4f3d220bf986403f02fa1f6f702af6878"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
-- 
2.20.1


