Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iV-0003rX-SC
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:49:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:34:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440690"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:34:04 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:22 +0200
Message-Id: <0072c346f22b2821a65a2228023fccc017572567.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
Subject: [PATCH 10/15] libuser: upgrade to 0.58
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
X-List-Received-Date: Mon, 24 Dec 2012 08:49:00 -0000

License checksum modification due to:
    COPYING: Free Software Fondation address change
    lib/user.h: Free Software Fondation address change
    samples/testuser.c: Free Software Fondation address change

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../libuser/{libuser_0.57.1.bb => libuser_0.58.bb}           | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/libuser/{libuser_0.57.1.bb => libuser_0.58.bb} (65%)

diff --git a/meta/recipes-extended/libuser/libuser_0.57.1.bb b/meta/recipes-extended/libuser/libuser_0.58.bb
similarity index 65%
rename from meta/recipes-extended/libuser/libuser_0.57.1.bb
rename to meta/recipes-extended/libuser/libuser_0.58.bb
index 105bacf..fbd3dd5 100644
--- a/meta/recipes-extended/libuser/libuser_0.57.1.bb
+++ b/meta/recipes-extended/libuser/libuser_0.58.bb
@@ -5,17 +5,17 @@ HOMEPAGE = "https://fedorahosted.org/libuser/"
 BUGTRACKER = "https://fedorahosted.org/libuser/newticket"
 
 LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://lib/user.h;endline=19;md5=9bc141f2e0d3e8b97ecdc945b2ed1ec7 \
-                    file://samples/testuser.c;endline=19;md5=61e8c05bd37ce1cba5590071f6e17500"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
+                    file://lib/user.h;endline=19;md5=76b301f63c39fa992062395efbdc9558 \
+                    file://samples/testuser.c;endline=19;md5=3b87fa660fa3f4a6bb31d624afe30ba1"
 
 SECTION = "base"
 
 SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "be82c6941264d0b4bd04f95fb342ec7d"
-SRC_URI[sha256sum] = "a61289867581fa715354a3fafe09c3e481173ce0a2dcb33b04588b6ac13cead5"
-PR = "r3"
+SRC_URI[md5sum] = "1fc3ef3f3a3955b2d78562ff4daed793"
+SRC_URI[sha256sum] = "12a0c09d016d80687e04227a00a89e3c056d3b48bfa2444a9028e6474d8e1dbd"
+PR = "r0"
 
 DEPENDS = "popt libpam glib-2.0 xz-native docbook-utils-native linuxdoc-tools-native python"
 
-- 
1.7.11.7



