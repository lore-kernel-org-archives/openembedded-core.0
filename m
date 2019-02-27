Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EAC887C81B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 03:17:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2019 19:17:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,417,1544515200"; d="scan'208";a="322424645"
Received: from anmitta2-mobl1.png.intel.com ([10.221.17.109])
	by fmsmga006.fm.intel.com with ESMTP; 26 Feb 2019 19:17:12 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 11:17:10 +0800
Message-Id: <20190227031710.20547-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] xserver-xorg: upgrade 1.20.3 -> 1.20.4
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
X-List-Received-Date: Wed, 27 Feb 2019 03:17:12 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{xserver-xorg_1.20.3.bb => xserver-xorg_1.20.4.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.3.bb => xserver-xorg_1.20.4.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.3.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.3.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
index 1caa154a23..3f55987bba 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.3.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
@@ -4,8 +4,8 @@ SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
             file://pkgconfig.patch \
             "
-SRC_URI[md5sum] = "8ee29e8b24cef6b3cfa747ec01b9155a"
-SRC_URI[sha256sum] = "1b3ce466c12cacbe2252b3ad5b0ed561972eef9d09e75900d65fb1e21f9201de"
+SRC_URI[md5sum] = "c4841cc24b79420205d082fe82e0a650"
+SRC_URI[sha256sum] = "fe0fd493ebe93bfc56bede382fa204458ff5f636ea54d413a5d1bd58e19166ee"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.17.1


