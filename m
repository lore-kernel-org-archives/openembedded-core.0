Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqge-0008V4-1g
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495920"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:14:47 -0700
Message-Id: <34c3bd4ab5fa703c0c264f156709f619db1908a2.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
Subject: [PATCH 08/21] xserver-kdrive: Add SRC_URI Checksum
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
X-List-Received-Date: Thu, 06 Oct 2011 16:20:44 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
index c2067c9..c810e1b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN} += "xkeyboard-config"
 EXTRA_OECONF += "--disable-glx"
 
 PE = "1"
-PR = "r26"
+PR = "r27"
 
 SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 	file://extra-kmodes.patch \
@@ -25,5 +25,8 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 #	file://enable-builtin-fonts.patch
 #	file://optional-xkb.patch
 
+SRC_URI[md5sum] = "cafc4e2d4ef6cf6e47f3e7dffeb3346a"
+SRC_URI[sha256sum] = "a89f13b166b412930fe418ff50032dd2cde8bb181d8b47b5ca6f848d218fdcf2"
+
 
 S = "${WORKDIR}/xorg-server-${PV}"
-- 
1.7.6.2



