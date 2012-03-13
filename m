Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Mln-0000I0-Sq
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 09:07:48 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2012 00:59:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128321790"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.137])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2012 00:59:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:58:41 -0700
Message-Id: <75860c4ab344c359756d983c193add6524d3aea2.1331589797.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/23] dpkg: rename postinst trigger script
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
X-List-Received-Date: Tue, 13 Mar 2012 08:07:48 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Use 'run-postinsts' as trigger script name as it describes better the
intent of it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/dpkg/dpkg.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 69fd50a..09bfbbc 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -42,9 +42,9 @@ do_install_prepend () {
 	# this happens at S98 where our good 'ole packages script used to run
 	printf "#!/bin/sh
 dpkg --configure -a
-rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
-" > ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
-	chmod 0755 ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
+rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
+" > ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
+	chmod 0755 ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
 }
 
 do_install_append () {
-- 
1.7.7.6



