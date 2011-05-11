Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QK3mZ-0003ed-RL
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 09:24:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 May 2011 00:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; d="scan'208";a="434128699"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by azsmga001.ch.intel.com with ESMTP; 11 May 2011 00:21:31 -0700
Message-Id: <e8e9853186f1ac9524a0cda485eb877bd2effc67.1305098201.git.ke.yu@intel.com>
In-Reply-To: <cover.1305098201.git.ke.yu@intel.com>
References: <cover.1305098201.git.ke.yu@intel.com>
Old-Date: Fri, 6 May 2011 17:02:21 +0800
Date: Wed, 11 May 2011 15:27:47 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 1/5] xf86-video-intel: upgrade from 2.14.0 to 2.15.0
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
X-List-Received-Date: Wed, 11 May 2011 07:24:32 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../distro/include/preferred-xorg-versions.inc     |    2 +-
 ...-intel_2.14.0.bb => xf86-video-intel_2.15.0.bb} |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.14.0.bb => xf86-video-intel_2.15.0.bb} (83%)

diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
index da730e6..7afa8c9 100644
--- a/meta/conf/distro/include/preferred-xorg-versions.inc
+++ b/meta/conf/distro/include/preferred-xorg-versions.inc
@@ -145,6 +145,6 @@ PREFERRED_VERSION_xf86-input-evdev ?= "2.6.0"
 PREFERRED_VERSION_xf86-input-mouse ?= "1.7.0"
 PREFERRED_VERSION_xf86-input-keyboard ?= "1.6.0"
 PREFERRED_VERSION_xf86-input-synaptics ?= "1.4.0"
-PREFERRED_VERSION_xf86-video-intel ?= "2.14.0"
+PREFERRED_VERSION_xf86-video-intel ?= "2.15.0"
 
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.14.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.15.0.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.14.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.15.0.bb
index 099cf9d..6c9db59 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.14.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.15.0.bb
@@ -9,7 +9,7 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-PR = "r1"
+PR = "r0"
 
 EXTRA_OECONF += "--disable-xvmc"
 
@@ -21,5 +21,5 @@ DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "05f187582aeabda57fcd6f2782cfbf8e"
-SRC_URI[sha256sum] = "e18c37a579a960516e69de5c6f74750ca02208c0e41cf763ae5630c84db507df"
+SRC_URI[md5sum] = "ba56ae395a9769ada1fef2014468bee9"
+SRC_URI[sha256sum] = "c377e1e9ab8b846d7e039acc9105479d5dce6a03f1ddccccf01c8474259c1720"
-- 
1.7.0.4



