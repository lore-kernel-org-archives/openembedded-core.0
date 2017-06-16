Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 365F4784D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279615"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:18 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:54 +0300
Message-Id: <e936aef3c0e6370b8fd75ec063b8f3aa6e4587c8.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 31/32] npth: update to 1.5
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:30 -0000

Licensing has changed to LGPLv2+.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/npth/{npth_1.3.bb => npth_1.5.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-support/npth/{npth_1.3.bb => npth_1.5.bb} (61%)

diff --git a/meta/recipes-support/npth/npth_1.3.bb b/meta/recipes-support/npth/npth_1.5.bb
similarity index 61%
rename from meta/recipes-support/npth/npth_1.3.bb
rename to meta/recipes-support/npth/npth_1.5.bb
index d4fc064bf2a..54de70c5c08 100644
--- a/meta/recipes-support/npth/npth_1.3.bb
+++ b/meta/recipes-support/npth/npth_1.5.bb
@@ -1,18 +1,17 @@
 SUMMARY = "New GNU Portable Threads library"
 HOMEPAGE = "http://www.gnupg.org/software/pth/"
 SECTION = "libs"
-LICENSE = "LGPLv3+ & GPLv2+"
+LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=751419260aa954499f7abaabaa882bbe\
-    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6\
+    file://COPYING.LIB;md5=2caced0b25dfefd4c601d92bd15116de\
     "
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/npth/npth-${PV}.tar.bz2 \
            file://pkgconfig.patch \
           "
 
-SRC_URI[md5sum] = "efe1524c53670b5755dc27893d2d68a0"
-SRC_URI[sha256sum] = "bca81940436aed0734eb8d0ff8b179e04cc8c087f5625204419f5f45d736a82a"
+SRC_URI[md5sum] = "9ba2dc4302d2f32c66737c43ed191b1b"
+SRC_URI[sha256sum] = "294a690c1f537b92ed829d867bee537e46be93fbd60b16c04630fbbfcd9db3c2"
 
 BINCONFIG = "${bindir}/npth-config"
 
-- 
2.11.0


