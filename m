Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A54D66BF43
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:55:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 00:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,286,1539673200"; d="scan'208";a="103727658"
Received: from asau1-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.138.143])
	by orsmga003.jf.intel.com with ESMTP; 27 Nov 2018 00:55:34 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 16:55:12 +0800
Message-Id: <20181127085524.4826-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127085524.4826-1-anuj.mittal@intel.com>
References: <20181127085524.4826-1-anuj.mittal@intel.com>
Subject: [PATCH 02/14] libva-utils: 2.2.0 -> 2.3.0
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
X-List-Received-Date: Tue, 27 Nov 2018 08:55:33 -0000

No release tarballs, so switch to git instead.

Changes from release notes:

Add HEVC encode sample code
Add sample code for avc decode streamout
Add VP8 sample encoder application (SVCT supported)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libva/{libva-utils_2.2.0.bb => libva-utils_2.3.0.bb}   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.2.0.bb => libva-utils_2.3.0.bb} (83%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.2.0.bb b/meta/recipes-graphics/libva/libva-utils_2.3.0.bb
similarity index 83%
rename from meta/recipes-graphics/libva/libva-utils_2.2.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.3.0.bb
index e35085cb98..a1b7596e86 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.2.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.3.0.bb
@@ -14,9 +14,10 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "93b58aa5b14c16f4bace8a45dc255ec9"
-SRC_URI[sha256sum] = "ed7a6ed1fab657df4e83ea11f90310efcf31c27828f32d65351a28ca3c404dc0"
+SRC_URI = "git://github.com/intel/libva-utils.git;protocol=https;branch=v2.3-branch"
+SRCREV = "b5a56ad33ef7d72fc522f26d2de874461be4b41e"
+
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
 
-- 
2.17.1


