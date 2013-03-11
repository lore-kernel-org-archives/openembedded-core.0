Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UF5py-0004Ug-Sz
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 17:44:35 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2013 09:27:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,824,1355126400"; d="scan'208";a="300091475"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2013 09:27:52 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 18:27:42 +0200
Message-Id: <59e7b03eb6aed062cfa6dfd9c10f1c2d6c58e8a7.1363018567.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363018567.git.laurentiu.palcu@intel.com>
References: <cover.1363018567.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1363018567.git.laurentiu.palcu@intel.com>
References: <cover.1363018567.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/4] xf86-video-intel: upgrade to 2.21.3
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
X-List-Received-Date: Mon, 11 Mar 2013 16:44:36 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...-intel_2.21.0.bb => xf86-video-intel_2.21.3.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.0.bb => xf86-video-intel_2.21.3.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.3.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.3.bb
index 157e0f3..6d83ef8 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.3.bb
@@ -23,5 +23,5 @@ EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "f029cc261fca75b32ba85b9c4189db88"
-SRC_URI[sha256sum] = "d872adef06cbf1a4434811baad4b8a18feacc6633b59b36557e8d7db7161081c"
+SRC_URI[md5sum] = "362a1d70082f5c0d2410aaf87b5125ba"
+SRC_URI[sha256sum] = "1ce672a042226dba776649e9067827c24fbb27383c78919a372265bb0d939dbb"
-- 
1.7.9.5



