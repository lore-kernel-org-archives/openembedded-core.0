Return-Path: <anuj.mittal@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 73D6F784F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 02:13:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Feb 2018 18:04:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,467,1511856000"; d="scan'208";a="32305014"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.239])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2018 18:04:12 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Feb 2018 10:04:00 +0800
Message-Id: <1517882640-731-3-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517882640-731-1-git-send-email-anuj.mittal@intel.com>
References: <1517882640-731-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH v2 3/3] libva-utils: upgrade to 2.0.0
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
X-List-Received-Date: Tue, 06 Feb 2018 02:13:35 -0000

Major changes:

* Add option '--device <device>' to vainfo
* Add vp9enc for VP9 encoding
* Add vavpp for video processing
* Add FEI gtest cases
* Fix segmentation fault in putsurface_wayland
* Fix GCC 7.1.1 warnings/errors
* Fix libva version printed out by vainfo

Updated recipe to point to release tarball instead of git. Also, updated
github URLs to point to renamed Intel repository.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libva/{libva-utils_1.8.3.bb => libva-utils_2.0.0.bb}      | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_1.8.3.bb => libva-utils_2.0.0.bb} (74%)

diff --git a/meta/recipes-graphics/libva/libva-utils_1.8.3.bb b/meta/recipes-graphics/libva/libva-utils_2.0.0.bb
similarity index 74%
rename from meta/recipes-graphics/libva/libva-utils_1.8.3.bb
rename to meta/recipes-graphics/libva/libva-utils_2.0.0.bb
index c082c18..a744730 100644
--- a/meta/recipes-graphics/libva/libva-utils_1.8.3.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.0.0.bb
@@ -8,18 +8,17 @@ for video processing. It consists of a main library and driver-specific \
 acceleration backends for each supported hardware vendor"
 
 HOMEPAGE = "https://01.org/linuxmedia/vaapi"
-BUGTRACKER = "https://github.com/01org/libva-utils/issues"
+BUGTRACKER = "https://github.com/intel/libva-utils/issues"
 
 SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/01org/libva-utils.git;branch=v1.8-branch"
-SRCREV = "011c709b98b52db3b10aeb361dfea9da43930364"
-UPSTREAM_CHECK_URI = "https://github.com/01org/libva-utils/releases"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
+SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "60fd49a60ef96ebfb559374d412e1fc4"
+SRC_URI[sha256sum] = "a921df31311d8f49d2e392a5fc2a068d79f89aeb588309fbff24365310dbc5f6"
 
-S = "${WORKDIR}/git"
+UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
 
 DEPENDS = "libva"
 
-- 
2.7.4


