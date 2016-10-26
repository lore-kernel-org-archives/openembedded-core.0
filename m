Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 79BC571CE3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:38:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 26 Oct 2016 01:38:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,549,1473145200"; d="scan'208";a="1075916516"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2016 01:38:02 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 3A93F6A4006;
	Wed, 26 Oct 2016 01:37:27 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 11:37:37 +0300
Message-Id: <d1e085d361fa8af9d81fbf79be0a16010e93ab84.1477469885.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
References: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477469885.git.jussi.kukkonen@intel.com>
References: <cover.1477469885.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 14/16] libx11-diet: Upgrade 1.6.3 -> 1.6.4
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
X-List-Received-Date: Wed, 26 Oct 2016 08:38:00 -0000

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


