Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DF57C76483
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:31:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 06:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758407598"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 06:31:14 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:31:46 +0300
Message-Id: <d5362f4afd2b421f9a6b628289bde50f60a9882b.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 17/26] tremor: switch SRC_URI from svn to tarballs on debian mirrors
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
X-List-Received-Date: Thu, 30 Jul 2015 13:31:36 -0000

There is no support for checking svn repositories for new commits, so
let's use debian tarballs and assume that Debian has a dedicated maintainer
who would check the upstream now and then.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{tremor-20120314 => tremor}/obsolete_automake_macros.patch      | 0
 .../tremor/{tremor-20120314 => tremor}/tremor-arm-thumb2.patch      | 0
 .../tremor/{tremor_20120314.bb => tremor_18153.bb}                  | 6 ++++--
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/tremor/{tremor-20120314 => tremor}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-multimedia/tremor/{tremor-20120314 => tremor}/tremor-arm-thumb2.patch (100%)
 rename meta/recipes-multimedia/tremor/{tremor_20120314.bb => tremor_18153.bb} (66%)

diff --git a/meta/recipes-multimedia/tremor/tremor-20120314/obsolete_automake_macros.patch b/meta/recipes-multimedia/tremor/tremor/obsolete_automake_macros.patch
similarity index 100%
rename from meta/recipes-multimedia/tremor/tremor-20120314/obsolete_automake_macros.patch
rename to meta/recipes-multimedia/tremor/tremor/obsolete_automake_macros.patch
diff --git a/meta/recipes-multimedia/tremor/tremor-20120314/tremor-arm-thumb2.patch b/meta/recipes-multimedia/tremor/tremor/tremor-arm-thumb2.patch
similarity index 100%
rename from meta/recipes-multimedia/tremor/tremor-20120314/tremor-arm-thumb2.patch
rename to meta/recipes-multimedia/tremor/tremor/tremor-arm-thumb2.patch
diff --git a/meta/recipes-multimedia/tremor/tremor_20120314.bb b/meta/recipes-multimedia/tremor/tremor_18153.bb
similarity index 66%
rename from meta/recipes-multimedia/tremor/tremor_20120314.bb
rename to meta/recipes-multimedia/tremor/tremor_18153.bb
index afc78ac..c27fe8c 100644
--- a/meta/recipes-multimedia/tremor/tremor_20120314.bb
+++ b/meta/recipes-multimedia/tremor/tremor_18153.bb
@@ -8,12 +8,14 @@ DEPENDS = "libogg"
 SRCDATE = "${PV}"
 PR = "r1"
 
-SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=18221;protocol=http \
+SRC_URI = "${DEBIAN_MIRROR}/main/libv/libvorbisidec/libvorbisidec_1.0.2+svn${PV}.orig.tar.gz \
            file://obsolete_automake_macros.patch;striplevel=0 \
            file://tremor-arm-thumb2.patch \
 "
+SRC_URI[md5sum] = "4190859414c5d6760e316b5cf00fe7c5"
+SRC_URI[sha256sum] = "4dc8c224289da3479fc10ce4e49ffbb85c790eb2fe55ef480934a265ee0a6782"
 
-S = "${WORKDIR}/Tremor"
+S = "${WORKDIR}/libvorbisidec-1.0.2+svn${PV}"
 
 inherit autotools pkgconfig
 
-- 
2.1.4


