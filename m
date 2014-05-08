Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4BAEF65FB4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 15:07:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2014 08:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1010,1389772800"; d="scan'208";a="537126412"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2014 08:06:15 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 May 2014 18:05:56 +0300
Message-Id: <256c300abd9cfba29f482101942514fe8cff9cf9.1399561398.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1399561398.git.valentin.popa@intel.com>
References: <cover.1399561398.git.valentin.popa@intel.com>
In-Reply-To: <cover.1399561398.git.valentin.popa@intel.com>
References: <cover.1399561398.git.valentin.popa@intel.com>
Subject: [PATCH 1/4] libpng12: upgrade to 1.2.51
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
X-List-Received-Date: Thu, 08 May 2014 15:07:13 -0000

License is the same.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../libpng/{libpng12_1.2.50.bb => libpng12_1.2.51.bb}             | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-lsb4/libpng/{libpng12_1.2.50.bb => libpng12_1.2.51.bb} (70%)

diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.51.bb
similarity index 70%
rename from meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
rename to meta/recipes-lsb4/libpng/libpng12_1.2.51.bb
index 29d581b..6b2dcba 100644
--- a/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
+++ b/meta/recipes-lsb4/libpng/libpng12_1.2.51.bb
@@ -2,8 +2,8 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
-                    file://png.h;beginline=310;endline=424;md5=b87b5e9252a3e14808a27b92912d268d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ec135c8490e3b3d4ba2cc21f84c3a294 \
+                    file://png.h;beginline=314;endline=428;md5=151cf86c4efc2a7400f8a9a61d743d8e"
 DEPENDS = "zlib"
 
 PN = "libpng12"
@@ -11,8 +11,8 @@ S = "${WORKDIR}/libpng-${PV}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "a3e00fccbfe356174ab515b5c00641c7"
-SRC_URI[sha256sum] = "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9fbaff07bfd9d8e8e7"
+SRC_URI[md5sum] = "4efba67fa5aa2b785c6fcec2cc3e90c9"
+SRC_URI[sha256sum] = "c7d7b813b022afd70474f78bcc3655c7bb54edbf28dd4652e5521cbb6da56d4a"
 
 BINCONFIG_GLOB = "${PN}-config"
 
-- 
1.9.1


