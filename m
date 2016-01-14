Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4322A731E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:23:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jan 2016 05:23:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="893103192"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2016 05:23:27 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 15:27:51 +0200
Message-Id: <7784ac0030dd83837c25e7cac8c47c845c5f34ad.1452777133.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
References: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1452777133.git.jussi.kukkonen@intel.com>
References: <cover.1452777133.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/9] libcroco: upgrade to 0.6.11
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
X-List-Received-Date: Thu, 14 Jan 2016 13:23:28 -0000

Remove PR from recipe.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libcroco/{libcroco_0.6.9.bb => libcroco_0.6.11.bb}               | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libcroco/{libcroco_0.6.9.bb => libcroco_0.6.11.bb} (80%)

diff --git a/meta/recipes-support/libcroco/libcroco_0.6.9.bb b/meta/recipes-support/libcroco/libcroco_0.6.11.bb
similarity index 80%
rename from meta/recipes-support/libcroco/libcroco_0.6.9.bb
rename to meta/recipes-support/libcroco/libcroco_0.6.11.bb
index 05bd931..9df7923 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.9.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.11.bb
@@ -11,11 +11,10 @@ SECTION = "x11/utils"
 DEPENDS = "glib-2.0 libxml2 zlib"
 BBCLASSEXTEND = "native"
 EXTRA_OECONF += "--enable-Bsymbolic=auto"
-PR = "r2"
 
 BINCONFIG = "${bindir}/croco-0.6-config"
 
 inherit autotools pkgconfig gnomebase gtk-doc binconfig-disabled
 
-SRC_URI[archive.md5sum] = "f1863da805c9206563da06f56da1ea55"
-SRC_URI[archive.sha256sum] = "38b9a6aed1813e55b3ca07a68d1af845ad4d1f984602e9272fe692930c0be0ae"
+SRC_URI[archive.md5sum] = "dabc1911dfbfa85f8e6859ca47863168"
+SRC_URI[archive.sha256sum] = "132b528a948586b0dfa05d7e9e059901bca5a3be675b6071a90a90b81ae5a056"
-- 
2.1.4


