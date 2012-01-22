Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1lj-0002Jt-8Y
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 19:03:55 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Jan 2012 09:56:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98550008"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by azsmga001.ch.intel.com with ESMTP; 22 Jan 2012 09:56:10 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:15 +0800
Message-Id: <dd269ac336536e071c71ec0eb741cd5587d0a8f1.1327255446.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 10/18] bluez4: upgrade to 4.98
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
X-List-Received-Date: Sun, 22 Jan 2012 18:03:55 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{bluez4-4.96 => bluez4-4.98}/bluetooth.conf    |    0
 .../bluez/{bluez4_4.96.bb => bluez4_4.98.bb}       |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/bluez/{bluez4-4.96 => bluez4-4.98}/bluetooth.conf (100%)
 rename meta/recipes-connectivity/bluez/{bluez4_4.96.bb => bluez4_4.98.bb} (86%)

diff --git a/meta/recipes-connectivity/bluez/bluez4-4.96/bluetooth.conf b/meta/recipes-connectivity/bluez/bluez4-4.98/bluetooth.conf
similarity index 100%
rename from meta/recipes-connectivity/bluez/bluez4-4.96/bluetooth.conf
rename to meta/recipes-connectivity/bluez/bluez4-4.98/bluetooth.conf
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb b/meta/recipes-connectivity/bluez/bluez4_4.98.bb
similarity index 86%
rename from meta/recipes-connectivity/bluez/bluez4_4.96.bb
rename to meta/recipes-connectivity/bluez/bluez4_4.98.bb
index 88ec7a4..62de1fe 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.98.bb
@@ -1,11 +1,11 @@
 require bluez4.inc
 
-PR = "r4"
+PR = "r0"
 
 SRC_URI += "file://bluetooth.conf"
 
-SRC_URI[md5sum] = "296111afac49e3f9035085ac14daf518"
-SRC_URI[sha256sum] = "c06fd50fd77909cad55e3181a42c6bce7cfcf7abb8cd87871c13d0d70f87fa99"
+SRC_URI[md5sum] = "362864b716950baa04797de735fc237b"
+SRC_URI[sha256sum] = "9a5b655bada7c7a1921cb3bac83b8a32bbe49893e4c7a1377cdc1b0d35f7d233"
 
 do_install_append() {
 	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
-- 
1.7.6



