Return-Path: <jussi.kukkonen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7CF00730DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 13:02:39 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 22 Feb 2017 05:02:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="67715256"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 22 Feb 2017 05:02:40 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 6068E6A4080;
	Wed, 22 Feb 2017 05:02:39 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 15:02:31 +0200
Message-Id: <9c66ca31ffaa2bb1bbe284dfad0dda5cc76de106.1487764904.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487764904.git.jussi.kukkonen@intel.com>
References: <cover.1487764904.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/6] glib-2.0: Upgrade 2.50.2 -> 2.50.3
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
X-List-Received-Date: Wed, 22 Feb 2017 13:02:39 -0000

Tiny bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-core/glib-2.0/{glib-2.0_2.50.2.bb => glib-2.0_2.50.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.50.2.bb => glib-2.0_2.50.3.bb} (86%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.50.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.50.3.bb
similarity index 86%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.50.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.50.3.bb
index b7a0670..22ea347 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.50.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.50.3.bb
@@ -21,5 +21,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch \
                                 file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "5eeb2bfaf78a07be59585e8b6e80b1d6"
-SRC_URI[sha256sum] = "be68737c1f268c05493e503b3b654d2b7f43d7d0b8c5556f7e4651b870acfbf5"
+SRC_URI[md5sum] = "381ab22934f296750d036aa55a397ded"
+SRC_URI[sha256sum] = "82ee94bf4c01459b6b00cb9db0545c2237921e3060c0b74cff13fbc020cfd999"
-- 
2.1.4


