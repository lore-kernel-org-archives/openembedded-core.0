Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 284A27728E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:36:06 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP; 19 Dec 2016 05:35:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,373,1477983600"; d="scan'208";a="44485975"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 19 Dec 2016 05:35:56 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id CBED96A4082;
	Mon, 19 Dec 2016 05:35:06 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:35:41 +0200
Message-Id: <88341a537f4efb87e11b95d6d0f79e49037ad1ba.1482154012.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482154012.git.jussi.kukkonen@intel.com>
References: <cover.1482154012.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/8] glib-2.0: Upgrade 2.50.1 -> 2.50.2
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
X-List-Received-Date: Mon, 19 Dec 2016 13:36:07 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-core/glib-2.0/{glib-2.0_2.50.1.bb => glib-2.0_2.50.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.50.1.bb => glib-2.0_2.50.2.bb} (86%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.50.2.bb
similarity index 86%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.50.2.bb
index e4fccc7..b7a0670 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.50.2.bb
@@ -21,5 +21,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch \
                                 file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "6baee4d7e3b1ec791b4ced93976365ee"
-SRC_URI[sha256sum] = "2ef87a78f37c1eb5b95f4cc95efd5b66f69afad9c9c0899918d04659cf6df7dd"
+SRC_URI[md5sum] = "5eeb2bfaf78a07be59585e8b6e80b1d6"
+SRC_URI[sha256sum] = "be68737c1f268c05493e503b3b654d2b7f43d7d0b8c5556f7e4651b870acfbf5"
-- 
2.1.4


