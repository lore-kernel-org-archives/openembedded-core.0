Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AD21178682
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 04:30:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2018 20:30:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,542,1511856000"; d="scan'208";a="21762467"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.104])
	by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2018 20:30:24 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Feb 2018 12:30:15 +0800
Message-Id: <1519187416-26121-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] libva: upgrade to 2.1.0
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
X-List-Received-Date: Wed, 21 Feb 2018 04:30:24 -0000

Major changes:

* Bump VA-API version to 1.1.0
* Add API for multi-frame processing
* Add entrypoint VAEntrypointStats for Statistics
* Add data structures for HEVC FEI support
* Add new attributes for decoding/encoding/video processing
* Add new VPP filter for Total Color Correction
* Add blending interface in VPP
* Add rotation interface in VPP
* Add mirroring interface in VPP
* Add Chroma siting flags in VPP
* Add new color standard definitions
* Add new interface for exporting surface
* Add message callbacks for drivers to use

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/libva/{libva_2.0.0.bb => libva_2.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva_2.0.0.bb => libva_2.1.0.bb} (92%)

diff --git a/meta/recipes-graphics/libva/libva_2.0.0.bb b/meta/recipes-graphics/libva/libva_2.1.0.bb
similarity index 92%
rename from meta/recipes-graphics/libva/libva_2.0.0.bb
rename to meta/recipes-graphics/libva/libva_2.1.0.bb
index 097a676..d3cf633 100644
--- a/meta/recipes-graphics/libva/libva_2.0.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.1.0.bb
@@ -19,8 +19,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
 SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "b863f99b7ae41960a0e2e7a4cc959b46"
-SRC_URI[sha256sum] = "bb0601f9a209e60d8d0b867067323661a7816ff429021441b775452b8589e533"
+SRC_URI[md5sum] = "9d6e4f1d36c407566343e9dde5a972b8"
+SRC_URI[sha256sum] = "f3fa953a11d3210c3a4ee79031abdbe0863d5ce13d9b3f93f315f1eec60a4b0f"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
-- 
2.7.4


