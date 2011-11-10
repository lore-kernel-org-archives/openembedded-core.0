Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOG-0005bO-8X
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:40 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351202"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:42:52 -0800
Message-Id: <1cbf6306a4f4fda80983be4ef9aa91f713cb1ed9.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 10/33] kbd: import from meta-oe
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:43 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* replaces console-tools used in keymaps

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/kbd/kbd_1.15.2.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/kbd/kbd_1.15.2.bb

diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kbd/kbd_1.15.2.bb
new file mode 100644
index 0000000..36e68a0
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "This package contains keytable files and keyboard utilities"
+# everything minus console-fonts is GPLv2+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=587ce626d15bd61699a64a6b8a5afefb"
+
+inherit autotools gettext
+
+BBCLASSEXTEND = "native"
+
+SRC_URI="${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
+SRC_URI[md5sum] = "e850eb91e4d3b94b194efe8e953204c5"
+SRC_URI[sha256sum] = "b3602d191eef7a6a8317fc3cd231efa40a89ac235dce57a77cac825a2a21eba6"
+
+PACKAGES += "${PN}-consolefonts ${PN}-keymaps ${PN}-unimaps ${PN}-consoletrans"
+
+FILES_${PN}-consolefonts = "${datadir}/consolefonts"
+FILES_${PN}-consoletrans = "${datadir}/consoletrans"
+FILES_${PN}-keymaps = "${datadir}/keymaps"
+FILES_${PN}-unimaps = "${datadir}/unimaps"
-- 
1.7.6.4



