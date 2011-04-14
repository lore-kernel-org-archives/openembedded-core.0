Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QAIQB-0000FO-1s
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2011 11:01:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Apr 2011 01:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,210,1301900400"; d="scan'208";a="733210617"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga001.jf.intel.com with ESMTP; 14 Apr 2011 01:58:47 -0700
Message-Id: <0a8f2fe9a2d54644d4c564309110b73bee9bb981.1302770941.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302770941.git.dexuan.cui@intel.com>
References: <cover.1302770941.git.dexuan.cui@intel.com>
Old-Date: Tue, 12 Apr 2011 01:08:38 +0800
Date: Thu, 14 Apr 2011 16:56:42 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [v2 10/12] preferred-xorg-versions.inc: update libxt, libxi, fixesproto, xproto, xextproto and libpciaccess
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
X-List-Received-Date: Thu, 14 Apr 2011 09:01:03 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../distro/include/preferred-xorg-versions.inc     |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
index b164b77..9a04be4 100644
--- a/meta/conf/distro/include/preferred-xorg-versions.inc
+++ b/meta/conf/distro/include/preferred-xorg-versions.inc
@@ -10,7 +10,7 @@ PREFERRED_VERSION_compositeproto ?= "0.4.2"
 PREFERRED_VERSION_damageproto ?= "1.2.1"
 PREFERRED_VERSION_dmxproto ?= "2.3.1"
 PREFERRED_VERSION_evieext ?= "1.1.0"
-PREFERRED_VERSION_fixesproto ?= "4.1.2"
+PREFERRED_VERSION_fixesproto ?= "5.0"
 PREFERRED_VERSION_fontcacheproto ?= "0.1.3"
 PREFERRED_VERSION_fontcacheproto-native ?= "0.1.3"
 PREFERRED_VERSION_fontsproto ?= "2.1.1"
@@ -56,7 +56,7 @@ PREFERRED_VERSION_libxfont ?= "1.4.3"
 PREFERRED_VERSION_libxfont-native ?= "1.4.3"
 PREFERRED_VERSION_libxfontcache ?= "1.0.5"
 PREFERRED_VERSION_libxft ?= "2.2.0"
-PREFERRED_VERSION_libxi ?= "1.4.0"
+PREFERRED_VERSION_libxi ?= "1.4.2"
 PREFERRED_VERSION_libxinerama ?= "1.1.1"
 PREFERRED_VERSION_libxkbfile ?= "1.0.7"
 PREFERRED_VERSION_libxkbui ?= "1.0.2"
@@ -71,7 +71,7 @@ PREFERRED_VERSION_libxrender ?= "0.9.6"
 PREFERRED_VERSION_libxrender-nativesdk ?= "0.9.6"
 PREFERRED_VERSION_libxres ?= "1.0.5"
 PREFERRED_VERSION_libxscrnsaver ?= "1.2.1"
-PREFERRED_VERSION_libxt ?= "1.0.9"
+PREFERRED_VERSION_libxt ?= "1.1.1"
 PREFERRED_VERSION_libxtrap ?= "1.0.0"
 PREFERRED_VERSION_libxtst ?= "1.2.0"
 PREFERRED_VERSION_libxv ?= "1.0.6"
@@ -103,9 +103,9 @@ PREFERRED_VERSION_xcmiscproto-native ?= "1.2.1"
 PREFERRED_VERSION_xcmiscproto-nativesdk ?= "1.2.1"
 PREFERRED_VERSION_xdpyinfo ?= "1.2.0"
 PREFERRED_VERSION_xev ?= "1.0.3"
-PREFERRED_VERSION_xextproto ?= "7.1.2"
-PREFERRED_VERSION_xextproto-native ?= "7.1.2"
-PREFERRED_VERSION_xextproto-nativesdk ?= "7.1.2"
+PREFERRED_VERSION_xextproto ?= "7.2.0"
+PREFERRED_VERSION_xextproto-native ?= "7.2.0"
+PREFERRED_VERSION_xextproto-nativesdk ?= "7.2.0"
 PREFERRED_VERSION_xf86bigfontproto ?= "1.2.0"
 PREFERRED_VERSION_xf86bigfontproto-native ?= "1.2.0"
 PREFERRED_VERSION_xf86bigfontproto-nativesdk ?= "1.2.0"
@@ -121,9 +121,9 @@ PREFERRED_VERSION_xineramaproto ?= "1.2.1"
 PREFERRED_VERSION_xmodmap ?= "1.0.5"
 PREFERRED_VERSION_xorg-cf-files ?= "1.0.3"
 PREFERRED_VERSION_xprop ?= "1.2.0"
-PREFERRED_VERSION_xproto ?= "7.0.20"
-PREFERRED_VERSION_xproto-native ?= "7.0.20"
-PREFERRED_VERSION_xproto-nativesdk ?= "7.0.20"
+PREFERRED_VERSION_xproto ?= "7.0.21"
+PREFERRED_VERSION_xproto-native ?= "7.0.21"
+PREFERRED_VERSION_xproto-nativesdk ?= "7.0.21"
 PREFERRED_VERSION_xproxymanagementprotocol ?= "1.0.3"
 PREFERRED_VERSION_xrandr ?= "1.3.4"
 PREFERRED_VERSION_xrdb ?= "1.0.5"
@@ -140,7 +140,7 @@ PREFERRED_VERSION_libdrm ?= "2.4.23"
 PREFERRED_VERSION_xcb-proto ?= "1.6"
 PREFERRED_VERSION_libxcb ?= "1.7"
 PREFERRED_VERSION_libxcb-nativesdk ?= "1.7"
-PREFERRED_VERSION_libpciaccess ?= "0.12.0"
+PREFERRED_VERSION_libpciaccess ?= "0.12.1"
 PREFERRED_VERSION_xf86-input-evdev ?= "2.6.0"
 PREFERRED_VERSION_xf86-input-mouse ?= "1.6.0"
 PREFERRED_VERSION_xf86-input-keyboard ?= "1.5.0"
-- 
1.7.2



