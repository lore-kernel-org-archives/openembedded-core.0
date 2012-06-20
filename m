Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <valentin.popa@intel.com>) id 1ShIZa-0000Av-NA
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 12:55:42 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jun 2012 03:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="167945610"
Received: from valentin-desktop (HELO localhost.localdomain) ([10.237.105.52])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2012 03:43:48 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 10:50:41 +0300
Message-Id: <1340178641-5900-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] evolution-data-server: updated to ver. 2.30_3
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
X-List-Received-Date: Wed, 20 Jun 2012 10:55:42 -0000

Tested using Tasks & Contacts

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-sato/eds/evolution-data-server_git.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/eds/evolution-data-server_git.bb b/meta/recipes-sato/eds/evolution-data-server_git.bb
index 1d675dc..17724ce 100644
--- a/meta/recipes-sato/eds/evolution-data-server_git.bb
+++ b/meta/recipes-sato/eds/evolution-data-server_git.bb
@@ -10,9 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libiconv zlib libsoup-2.4 libglade libical gnome-keyring gperf-native"
 
-SRCREV = "7337d11aed576e7caaa12b4e881ad8d33668799f"
+SRCREV = "3ca578d968d09785933ebbb45b66b3bccdbd5832"
+
 PV = "2.30+git${SRCPV}"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://oh-contact.patch;striplevel=0 \
-- 
1.7.9.5



