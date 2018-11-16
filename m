Return-Path: <anuj.mittal@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id C0F5B6B5C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 10:13:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2018 02:13:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,239,1539673200"; d="scan'208,223";a="89810027"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.21.208])
	by orsmga007.jf.intel.com with ESMTP; 16 Nov 2018 02:13:03 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2018 18:13:00 +0800
Message-Id: <20181116101300.16897-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libva: update 2.2.0 -> 2.3.0
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
X-List-Received-Date: Fri, 16 Nov 2018 10:13:03 -0000

From release notes:

    Bump VA-API version to 1.3.0 and libva to 2.3.0
    Add max frame size parameters for multiple pass case in legacy mode
    Add new BRC mode AVBR
    Add new interface for High Dynamic Range tone mapping
    Add missing enum to string conversions
    Add hevc subsets parameters structure
    Add Customized Noise Reduction (HVS) interfaces
    Add new BRC mode definition QVBR
    Add more complete colour properties for use in VPP

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-graphics/libva/{libva_2.2.0.bb => libva_2.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva_2.2.0.bb => libva_2.3.0.bb} (92%)

diff --git a/meta/recipes-graphics/libva/libva_2.2.0.bb b/meta/recipes-graphics/libva/libva_2.3.0.bb
similarity index 92%
rename from meta/recipes-graphics/libva/libva_2.2.0.bb
rename to meta/recipes-graphics/libva/libva_2.3.0.bb
index 11e57e0eb8..4aab5269aa 100644
--- a/meta/recipes-graphics/libva/libva_2.2.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.3.0.bb
@@ -19,8 +19,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
 SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "92d04ad1700136dc75b1e5f47516e704"
-SRC_URI[sha256sum] = "6f6ca04c785544d30d315ef130a6aeb9435b75f934d7fbe0e4e9ba6084ce4ef2"
+SRC_URI[md5sum] = "2555c46075ab2f6128f39902ba1c6183"
+SRC_URI[sha256sum] = "60840e50da6932ee2111e15fc8911180ff8a0d6f18bb9cc6ba8c1030098fdce4"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
-- 
2.17.1


