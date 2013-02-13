Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5fdr-0004E4-0C
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 17:57:26 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Feb 2013 08:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,658,1355126400"; d="scan'208";a="290652900"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2013 08:40:39 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Feb 2013 18:40:28 +0200
Message-Id: <d6a9e1b9ce237f707d8935cd050fca3735d84261.1360773347.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360773347.git.laurentiu.palcu@intel.com>
References: <cover.1360773347.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360773347.git.laurentiu.palcu@intel.com>
References: <cover.1360773347.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/7] xf86-video-intel: upgrade to 2.21.0
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
X-List-Received-Date: Wed, 13 Feb 2013 16:57:39 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...intel_2.20.17.bb => xf86-video-intel_2.21.0.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.20.17.bb => xf86-video-intel_2.21.0.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.17.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.17.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb
index c371796..157e0f3 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.17.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb
@@ -23,5 +23,5 @@ EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "b76a8ad65b3f6f2f5e0842a55abbffbd"
-SRC_URI[sha256sum] = "0bf5e9bd82b2643e06503665545f5cc8c3e24ab48ca4fe84f4e9e7ebbb9e7dbc"
+SRC_URI[md5sum] = "f029cc261fca75b32ba85b9c4189db88"
+SRC_URI[sha256sum] = "d872adef06cbf1a4434811baad4b8a18feacc6633b59b36557e8d7db7161081c"
-- 
1.7.9.5



