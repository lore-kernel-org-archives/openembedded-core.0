Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 03FE660797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 13:22:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2016 06:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="977873424"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2016 06:22:54 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 16:22:39 +0300
Message-Id: <bb10e97b5238a7d005f0ea117bd4e1fb81da7543.1463404035.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
References: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463404035.git.jussi.kukkonen@intel.com>
References: <cover.1463404035.git.jussi.kukkonen@intel.com>
Subject: [PATCH 02/13] glib-networking: Upgrade 2.46.1 -> 2.48.2
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
X-List-Received-Date: Mon, 16 May 2016 13:22:54 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{glib-networking_2.46.1.bb => glib-networking_2.48.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.46.1.bb => glib-networking_2.48.2.bb} (88%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.48.2.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.48.2.bb
index 749ac98..50d9983 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.48.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 SECTION = "libs"
 DEPENDS = "glib-2.0 intltool-native"
 
-SRC_URI[archive.md5sum] = "c000e0b579f5d8fd48efebc7ac4d95dc"
-SRC_URI[archive.sha256sum] = "d5034214217f705891b6c9e719cc2c583c870bfcfdc454ebbb5e5e8940ac90b1"
+SRC_URI[archive.md5sum] = "d7cf81d52c856b0c66f7821021f40e08"
+SRC_URI[archive.sha256sum] = "925c0c49d6b2b8b5695f2e33cd952d1dbb7d18d3f2f796413577719315bb3a84"
 
 PACKAGECONFIG ??= "ca-certificates gnutls"
 
-- 
2.1.4


