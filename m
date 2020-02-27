Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D04A961144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 00:06:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2020 16:06:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,490,1574150400"; d="scan'208";a="256519723"
Received: from wrath.jf.intel.com ([10.54.31.24])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2020 16:06:24 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 16:06:02 -0800
Message-Id: <20200227000603.14252-4-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
References: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] at-spi2-atk: upgrade 2.32.0 -> 2.34.1
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
X-List-Received-Date: Thu, 27 Feb 2020 00:06:22 -0000
Content-Transfer-Encoding: 8bit

Release notes:
https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b793de2161a0548835424f4d087ac90d1172d/NEWS

License-Update: Changed to LGPL-2.1+

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../atk/{at-spi2-atk_2.32.0.bb => at-spi2-atk_2.34.1.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.32.0.bb => at-spi2-atk_2.34.1.bb} (66%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
similarity index 66%
rename from meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
index b717a9c7f7..b09cb6a392 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
@@ -1,10 +1,10 @@
 SUMMARY = "AT-SPI 2 Toolkit Bridge"
 HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[archive.md5sum] = "6a4b27bace3b9352721ed462b95f6291"
-SRC_URI[archive.sha256sum] = "0b51e6d339fa2bcca3a3e3159ccea574c67b107f1ac8b00047fa60e34ce7a45c"
+SRC_URI[archive.md5sum] = "e0f99641c5a403041c4214be04722e15"
+SRC_URI[archive.sha256sum] = "776df930748fde71c128be6c366a987b98b6ee66d508ed9c8db2355bf4b9cc16"
 
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
 
-- 
2.24.0


