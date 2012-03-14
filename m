Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7jmk-0004Xg-RP
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:42:19 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 01:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138551623"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2012 01:33:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 01:33:24 -0700
Message-Id: <c7f44d97ef3d008db7f753439e06ed7f602b70a9.1331713807.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
Subject: [PATCH 13/14] man: fix configure issue to solve warnings
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
X-List-Received-Date: Wed, 14 Mar 2012 08:42:19 -0000

WARNING: For recipe man, the following files/directories were installed but not shipped in any package:
WARNING:   /intel
WARNING:   /intel/poky
WARNING:   /intel/poky/builds
WARNING:   /intel/poky/builds/world
WARNING:   /intel/poky/builds/world/tmp
WARNING:   /intel/poky/builds/world/tmp/work
WARNING:   /intel/poky/builds/world/tmp/work/i586-poky-linux
WARNING:   /intel/poky/builds/world/tmp/work/i586-poky-linux/man-1.6f-r1
WARNING:   /intel/poky/builds/world/tmp/work/i586-poky-linux/man-1.6f-r1/image
WARNING:   /intel/poky/builds/world/tmp/work/i586-poky-linux/man-1.6f-r1/image/etc
WARNING:   /intel/poky/builds/world/tmp/work/i586-poky-linux/man-1.6f-r1/image/etc/man.config
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/man/man_1.6f.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/man/man_1.6f.bb b/meta/recipes-extended/man/man_1.6f.bb
index c98c920..ee3d648 100644
--- a/meta/recipes-extended/man/man_1.6f.bb
+++ b/meta/recipes-extended/man/man_1.6f.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A set of documentation tools: man, apropos and whatis"
 SECTION = "console/utils"
 HOMEPAGE = "http://primates.ximian.com/~flucifredi/man"
 LICENSE = "GPLv2"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "groff less"
 
@@ -42,7 +42,7 @@ SRC_URI[sha256sum] = "9f208c7e1981371ad4481d6e6c2c566bc726a15778723f94136d220fb9
 
 
 do_configure () {
-        ${S}/configure -default -confdir ${D}/etc +sgid +fhs +lang all
+        ${S}/configure -default -confdir /etc +sgid +fhs +lang all
 }
 
 
-- 
1.7.7.6



