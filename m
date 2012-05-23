Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWN-0002yE-4d
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:22:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416718"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:23 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:10:59 +0300
Message-Id: <5b1120caa839ab1daaa3c2341711aa781e69e11e.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 07/19] xcmiscproto: upgrade to 1.2.2
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
 .../{xcmiscproto_1.2.1.bb => xcmiscproto_1.2.2.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xcmiscproto_1.2.1.bb => xcmiscproto_1.2.2.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb b/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb
rename to meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb
index af5ddfd..b5c085c 100644
--- a/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb
@@ -14,5 +14,5 @@ PE = "1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "cd7372cd827bfd7ca7e9238f2ce274b1"
-SRC_URI[sha256sum] = "730e27e22bfb99409bc364233f3f766f5163de0cbf2edad33738cfdf55f04c15"
+SRC_URI[md5sum] = "5f4847c78e41b801982c8a5e06365b24"
+SRC_URI[sha256sum] = "b13236869372256c36db79ae39d54214172677fb79e9cdc555dceec80bd9d2df"
-- 
1.7.9.5



