Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 85F9A61148
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 00:06:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2020 16:06:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,490,1574150400"; d="scan'208";a="256519710"
Received: from wrath.jf.intel.com ([10.54.31.24])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2020 16:06:21 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 16:06:01 -0800
Message-Id: <20200227000603.14252-3-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
References: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] at-spi2-core: upgrade 2.32.1 -> 2.34.0
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
X-List-Received-Date: Thu, 27 Feb 2020 00:06:20 -0000
Content-Transfer-Encoding: 8bit

Release notes:
https://gitlab.gnome.org/GNOME/at-spi2-core/-/raw/6da122f1e8d6b02dda0f368610ab72fc3d1720cf/NEWS

License-Update: Changed to LPGL-2.1+

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../{at-spi2-core_2.32.1.bb => at-spi2-core_2.34.0.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.32.1.bb => at-spi2-core_2.34.0.bb} (83%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.32.1.bb b/meta/recipes-support/atk/at-spi2-core_2.34.0.bb
similarity index 83%
rename from meta/recipes-support/atk/at-spi2-core_2.32.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.34.0.bb
index 18b5de2d58..84e05e77fc 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.32.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.34.0.bb
@@ -1,15 +1,15 @@
 SUMMARY = "Assistive Technology Service Provider Interface (dbus core)"
 HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Fix-source-reproducibility.patch"
 
-SRC_URI[md5sum] = "998fd9d858f8fa22c4c8c15567bf6254"
-SRC_URI[sha256sum] = "3c2aa937ebfaca2c86569bce9b16a34fbe20d69ef0c58846313b1c42f53b0d53"
+SRC_URI[md5sum] = "53c21565507105fb68031cd9c21a559b"
+SRC_URI[sha256sum] = "d629cdbd674e539f8912028512af583990938c7b49e25184c126b00121ef11c6"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-- 
2.24.0


