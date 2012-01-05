Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rigy3-0001EI-5i
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 07:38:28 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jan 2012 22:31:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94663928"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2012 22:31:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 22:30:49 -0800
Message-Id: <ea57bd7990e70dac873ce926b74fa1a1a6a5dee5.1325744640.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 24/28] udev: remove commented code from init script (no code changes)
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
X-List-Received-Date: Thu, 05 Jan 2012 06:39:36 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev.inc |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 2ced534..0e571d6 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -75,18 +75,6 @@ do_install_append () {
 	install -d ${D}${sysconfdir}/udev/rules.d/
 
 	install -m 0644 ${WORKDIR}/local.rules         ${D}${sysconfdir}/udev/rules.d/local.rules
-	#install -m 0644 ${WORKDIR}/permissions.rules   ${D}${sysconfdir}/udev/rules.d/permissions.rules
-	#install -m 0644 ${WORKDIR}/run.rules          ${D}${sysconfdir}/udev/rules.d/run.rules
-	#install -m 0644 ${WORKDIR}/udev.rules          ${D}${sysconfdir}/udev/rules.d/udev.rules
-	#install -m 0644 ${WORKDIR}/links.conf          ${D}${sysconfdir}/udev/links.conf
-	#if [ "${UDEV_DEVFS_RULES}" = "1" ]; then
-	#	install -m 0644 ${WORKDIR}/devfs-udev.rules ${D}${sysconfdir}/udev/rules.d/devfs-udev.rules
-	#fi
-
-	# Remove some default rules that don't work well on embedded devices
-	#rm ${D}${libexecdir}/rules.d/60-persistent-input.rules
-	#rm ${D}${libexecdir}/rules.d/60-persistent-storage.rules
-	#rm ${D}${libexecdir}/rules.d/60-persistent-storage-tape.rules
 
 	install -d ${D}${sysconfdir}/udev/scripts/
 
-- 
1.7.6.4



