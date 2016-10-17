Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DF03E71B76
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:15:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 17 Oct 2016 08:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; d="scan'208";a="180649221"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2016 08:15:28 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 18:12:42 +0300
Message-Id: <016c3e6533828bcc14e2900384f5e99329ad2961.1476716907.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/23] gummiboot: enable optional building of manpages
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
X-List-Received-Date: Mon, 17 Oct 2016 15:15:26 -0000

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


