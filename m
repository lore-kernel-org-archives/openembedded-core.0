Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EE50D6DCFF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:29:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 07:29:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="450785165"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2014 07:29:45 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 17:29:27 +0200
Message-Id: <df48f9776e1244c4e2b9cb001d83a61cc6bb436e.1391699953.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
Subject: [PATCH 08/13] libmpc: upgrade to 1.0.2
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
X-List-Received-Date: Thu, 06 Feb 2014 15:30:01 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../libmpc/{libmpc_1.0.1.bb => libmpc_1.0.2.bb}    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libmpc/{libmpc_1.0.1.bb => libmpc_1.0.2.bb} (64%)

diff --git a/meta/recipes-support/libmpc/libmpc_1.0.1.bb b/meta/recipes-support/libmpc/libmpc_1.0.2.bb
similarity index 64%
rename from meta/recipes-support/libmpc/libmpc_1.0.1.bb
rename to meta/recipes-support/libmpc/libmpc_1.0.2.bb
index 0b4766c..41177eb 100644
--- a/meta/recipes-support/libmpc/libmpc_1.0.1.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.0.2.bb
@@ -5,8 +5,8 @@ DEPENDS = "gmp mpfr"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b32a2e1a3daa392372fbd586d1ed3679"
-SRC_URI[sha256sum] = "ed5a815cfea525dc778df0cb37468b9c1b554aaf30d9328b1431ca705b7400ff"
+SRC_URI[md5sum] = "68fadff3358fb3e7976c7a398a0af4c3"
+SRC_URI[sha256sum] = "b561f54d8a479cee3bc891ee52735f18ff86712ba30f036f8b8537bae380c488"
 
 S = "${WORKDIR}/mpc-${PV}"
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.9.5


