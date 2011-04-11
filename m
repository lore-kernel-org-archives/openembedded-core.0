Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Q95qt-0005il-OK
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Apr 2011 03:23:40 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Apr 2011 18:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,336,1299484800"; d="scan'208";a="416839092"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2011 18:21:25 -0700
Message-Id: <157c8536d2340e2efb6c229f7b5dab7adc077f95.1302485033.git.ke.yu@intel.com>
In-Reply-To: <cover.1302485033.git.ke.yu@intel.com>
References: <cover.1302485033.git.ke.yu@intel.com>
Old-Date: Thu, 7 Apr 2011 16:21:19 +0800
Date: Mon, 11 Apr 2011  9:28:36 +0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 2/9] xf86-input-synaptics: upgrade from 1.3.0 to 1.4.0
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
X-List-Received-Date: Mon, 11 Apr 2011 01:23:40 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../distro/include/preferred-xorg-versions.inc     |    2 +-
 ...tics_1.3.0.bb => xf86-input-synaptics_1.4.0.bb} |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.3.0.bb => xf86-input-synaptics_1.4.0.bb} (83%)

diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
index 092ba35..3d6d934 100644
--- a/meta/conf/distro/include/preferred-xorg-versions.inc
+++ b/meta/conf/distro/include/preferred-xorg-versions.inc
@@ -144,7 +144,7 @@ PREFERRED_VERSION_libpciaccess ?= "0.12.0"
 PREFERRED_VERSION_xf86-input-evdev ?= "2.6.0"
 PREFERRED_VERSION_xf86-input-mouse ?= "1.6.0"
 PREFERRED_VERSION_xf86-input-keyboard ?= "1.5.0"
-PREFERRED_VERSION_xf86-input-synaptics ?= "1.3.0"
+PREFERRED_VERSION_xf86-input-synaptics ?= "1.4.0"
 PREFERRED_VERSION_xf86-video-intel ?= "2.14.0"
 
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.3.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.4.0.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.3.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.4.0.bb
index b0953bb..39cd35f 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.4.0.bb
@@ -18,5 +18,5 @@ DEPENDS += "libxi"
 #
 EXTRA_OEMAKE += " sdkdir=${STAGING_INCDIR}/xorg "
 
-SRC_URI[md5sum] = "b4e58eba1bdca13f0929a4b03b262135"
-SRC_URI[sha256sum] = "30a33250c4f3d2daa8a61cab847dc7befd3248db0fca139d17fd7b890b5a8fd7"
+SRC_URI[md5sum] = "cbe487f9d22237d1e39c7d0b5812ab7e"
+SRC_URI[sha256sum] = "5874d979f028636dbddf14fffb84b496b006e63d5ea8dfa120820e58642812c2"
-- 
1.7.0.4



