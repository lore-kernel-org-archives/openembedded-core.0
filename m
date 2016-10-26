Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E6B4A607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:16 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP; 26 Oct 2016 06:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="23846760"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 26 Oct 2016 06:28:09 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 985A46A4006;
	Wed, 26 Oct 2016 06:27:34 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:50 +0300
Message-Id: <fb4932447896d94e0a47913ca785c88a2dd35708.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
References: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477488358.git.jussi.kukkonen@intel.com>
References: <cover.1477488358.git.jussi.kukkonen@intel.com>
Subject: [PATCH 09/14] freetype: Upgrade 2.6.5 -> 2.7
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
X-List-Received-Date: Wed, 26 Oct 2016 13:28:17 -0000

Includes new default subpixel hinting mode (aka ClearType).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/freetype/{freetype_2.6.5.bb => freetype_2.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.6.5.bb => freetype_2.7.bb} (93%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.6.5.bb b/meta/recipes-graphics/freetype/freetype_2.7.bb
similarity index 93%
rename from meta/recipes-graphics/freetype/freetype_2.6.5.bb
rename to meta/recipes-graphics/freetype/freetype_2.7.bb
index 97dde3a..36da1fb 100644
--- a/meta/recipes-graphics/freetype/freetype_2.6.5.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.7.bb
@@ -18,8 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
-SRC_URI[md5sum] = "6a386964e18ba28cb93370e57a19031b"
-SRC_URI[sha256sum] = "e20a6e1400798fd5e3d831dd821b61c35b1f9a6465d6b18a53a9df4cf441acf0"
+SRC_URI[md5sum] = "be4601619827b7935e1d861745923a68"
+SRC_URI[sha256sum] = "d6a451f5b754857d2aa3964fd4473f8bc5c64e879b24516d780fb26bec7f7d48"
 
 inherit autotools pkgconfig binconfig-disabled multilib_header
 
-- 
2.1.4


