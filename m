Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C50A66011C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 16:10:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2016 09:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,356,1459839600"; d="scan'208";a="986968594"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2016 09:10:54 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 03:09:08 -0500
Message-Id: <1463990948-23921-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v2] ghostscript: Update URL_SRI_BASE to point to github
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
X-List-Received-Date: Mon, 23 May 2016 16:10:56 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Starting at 9.18, latest releases (current and previous release) are placed on
github [1].

[1] https://github.com/ArtifexSoftware/ghostpdl-downloads/releases

[YOCTO #9573]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.18.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.18.bb b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
index d4222c7..1d76013 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
@@ -16,7 +16,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b17cea54743435ab2a581c237bea294a"
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libpng"
 DEPENDS_class-native = "libpng-native"
 
-SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.gz \
+# remove dots on PV, used on SRC_URI_BASE
+python () {
+       version = d.getVar('PV', True).split('.')
+       d.setVar('PV_NODOTS', ''.join(version))
+}
+
+SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${PV_NODOTS}/ghostscript-${PV}.tar.gz \
                 file://ghostscript-9.15-parallel-make.patch \
                 file://ghostscript-9.16-Werror-return-type.patch \
                 file://png_mak.patch \
-- 
2.6.6


