Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B8A6C606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 14:38:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 24 May 2016 07:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,360,1459839600"; d="scan'208";a="109594702"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 07:38:30 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 01:36:44 -0500
Message-Id: <1464071804-35217-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] ghostcript: Set UPSTREAM_CHECK_URI variable
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
X-List-Received-Date: Tue, 24 May 2016 14:38:34 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Set UPSTREAM_CHECK_URI (a github location), so package checking system gets the
latest version of the package.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.18.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.18.bb b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
index aa39345..eddf18d 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
@@ -16,6 +16,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b17cea54743435ab2a581c237bea294a"
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libpng"
 DEPENDS_class-native = "libpng-native"
 
+UPSTREAM_CHECK_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
+
 SRC_URI_BASE = "http://downloads.ghostscript.com/public/old-gs-releases/ghostscript-${PV}.tar.gz \
                 file://ghostscript-9.15-parallel-make.patch \
                 file://ghostscript-9.16-Werror-return-type.patch \
-- 
2.6.6


