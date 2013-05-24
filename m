Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 9D04C6A453
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:16:18 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 May 2013 02:16:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,734,1363158000"; d="scan'208";a="246063880"
Received: from work.rb.intel.com ([10.237.105.51])
	by AZSMGA002.ch.intel.com with ESMTP; 24 May 2013 02:16:18 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2013 12:18:06 +0300
Message-Id: <b03438668613cd856b4993a5cfaa4faadb17fd62.1369386157.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369386157.git.ionutx.radu@intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1369386157.git.ionutx.radu@intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
Subject: [PATCH 2/7] freetype: Updated from 2.4.11 to 2.4.12
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
X-List-Received-Date: Fri, 24 May 2013 09:16:18 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>

freetype: no-hardcode.patch does not apply to 2.4.12 version because
hardcode_libdir_flag_spec variable is set to '' in 2.4.12

---
 .../{freetype-2.4.11 => freetype-2.4.12}/no-hardcode.patch  |    0
 .../freetype/{freetype_2.4.11.bb => freetype_2.4.12.bb}     |   11 ++++-------
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype-2.4.11 => freetype-2.4.12}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.11.bb => freetype_2.4.12.bb} (83%)

diff --git a/meta/recipes-graphics/freetype/freetype-2.4.11/no-hardcode.patch b/meta/recipes-graphics/freetype/freetype-2.4.12/no-hardcode.patch
similarity index 100%
rename from meta/recipes-graphics/freetype/freetype-2.4.11/no-hardcode.patch
rename to meta/recipes-graphics/freetype/freetype-2.4.12/no-hardcode.patch
diff --git a/meta/recipes-graphics/freetype/freetype_2.4.11.bb b/meta/recipes-graphics/freetype/freetype_2.4.12.bb
similarity index 83%
rename from meta/recipes-graphics/freetype/freetype_2.4.11.bb
rename to meta/recipes-graphics/freetype/freetype_2.4.12.bb
index 53fde1d..36817a6 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.11.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.12.bb
@@ -7,19 +7,16 @@ HOMEPAGE = "http://www.freetype.org/"
 BUGTRACKER = "https://savannah.nongnu.org/bugs/?group=freetype"
 
 LICENSE = "FreeType | GPLv2+"
-LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=28d5381b1bef2649c59f20c20bae4f39 \
+LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56 \
                     file://docs/FTL.TXT;md5=d479e83797f699fe873b38dadd0fcd4c \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
 SECTION = "libs"
 
-PR = "r0"
+SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
-           file://no-hardcode.patch"
-
-SRC_URI[md5sum] = "b93435488942486c8d0ca22e8f768034"
-SRC_URI[sha256sum] = "ef9d0bcb64647d9e5125dc7534d7ca371c98310fec87677c410f397f71ffbe3f"
+SRC_URI[md5sum] = "3463102764315eb86c0d3c2e1f3ffb7d"
+SRC_URI[sha256sum] = "a78a17486689ab6852a9e1a759b179827ac9dfd7e2f237ddf169c73398c85381"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.10.4


