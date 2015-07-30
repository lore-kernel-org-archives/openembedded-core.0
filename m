Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D713E764A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:31:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 06:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758407573"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 06:31:10 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:31:42 +0300
Message-Id: <eb991f734674a23f31de22ff59c8b2327aa26d36.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/26] oprofile: reorder SRC_URI lines to fix upstream version check
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
X-List-Received-Date: Thu, 30 Jul 2015 13:31:33 -0000

The source tarball should be listed first.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc      | 2 +-
 meta/recipes-kernel/oprofile/oprofile_1.0.0.bb | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 49e6b16..ff360d1 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -18,7 +18,7 @@ FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
-SRC_URI = "file://filemode-fix.patch \
+SRC_URI += "file://filemode-fix.patch \
            file://acinclude.m4 \
            file://automake-foreign.patch \
            file://oprofile-cross-compile-tests.patch \
diff --git a/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb b/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb
index f4a34b3..f75a1dd 100644
--- a/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb
+++ b/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb
@@ -1,13 +1,13 @@
-require oprofile.inc
-
 DEPENDS += "virtual/kernel"
 DEPENDS_append_powerpc64 = " libpfm4"
 
-SRC_URI += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "ba0b340e5c421a93959776c836ed35b3"
 SRC_URI[sha256sum] = "847110b4ecdcf8c8353cd38f94c1b704aad4bfcd9453e38b88d112cfb7e3c45a"
 
+require oprofile.inc
+
 S = "${WORKDIR}/oprofile-${PV}"
 
 PR = "r1"
-- 
2.1.4


