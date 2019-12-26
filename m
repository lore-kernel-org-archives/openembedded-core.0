Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0652D7D71B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Dec 2019 06:14:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Dec 2019 22:14:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,358,1571727600"; d="scan'208";a="417949440"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga005.fm.intel.com with ESMTP; 25 Dec 2019 22:14:18 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Dec 2019 14:14:15 +0800
Message-Id: <1577340855-56106-1-git-send-email-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 2/2] libva-utils: upgrade 2.5.0 -> 2.6.0
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
X-List-Received-Date: Thu, 26 Dec 2019 06:14:18 -0000

Release details can be found here:
https://github.com/intel/libva-utils/releases/tag/2.6.0

Removed the patch which is not required anymore

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../libva/{libva-utils_2.5.0.bb => libva-utils_2.6.0.bb}         | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.5.0.bb => libva-utils_2.6.0.bb} (78%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.5.0.bb b/meta/recipes-graphics/libva/libva-utils_2.6.0.bb
similarity index 78%
rename from meta/recipes-graphics/libva/libva-utils_2.5.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.6.0.bb
index f68d0cf..638e3c5 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.5.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.6.0.bb
@@ -14,12 +14,9 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2 \
-           file://0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch \
-           "
-
-SRC_URI[md5sum] = "c1fada26c286654859eff33b2562cb79"
-SRC_URI[sha256sum] = "9238c9d5110d60f935683390b8383fdac3507346384cd5f117a23c6db1d72a17"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.6-branch"
+SRCREV = "8ea1eba433dcbceb0e5dcb54b8e3f984987f7a17"
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
 
-- 
2.7.4


