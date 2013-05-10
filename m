Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Uap9z-0006xl-Od
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 17:23:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 10 May 2013 08:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,648,1363158000"; d="scan'208";a="331999112"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 08:04:34 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 18:04:19 +0300
Message-Id: <8c9c3c5382faf39242fe69adc402e3aac4811296.1368198012.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
Subject: [PATCH 7/8] xproto: upgrade to 7.0.24
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 15:23:26 -0000
X-List-Received-Date: Fri, 10 May 2013 15:23:26 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{xproto_7.0.23.bb => xproto_7.0.24.bb}         |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.23.bb => xproto_7.0.24.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-proto/xproto_7.0.23.bb b/meta/recipes-graphics/xorg-proto/xproto_7.0.24.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-proto/xproto_7.0.23.bb
rename to meta/recipes-graphics/xorg-proto/xproto_7.0.24.bb
index 486e562..2c6cbc0 100644
--- a/meta/recipes-graphics/xorg-proto/xproto_7.0.23.bb
+++ b/meta/recipes-graphics/xorg-proto/xproto_7.0.24.bb
@@ -8,7 +8,6 @@ System."
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b9e051107d5628966739a0b2e9b32676"
 
-PR = "r0"
 PE = "1"
 
 SRC_URI += "file://xproto_fix_for_x32.patch"
@@ -16,6 +15,6 @@ SRC_URI += "file://xproto_fix_for_x32.patch"
 EXTRA_OECONF_append = " --enable-specs=no"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "d4d241a4849167e4e694fe73371c328c"
-SRC_URI[sha256sum] = "ade04a0949ebe4e3ef34bb2183b1ae8e08f6f9c7571729c9db38212742ac939e"
+SRC_URI[md5sum] = "9c0203c3bee4bac432ec504dc45712ed"
+SRC_URI[sha256sum] = "3698a1c7e3b734bc1139a7eb694ed8c66188658d6b4dea3d567066fe4e88b2fc"
 
-- 
1.7.9.5



