Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UapAE-0006yy-MH
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 17:23:26 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 10 May 2013 08:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,648,1363158000"; d="scan'208";a="331999024"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 08:04:29 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 18:04:14 +0300
Message-Id: <20470b0ecae97392f6e2cf886079fbf057bda3c6.1368198012.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/8] xf86-video-intel: upgrade to 2.21.6
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
X-List-Received-Date: Fri, 10 May 2013 15:23:27 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...-intel_2.21.3.bb => xf86-video-intel_2.21.6.bb} |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.3.bb => xf86-video-intel_2.21.6.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.3.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.6.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.3.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.6.bb
index da63ef4..7e65f9f 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.6.bb
@@ -9,8 +9,6 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-PR = "${INC_PR}.0"
-
 DEPENDS += "virtual/libx11 drm xf86driproto glproto \
 	    virtual/libgl xineramaproto xf86driproto libpciaccess udev"
 
@@ -23,5 +21,5 @@ EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "362a1d70082f5c0d2410aaf87b5125ba"
-SRC_URI[sha256sum] = "1ce672a042226dba776649e9067827c24fbb27383c78919a372265bb0d939dbb"
+SRC_URI[md5sum] = "a4f002f50b370fe550231c9b33e12399"
+SRC_URI[sha256sum] = "c3ef371e72544350c878d5373b2e7f49b8a0e253f9b63cb1ce2881180b45f8d9"
-- 
1.7.9.5



