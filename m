Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6F46C0F1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 05:57:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Feb 2019 21:57:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,342,1544515200"; d="scan'208";a="131709106"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.100])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2019 21:57:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2019 13:57:14 +0800
Message-Id: <20190207055714.25880-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190207055714.25880-1-anuj.mittal@intel.com>
References: <20190207055714.25880-1-anuj.mittal@intel.com>
Subject: [PATCH 3/3] libva-utils: upgrade 2.3.0 -> 2.4.0
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
X-List-Received-Date: Thu, 07 Feb 2019 05:57:18 -0000

For changes, see:

https://github.com/intel/libva-utils/releases

Switch back to using tarball now that it is available.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libva/{libva-utils_2.3.0.bb => libva-utils_2.4.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.3.0.bb => libva-utils_2.4.0.bb} (83%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.3.0.bb b/meta/recipes-graphics/libva/libva-utils_2.4.0.bb
similarity index 83%
rename from meta/recipes-graphics/libva/libva-utils_2.3.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.4.0.bb
index a1b7596e86..f1d00b0b6c 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.3.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.4.0.bb
@@ -14,10 +14,10 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;protocol=https;branch=v2.3-branch"
-SRCREV = "b5a56ad33ef7d72fc522f26d2de874461be4b41e"
+SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
 
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "f5374c4c32ce136e50aea0267887aed5"
+SRC_URI[sha256sum] = "5b7d1954b40fcb2c0544be20125c71a0852049715ab85a3e8aba60434a40c6b3"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
 
-- 
2.17.1


