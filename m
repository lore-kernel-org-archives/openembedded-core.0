Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8728D75340
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 02:39:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2018 19:39:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,346,1526367600"; d="scan'208";a="244890968"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.253])
	by fmsmga005.fm.intel.com with ESMTP; 12 Jul 2018 19:39:48 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2018 10:39:43 +0800
Message-Id: <20180713023944.23722-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] libva: upgrade 2.1.0 -> 2.2.0
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

* Bump VA-API version to 1.2.0
* Add support for hevc range extension decoding
* Add support for fast intra prediction in HEVC FEI
* Add 10/12-bit YUV render target formats
* Add fourcc code for Y210/Y216/Y410/Y416/RGB565/BGR565
* Add VA_STATUS_ERROR_NOT_ENOUGH_BUFFER
* Add VA_SURFACE_ATTRIB_USAGE_HINT_EXPORT
* Improve documentation

Tested with Intel vaapi driver. There is support for meson available but
its not being packaged as part of release tarball yet.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-graphics/libva/{libva_2.1.0.bb => libva_2.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva_2.1.0.bb => libva_2.2.0.bb} (92%)

diff --git a/meta/recipes-graphics/libva/libva_2.1.0.bb b/meta/recipes-graphics/libva/libva_2.2.0.bb
similarity index 92%
rename from meta/recipes-graphics/libva/libva_2.1.0.bb
rename to meta/recipes-graphics/libva/libva_2.2.0.bb
index d3cf6334ce..11e57e0eb8 100644
--- a/meta/recipes-graphics/libva/libva_2.1.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.2.0.bb
@@ -19,8 +19,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
 SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "9d6e4f1d36c407566343e9dde5a972b8"
-SRC_URI[sha256sum] = "f3fa953a11d3210c3a4ee79031abdbe0863d5ce13d9b3f93f315f1eec60a4b0f"
+SRC_URI[md5sum] = "92d04ad1700136dc75b1e5f47516e704"
+SRC_URI[sha256sum] = "6f6ca04c785544d30d315ef130a6aeb9435b75f934d7fbe0e4e9ba6084ce4ef2"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
-- 
2.17.1


