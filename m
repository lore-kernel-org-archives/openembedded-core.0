Return-Path: <amarnath.valluri@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 75D36734B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 11:16:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jul 2015 04:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,529,1432623600"; d="scan'208";a="769778305"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 23 Jul 2015 04:15:56 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 14:17:06 +0300
Message-Id: <1437650226-27368-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] libical: Upgrade v1.0.0 -> v1.0.1
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
X-List-Received-Date: Thu, 23 Jul 2015 11:16:22 -0000

- Build system changed from autotools to cmake.
- Perl dependency added.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 .../libical/{libical_1.0.0.bb => libical_1.0.1.bb}                | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libical/{libical_1.0.0.bb => libical_1.0.1.bb} (66%)

diff --git a/meta/recipes-support/libical/libical_1.0.0.bb b/meta/recipes-support/libical/libical_1.0.1.bb
similarity index 66%
rename from meta/recipes-support/libical/libical_1.0.0.bb
rename to meta/recipes-support/libical/libical_1.0.1.bb
index be6b635..59ecdad 100644
--- a/meta/recipes-support/libical/libical_1.0.0.bb
+++ b/meta/recipes-support/libical/libical_1.0.1.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
 SECTION = "libs"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "f4b8e33ae5efb2f025eb43ce69682a36"
-SRC_URI[sha256sum] = "0072e83834092315772e6719b85fc8b11530b1ff53f4d108315fb38cddbce8c2"
+SRC_URI[md5sum] = "af91db06b22559f863869c5a382ad08a"
+SRC_URI[sha256sum] = "7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb14249d1413d6c610c"
 
-inherit autotools
+inherit cmake perlnative
+
+FILES_${PN}-dev += "${libdir}/cmake/LibIcal/*.cmake"
-- 
2.1.4

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


