Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWN-0002y7-Dg
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:22:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416722"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:24 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:11:00 +0300
Message-Id: <202c8b37ddf9cd84fd303b246875fa9ae495e2d6.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 08/19] scrnsaverproto: upgrade to 1.2.2
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
X-List-Received-Date: Wed, 23 May 2012 13:22:35 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...saverproto_1.2.1.bb => scrnsaverproto_1.2.2.bb} |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{scrnsaverproto_1.2.1.bb => scrnsaverproto_1.2.2.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.1.bb b/meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.2.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.1.bb
rename to meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.2.bb
index fe937eb..3045ccf 100644
--- a/meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.2.bb
@@ -16,6 +16,5 @@ PE = "1"
 
 EXTRA_OECONF_append = " --enable-specs=no"
 
-SRC_URI[md5sum] = "6af0f2e3369f5f74e69345e214f5fd0d"
-SRC_URI[sha256sum] = "fad2f73cac136fcddd311d27a14ac7e519a9bec6ab272490d9c9b363556024f1"
-
+SRC_URI[md5sum] = "edd8a73775e8ece1d69515dd17767bfb"
+SRC_URI[sha256sum] = "8bb70a8da164930cceaeb4c74180291660533ad3cc45377b30a795d1b85bcd65"
-- 
1.7.9.5



