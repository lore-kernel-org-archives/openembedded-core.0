Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ionutx.radu@intel.com>) id 1Ua5rI-0001dU-D2
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 17:00:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2013 07:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="330858734"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2013 07:40:27 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 17:41:56 +0300
Message-Id: <1368024119-4149-7-git-send-email-ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
References: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
Subject: [PATCH 6/9] qemu: Updated from 1.4.0 to 1.4.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 15:02:20 -0000

0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch and 3f08ffb4a4741d147634761dc053ed386243a0de.patch were backported in 1.4.1

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                         |    1 -
 meta/recipes-devtools/qemu/{qemu_1.4.0.bb => qemu_1.4.1.bb} |    8 +++-----
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_1.4.0.bb => qemu_1.4.1.bb} (49%)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bd7890d..0a7dc4e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -26,7 +26,6 @@ SRC_URI = "\
     file://larger_default_ram_size.patch \
     file://arm-bgr.patch \
     file://Revert-vmware_vga-Add-back-some-info-in-local-state-.patch \
-    file://0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch \
     file://0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch \
     "
 
diff --git a/meta/recipes-devtools/qemu/qemu_1.4.0.bb b/meta/recipes-devtools/qemu/qemu_1.4.1.bb
similarity index 49%
rename from meta/recipes-devtools/qemu/qemu_1.4.0.bb
rename to meta/recipes-devtools/qemu/qemu_1.4.1.bb
index d968782..f59d28a 100644
--- a/meta/recipes-devtools/qemu/qemu_1.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.4.1.bb
@@ -3,10 +3,8 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-SRC_URI += "file://3f08ffb4a4741d147634761dc053ed386243a0de.patch \
-            file://fdt_header.patch \
-           "
+SRC_URI += "file://fdt_header.patch"
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
-SRC_URI[md5sum] = "78f13b774814b6b7ebcaf4f9b9204318"
-SRC_URI[sha256sum] = "066297ed77408fb7588889c271a85cf3c259ad55c939315988e6062d7708eda8"
+SRC_URI[md5sum] = "eb2d696956324722b5ecfa46e41f9a75"
+SRC_URI[sha256sum] = "75063a9326221607de3599e89fb5af80f2d8080ddc55ca253fff113843432df1"
-- 
1.7.10.4



