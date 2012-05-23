Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWM-0002y7-MR
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:22:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416712"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:20 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:10:57 +0300
Message-Id: <c1400e7bd5d40bc0327196092dca4d3027f0b45f.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 05/19] fontsproto: upgrade to 2.1.2
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
 .../{fontsproto_2.1.1.bb => fontsproto_2.1.2.bb}   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{fontsproto_2.1.1.bb => fontsproto_2.1.2.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-proto/fontsproto_2.1.1.bb b/meta/recipes-graphics/xorg-proto/fontsproto_2.1.2.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-proto/fontsproto_2.1.1.bb
rename to meta/recipes-graphics/xorg-proto/fontsproto_2.1.2.bb
index af59240..d87786e 100644
--- a/meta/recipes-graphics/xorg-proto/fontsproto_2.1.1.bb
+++ b/meta/recipes-graphics/xorg-proto/fontsproto_2.1.2.bb
@@ -15,5 +15,5 @@ PE = "1"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "37102ffcaa73f77d700acd6f7a25d8f0"
-SRC_URI[sha256sum] = "9c9abc81e2927e6b6ffc6eece1f3fbc7559f506a2848673a21e72c0ae4d639bc"
+SRC_URI[md5sum] = "c5f4f1fb4ba7766eedbc9489e81f3be2"
+SRC_URI[sha256sum] = "869c97e5a536a8f3c9bc8b9923780ff1f062094bab935e26f96df3d6f1aa68a9"
-- 
1.7.9.5



