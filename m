Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWM-0002y6-0H
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:22:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416708"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:19 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:10:56 +0300
Message-Id: <c3cdc228d2e00da0310d2130a419fad6af72812f.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 04/19] kbproto: upgrade to 1.0.6
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

Also, shifted up one line the start and end lines for licence checksum
computation.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{kbproto_1.0.5.bb => kbproto_1.0.6.bb}         |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{kbproto_1.0.5.bb => kbproto_1.0.6.bb} (68%)

diff --git a/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb b/meta/recipes-graphics/xorg-proto/kbproto_1.0.6.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb
rename to meta/recipes-graphics/xorg-proto/kbproto_1.0.6.bb
index f1f7cbb..9177903 100644
--- a/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-proto/kbproto_1.0.6.bb
@@ -8,12 +8,12 @@ to keyboard handling and layout."
 
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7dd6ea99e2a83a552c02c80963623c38 \
-                    file://XKBproto.h;beginline=2;endline=26;md5=5744eeff407aeb6e7a1346eebab486a2"
+                    file://XKBproto.h;beginline=1;endline=25;md5=5744eeff407aeb6e7a1346eebab486a2"
 
 PR = "r0"
 PE = "1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "e7edb59a3f54af15f749e8f3e314ee62"
-SRC_URI[sha256sum] = "0eba4f525e1700798cc0585fe29556e4369fba6517c670866273ad104cf5f49d"
+SRC_URI[md5sum] = "677ea8523eec6caca86121ad2dca0b71"
+SRC_URI[sha256sum] = "037cac0aeb80c4fccf44bf736d791fccb2ff7fd34c558ef8f03ac60b61085479"
-- 
1.7.9.5



