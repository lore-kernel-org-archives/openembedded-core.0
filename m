Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7EAA46B1F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:10:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 06:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="354884429"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2013 06:10:06 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:09:50 +0300
Message-Id: <de4662434f41ce17bee8887ed8bfd22f586e4252.1375275560.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
Subject: [PATCH 06/13] libpciaccess: upgrade to 0.13.2
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
X-List-Received-Date: Wed, 31 Jul 2013 13:10:17 -0000

Licence MD5 changed because some years were updated and some new people
added their own copyright text which, apparently, is similar with what
already exists in the file.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...bpciaccess_0.13.1.bb => libpciaccess_0.13.2.bb} |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.13.1.bb => libpciaccess_0.13.2.bb} (50%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.1.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb
similarity index 50%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.13.1.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb
index 0ec6814..6da86f2 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb
@@ -6,9 +6,7 @@ PCI bus and devices in a platform-independent way."
 require xorg-lib-common.inc
 
 LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=de01cb89a769dc657d4c321c209ce4fc"
+LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
 
-PR = "r1"
-
-SRC_URI[md5sum] = "399a419ac6a54f0fc07c69c9bdf452dc"
-SRC_URI[sha256sum] = "27ab68f645691a4ca258dcc9d131040586e134f9233ce079794496f6264da084"
+SRC_URI[md5sum] = "b7c0d3afce14eedca57312a3141ec13a"
+SRC_URI[sha256sum] = "abab8c2b050afb89bc29280e9c6b50ec5867174960d88bfb81a01036ec20de19"
-- 
1.7.9.5


