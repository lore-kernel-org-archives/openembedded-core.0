Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 88BB36017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 12:06:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 10 Jul 2015 05:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,446,1432623600"; d="scan'208";a="761914280"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by orsmga002.jf.intel.com with ESMTP; 10 Jul 2015 05:06:53 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jul 2015 15:07:06 +0300
Message-Id: <1436530026-31823-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V2] libical: upgrade to 1.0.1
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
X-List-Received-Date: Fri, 10 Jul 2015 12:06:53 -0000

Bugfix release mainly.
autotools build system removed, cmake is now used.
perl is needed during the configure phase.
Switched to releases download link.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../libical/{libical_1.0.0.bb => libical_1.0.1.bb}            | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libical/{libical_1.0.0.bb => libical_1.0.1.bb} (55%)

diff --git a/meta/recipes-support/libical/libical_1.0.0.bb b/meta/recipes-support/libical/libical_1.0.1.bb
similarity index 55%
rename from meta/recipes-support/libical/libical_1.0.0.bb
rename to meta/recipes-support/libical/libical_1.0.1.bb
index be6b635..eb93b4f 100644
--- a/meta/recipes-support/libical/libical_1.0.0.bb
+++ b/meta/recipes-support/libical/libical_1.0.1.bb
@@ -6,8 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
                     file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
 SECTION = "libs"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "f4b8e33ae5efb2f025eb43ce69682a36"
-SRC_URI[sha256sum] = "0072e83834092315772e6719b85fc8b11530b1ff53f4d108315fb38cddbce8c2"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI[md5sum] = "af91db06b22559f863869c5a382ad08a"
+SRC_URI[sha256sum] = "7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb14249d1413d6c610c"
+
+inherit cmake perlnative
+
+FILES_${PN}-dev += "${libdir}/cmake"
 
-inherit autotools
-- 
2.1.4


