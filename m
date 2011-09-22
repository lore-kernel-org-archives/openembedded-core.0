Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6ofg-0003rh-HE
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 21:10:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Sep 2011 12:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="54165811"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.16])
	by orsmga002.jf.intel.com with ESMTP; 22 Sep 2011 12:05:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 12:05:33 -0700
Message-Id: <31b6f02d5186145a665535ba18531f57e3708ebd.1316718291.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316718291.git.sgw@linux.intel.com>
References: <cover.1316718291.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316718291.git.sgw@linux.intel.com>
References: <cover.1316718291.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] gnome-desktop: Fix python path in scripts to use target path
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
X-List-Received-Date: Thu, 22 Sep 2011 19:10:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-gnome/gnome/gnome-desktop.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-desktop.inc b/meta/recipes-gnome/gnome/gnome-desktop.inc
index 336b87f..1317fff 100644
--- a/meta/recipes-gnome/gnome/gnome-desktop.inc
+++ b/meta/recipes-gnome/gnome/gnome-desktop.inc
@@ -11,7 +11,11 @@ do_configure_prepend () {
 
 FILES_${PN} += "${datadir}/gnome-about"
 
-PR = "r1"
+PR = "r2"
 
 inherit gnome pkgconfig
 
+do_install_append () {
+	sed -i -e's,${STAGING_BINDIR_NATIVE},${bindir},g' ${D}${bindir}/gnome-about
+}
+
-- 
1.7.6



