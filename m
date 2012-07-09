Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMs-00065B-Rn
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:48:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292956"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:48:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:55 -0700
Message-Id: <54909b79bd73361efb2e4b691508c523ec45c063.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 41/41] lsbinitscripts: increase ALTERNATIVE_PRIORITY
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
X-List-Received-Date: Mon, 09 Jul 2012 16:12:35 -0000

From: Kang Kai <kai.kang@windriver.com>

[YOCTO #2133]

Increase ALTERNATIVE_PRIORITY of file functions to be higher than
the value in package initscript. Then when lsbinitscripts installed,
file functions provided by lsbinitscripts will be used.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
index d07c4e2..8071916 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SysV init scripts which only is used in an LSB image"
 SECTION = "base"
 LICENSE = "GPLv2"
 DEPENDS = "popt glib-2.0"
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
@@ -15,7 +15,7 @@ SRC_URI[md5sum] = "668fa2762b57ef75436303857847bba3"
 SRC_URI[sha256sum] = "d56547a68ce223a7413b2676650b042125f047c8d6d139c5b970e118b3dc958a"
 inherit update-alternatives
 
-ALTERNATIVE_PRIORITY = "10"
+ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "functions"
 ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
 
-- 
1.7.7.6



