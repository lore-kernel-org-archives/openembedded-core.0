Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWL-0002y7-Ty
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:22:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416705"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:18 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:10:55 +0300
Message-Id: <b69906e6ab6fcbe0033d2008ddf1c3222dc79522.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 03/19] xproto: upgrade to 7.0.23
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2012 13:22:34 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{xproto_7.0.22.bb => xproto_7.0.23.bb}         |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.22.bb => xproto_7.0.23.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb b/meta/recipes-graphics/xorg-proto/xproto_7.0.23.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb
rename to meta/recipes-graphics/xorg-proto/xproto_7.0.23.bb
index 8f76314..486e562 100644
--- a/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb
+++ b/meta/recipes-graphics/xorg-proto/xproto_7.0.23.bb
@@ -8,7 +8,7 @@ System."
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b9e051107d5628966739a0b2e9b32676"
 
-PR = "r1"
+PR = "r0"
 PE = "1"
 
 SRC_URI += "file://xproto_fix_for_x32.patch"
@@ -16,6 +16,6 @@ SRC_URI += "file://xproto_fix_for_x32.patch"
 EXTRA_OECONF_append = " --enable-specs=no"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "da0b0eb2f432b7cc1d665b05422a0457"
-SRC_URI[sha256sum] = "ad8397dd2a3de7249d2f3fb3a49444fef71483d43681285936c11911663817a8"
+SRC_URI[md5sum] = "d4d241a4849167e4e694fe73371c328c"
+SRC_URI[sha256sum] = "ade04a0949ebe4e3ef34bb2183b1ae8e08f6f9c7571729c9db38212742ac939e"
 
-- 
1.7.9.5



