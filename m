Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9002471CB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:22:31 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Oct 2016 03:22:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="182256764"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2016 03:22:33 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:22:12 +0300
Message-Id: <b5235d3a0b7906373a463c3891813856e2e5f284.1477032779.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
References: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477032779.git.jussi.kukkonen@intel.com>
References: <cover.1477032779.git.jussi.kukkonen@intel.com>
Subject: [PATCH 14/15] libx11-diet: Upgrade 1.6.3 -> 1.6.4
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
X-List-Received-Date: Fri, 21 Oct 2016 10:22:31 -0000

Maintenance release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-lib/{libx11-diet_1.6.3.bb => libx11-diet_1.6.4.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.6.3.bb => libx11-diet_1.6.4.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.3.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.4.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/libx11-diet_1.6.3.bb
rename to meta/recipes-graphics/xorg-lib/libx11-diet_1.6.4.bb
index c0d0148..0c761d7 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.4.bb
@@ -11,8 +11,8 @@ SRC_URI += "file://X18NCMSstubs.diff \
 RPROVIDES_${PN}-dev = "libx11-dev"
 RPROVIDES_${PN}-locale = "libx11-locale"
 
-SRC_URI[md5sum] = "2e36b73f8a42143142dda8129f02e4e0"
-SRC_URI[sha256sum] = "cf31a7c39f2f52e8ebd0db95640384e63451f9b014eed2bb7f5de03e8adc8111"
+SRC_URI[md5sum] = "6d54227082f3aa2c596f0b3a3fbb9175"
+SRC_URI[sha256sum] = "b7c748be3aa16ec2cbd81edc847e9b6ee03f88143ab270fb59f58a044d34e441"
 
 EXTRA_OECONF += "--disable-xlocale"
 
-- 
2.1.4


