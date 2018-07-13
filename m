Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7170F745C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 02:39:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2018 19:39:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,346,1526367600"; d="scan'208";a="244890971"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.253])
	by fmsmga005.fm.intel.com with ESMTP; 12 Jul 2018 19:39:50 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2018 10:39:44 +0800
Message-Id: <20180713023944.23722-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180713023944.23722-1-anuj.mittal@intel.com>
References: <20180713023944.23722-1-anuj.mittal@intel.com>
Subject: [PATCH 2/2] libva-utils: upgrade 2.1.0 -> 2.2.0
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
X-List-Received-Date: Fri, 13 Jul 2018 02:39:50 -0000

* Add vainfo support in Android
* Remove driver specific test cases

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libva/{libva-utils_2.1.0.bb => libva-utils_2.2.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.1.0.bb => libva-utils_2.2.0.bb} (89%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.1.0.bb b/meta/recipes-graphics/libva/libva-utils_2.2.0.bb
similarity index 89%
rename from meta/recipes-graphics/libva/libva-utils_2.1.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.2.0.bb
index a8018ea728..e35085cb98 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.1.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.2.0.bb
@@ -15,8 +15,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
 SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "6649be70390606651cb636320bfd43c6"
-SRC_URI[sha256sum] = "f6a7790c3dcc56537372c90a83036a3136194a8b397e84e97bf9cc9254fa2c51"
+SRC_URI[md5sum] = "93b58aa5b14c16f4bace8a45dc255ec9"
+SRC_URI[sha256sum] = "ed7a6ed1fab657df4e83ea11f90310efcf31c27828f32d65351a28ca3c404dc0"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
 
-- 
2.17.1


