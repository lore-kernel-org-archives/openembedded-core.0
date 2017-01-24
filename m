Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5A09777230
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 10:42:24 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jan 2017 02:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="57535569"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 24 Jan 2017 02:42:25 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id ED1CF6A4006;
	Tue, 24 Jan 2017 02:41:27 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 12:42:14 +0200
Message-Id: <c21a6535f14cc7963f65d521a4a6efc2ff365e43.1485249527.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485249527.git.jussi.kukkonen@intel.com>
References: <cover.1485249527.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/9] freetype: Upgrade 2.7.0 -> 2.7.1
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
X-List-Received-Date: Tue, 24 Jan 2017 10:42:25 -0000

Bug fixes and some new features: support for Adobe CFF2 font format
and OpenType 1.8 variation fonts.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/freetype/{freetype_2.7.bb => freetype_2.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.7.bb => freetype_2.7.1.bb} (93%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.7.bb b/meta/recipes-graphics/freetype/freetype_2.7.1.bb
similarity index 93%
rename from meta/recipes-graphics/freetype/freetype_2.7.bb
rename to meta/recipes-graphics/freetype/freetype_2.7.1.bb
index 36da1fb..544f835 100644
--- a/meta/recipes-graphics/freetype/freetype_2.7.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.7.1.bb
@@ -18,8 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
-SRC_URI[md5sum] = "be4601619827b7935e1d861745923a68"
-SRC_URI[sha256sum] = "d6a451f5b754857d2aa3964fd4473f8bc5c64e879b24516d780fb26bec7f7d48"
+SRC_URI[md5sum] = "b3230110e0cab777e0df7631837ac36e"
+SRC_URI[sha256sum] = "3a3bb2c4e15ffb433f2032f50a5b5a92558206822e22bfe8cbe339af4aa82f88"
 
 inherit autotools pkgconfig binconfig-disabled multilib_header
 
-- 
2.1.4


