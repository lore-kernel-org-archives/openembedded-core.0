Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihai.prica@intel.com>) id 1UNjEC-0002VS-Eb
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 14:25:16 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Apr 2013 05:08:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,408,1363158000"; d="scan'208";a="222773740"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.142])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Apr 2013 05:08:01 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 15:09:15 +0300
Message-Id: <1365077355-17673-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V3] qemu: Enabled SDL when compiling for target architecture
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
X-List-Received-Date: Thu, 04 Apr 2013 12:25:16 -0000

Enables qemu to run images with video output without the need for vncviewer.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1b5b569..06fa88b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
-DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc"
+DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc libsdl"
 DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native dtc-native"
 DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
 RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
@@ -13,7 +13,7 @@ BBCLASSEXTEND = "native nativesdk"
 # QEMU_TARGETS is overridable variable
 QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 
-SDL ?= "--disable-sdl"
+SDL ?= ""
 SDL_class-native ?= ""
 SDL_class-nativesdk ?= ""
 
-- 
1.7.9.5



