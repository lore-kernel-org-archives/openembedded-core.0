Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWs-0003Gz-Jf
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:23:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416737"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:26 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:11:02 +0300
Message-Id: <9d5f3a2fe37231da3359621acba82411254838ab.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 10/19] xcb-proto: upgrade to 1.7.1
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
X-List-Received-Date: Wed, 23 May 2012 13:23:06 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xcb/{xcb-proto_1.7.bb => xcb-proto_1.7.1.bb}   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xcb/{xcb-proto_1.7.bb => xcb-proto_1.7.1.bb} (61%)

diff --git a/meta/recipes-graphics/xcb/xcb-proto_1.7.bb b/meta/recipes-graphics/xcb/xcb-proto_1.7.1.bb
similarity index 61%
rename from meta/recipes-graphics/xcb/xcb-proto_1.7.bb
rename to meta/recipes-graphics/xcb/xcb-proto_1.7.1.bb
index fac24df..27050d2 100644
--- a/meta/recipes-graphics/xcb/xcb-proto_1.7.bb
+++ b/meta/recipes-graphics/xcb/xcb-proto_1.7.1.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
 
 PR = "r0"
 
-SRC_URI[md5sum] = "f5d73ec841ed055f5e80535819f18400"
-SRC_URI[sha256sum] = "e67eb7263f222133fb9d1de70928724bea3a448cdcd99d0fa4c63c04fc124b38"
+SRC_URI[md5sum] = "948fec39dd42f3694edd5d9689735ec4"
+SRC_URI[sha256sum] = "ad5d99887d811c9817f1916d7b3f5dc6c21414c093256cbeffb945aacdc34437"
-- 
1.7.9.5



