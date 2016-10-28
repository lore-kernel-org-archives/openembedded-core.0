Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 392AA71D61
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:14:58 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 28 Oct 2016 08:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,410,1473145200"; d="scan'208";a="24878509"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Oct 2016 08:14:59 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 18:12:05 +0300
Message-Id: <969f5145d6d08edd7e907cdf46ebb6b8b85bec6d.1477667287.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 02/26] gummiboot: enable optional building of manpages
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
X-List-Received-Date: Fri, 28 Oct 2016 15:14:58 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-bsp/gummiboot/gummiboot_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
index 376ab54..c684b83 100644
--- a/meta/recipes-bsp/gummiboot/gummiboot_git.bb
+++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "gnu-efi util-linux"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig manpages
 inherit deploy
 
 PV = "48+git${SRCPV}"
@@ -16,6 +16,8 @@ SRC_URI = "git://anongit.freedesktop.org/gummiboot \
            file://0001-console-Fix-C-syntax-errors-for-function-declaration.patch \
           "
 
+PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
+
 # Note: Add COMPATIBLE_HOST here is only because it depends on gnu-efi
 # which has set the COMPATIBLE_HOST, the gummiboot itself may work on
 # more hosts.
@@ -23,7 +25,7 @@ COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF = "--disable-manpages --with-efi-includedir=${STAGING_INCDIR} \
+EXTRA_OECONF = "--with-efi-includedir=${STAGING_INCDIR} \
                 --with-efi-ldsdir=${STAGING_LIBDIR} \
                 --with-efi-libdir=${STAGING_LIBDIR}"
 
-- 
2.9.3


