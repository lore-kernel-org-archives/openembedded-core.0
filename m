Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LEN-0000rW-0d
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:41:19 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:32:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121477944"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:32:33 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:10 +0800
Message-Id: <80c9232a4176a80eb3b9a24e4ea02a78ed04a077.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 13/60] bluez4: upgrade to 4.99
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
X-List-Received-Date: Fri, 16 Mar 2012 00:41:19 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{bluez4-4.98 => bluez4-4.99}/bluetooth.conf    |    0
 .../{bluez4-4.98 => bluez4-4.99}/sbc_mmx.patch     |    0
 .../bluez/{bluez4_4.98.bb => bluez4_4.99.bb}       |    6 +++---
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/bluez/{bluez4-4.98 => bluez4-4.99}/bluetooth.conf (100%)
 rename meta/recipes-connectivity/bluez/{bluez4-4.98 => bluez4-4.99}/sbc_mmx.patch (100%)
 rename meta/recipes-connectivity/bluez/{bluez4_4.98.bb => bluez4_4.99.bb} (86%)

diff --git a/meta/recipes-connectivity/bluez/bluez4-4.98/bluetooth.conf b/meta/recipes-connectivity/bluez/bluez4-4.99/bluetooth.conf
similarity index 100%
rename from meta/recipes-connectivity/bluez/bluez4-4.98/bluetooth.conf
rename to meta/recipes-connectivity/bluez/bluez4-4.99/bluetooth.conf
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.98/sbc_mmx.patch b/meta/recipes-connectivity/bluez/bluez4-4.99/sbc_mmx.patch
similarity index 100%
rename from meta/recipes-connectivity/bluez/bluez4-4.98/sbc_mmx.patch
rename to meta/recipes-connectivity/bluez/bluez4-4.99/sbc_mmx.patch
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.98.bb b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
similarity index 86%
rename from meta/recipes-connectivity/bluez/bluez4_4.98.bb
rename to meta/recipes-connectivity/bluez/bluez4_4.99.bb
index 9a4c682..9aef5ac 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.98.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
@@ -1,13 +1,13 @@
 require bluez4.inc
 
-PR = "r2"
+PR = "r0"
 
 SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch \
            "
 
-SRC_URI[md5sum] = "362864b716950baa04797de735fc237b"
-SRC_URI[sha256sum] = "9a5b655bada7c7a1921cb3bac83b8a32bbe49893e4c7a1377cdc1b0d35f7d233"
+SRC_URI[md5sum] = "570aa10692ed890aa0a4297b37824912"
+SRC_URI[sha256sum] = "d884b9aa5d3d9653c076b7646ca14a3e43eb84bccfe8193c49690f802bbd827c"
 
 do_install_append() {
 	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
-- 
1.7.6



