Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWM-0002y6-Rf
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:22:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416716"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:21 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:10:58 +0300
Message-Id: <e2915631cf670797c43e01ff95d79ff9823678ae.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 06/19] xextproto: upgrade to 7.2.1
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
 .../{xextproto_7.2.0.bb => xextproto_7.2.1.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xextproto_7.2.0.bb => xextproto_7.2.1.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb b/meta/recipes-graphics/xorg-proto/xextproto_7.2.1.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb
rename to meta/recipes-graphics/xorg-proto/xextproto_7.2.1.bb
index 09eb59a..69e4d0d 100644
--- a/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb
+++ b/meta/recipes-graphics/xorg-proto/xextproto_7.2.1.bb
@@ -21,5 +21,5 @@ EXTRA_OECONF_append = " --enable-specs=no"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "220732210ceffb01bf1caf970e3b1bfb"
-SRC_URI[sha256sum] = "d2bc4208c6b1883ebe00bc5c0048e5d825038cda56775f74bb4aa89afdc576d5"
+SRC_URI[md5sum] = "eaac343af094e6b608cf15cfba0f77c5"
+SRC_URI[sha256sum] = "7c53b105407ef3b2eb180a361bd672c1814524a600166a0a7dbbe76b97556d1a"
-- 
1.7.9.5



