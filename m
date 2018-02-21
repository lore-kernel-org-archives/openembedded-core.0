Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 58BAD786D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 04:30:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2018 20:30:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,542,1511856000"; d="scan'208";a="21762474"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.104])
	by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2018 20:30:28 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Feb 2018 12:30:16 +0800
Message-Id: <1519187416-26121-2-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519187416-26121-1-git-send-email-anuj.mittal@intel.com>
References: <1519187416-26121-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH 2/2] libva-utils: upgrade to 2.1.0
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
X-List-Received-Date: Wed, 21 Feb 2018 04:30:27 -0000

Major changes:

* Refine gtest conformance cases
* vp9enc: add support low power mode
* vavpp: add support for RGBA/RGBX surface
* vainfo: add support new profile/entrypoint pairs

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libva/{libva-utils_2.0.0.bb => libva-utils_2.1.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.0.0.bb => libva-utils_2.1.0.bb} (89%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.0.0.bb b/meta/recipes-graphics/libva/libva-utils_2.1.0.bb
similarity index 89%
rename from meta/recipes-graphics/libva/libva-utils_2.0.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.1.0.bb
index f69fab9..a8018ea 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.0.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.1.0.bb
@@ -15,8 +15,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
 SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "60fd49a60ef96ebfb559374d412e1fc4"
-SRC_URI[sha256sum] = "a921df31311d8f49d2e392a5fc2a068d79f89aeb588309fbff24365310dbc5f6"
+SRC_URI[md5sum] = "6649be70390606651cb636320bfd43c6"
+SRC_URI[sha256sum] = "f6a7790c3dcc56537372c90a83036a3136194a8b397e84e97bf9cc9254fa2c51"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
 
-- 
2.7.4


