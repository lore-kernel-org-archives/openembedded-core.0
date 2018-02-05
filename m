Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB7F7836E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 06:22:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Feb 2018 22:22:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,463,1511856000"; d="scan'208";a="24708837"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.239])
	by orsmga003.jf.intel.com with ESMTP; 04 Feb 2018 22:22:12 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Feb 2018 14:21:32 +0800
Message-Id: <1517811692-28225-3-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517811692-28225-1-git-send-email-anuj.mittal@intel.com>
References: <1517811692-28225-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH 3/3] libva-utils: upgrade to 2.0.0
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
X-List-Received-Date: Mon, 05 Feb 2018 06:22:31 -0000

Major changes:

* Add option '--device <device>' to vainfo
* Add vp9enc for VP9 encoding
* Add vavpp for video processing
* Add FEI gtest cases
* Fix segmentation fault in putsurface_wayland
* Fix GCC 7.1.1 warnings/errors
* Fix libva version printed out by vainfo

Also, updated github URLs to point to renamed Intel repository.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libva/{libva-utils_1.8.3.bb => libva-utils_2.0.0.bb}          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_1.8.3.bb => libva-utils_2.0.0.bb} (81%)

diff --git a/meta/recipes-graphics/libva/libva-utils_1.8.3.bb b/meta/recipes-graphics/libva/libva-utils_2.0.0.bb
similarity index 81%
rename from meta/recipes-graphics/libva/libva-utils_1.8.3.bb
rename to meta/recipes-graphics/libva/libva-utils_2.0.0.bb
index c082c18..edf4946 100644
--- a/meta/recipes-graphics/libva/libva-utils_1.8.3.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.0.0.bb
@@ -8,15 +8,15 @@ for video processing. It consists of a main library and driver-specific \
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
+SRC_URI = "git://github.com/intel/libva-utils.git"
+SRCREV = "505216d0e0d30273f665c888d4c60aa694060729"
+UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


