Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6C28065D34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 23:49:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2014 16:49:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,907,1389772800"; d="scan'208";a="497712227"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2014 16:49:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Apr 2014 16:49:23 -0700
Message-Id: <447023b05599a45c2daea122926199402f4ad9f9.1398210385.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
Subject: [PATCH 01/10] help2man update to 1.44.1
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
X-List-Received-Date: Tue, 22 Apr 2014 23:49:37 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../help2man/{help2man-native_1.44.1.bb => help2man-native_1.45.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.44.1.bb => help2man-native_1.45.1.bb} (79%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.44.1.bb b/meta/recipes-devtools/help2man/help2man-native_1.45.1.bb
similarity index 79%
rename from meta/recipes-devtools/help2man/help2man-native_1.44.1.bb
rename to meta/recipes-devtools/help2man/help2man-native_1.45.1.bb
index cf9a12d..dec17b5 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.44.1.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.45.1.bb
@@ -6,8 +6,8 @@ DEPENDS = "autoconf-native automake-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "a5dc6530340b41f0e492d400670dd7ae"
-SRC_URI[sha256sum] = "22de6846771921f455e389cdca07119d7f55b1877685b42dd5bbb9fc1377defb"
+SRC_URI[md5sum] = "8a8a5314284e46185e492756afdca29a"
+SRC_URI[sha256sum] = "c70fc791e6d13240327955de355244371b00bb1c9e247d5693ed601b716467c2"
 
 inherit autotools native
 
-- 
1.8.3.1


