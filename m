Return-Path: <cristiana.voicu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 250CB6DA9A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:57:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Nov 2013 06:54:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="437160340"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by orsmga002.jf.intel.com with ESMTP; 18 Nov 2013 06:57:48 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2013 17:03:14 +0200
Message-Id: <a80b777c2a5e6c8d4d8b4094e254a7da34890c80.1384786750.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384786750.git.cristiana.voicu@intel.com>
References: <cover.1384786750.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1384786750.git.cristiana.voicu@intel.com>
References: <cover.1384786750.git.cristiana.voicu@intel.com>
Subject: [PATCH 1/2] at-spi2-core: upgrade to 2.10.2
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
X-List-Received-Date: Mon, 18 Nov 2013 14:57:48 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 ...-spi2-core_2.10.0.bb => at-spi2-core_2.10.2.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.10.0.bb => at-spi2-core_2.10.2.bb} (77%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.10.0.bb b/meta/recipes-support/atk/at-spi2-core_2.10.2.bb
similarity index 77%
rename from meta/recipes-support/atk/at-spi2-core_2.10.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.10.2.bb
index a6ff734..1cfbc9f 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.10.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.10.2.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "bb3b6f5679ecfc7dabcf76a1b6bfe2db"
-SRC_URI[sha256sum] = "964155c7574220a00e11e1c0d91f2d3017ed603920eb1333ff9cbdb6a22744db"
+SRC_URI[md5sum] = "d4a198201f6189fb248f3edd19efe39c"
+SRC_URI[sha256sum] = "d3da58f84f4c8e4d5fe940ecb52fb27b4d9ea2b4dcdb3e1fae0f46b5eaa2dde1"
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
 
-- 
1.7.9.5


