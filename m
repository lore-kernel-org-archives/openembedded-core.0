Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B5C956EFDB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 08:23:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 00:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,859,1384329600"; d="scan'208";a="476400703"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.197])
	by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2014 00:23:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 00:22:57 -0800
Message-Id: <48c17be97f0801da0dd707cca230ca884917bc80.1392625337.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1392625337.git.sgw@linux.intel.com>
References: <cover.1392625337.git.sgw@linux.intel.com>
In-Reply-To: <cover.1392625337.git.sgw@linux.intel.com>
References: <cover.1392625337.git.sgw@linux.intel.com>
Subject: [PATCH 2/7] help2man: Update to 1.44.1
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
X-List-Received-Date: Mon, 17 Feb 2014 08:23:03 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{help2man-native_1.43.3.bb => help2man-native_1.44.1.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.43.3.bb => help2man-native_1.44.1.bb} (72%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.43.3.bb b/meta/recipes-devtools/help2man/help2man-native_1.44.1.bb
similarity index 72%
rename from meta/recipes-devtools/help2man/help2man-native_1.43.3.bb
rename to meta/recipes-devtools/help2man/help2man-native_1.44.1.bb
index 5bf6149..cf9a12d 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.43.3.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.44.1.bb
@@ -4,10 +4,10 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "autoconf-native automake-native"
 
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "a84868db7c139238df8add5d86a0b54f"
-SRC_URI[sha256sum] = "67978d118980ebd9f0c60be5db129527900a7b997b9568fc795ba9bdb341d303"
+SRC_URI[md5sum] = "a5dc6530340b41f0e492d400670dd7ae"
+SRC_URI[sha256sum] = "22de6846771921f455e389cdca07119d7f55b1877685b42dd5bbb9fc1377defb"
 
 inherit autotools native
 
-- 
1.8.3.1


