Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzRC-0006GU-C1
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:57:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Apr 2011 23:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="910410931"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2011 23:54:34 -0700
Message-Id: <5279247a00d90d96196c1b38feea16d3cad7b9bc.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Sat, 9 Apr 2011 22:22:31 +0800
Date: Fri, 15 Apr 2011 23:54:33 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 34/58] xf86-input-keyboard: upgrade from 1.5.0 to 1.6.0
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
X-List-Received-Date: Sat, 16 Apr 2011 06:57:00 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../distro/include/preferred-xorg-versions.inc     |    2 +-
 ...board_1.5.0.bb => xf86-input-keyboard_1.6.0.bb} |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.5.0.bb => xf86-input-keyboard_1.6.0.bb} (74%)

diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
index 07eb35d..fb21c2c 100644
--- a/meta/conf/distro/include/preferred-xorg-versions.inc
+++ b/meta/conf/distro/include/preferred-xorg-versions.inc
@@ -143,7 +143,7 @@ PREFERRED_VERSION_libxcb-nativesdk ?= "1.7"
 PREFERRED_VERSION_libpciaccess ?= "0.12.1"
 PREFERRED_VERSION_xf86-input-evdev ?= "2.6.0"
 PREFERRED_VERSION_xf86-input-mouse ?= "1.6.0"
-PREFERRED_VERSION_xf86-input-keyboard ?= "1.5.0"
+PREFERRED_VERSION_xf86-input-keyboard ?= "1.6.0"
 PREFERRED_VERSION_xf86-input-synaptics ?= "1.4.0"
 PREFERRED_VERSION_xf86-video-intel ?= "2.14.0"
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.5.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.5.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb
index aa8be67..9b1441d 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb
@@ -11,5 +11,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea2099d24ac9e316a6d4b9f20b3d4e10"
 
 PR = "r0"
 
-SRC_URI[md5sum] = "b74d7162db5ce7899c17927c6cfa9522"
-SRC_URI[sha256sum] = "2303510e905465ebee91f22cdd75706a15afb108258bc220c7500f213de19cb0"
+SRC_URI[md5sum] = "e2abe9f13e526a73cb68a7d257546eba"
+SRC_URI[sha256sum] = "c46c790fec905d696573b7a374b10ab8b4389112a8f69993fe011006c99e858e"
-- 
1.7.1.1



