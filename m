Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D757C731CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:21:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2016 00:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,609,1455004800"; d="scan'208";a="974144642"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2016 00:20:53 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:20:30 +0300
Message-Id: <b1c39d537f969ddbb008fa73762b7c8da9a92748.1463035854.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
References: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463035854.git.jussi.kukkonen@intel.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
Subject: [PATCH 07/13] libxkbcommon: Upgrade 0.5.0 -> 0.6.1
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
X-List-Received-Date: Thu, 12 May 2016 07:21:06 -0000

License file was renamed, content is the same.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-lib/{libxkbcommon_0.5.0.bb => libxkbcommon_0.6.1.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.5.0.bb => libxkbcommon_0.6.1.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.6.1.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.6.1.bb
index de22a81..fc08109 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.6.1.bb
@@ -2,15 +2,15 @@ SUMMARY = "Generic XKB keymap library"
 DESCRIPTION = "libxkbcommon is a keymap compiler and support library which \
 processes a reduced subset of keymaps as defined by the XKB specification."
 HOMEPAGE = "http://www.xkbcommon.org"
-LIC_FILES_CHKSUM = "file://COPYING;md5=09457b156e3155972abebcaaaa0cb434"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=09457b156e3155972abebcaaaa0cb434"
 LICENSE = "MIT & MIT-style"
 
 DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "2e1faeafcc609c30af3a561a91e84158"
-SRC_URI[sha256sum] = "90bd7824742b9a6f52a6cf80e2cadd6f5349cf600a358d08260772615b89d19c"
+SRC_URI[md5sum] = "67a8f322b5fa32352272e811bb90dd73"
+SRC_URI[sha256sum] = "5b0887b080b42169096a61106661f8d35bae783f8b6c58f97ebcd3af83ea8760"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.1.4


