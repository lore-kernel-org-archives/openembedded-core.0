Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 57036767A4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 14:27:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Aug 2015 07:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,630,1432623600"; d="scan'208";a="779724774"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2015 07:27:50 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Aug 2015 17:28:44 +0300
Message-Id: <6ce3ab3e072f2e0c15ab95d9d5b3ca4b0097bae0.1438956967.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/7] oprofile: reorder SRC_URI lines to fix upstream version check
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
X-List-Received-Date: Fri, 07 Aug 2015 14:27:51 -0000

The source tarball should be listed first.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc      | 3 ++-
 meta/recipes-kernel/oprofile/oprofile_1.0.0.bb | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 49e6b16..6b393bc 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -18,7 +18,8 @@ FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
-SRC_URI = "file://filemode-fix.patch \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
+           file://filemode-fix.patch \
            file://acinclude.m4 \
            file://automake-foreign.patch \
            file://oprofile-cross-compile-tests.patch \
diff --git a/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb b/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb
index f4a34b3..b44b5c5 100644
--- a/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb
+++ b/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb
@@ -3,8 +3,6 @@ require oprofile.inc
 DEPENDS += "virtual/kernel"
 DEPENDS_append_powerpc64 = " libpfm4"
 
-SRC_URI += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "ba0b340e5c421a93959776c836ed35b3"
 SRC_URI[sha256sum] = "847110b4ecdcf8c8353cd38f94c1b704aad4bfcd9453e38b88d112cfb7e3c45a"
 
-- 
2.1.4


