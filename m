Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tkc7b-0002Bv-Ay
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 15:56:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Dec 2012 06:41:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,300,1355126400"; d="scan'208";a="235102416"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 17 Dec 2012 06:42:05 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 16:42:00 +0200
Message-Id: <1355755320-2375-3-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355755320-2375-1-git-send-email-laurentiu.palcu@intel.com>
References: <1355755320-2375-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] xf86-video-intel: upgrade to 2.20.16
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
X-List-Received-Date: Mon, 17 Dec 2012 14:57:02 -0000
X-List-Received-Date: Mon, 17 Dec 2012 14:57:02 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ntel_2.20.12.bb => xf86-video-intel_2.20.16.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.20.12.bb => xf86-video-intel_2.20.16.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.12.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.16.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.12.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.16.bb
index 09aa339..31f6a91 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.12.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.16.bb
@@ -23,5 +23,5 @@ EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "6d9565de03c167d8f621315476c20c73"
-SRC_URI[sha256sum] = "39e02b7f90a2665efe5483075f93b1c87d24f48070d5de783dd41e20d9eb0c7c"
+SRC_URI[md5sum] = "bff3599b51e44c43c4213cb8d04fa13d"
+SRC_URI[sha256sum] = "308646d1d4b07e5c581cd7cca133b0e3410a1a3911a58d7d49b8ea106b64d0ba"
-- 
1.7.9.5



