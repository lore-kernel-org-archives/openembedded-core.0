Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1371C76970
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 19:12:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2015 12:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,655,1432623600"; d="scan'208";a="782158015"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2015 12:12:29 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 22:13:57 +0300
Message-Id: <83d4e48449c0655bb354cc3589b4cc81ef28444a.1439318387.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <65f10f6264c7a8d751c5d0a56a38c920e02236b2.1439318387.git.jussi.kukkonen@intel.com>
References: <65f10f6264c7a8d751c5d0a56a38c920e02236b2.1439318387.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1439318387.git.jussi.kukkonen@intel.com>
References: <cover.1439318387.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/4] nss: Upgrade 3.19.1 -> 3.19.2
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
X-List-Received-Date: Tue, 11 Aug 2015 19:12:30 -0000

This is a bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/nss/{nss_3.19.1.bb => nss_3.19.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/nss/{nss_3.19.1.bb => nss_3.19.2.bb} (97%)

diff --git a/meta/recipes-support/nss/nss_3.19.1.bb b/meta/recipes-support/nss/nss_3.19.2.bb
similarity index 97%
rename from meta/recipes-support/nss/nss_3.19.1.bb
rename to meta/recipes-support/nss/nss_3.19.2.bb
index 66b9d60..23a4a1f 100644
--- a/meta/recipes-support/nss/nss_3.19.1.bb
+++ b/meta/recipes-support/nss/nss_3.19.2.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
                     file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
 SRC_URI = "\
-    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_19_1_RTM/src/${BP}.tar.gz \
+    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_19_2_RTM/src/${BP}.tar.gz \
     file://nss-fix-support-cross-compiling.patch \
     file://nss-no-rpath-for-cross-compiling.patch \
     file://nss-fix-incorrect-shebang-of-perl.patch \
@@ -24,8 +24,8 @@ SRC_URI = "\
     file://signlibs.sh \
 "
 
-SRC_URI[md5sum] = "68a9c01c987b9bd92066b4e0041f3e58"
-SRC_URI[sha256sum] = "b7be709551ec13206d8e3e8c065b894fa981c11573115e9478fa051029c52fff"
+SRC_URI[md5sum] = "b02ffd1e8e8ef5f8512fa02d8ca9db3d"
+SRC_URI[sha256sum] = "1306663e8f61d8449ad8cbcffab743a604dcd9f6f34232c210847c51dce2c9ae"
 
 inherit siteinfo
 
-- 
2.1.4


