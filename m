Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TsFgA-0006le-4l
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 17:36:06 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jan 2013 08:19:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="268721119"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2013 08:20:50 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 18:20:48 +0200
Message-Id: <1357575648-13686-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] xf86-video-intel: upgrade to 2.20.17
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
X-List-Received-Date: Mon, 07 Jan 2013 16:36:09 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---

The recipe was built successfully for qemux86, qemux86-64 and atom-pc. Basic
functionality tests were done on an ideapad s10-3t netbook.

Thanks,
Laurentiu

 ...ntel_2.20.16.bb => xf86-video-intel_2.20.17.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.20.16.bb => xf86-video-intel_2.20.17.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.16.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.17.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.16.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.17.bb
index 31f6a91..c371796 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.16.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.17.bb
@@ -23,5 +23,5 @@ EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "bff3599b51e44c43c4213cb8d04fa13d"
-SRC_URI[sha256sum] = "308646d1d4b07e5c581cd7cca133b0e3410a1a3911a58d7d49b8ea106b64d0ba"
+SRC_URI[md5sum] = "b76a8ad65b3f6f2f5e0842a55abbffbd"
+SRC_URI[sha256sum] = "0bf5e9bd82b2643e06503665545f5cc8c3e24ab48ca4fe84f4e9e7ebbb9e7dbc"
-- 
1.7.9.5



